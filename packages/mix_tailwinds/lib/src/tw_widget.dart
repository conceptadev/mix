import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import 'parser/candidate_parser.dart';
import 'parser/data/parser_registry.g.dart';
import 'parser/diagnostics.dart';
import 'parser/model.dart';
import 'translate/tw_target.dart' as tw_target;
import 'translate/tw_routing.dart';
import 'tw_config.dart';
import 'tw_flex_item.dart';
import 'tw_parser.dart';
import 'tw_types.dart';
import 'tw_utils.dart';

// =============================================================================
// Box/Margin Utility Detection
// =============================================================================

const _candidateParser = TailwindCandidateParser(
  registry: defaultTailwindParserRegistry,
);

/// Extracts positive margin [EdgeInsets] from [classNames].
///
/// Returns null when no positive margin token is present.
///
/// - Negative margins (`-mb-4`) are skipped. They are applied via [Padding],
///   whose `RenderPadding` asserts non-negative insets, so emitting them would
///   crash. True CSS negative-margin parity needs a transform-based strategy at
///   the box layer and is tracked separately.
/// - Variant-prefixed margins are skipped because responsive/interaction
///   margin semantics are not yet modeled in the widget layer.
EdgeInsets? _extractMargin(String classNames, TwConfig cfg) {
  final tokens = splitTailwindTokens(classNames);
  double? top, right, bottom, left;

  for (final token in tokens) {
    final candidate = _parseCandidate(token);
    if (candidate == null || candidate.variants.isNotEmpty) continue;

    final route = routeCandidate(candidate, breakpoints: cfg.breakpoints);
    if (route.kind != TwRouteKind.schemaValue) continue;

    final utility = candidate.utility;
    final root = tailwindUtilityRoot(utility);
    if (!_marginRoots.contains(root)) continue;
    if (tailwindUtilityNegative(utility)) continue;

    final value = _marginLength(tailwindUtilityValue(utility), cfg);
    if (value == null || value < 0) continue;

    switch (root) {
      case 'm':
        top = right = bottom = left = value;
      case 'mx':
        left = right = value;
      case 'my':
        top = bottom = value;
      case 'mt':
        top = value;
      case 'mr':
        right = value;
      case 'mb':
        bottom = value;
      case 'ml':
        left = value;
    }
  }

  if (top == null && right == null && bottom == null && left == null) {
    return null;
  }

  return EdgeInsets.only(
    left: left ?? 0,
    top: top ?? 0,
    right: right ?? 0,
    bottom: bottom ?? 0,
  );
}

double? _marginLength(TailwindValue? value, TwConfig cfg) {
  final key = tailwindValueKey(value);
  final scale = cfg.space[key];
  if (scale != null) return scale;
  return value is TailwindArbitraryValue ? parseCssLength(value.value) : null;
}

const _marginRoots = {'m', 'mx', 'my', 'mt', 'mr', 'mb', 'ml'};

TailwindCandidate? _parseCandidate(String token) {
  final parsed = _candidateParser.parseCandidate(token);
  return switch (parsed) {
    TailwindParseSuccess(:final candidate) => candidate,
    TailwindParseFailure() => null,
  };
}

// =============================================================================
// CSS Semantic Margin Helpers
// =============================================================================

/// Creates a new [BoxSpec] with margin set to null.
///
/// Used to strip margin from a spec so it can be applied externally
/// for CSS semantic hit-testing (margin outside interactive area).
BoxSpec _boxSpecWithoutMargin(BoxSpec spec) {
  return BoxSpec(
    alignment: spec.alignment,
    padding: spec.padding,
    margin: null,
    constraints: spec.constraints,
    decoration: spec.decoration,
    foregroundDecoration: spec.foregroundDecoration,
    transform: spec.transform,
    transformAlignment: spec.transformAlignment,
    clipBehavior: spec.clipBehavior,
  );
}

/// Creates a new [StyleSpec<BoxSpec>] with margin stripped from the inner spec.
///
/// Preserves animation and widgetModifiers from the original.
StyleSpec<BoxSpec> _styleSpecWithoutMargin(StyleSpec<BoxSpec> styleSpec) {
  return StyleSpec<BoxSpec>(
    spec: _boxSpecWithoutMargin(styleSpec.spec),
    animation: styleSpec.animation,
    widgetModifiers: styleSpec.widgetModifiers,
  );
}

/// Creates a new [FlexBoxSpec] with margin stripped from the box spec.
///
/// Preserves flex spec and other box properties.
FlexBoxSpec _flexBoxSpecWithoutMargin(FlexBoxSpec spec) {
  if (spec.box == null) return spec;
  return FlexBoxSpec(box: _styleSpecWithoutMargin(spec.box!), flex: spec.flex);
}

// =============================================================================
// CSS Semantic Box Widgets
// =============================================================================

/// A Box widget with CSS-style margin semantics.
///
// =============================================================================
// Flex Scope (boundedness propagation)
// =============================================================================

/// Exposes flex container context to children for boundedness gating.
///
/// Injected by [_buildResponsiveFlex] inside its [LayoutBuilder], where the
/// parent constraints are known. Children read this via [maybeOf] to decide
/// whether `flex > 0` wrappers are safe to apply.
class _TwFlexScope extends InheritedWidget {
  const _TwFlexScope({
    required this.axis,
    required this.isMainAxisBounded,
    required super.child,
  });

  final Axis axis;
  final bool isMainAxisBounded;

  static _TwFlexScope? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_TwFlexScope>();

  @override
  bool updateShouldNotify(_TwFlexScope oldWidget) =>
      axis != oldWidget.axis ||
      isMainAxisBounded != oldWidget.isMainAxisBounded;
}

/// Determines if the parent flex container's main axis is bounded.
///
/// Priority:
/// 1. [_TwFlexScope] (accurate, set at LayoutBuilder time) — only used when
///    scope axis matches [axis] to prevent nested mismatch.
/// 2. [RenderFlex.constraints] from previous layout pass (covers native
///    Column/Row parents that have no scope).
/// 3. Default `true` (first frame, conservative — prevents false negatives).
bool _resolveIsMainAxisBounded(
  BuildContext context,
  RenderFlex renderFlex,
  Axis axis,
) {
  final scope = _TwFlexScope.maybeOf(context);
  if (scope != null && scope.axis == axis) {
    return scope.isMainAxisBounded;
  }

  // Fallback: read RenderFlex constraints directly (covers native parents)
  if (renderFlex.hasSize) {
    return axis == Axis.horizontal
        ? renderFlex.constraints.hasBoundedWidth
        : renderFlex.constraints.hasBoundedHeight;
  }

  // First frame, no layout yet — assume bounded (safe default)
  return true;
}

// =============================================================================
// CSS Semantic Widgets
// =============================================================================

/// In CSS, margin is outside the hit-test area - hover/press only triggers
/// on the border-box (content + padding + border). This widget extracts
/// margin from the BoxSpec and applies it OUTSIDE the MixInteractionDetector.
///
/// Widget tree structure:
/// ```
/// Padding(margin)              <- OUTSIDE hover detection
///   └── StyleBuilder
///         └── MixInteractionDetector  <- Hover detection here
///               └── Box(no margin)
/// ```
class _CssSemanticBox extends StatelessWidget {
  const _CssSemanticBox({required this.style, this.child, this.wrapBorderBox});

  final BoxStyler style;
  final Widget? child;
  final _BorderBoxWrapper? wrapBorderBox;

  @override
  Widget build(BuildContext context) {
    // Step 1: Resolve base margin BEFORE MixInteractionDetector
    // This ensures margin is outside the hover/press detection area
    final baseSpec = style.resolve(context).spec;
    final margin = baseSpec.margin;

    // Step 2: Build inner content with StyleBuilder (handles variants/animations)
    Widget inner = StyleBuilder<BoxSpec>(
      style: style,
      builder: (context, spec) {
        // Use Box widget with margin stripped - margin is applied externally
        return Box(
          styleSpec: _styleSpecWithoutMargin(StyleSpec(spec: spec)),
          child: child,
        );
      },
    );

    if (wrapBorderBox case final wrap?) {
      inner = wrap(inner);
    }

    // Step 3: Apply margin OUTSIDE MixInteractionDetector
    if (margin != null) {
      inner = Padding(padding: margin, child: inner);
    }

    return inner;
  }
}

/// A FlexBox widget with CSS-style margin semantics.
///
/// See [_CssSemanticBox] for details on CSS margin semantics.
class _CssSemanticFlexBox extends StatelessWidget {
  const _CssSemanticFlexBox({
    required this.style,
    required this.children,
    this.wrapBorderBox,
    this.selfAlignments,
    this.zeroBasisItems,
  });

  final FlexBoxStyler style;
  final List<Widget> children;
  final _BorderBoxWrapper? wrapBorderBox;

  /// Per-child `self-*` alignment, positional and null where a child keeps the
  /// container's alignment. Null when no child opts out at all.
  final List<_SelfAlignment?>? selfAlignments;

  /// CSS sizing inputs for direct `flex-basis: 0` children. Null keeps the
  /// stock Flutter flex path.
  final List<_ZeroBasisFlexItem?>? zeroBasisItems;

  @override
  Widget build(BuildContext context) {
    // Step 1: Resolve base margin BEFORE MixInteractionDetector
    final baseSpec = style.resolve(context);
    final margin = baseSpec.spec.box?.spec.margin;

    // Step 2: Build inner content with StyleBuilder (handles variants/animations)
    Widget inner = StyleBuilder<FlexBoxSpec>(
      style: style,
      builder: (context, spec) {
        // Use FlexBox widget with margin stripped - margin is applied externally
        final stripped = _flexBoxSpecWithoutMargin(spec);
        final alignments = selfAlignments;
        final items = zeroBasisItems;
        if (alignments == null && items == null) {
          return FlexBox(
            styleSpec: StyleSpec(spec: stripped),
            children: children,
          );
        }

        // FlexBox is a Box wrapping a Flex, so rebuild that composition when
        // Tailwind needs per-child alignment or content-box flex sizing.
        final flexSpec = stripped.flex?.spec;
        final Widget flex = _TailwindFlex(
          direction: flexSpec?.direction ?? Axis.horizontal,
          mainAxisAlignment:
              flexSpec?.mainAxisAlignment ?? MainAxisAlignment.start,
          mainAxisSize: flexSpec?.mainAxisSize ?? MainAxisSize.max,
          crossAxisAlignment:
              flexSpec?.crossAxisAlignment ?? CrossAxisAlignment.center,
          textDirection: flexSpec?.textDirection,
          verticalDirection:
              flexSpec?.verticalDirection ?? VerticalDirection.down,
          textBaseline: flexSpec?.textBaseline,
          clipBehavior: flexSpec?.clipBehavior ?? Clip.none,
          spacing: flexSpec?.spacing ?? 0.0,
          selfAlignments: alignments ?? const [],
          zeroBasisItems: items ?? const [],
          children: children,
        );

        final box = stripped.box;
        return box == null ? flex : Box(styleSpec: box, child: flex);
      },
    );

    if (wrapBorderBox case final wrap?) {
      inner = wrap(inner);
    }

    // Step 3: Apply margin OUTSIDE MixInteractionDetector
    if (margin != null) {
      inner = Padding(padding: margin, child: inner);
    }

    return inner;
  }
}

// =============================================================================
// Public Widgets
// =============================================================================

/// A Tailwind element that exposes the class string it was built from.
///
/// A Tailwind flex container reads this interface on direct children for
/// semantics that Flutter's [RenderFlex] cannot infer from their render boxes,
/// including `self-*` alignment and zero-basis content-box sizing.
abstract interface class TwClassed {
  String get classNames;
}

abstract interface class _TwConfigured {
  TwConfig? get config;
}

class Div extends StatelessWidget implements TwClassed, _TwConfigured {
  const Div({
    super.key,
    required this.classNames,
    this.child,
    this.children = const [],
    this.isFlex,
    this.onDiagnostic,
    @Deprecated('Use onDiagnostic instead.') this.onUnsupported,
    this.config,
  });

  @override
  final String classNames;
  final Widget? child;
  final List<Widget> children;
  final bool? isFlex;
  @override
  final TwConfig? config;
  final TwDiagnosticCallback? onDiagnostic;

  @Deprecated('Use onDiagnostic instead.')
  final void Function(String token)? onUnsupported;

  @override
  Widget build(BuildContext context) {
    return _TwElement(
      classNames: classNames,
      child: child,
      children: children,
      isFlex: isFlex,
      onDiagnostic: onDiagnostic,
      onUnsupported: onUnsupported,
      config: config,
    );
  }
}

/// A Tailwind-styled button backed by Mix [Pressable].
///
/// Its margin remains outside the interactive and semantic hit-test area,
/// matching the CSS box model. A null [onPressed] disables the button unless
/// [onLongPress] provides an action.
class Button extends StatelessWidget implements TwClassed, _TwConfigured {
  const Button({
    super.key,
    required this.classNames,
    required this.onPressed,
    this.child,
    this.children = const [],
    this.isFlex,
    this.onDiagnostic,
    @Deprecated('Use onDiagnostic instead.') this.onUnsupported,
    this.config,
    this.enableFeedback = false,
    this.hitTestBehavior = HitTestBehavior.opaque,
    this.onLongPress,
    this.onFocusChange,
    this.autofocus = false,
    this.focusNode,
    this.mouseCursor,
    this.canRequestFocus = true,
    this.excludeFromSemantics = false,
    this.semanticsLabel,
    this.onKeyEvent,
    this.controller,
    this.actions,
  });

  @override
  final String classNames;
  final VoidCallback? onPressed;
  final Widget? child;
  final List<Widget> children;
  final bool? isFlex;
  @override
  final TwConfig? config;
  final TwDiagnosticCallback? onDiagnostic;

  @Deprecated('Use onDiagnostic instead.')
  final void Function(String token)? onUnsupported;

  final bool enableFeedback;
  final HitTestBehavior hitTestBehavior;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onFocusChange;
  final bool autofocus;
  final FocusNode? focusNode;
  final MouseCursor? mouseCursor;
  final bool canRequestFocus;
  final bool excludeFromSemantics;

  /// An accessible label for a child that does not provide one itself.
  ///
  /// Omit this when visible child text already names the button because Mix
  /// combines an explicit label with descendant semantics.
  final String? semanticsLabel;
  final FocusOnKeyEventCallback? onKeyEvent;
  final WidgetStatesController? controller;
  final Map<Type, Action<Intent>>? actions;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null || onLongPress != null;

    return _TwElement(
      classNames: classNames,
      child: child,
      children: children,
      isFlex: isFlex,
      onDiagnostic: onDiagnostic,
      onUnsupported: onUnsupported,
      config: config,
      wrapBorderBox: (child) => Pressable(
        enabled: enabled,
        enableFeedback: enableFeedback,
        onPress: onPressed,
        hitTestBehavior: hitTestBehavior,
        onLongPress: onLongPress,
        onFocusChange: onFocusChange,
        autofocus: autofocus,
        focusNode: focusNode,
        mouseCursor: mouseCursor,
        canRequestFocus: canRequestFocus,
        excludeFromSemantics: excludeFromSemantics,
        semanticsLabel: semanticsLabel,
        semanticsRole: PressableSemanticsRole.button,
        onKeyEvent: onKeyEvent,
        controller: controller,
        actions: actions,
        child: child,
      ),
    );
  }
}

typedef _BorderBoxWrapper = Widget Function(Widget child);

class _TwElement extends StatelessWidget {
  const _TwElement({
    required this.classNames,
    required this.child,
    required this.children,
    required this.isFlex,
    required this.onDiagnostic,
    required this.onUnsupported,
    required this.config,
    this.wrapBorderBox,
  });

  final String classNames;
  final Widget? child;
  final List<Widget> children;
  final bool? isFlex;
  final TwConfig? config;
  final TwDiagnosticCallback? onDiagnostic;
  final void Function(String token)? onUnsupported;
  final _BorderBoxWrapper? wrapBorderBox;

  @override
  Widget build(BuildContext context) {
    assert(
      child == null || children.isEmpty,
      'Provide either child or children, not both.',
    );
    final cfg = config ?? TwConfigProvider.of(context);
    final reportedTokens = <String>{};
    void reportDiagnostic(TwDiagnostic diagnostic) {
      if (reportedTokens.add(diagnostic.token)) {
        onDiagnostic?.call(diagnostic);
        onUnsupported?.call(diagnostic.token);
      }
    }

    final parser = TwParser(config: cfg, onDiagnostic: reportDiagnostic);
    final tokens = parser.setTokens(classNames);
    _reportUnsupportedWidgetLayerVariants(tokens, cfg, reportDiagnostic);
    final shouldUseFlex = isFlex ?? parser.wantsFlex(tokens);
    final animationConfig = parser.parseAnimationFromTokens(tokens.toList());

    Widget built;

    if (shouldUseFlex) {
      var flexStyle = parser.parseFlex(classNames);
      if (animationConfig != null) {
        flexStyle = flexStyle.animate(animationConfig);
      }
      final rawChildren = children.isNotEmpty
          ? List<Widget>.from(children)
          : (child != null ? <Widget>[child!] : const <Widget>[]);

      built = _buildResponsiveFlex(
        tokens: tokens,
        cfg: cfg,
        baseStyle: flexStyle,
        rawChildren: rawChildren,
        wrapBorderBox: wrapBorderBox,
      );
    } else {
      var boxStyle = parser.parseBox(classNames);
      if (animationConfig != null) {
        boxStyle = boxStyle.animate(animationConfig);
      }
      // CSS block elements stretch horizontally but shrink-wrap vertically.
      final resolvedChild =
          child ??
          (children.isNotEmpty
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: children,
                )
              : null);

      built = _buildResponsiveBox(
        tokens: tokens,
        cfg: cfg,
        style: boxStyle,
        child: resolvedChild,
        wrapBorderBox: wrapBorderBox,
      );
    }

    return _wrapWithFlexItemDecorators(
      child: built,
      tokens: tokens,
      cfg: cfg,
      viewportWidth: _responsiveWidth(null, context),
    );
  }
}

/// Block-level text element with Tailwind styling.
///
/// Equivalent to HTML `<p>`. Renders as Flutter's `Text` widget
/// which is block-level (takes its own line).
///
/// Supports margin utilities (m-*, mx-*, my-*, mt-*, mr-*, mb-*, ml-*)
/// which wrap the text with appropriate padding.
///
/// ```dart
/// P(
///   text: 'Hello world',
///   classNames: 'text-lg font-bold text-gray-700 mb-4',
/// )
/// ```
class P extends StatelessWidget implements TwClassed, _TwConfigured {
  const P({super.key, required this.text, this.classNames = '', this.config});

  final String text;
  @override
  final String classNames;
  @override
  final TwConfig? config;

  @override
  Widget build(BuildContext context) {
    final cfg = config ?? TwConfigProvider.of(context);
    final style = TwParser(config: cfg).parseText(classNames);
    Widget result = StyledText(text, style: style);

    // Apply margin if present
    final margin = _extractMargin(classNames, cfg);
    if (margin != null) {
      result = Padding(padding: margin, child: result);
    }

    return result;
  }
}

/// Inline-level text element with Tailwind styling.
///
/// Equivalent to HTML `<span>`. Renders as Mix's `StyledText` widget.
///
/// When box utilities (padding, background, border, rounded, etc.) are present,
/// the text is wrapped in a Box container to apply those styles, matching
/// CSS behavior where `<span>` can have padding, background, etc.
class Span extends StatelessWidget implements TwClassed, _TwConfigured {
  const Span({
    super.key,
    required this.text,
    this.classNames = '',
    this.config,
  });

  final String text;
  @override
  final String classNames;
  @override
  final TwConfig? config;

  @override
  Widget build(BuildContext context) {
    final cfg = config ?? TwConfigProvider.of(context);
    final parser = TwParser(config: cfg);

    // Check if we need box styling (padding, background, border, etc.)
    if (tw_target.hasBoxUtilities(classNames, breakpoints: cfg.breakpoints)) {
      // Parse as box to get padding, background, border, etc.
      // parseBox also handles text styling via DefaultTextStyle wrapper
      final boxStyle = parser.parseBox(classNames);
      final textStyle = parser.parseText(classNames);

      // Use inline layout (no block-level stretch)
      return _CssSemanticBox(
        style: boxStyle,
        child: StyledText(text, style: textStyle),
      );
    }

    // No box utilities - render as simple styled text
    final style = parser.parseText(classNames);
    return StyledText(text, style: style);
  }
}

/// Icon element with Tailwind-style size and color utilities.
///
/// This is a small bridge between Tailwind SVG icon classes and Mix's
/// [StyledIcon]. It supports the icon classes used by common inline SVGs:
/// `w-*`, `h-*`, `text-*`, and positive logical/physical margin tokens.
class TwIcon extends StatelessWidget implements TwClassed, _TwConfigured {
  const TwIcon(
    this.icon, {
    super.key,
    this.classNames = '',
    this.config,
    this.semanticLabel,
  });

  final IconData icon;
  @override
  final String classNames;
  @override
  final TwConfig? config;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final cfg = config ?? TwConfigProvider.of(context);
    final parsedStyle = TwParser(config: cfg).parseIcon(classNames);

    // Preserve the inherited text color as a fallback; the parsed icon style
    // overrides it when the class names include a `text-<color>` utility.
    final fallbackColor = DefaultTextStyle.of(context).style.color;
    var style = fallbackColor != null
        ? IconStyler().color(fallbackColor)
        : IconStyler();
    style = style.merge(parsedStyle);

    Widget current = StyledIcon(
      icon: icon,
      semanticLabel: semanticLabel,
      style: style,
    );

    final margin = _extractLogicalMargin(classNames, cfg);
    if (margin != null) {
      current = Padding(padding: margin, child: current);
    }

    return current;
  }
}

/// Extracts logical/physical icon margins (`ms-*`, `me-*`, `ml-*`, `mr-*`).
///
/// Parses each token through the candidate parser so variant-prefixed margins
/// (e.g. `hover:me-1`) and negatives do not apply as base styles. `ms`/`me` are
/// not typed-styler utility roots, so sides are matched on the unprefixed
/// utility text rather than via [routeCandidate].
EdgeInsetsGeometry? _extractLogicalMargin(String classNames, TwConfig cfg) {
  var start = 0.0;
  var end = 0.0;
  var left = 0.0;
  var right = 0.0;
  var hasMargin = false;

  final tokens = splitTailwindTokens(classNames);
  for (final token in tokens) {
    final candidate = _parseCandidate(token);
    if (candidate == null || candidate.variants.isNotEmpty) continue;

    final utility = candidate.utility;
    if (tailwindUtilityNegative(utility)) continue;

    final raw = utility.raw;
    void Function(double value)? setter;
    if (raw.startsWith('ms-')) {
      setter = (value) => start = value;
    } else if (raw.startsWith('me-')) {
      setter = (value) => end = value;
    } else if (raw.startsWith('ml-')) {
      setter = (value) => left = value;
    } else if (raw.startsWith('mr-')) {
      setter = (value) => right = value;
    }
    if (setter == null) continue;

    final length = _spacingTokenLength(raw.substring(3), cfg);
    if (length == null) continue;
    setter(length);
    hasMargin = true;
  }

  if (!hasMargin) return null;
  return EdgeInsetsDirectional.only(
    start: start,
    end: end,
  ).add(EdgeInsets.only(left: left, right: right));
}

double? _spacingTokenLength(String key, TwConfig cfg) {
  if (key == 'px') return 1;
  return cfg.hasSpace(key) ? cfg.spaceOf(key) : null;
}

abstract class _Heading extends StatelessWidget
    implements TwClassed, _TwConfigured {
  const _Heading({
    super.key,
    required int headingLevel,
    required this.text,
    this.classNames = '',
    this.config,
  }) : _headingLevel = headingLevel;

  final int _headingLevel;
  final String text;
  @override
  final String classNames;
  @override
  final TwConfig? config;

  @override
  Widget build(BuildContext context) {
    final cfg = config ?? TwConfigProvider.of(context);
    final style = TwParser(config: cfg).parseText(classNames);
    Widget result = StyledText(text, style: style);

    final margin = _extractMargin(classNames, cfg);
    if (margin != null) {
      result = Padding(padding: margin, child: result);
    }

    return Semantics(headingLevel: _headingLevel, child: result);
  }
}

/// Heading level 1 element with Tailwind styling.
///
/// Equivalent to HTML `<h1>`. Like Tailwind's Preflight, headings have no
/// default styles; use utility classes such as `text-4xl font-bold`.
/// Exposes Flutter semantics heading level 1 and supports margin utilities.
class H1 extends _Heading {
  const H1({
    super.key,
    required super.text,
    super.classNames = '',
    super.config,
  }) : super(headingLevel: 1);
}

/// Heading level 2 element with Tailwind styling.
///
/// Equivalent to HTML `<h2>`. Note: Like Tailwind's Preflight, headings have
/// no default styles - use utility classes like `text-3xl font-semibold`.
/// Supports margin utilities (m-*, mx-*, my-*, mt-*, mr-*, mb-*, ml-*).
class H2 extends _Heading {
  const H2({
    super.key,
    required super.text,
    super.classNames = '',
    super.config,
  }) : super(headingLevel: 2);
}

/// Heading level 3 element with Tailwind styling.
///
/// Equivalent to HTML `<h3>`. Note: Like Tailwind's Preflight, headings have
/// no default styles - use utility classes like `text-2xl font-semibold`.
/// Supports margin utilities (m-*, mx-*, my-*, mt-*, mr-*, mb-*, ml-*).
class H3 extends _Heading {
  const H3({
    super.key,
    required super.text,
    super.classNames = '',
    super.config,
  }) : super(headingLevel: 3);
}

/// Heading level 4 element with Tailwind styling.
///
/// Equivalent to HTML `<h4>`. Note: Like Tailwind's Preflight, headings have
/// no default styles - use utility classes like `text-xl font-semibold`.
/// Supports margin utilities (m-*, mx-*, my-*, mt-*, mr-*, mb-*, ml-*).
class H4 extends _Heading {
  const H4({
    super.key,
    required super.text,
    super.classNames = '',
    super.config,
  }) : super(headingLevel: 4);
}

/// Heading level 5 element with Tailwind styling.
///
/// Equivalent to HTML `<h5>`. Note: Like Tailwind's Preflight, headings have
/// no default styles - use utility classes like `text-lg font-semibold`.
/// Supports margin utilities (m-*, mx-*, my-*, mt-*, mr-*, mb-*, ml-*).
class H5 extends _Heading {
  const H5({
    super.key,
    required super.text,
    super.classNames = '',
    super.config,
  }) : super(headingLevel: 5);
}

/// Heading level 6 element with Tailwind styling.
///
/// Equivalent to HTML `<h6>`. Note: Like Tailwind's Preflight, headings have
/// no default styles - use utility classes like `text-base font-semibold`.
/// Supports margin utilities (m-*, mx-*, my-*, mt-*, mr-*, mb-*, ml-*).
class H6 extends _Heading {
  const H6({
    super.key,
    required super.text,
    super.classNames = '',
    super.config,
  }) : super(headingLevel: 6);
}

/// Convenience wrapper for truncated text in flex containers.
///
/// Automatically wraps the text with `flex-1 min-w-0` container and applies
/// `truncate` to enable text truncation with ellipsis.
///
/// Equivalent to:
/// ```dart
/// Div(
///   classNames: 'flex-1 min-w-0',
///   child: P(text: text, classNames: 'truncate $classNames'),
/// )
/// ```
class TruncatedP extends StatelessWidget implements TwClassed, _TwConfigured {
  const TruncatedP({
    super.key,
    required this.text,
    this.classNames = '',
    this.config,
  });

  final String text;
  @override
  final String classNames;
  @override
  final TwConfig? config;

  @override
  Widget build(BuildContext context) {
    return Div(
      classNames: 'flex-1 min-w-0',
      config: config,
      child: P(text: text, classNames: 'truncate $classNames', config: config),
    );
  }
}

List<Widget> _applyCrossAxisGap(List<Widget> input, Axis axis, double? gap) {
  if (gap == null || gap <= 0 || input.length <= 1) {
    return input;
  }

  final halfGap = gap / 2;
  final lastIndex = input.length - 1;

  return List<Widget>.generate(input.length, (index) {
    final isFirst = index == 0;
    final isLast = index == lastIndex;
    final padding = axis == Axis.horizontal
        ? EdgeInsets.only(
            top: isFirst ? 0 : halfGap,
            bottom: isLast ? 0 : halfGap,
          )
        : EdgeInsets.only(
            left: isFirst ? 0 : halfGap,
            right: isLast ? 0 : halfGap,
          );
    return Padding(padding: padding, child: input[index]);
  }, growable: false);
}

bool _hasResponsiveAlignItems(Set<String> tokens, TwConfig cfg, double width) {
  for (final token in tokens) {
    final info = _parseResponsiveToken(token, cfg);
    if (info == null || info.minWidth > width) {
      continue;
    }
    if (info.base.startsWith('items-')) {
      return true;
    }
  }
  return false;
}

/// The `self-*` alignment a direct child asks for at [width], if any.
///
/// Only Tailwind elements can be read; an arbitrary widget child has no class
/// string and therefore never overrides the container.
_SelfAlignment? _selfAlignmentOfChild(
  Widget child,
  TwConfig cfg,
  double width,
) {
  if (child case final TwClassed classed) {
    return _resolveSelfAlignment(
      TwParser(config: cfg).setTokens(classed.classNames),
      cfg,
      width,
    );
  }

  return null;
}

@immutable
class _ZeroBasisFlexItem {
  const _ZeroBasisFlexItem({required this.grow, required this.outerExtra});

  final double grow;

  /// Margin, padding, and border along the container's main axis.
  final double outerExtra;

  @override
  bool operator ==(Object other) =>
      other is _ZeroBasisFlexItem &&
      grow == other.grow &&
      outerExtra == other.outerExtra;

  @override
  int get hashCode => Object.hash(grow, outerExtra);
}

_ZeroBasisFlexItem? _zeroBasisFlexItemOfChild(
  Widget child,
  TwConfig cfg,
  double width,
  Axis axis,
  BuildContext context,
) {
  if (child is! TwClassed) return null;
  final classNames = (child as TwClassed).classNames;
  final childConfig = child is _TwConfigured
      ? (child as _TwConfigured).config ?? cfg
      : cfg;

  final parser = TwParser(config: childConfig);
  final tokens = parser.setTokens(classNames);
  final grow = _resolveZeroBasisGrow(tokens, childConfig, width);
  if (grow == null || grow <= 0) return null;

  final spec = parser.parseBox(classNames).resolve(context).spec;
  final textDirection = Directionality.maybeOf(context) ?? TextDirection.ltr;
  final padding = spec.padding?.resolve(textDirection) ?? EdgeInsets.zero;
  final margin = spec.margin?.resolve(textDirection) ?? EdgeInsets.zero;
  final decoration = spec.decoration;
  final border = decoration is BoxDecoration ? decoration.border : null;
  final borderInsets =
      border?.dimensions.resolve(textDirection) ?? EdgeInsets.zero;

  double mainExtent(EdgeInsets insets) =>
      axis == Axis.horizontal ? insets.horizontal : insets.vertical;

  return _ZeroBasisFlexItem(
    grow: grow,
    outerExtra:
        mainExtent(margin) + mainExtent(padding) + mainExtent(borderInsets),
  );
}

double? _resolveZeroBasisGrow(Set<String> tokens, TwConfig cfg, double width) {
  String? shorthand;
  var shorthandMinWidth = -1.0;
  String? basis;
  var basisMinWidth = -1.0;
  String? grow;
  var growMinWidth = -1.0;

  for (final token in tokens) {
    final info = _parseResponsiveToken(token, cfg);
    if (info == null || info.minWidth > width) continue;

    final utility = info.base;
    if ((utility == 'flex-1' ||
            utility == 'flex-auto' ||
            utility == 'flex-initial' ||
            utility == 'flex-none') &&
        info.minWidth >= shorthandMinWidth) {
      shorthand = utility;
      shorthandMinWidth = info.minWidth;
    }
    if (utility.startsWith('basis-') && info.minWidth >= basisMinWidth) {
      basis = utility;
      basisMinWidth = info.minWidth;
    }
    if ((utility == 'grow' || utility == 'grow-0') &&
        info.minWidth >= growMinWidth) {
      grow = utility;
      growMinWidth = info.minWidth;
    }
  }

  var hasZeroBasis = shorthand == 'flex-1';
  var resolvedGrow = shorthand == 'flex-1' || shorthand == 'flex-auto'
      ? 1.0
      : 0.0;

  // A responsive declaration outranks a lower-breakpoint declaration. At the
  // same breakpoint, Tailwind emits the longhands after the flex shorthand.
  if (basis != null && basisMinWidth >= shorthandMinWidth) {
    hasZeroBasis = basis == 'basis-0';
  }
  if (grow != null && growMinWidth >= shorthandMinWidth) {
    resolvedGrow = grow == 'grow' ? 1 : 0;
  }

  return hasZeroBasis ? resolvedGrow : null;
}

Widget _buildResponsiveFlex({
  required Set<String> tokens,
  required TwConfig cfg,
  required FlexBoxStyler baseStyle,
  required List<Widget> rawChildren,
  _BorderBoxWrapper? wrapBorderBox,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final width = _responsiveWidth(constraints, context);
      final axis = _resolveFlexAxisResponsive(tokens, cfg, width);
      final isMainAxisBounded = axis == Axis.horizontal
          ? constraints.hasBoundedWidth
          : constraints.hasBoundedHeight;
      final baseGap = _resolveResponsiveGap(tokens, cfg, width, 'gap-');
      final gapX = _resolveResponsiveGap(tokens, cfg, width, 'gap-x-');
      final gapY = _resolveResponsiveGap(tokens, cfg, width, 'gap-y-');

      var style = baseStyle;
      final mainGap = axis == Axis.horizontal
          ? (gapX ?? baseGap)
          : (gapY ?? baseGap);
      if (mainGap != null) {
        style = style.spacing(mainGap);
      }

      final crossGap = axis == Axis.horizontal ? gapY : gapX;
      final flexChildren = _applyCrossAxisGap(rawChildren, axis, crossGap);

      // CSS `align-self` lets a child opt out of the container's `align-items`.
      // RenderFlex has one cross alignment for every child, so the opt-out is
      // carried to the flex itself and applied after it has sized its cross
      // axis. Collected positionally: the gap wrapper preserves child order.
      final selfAlignments = rawChildren
          .map((child) => _selfAlignmentOfChild(child, cfg, width))
          .toList(growable: false);
      final hasSelfAlignedChild = selfAlignments.any((a) => a != null);
      final zeroBasisItems = rawChildren
          .map(
            (child) =>
                _zeroBasisFlexItemOfChild(child, cfg, width, axis, context),
          )
          .toList(growable: false);
      final zeroBasisChildren = zeroBasisItems
          .whereType<_ZeroBasisFlexItem>()
          .toList(growable: false);
      final totalGrow = zeroBasisChildren.fold<double>(
        0,
        (sum, item) => sum + item.grow,
      );
      final totalOuterExtra = zeroBasisChildren.fold<double>(
        0,
        (sum, item) => sum + item.outerExtra,
      );
      // Stock RenderFlex is already correct when each item's non-content
      // extent is proportional to its grow factor.
      final needsContentBoxSizing =
          zeroBasisChildren.length > 1 &&
          zeroBasisChildren.any(
            (item) =>
                (item.outerExtra * totalGrow - totalOuterExtra * item.grow)
                    .abs() >
                0.001,
          );

      // CSS parity: Tailwind's default `align-items` is `stretch` (unless an
      // explicit `items-*` utility is present). Stretch is invalid on an
      // unbounded Flutter cross axis, so use `start` there to preserve CSS
      // block-child alignment instead of FlexBox's centered fallback.
      final hasExplicitItems = _hasResponsiveAlignItems(tokens, cfg, width);
      final isCrossAxisBounded = axis == Axis.horizontal
          ? constraints.hasBoundedHeight
          : constraints.hasBoundedWidth;
      if (!hasExplicitItems && axis == Axis.vertical) {
        style = style.crossAxisAlignment(
          isCrossAxisBounded
              ? CrossAxisAlignment.stretch
              : CrossAxisAlignment.start,
        );
      }

      // Use CSS semantic flex box - margin is outside hover/press detection area
      Widget current = _TwFlexScope(
        axis: axis,
        isMainAxisBounded: isMainAxisBounded,
        child: _CssSemanticFlexBox(
          style: style,
          wrapBorderBox: wrapBorderBox,
          selfAlignments: hasSelfAlignedChild ? selfAlignments : null,
          zeroBasisItems: needsContentBoxSizing ? zeroBasisItems : null,
          children: flexChildren,
        ),
      );
      current = _applyContainerSizingResponsive(
        current,
        tokens,
        cfg,
        constraints,
        context,
        width,
      );
      current = _applyMinSizingResponsive(current, tokens, cfg, context, width);
      current = _applyFractionalSizingResponsive(current, tokens, cfg, width);
      current = _loosenFixedWidthUnderTightStretch(
        current,
        tokens,
        cfg,
        width,
        constraints,
      );
      return current;
    },
  );
}

Widget _buildResponsiveBox({
  required Set<String> tokens,
  required TwConfig cfg,
  required BoxStyler style,
  Widget? child,
  _BorderBoxWrapper? wrapBorderBox,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final width = _responsiveWidth(constraints, context);
      // Use CSS semantic box - margin is outside hover/press detection area
      Widget current = _CssSemanticBox(
        style: style,
        wrapBorderBox: wrapBorderBox,
        child: child,
      );
      current = _applyContainerSizingResponsive(
        current,
        tokens,
        cfg,
        constraints,
        context,
        width,
      );
      current = _applyMinSizingResponsive(current, tokens, cfg, context, width);
      current = _applyFractionalSizingResponsive(current, tokens, cfg, width);
      current = _loosenFixedWidthUnderTightStretch(
        current,
        tokens,
        cfg,
        width,
        constraints,
      );
      return current;
    },
  );
}

Widget _wrapWithFlexItemDecorators({
  required Widget child,
  required Set<String> tokens,
  required TwConfig cfg,
  required double viewportWidth,
}) {
  if (!_needsFlexItemDecorators(tokens, cfg)) {
    return child;
  }

  return Builder(
    builder: (context) =>
        _applyFlexItemDecorators(child, tokens, cfg, context, viewportWidth),
  );
}

bool _needsFlexItemDecorators(Set<String> tokens, TwConfig cfg) {
  for (final token in tokens) {
    final info = _parseResponsiveToken(token, cfg);
    if (info == null) continue;
    final base = info.base;
    if (base == 'w-full' || base == 'h-full') {
      return true;
    }
    if (base.startsWith('flex-') ||
        base.startsWith('basis-') ||
        base.startsWith('self-') ||
        base.startsWith('shrink') ||
        base.startsWith('grow')) {
      return true;
    }
  }
  return false;
}

void _reportUnsupportedWidgetLayerVariants(
  Set<String> tokens,
  TwConfig cfg,
  TwDiagnosticCallback onDiagnostic,
) {
  for (final token in tokens) {
    final candidate = _parseCandidate(token);
    if (candidate == null || candidate.variants.isEmpty) {
      continue;
    }
    if (!_isRootLayoutWidgetUtility(candidate.utility)) {
      continue;
    }
    if (_hasOnlyBreakpointVariants(candidate.variants, cfg)) {
      continue;
    }

    onDiagnostic(
      TwDiagnostic(
        token: token,
        code: TwDiagnosticCode.widgetLayerVariantUnsupported,
        reason:
            'Widget-layer layout utilities only support breakpoint variants.',
        workaround: 'Move interactive state to a supported styler utility.',
      ),
    );
  }
}

bool _hasOnlyBreakpointVariants(List<TailwindVariant> variants, TwConfig cfg) {
  for (final variant in variants) {
    if (variant is! TailwindStaticVariant ||
        !cfg.breakpoints.containsKey(variant.root)) {
      return false;
    }
  }

  return true;
}

bool _isRootLayoutWidgetUtility(TailwindUtility utility) {
  final raw = utility.raw;
  final root = tailwindUtilityRoot(utility);
  final valueKey = tailwindValueKey(tailwindUtilityValue(utility));

  if (raw.startsWith('flex-') ||
      raw.startsWith('basis-') ||
      raw.startsWith('self-') ||
      raw.startsWith('shrink') ||
      raw.startsWith('grow')) {
    return true;
  }

  if (root == 'basis' ||
      root == 'self' ||
      root == 'grow' ||
      root == 'shrink' ||
      root == 'gap-x' ||
      root == 'gap-y' ||
      raw == 'block') {
    return true;
  }

  if (root == 'w' ||
      root == 'h' ||
      root == 'min-w' ||
      root == 'min-h' ||
      root == 'max-w' ||
      root == 'max-h') {
    return valueKey == 'full' ||
        valueKey == 'screen' ||
        valueKey == 'auto' ||
        valueKey?.contains('/') == true;
  }

  return false;
}

Widget _applyContainerSizingResponsive(
  Widget child,
  Set<String> tokens,
  TwConfig cfg,
  BoxConstraints constraints,
  BuildContext context,
  double width,
) {
  final widthIntent = _resolveResponsiveWidth(
    tokens,
    cfg,
    width,
  ).dimensionIntent;
  final heightIntent = _resolveDimensionIntent(
    tokens,
    cfg,
    width,
    isWidth: false,
  );

  if (widthIntent == _DimensionIntent.none &&
      heightIntent == _DimensionIntent.none) {
    return child;
  }

  final viewport = _viewportSize(context);
  double? targetWidth;
  double? targetHeight;

  if (widthIntent != _DimensionIntent.none) {
    targetWidth = widthIntent == _DimensionIntent.screen
        ? (viewport.width > 0
              ? viewport.width
              : _finiteOrNull(constraints.maxWidth))
        : _finiteOrNull(constraints.maxWidth) ??
              (viewport.width > 0 ? viewport.width : null);
  }

  if (heightIntent != _DimensionIntent.none) {
    targetHeight = heightIntent == _DimensionIntent.screen
        ? (viewport.height > 0
              ? viewport.height
              : _finiteOrNull(constraints.maxHeight))
        : _finiteOrNull(constraints.maxHeight) ??
              (viewport.height > 0 ? viewport.height : null);
  }

  if (targetWidth == null && targetHeight == null) {
    return child;
  }

  return SizedBox(width: targetWidth, height: targetHeight, child: child);
}

Widget _applyMinSizingResponsive(
  Widget child,
  Set<String> tokens,
  TwConfig cfg,
  BuildContext context,
  double width,
) {
  final minWidthScreen = _resolveMinScreenIntent(
    tokens,
    cfg,
    width,
    isWidth: true,
  );
  final minHeightScreen = _resolveMinScreenIntent(
    tokens,
    cfg,
    width,
    isWidth: false,
  );

  if (!minWidthScreen && !minHeightScreen) {
    return child;
  }

  final viewport = _viewportSize(context);
  double? minWidth;
  double? minHeight;

  if (minWidthScreen && viewport.width > 0) {
    minWidth = viewport.width;
  }
  if (minHeightScreen && viewport.height > 0) {
    minHeight = viewport.height;
  }

  if (minWidth == null && minHeight == null) {
    return child;
  }

  return ConstrainedBox(
    constraints: BoxConstraints(
      minWidth: minWidth ?? 0,
      minHeight: minHeight ?? 0,
    ),
    child: child,
  );
}

bool _resolveMinScreenIntent(
  Set<String> tokens,
  TwConfig cfg,
  double width, {
  required bool isWidth,
}) {
  final target = isWidth ? 'min-w-screen' : 'min-h-screen';

  for (final token in tokens) {
    final info = _parseResponsiveToken(token, cfg);
    if (info == null || info.minWidth > width) {
      continue;
    }
    if (info.base == target) {
      return true;
    }
  }
  return false;
}

Widget _applyFractionalSizingResponsive(
  Widget child,
  Set<String> tokens,
  TwConfig cfg,
  double width,
) {
  final widthFactor = _resolveResponsiveWidth(tokens, cfg, width).fraction;
  final heightFactor = _resolveResponsiveFraction(tokens, cfg, width, 'h-');

  if (widthFactor == null && heightFactor == null) {
    return child;
  }

  return FractionallySizedBox(
    widthFactor: widthFactor,
    heightFactor: heightFactor,
    alignment: AlignmentDirectional.topStart,
    child: child,
  );
}

Widget _loosenFixedWidthUnderTightStretch(
  Widget child,
  Set<String> tokens,
  TwConfig cfg,
  double width,
  BoxConstraints constraints,
) {
  final activeWidth = _resolveResponsiveWidth(tokens, cfg, width);
  if (!constraints.hasTightWidth ||
      activeWidth.kind != _ResponsiveWidthKind.fixed) {
    return child;
  }

  return Align(alignment: AlignmentDirectional.centerStart, child: child);
}

Widget _applyFlexItemDecorators(
  Widget child,
  Set<String> tokens,
  TwConfig cfg,
  BuildContext context,
  double viewportWidth,
) {
  final renderFlex = context.findAncestorRenderObjectOfType<RenderFlex>();
  if (renderFlex == null) {
    return child;
  }

  final axis = renderFlex.direction;
  final isMainAxisBounded = _resolveIsMainAxisBounded(
    context,
    renderFlex,
    axis,
  );
  var current = child;

  final widthIntent = _resolveResponsiveWidth(
    tokens,
    cfg,
    viewportWidth,
  ).dimensionIntent;
  final heightIntent = _resolveDimensionIntent(
    tokens,
    cfg,
    viewportWidth,
    isWidth: false,
  );

  final basis = _resolveBasisValue(tokens, cfg, viewportWidth);
  if (basis != null) {
    current = _applyBasis(current, basis, axis);
  }

  final selfAlignment = _resolveSelfAlignment(tokens, cfg, viewportWidth);
  if (selfAlignment != null) {
    current = _positionInCrossAxis(current, selfAlignment, axis);
  }

  final behavior = _resolveFlexItemBehavior(
    tokens,
    cfg,
    viewportWidth,
    context,
  );

  // Handle w-full/h-full when used as a direct child of a Flex.
  //
  // In Flutter, non-flex children of Row/Column get unbounded constraints along
  // the main axis. Our `w-full`/`h-full` sizing currently falls back to the
  // viewport size in that case, which does not match CSS semantics inside flex
  // containers (it should resolve against the flex container’s available space).
  //
  // To align with Tailwind/CSS behavior, treat w-full/h-full as a flex item that
  // expands to fill the available space on the main axis, unless the user already
  // provided explicit flex/basis behavior (or wrapped the widget in Flexible).
  final isAlreadyFlexible =
      context.findAncestorWidgetOfExactType<Flexible>() != null ||
      context.findAncestorWidgetOfExactType<Expanded>() != null;
  final wantsFullOnMainAxis = axis == Axis.horizontal
      ? widthIntent == _DimensionIntent.full
      : heightIntent == _DimensionIntent.full;
  if (!isAlreadyFlexible &&
      wantsFullOnMainAxis &&
      behavior == null &&
      basis == null &&
      isMainAxisBounded) {
    current = _FlexParentDataWrapper(
      flex: 1,
      fit: FlexFit.tight,
      child: current,
    );
  }

  if (behavior != null) {
    if (!isMainAxisBounded && behavior.flex > 0) {
      // CSS parity: flex-grow has no effect in unbounded context. Skip.
    } else {
      current = _FlexParentDataWrapper(
        flex: behavior.flex,
        fit: behavior.fit,
        child: current,
      );
    }
  }

  return current;
}

Axis _resolveFlexAxisResponsive(
  Set<String> tokens,
  TwConfig cfg,
  double width,
) {
  Axis? resolved;
  double chosenMin = -1;

  for (final token in tokens) {
    final info = _parseResponsiveToken(token, cfg);
    if (info == null || info.minWidth > width) {
      continue;
    }
    if (info.base == 'flex-col') {
      if (info.minWidth >= chosenMin) {
        resolved = Axis.vertical;
        chosenMin = info.minWidth;
      }
    } else if (info.base == 'flex-row' || info.base == 'flex') {
      if (info.minWidth >= chosenMin) {
        resolved = Axis.horizontal;
        chosenMin = info.minWidth;
      }
    }
  }

  if (resolved != null) {
    return resolved;
  }

  final hasBaseFlex = tokens.any((token) {
    if (token.contains(':')) return false;
    return token == 'flex' || token == 'flex-row' || token == 'flex-col';
  });

  return hasBaseFlex ? Axis.horizontal : Axis.vertical;
}

double? _resolveResponsiveGap(
  Set<String> tokens,
  TwConfig cfg,
  double width,
  String prefix,
) {
  double? resolved;
  double chosenMin = -1;

  for (final token in tokens) {
    final info = _parseResponsiveToken(token, cfg);
    if (info == null || info.minWidth > width) {
      continue;
    }
    if (!info.base.startsWith(prefix)) {
      continue;
    }

    final key = info.base.substring(prefix.length);
    if (key.isEmpty) {
      continue;
    }

    final value = cfg.spaceOf(key, fallback: double.nan);
    if (!value.isNaN && info.minWidth >= chosenMin) {
      resolved = value;
      chosenMin = info.minWidth;
    }
  }

  return resolved;
}

double? _resolveResponsiveFraction(
  Set<String> tokens,
  TwConfig cfg,
  double width,
  String prefix,
) {
  double? fraction;
  double chosenMin = -1;

  for (final token in tokens) {
    final info = _parseResponsiveToken(token, cfg);
    if (info == null || info.minWidth > width) {
      continue;
    }
    if (!info.base.startsWith(prefix)) {
      continue;
    }

    final value = parseFractionToken(info.base.substring(prefix.length));
    if (value != null && info.minWidth >= chosenMin) {
      fraction = value;
      chosenMin = info.minWidth;
    }
  }

  return fraction;
}

_ResponsiveWidth _resolveResponsiveWidth(
  Set<String> tokens,
  TwConfig cfg,
  double width,
) {
  var resolved = const _ResponsiveWidth(_ResponsiveWidthKind.none);
  double chosenMin = -1;

  for (final token in tokens) {
    final info = _parseResponsiveToken(token, cfg);
    if (info == null || info.minWidth > width || !info.base.startsWith('w-')) {
      continue;
    }

    final key = info.base.substring(2);
    final fraction = parseFractionToken(key);
    final candidate = switch (key) {
      'auto' => const _ResponsiveWidth(_ResponsiveWidthKind.auto),
      'full' => const _ResponsiveWidth(_ResponsiveWidthKind.full),
      'screen' => const _ResponsiveWidth(_ResponsiveWidthKind.screen),
      _ when fraction != null => _ResponsiveWidth(
        _ResponsiveWidthKind.fraction,
        fraction: fraction,
      ),
      _ when _isFixedWidthKey(key, cfg) => const _ResponsiveWidth(
        _ResponsiveWidthKind.fixed,
      ),
      _ => null,
    };

    if (candidate != null && info.minWidth >= chosenMin) {
      resolved = candidate;
      chosenMin = info.minWidth;
    }
  }

  return resolved;
}

bool _isFixedWidthKey(String key, TwConfig cfg) {
  if (cfg.hasSpace(key)) return true;
  if (!key.startsWith('[') || !key.endsWith(']')) return false;
  return parseCssLength(key.substring(1, key.length - 1)) != null;
}

_DimensionIntent _resolveDimensionIntent(
  Set<String> tokens,
  TwConfig cfg,
  double width, {
  required bool isWidth,
}) {
  _DimensionIntent? intent;
  double chosenMin = -1;

  final fullTarget = isWidth ? 'w-full' : 'h-full';
  final screenTarget = isWidth ? 'w-screen' : 'h-screen';

  for (final token in tokens) {
    final info = _parseResponsiveToken(token, cfg);
    if (info == null || info.minWidth > width) {
      continue;
    }

    if (info.base == fullTarget && info.minWidth >= chosenMin) {
      intent = _DimensionIntent.full;
      chosenMin = info.minWidth;
    } else if (info.base == screenTarget && info.minWidth >= chosenMin) {
      intent = _DimensionIntent.screen;
      chosenMin = info.minWidth;
    }
  }

  return intent ?? _DimensionIntent.none;
}

double _effectiveWidth(BoxConstraints constraints, BuildContext context) {
  final finite = _finiteOrNull(constraints.maxWidth);
  if (finite != null) {
    return finite;
  }
  final mediaWidth = _viewportSize(context).width;
  return mediaWidth > 0 ? mediaWidth : 0;
}

double _responsiveWidth(BoxConstraints? constraints, BuildContext context) {
  final viewportWidth = _viewportSize(context).width;
  if (viewportWidth > 0) {
    return viewportWidth;
  }
  if (constraints != null) {
    return _effectiveWidth(constraints, context);
  }
  return 0;
}

Size _viewportSize(BuildContext context) {
  final query = MediaQuery.maybeOf(context);
  return query?.size ?? Size.zero;
}

double? _finiteOrNull(double value) => value.isFinite ? value : null;

class _ResponsiveToken {
  const _ResponsiveToken(this.base, this.minWidth);

  final String base;
  final double minWidth;
}

_ResponsiveToken? _parseResponsiveToken(String token, TwConfig cfg) {
  final candidate = _parseCandidate(token);
  if (candidate == null) return null;

  final route = routeCandidate(candidate, breakpoints: cfg.breakpoints);
  if (route.kind == TwRouteKind.ignored ||
      route.kind == TwRouteKind.unsupported) {
    return null;
  }

  double minWidth = 0;

  for (final variant in candidate.variants) {
    if (variant is TailwindStaticVariant &&
        cfg.breakpoints.containsKey(variant.root)) {
      minWidth = cfg.breakpointOf(variant.root);
    } else {
      return null;
    }
  }

  return _ResponsiveToken(candidate.utility.raw, minWidth);
}

enum _DimensionIntent { none, full, screen }

enum _ResponsiveWidthKind { none, fixed, fraction, auto, full, screen }

class _ResponsiveWidth {
  const _ResponsiveWidth(this.kind, {this.fraction});

  final _ResponsiveWidthKind kind;
  final double? fraction;

  _DimensionIntent get dimensionIntent => switch (kind) {
    _ResponsiveWidthKind.full => _DimensionIntent.full,
    _ResponsiveWidthKind.screen => _DimensionIntent.screen,
    _ => _DimensionIntent.none,
  };
}

class _FlexItemBehavior {
  const _FlexItemBehavior({required this.flex, required this.fit});

  final int flex;
  final FlexFit fit;
}

class _BasisValue {
  const _BasisValue({this.pixels});

  final double? pixels;
}

enum _SelfAlignment { start, center, end }

_FlexItemBehavior? _resolveFlexItemBehavior(
  Set<String> tokens,
  TwConfig cfg,
  double width,
  BuildContext context,
) {
  _FlexItemBehavior? behavior;
  double chosenMin = -1;

  for (final token in tokens) {
    final info = _parseResponsiveToken(token, cfg);
    if (info == null || info.minWidth > width) {
      continue;
    }

    final modifier = twFlexibleModifierForFlexItem(info.base);
    final candidate = modifier == null
        ? null
        : _flexItemBehaviorFromModifier(modifier, context);

    if (candidate != null && info.minWidth >= chosenMin) {
      behavior = candidate;
      chosenMin = info.minWidth;
    }
  }

  return behavior;
}

_FlexItemBehavior _flexItemBehaviorFromModifier(
  FlexibleModifierMix modifier,
  BuildContext context,
) {
  final resolved = modifier.resolve(context);

  return _FlexItemBehavior(
    flex: resolved.flex ?? 1,
    fit: resolved.fit ?? FlexFit.loose,
  );
}

_BasisValue? _resolveBasisValue(
  Set<String> tokens,
  TwConfig cfg,
  double width,
) {
  _BasisValue? value;
  double chosenMin = -1;

  for (final token in tokens) {
    final info = _parseResponsiveToken(token, cfg);
    if (info == null || info.minWidth > width) {
      continue;
    }

    if (!info.base.startsWith('basis-')) {
      continue;
    }

    final key = info.base.substring(6);
    if (key.isEmpty) {
      continue;
    }

    bool handled = true;
    _BasisValue? candidate;

    if (key == 'auto') {
      candidate = null;
    } else {
      final size = cfg.spaceOf(key, fallback: double.nan);
      if (!size.isNaN) {
        candidate = _BasisValue(pixels: size);
      } else {
        handled = false;
      }
    }

    if (!handled) {
      continue;
    }

    if (info.minWidth >= chosenMin) {
      value = candidate;
      chosenMin = info.minWidth;
    }
  }

  return value;
}

Widget _applyBasis(Widget child, _BasisValue basis, Axis axis) {
  if (basis.pixels != null) {
    return SizedBox(
      width: axis == Axis.horizontal ? basis.pixels : null,
      height: axis == Axis.vertical ? basis.pixels : null,
      child: child,
    );
  }

  return child;
}

_SelfAlignment? _resolveSelfAlignment(
  Set<String> tokens,
  TwConfig cfg,
  double width,
) {
  _SelfAlignment? alignment;
  double chosenMin = -1;

  for (final token in tokens) {
    final info = _parseResponsiveToken(token, cfg);
    if (info == null || info.minWidth > width) {
      continue;
    }

    final candidate = switch (info.base) {
      'self-start' => _SelfAlignment.start,
      'self-center' => _SelfAlignment.center,
      'self-end' => _SelfAlignment.end,
      _ => null,
    };

    if (candidate != null && info.minWidth >= chosenMin) {
      alignment = candidate;
      chosenMin = info.minWidth;
    }
  }

  return alignment;
}

/// Places [child] at [position] within the cross extent the flex handed it.
///
/// With a tight cross extent, [Align] positions the styled box inside that
/// extent. With a loose extent it shrink-wraps, and [_RenderTailwindFlex]
/// positions the wrapper after the flex has determined its own size.
Widget _positionInCrossAxis(Widget child, _SelfAlignment position, Axis axis) {
  final resolved = switch (position) {
    _SelfAlignment.start =>
      axis == Axis.horizontal
          ? AlignmentDirectional.topCenter
          : AlignmentDirectional.centerStart,
    _SelfAlignment.center => AlignmentDirectional.center,
    _SelfAlignment.end =>
      axis == Axis.horizontal
          ? AlignmentDirectional.bottomCenter
          : AlignmentDirectional.centerEnd,
  };
  return Align(alignment: resolved, child: child);
}

/// A [Flex] that fills the two CSS gaps Flutter's [RenderFlex] cannot express:
/// per-child cross alignment and zero-basis content-box distribution.
///
/// [selfAlignments] is positional: entry _i_ belongs to child _i_, and null
/// means the child keeps the container's alignment.
class _TailwindFlex extends Flex {
  const _TailwindFlex({
    required super.direction,
    required super.mainAxisAlignment,
    required super.mainAxisSize,
    required super.crossAxisAlignment,
    required super.verticalDirection,
    required super.clipBehavior,
    required super.spacing,
    required this.selfAlignments,
    required this.zeroBasisItems,
    super.textDirection,
    super.textBaseline,
    super.children,
  });

  final List<_SelfAlignment?> selfAlignments;
  final List<_ZeroBasisFlexItem?> zeroBasisItems;

  @override
  RenderFlex createRenderObject(BuildContext context) {
    return _RenderTailwindFlex(
        direction: direction,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: getEffectiveTextDirection(context),
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        clipBehavior: clipBehavior,
        spacing: spacing,
      )
      ..selfAlignments = selfAlignments
      ..zeroBasisItems = zeroBasisItems;
  }

  @override
  void updateRenderObject(BuildContext context, RenderFlex renderObject) {
    super.updateRenderObject(context, renderObject);
    final tailwindFlex = renderObject as _RenderTailwindFlex;
    tailwindFlex
      ..selfAlignments = selfAlignments
      ..zeroBasisItems = zeroBasisItems;
  }
}

class _RenderTailwindFlex extends RenderFlex {
  _RenderTailwindFlex({
    required super.direction,
    required super.mainAxisAlignment,
    required super.mainAxisSize,
    required super.crossAxisAlignment,
    required super.verticalDirection,
    required super.clipBehavior,
    required super.spacing,
    super.textDirection,
    super.textBaseline,
  });

  List<_SelfAlignment?> _selfAlignments = const [];
  List<_ZeroBasisFlexItem?> _zeroBasisItems = const [];

  set selfAlignments(List<_SelfAlignment?> value) {
    if (listEquals(_selfAlignments, value)) return;
    _selfAlignments = value;
    markNeedsLayout();
  }

  set zeroBasisItems(List<_ZeroBasisFlexItem?> value) {
    if (listEquals(_zeroBasisItems, value)) return;
    _zeroBasisItems = value;
    markNeedsLayout();
  }

  /// Whether cross-axis start sits at the far edge rather than at zero.
  bool get _crossAxisIsReversed => direction == Axis.horizontal
      ? verticalDirection == VerticalDirection.up
      : textDirection == TextDirection.rtl;

  @override
  void performLayout() {
    super.performLayout();

    _redistributeZeroBasisItems();

    // RenderFlex has sized itself from its children by now, so the cross extent
    // is known even when the incoming constraints were unbounded. Only the
    // offsets of the opted-out children change; nothing is laid out again.
    var child = firstChild;
    var index = 0;
    while (child != null) {
      final parentData = child.parentData! as FlexParentData;
      final alignment = index < _selfAlignments.length
          ? _selfAlignments[index]
          : null;

      if (alignment != null) {
        final free = direction == Axis.horizontal
            ? size.height - child.size.height
            : size.width - child.size.width;
        final reversed = _crossAxisIsReversed;
        final crossOffset = switch (alignment) {
          _SelfAlignment.start => reversed ? free : 0.0,
          _SelfAlignment.center => free / 2,
          _SelfAlignment.end => reversed ? 0.0 : free,
        };
        parentData.offset = direction == Axis.horizontal
            ? Offset(parentData.offset.dx, crossOffset)
            : Offset(crossOffset, parentData.offset.dy);
      }

      child = parentData.nextSibling;
      index++;
    }
  }

  double _mainExtent(RenderBox child) =>
      direction == Axis.horizontal ? child.size.width : child.size.height;

  void _redistributeZeroBasisItems() {
    if (_zeroBasisItems.isEmpty) return;

    final flexChildren =
        <({RenderBox child, FlexParentData data, _ZeroBasisFlexItem item})>[];
    var child = firstChild;
    var index = 0;
    while (child != null) {
      final parentData = child.parentData! as FlexParentData;
      if ((parentData.flex ?? 0) > 0) {
        final item = index < _zeroBasisItems.length
            ? _zeroBasisItems[index]
            : null;
        if (item == null || parentData.fit != FlexFit.tight) return;
        flexChildren.add((child: child, data: parentData, item: item));
      }
      child = parentData.nextSibling;
      index++;
    }
    if (flexChildren.length < 2) return;

    final outerSpace = flexChildren.fold<double>(
      0,
      (sum, entry) => sum + _mainExtent(entry.child),
    );
    final outerExtra = flexChildren.fold<double>(
      0,
      (sum, entry) => sum + entry.item.outerExtra,
    );
    final totalGrow = flexChildren.fold<double>(
      0,
      (sum, entry) => sum + entry.item.grow,
    );
    final contentSpace = outerSpace - outerExtra;
    if (contentSpace <= 0 || totalGrow <= 0) return;

    final targets = flexChildren
        .map(
          (entry) =>
              entry.item.outerExtra +
              contentSpace * entry.item.grow / totalGrow,
        )
        .toList(growable: false);
    final changed = Iterable<int>.generate(flexChildren.length).any(
      (index) =>
          (targets[index] - _mainExtent(flexChildren[index].child)).abs() >
          0.001,
    );
    if (!changed) return;

    // RenderFlex accepts integer factors, so encode the target outer-size
    // ratios with enough precision to keep sub-pixel layout differences.
    const factorBudget = 1000000;
    final originalFactors = flexChildren
        .map((entry) => entry.data.flex!)
        .toList(growable: false);
    for (var index = 0; index < flexChildren.length; index++) {
      flexChildren[index].data.flex =
          (targets[index] / outerSpace * factorBudget).round().clamp(
            1,
            factorBudget,
          );
    }

    try {
      super.performLayout();
    } finally {
      for (var index = 0; index < flexChildren.length; index++) {
        flexChildren[index].data.flex = originalFactors[index];
      }
    }
  }
}

class _FlexParentDataWrapper extends ParentDataWidget<FlexParentData> {
  const _FlexParentDataWrapper({
    required this.flex,
    required this.fit,
    required super.child,
  });

  final int flex;
  final FlexFit fit;

  @override
  void applyParentData(RenderObject renderObject) {
    final parentData = renderObject.parentData as FlexParentData;
    var needsLayout = false;

    if (parentData.flex != flex) {
      parentData.flex = flex;
      needsLayout = true;
    }

    if (parentData.fit != fit) {
      parentData.fit = fit;
      needsLayout = true;
    }

    if (needsLayout) {
      final targetParent = renderObject.parent;
      if (targetParent is RenderObject) {
        targetParent.markNeedsLayout();
      }
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass => Flex;
}
