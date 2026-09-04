/// Tailwind candidate to Mix styler translator.
library;

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../parser/candidate_parser.dart';
import '../parser/data/parser_registry.g.dart';
import '../parser/diagnostics.dart';
import '../parser/model.dart';
import '../theme/data/default_theme.g.dart';
import '../tw_compilation.dart';
import '../tw_config.dart';
import '../tw_layout_plan.dart';
import '../tw_types.dart';
import '../tw_utils.dart';
import 'tw_accumulators.dart';
import 'tw_gradient.dart';
import 'tw_presets.dart';
import 'tw_routing.dart';
import 'tw_target.dart';

final class _CompiledCandidate {
  final String token;
  final TailwindCandidate candidate;
  final TwRoute route;
  final _VariantPath? variantPath;
  final TwLayoutUtilityInput? layoutInput;
  const _CompiledCandidate({
    required this.token,
    required this.candidate,
    required this.route,
    required this.variantPath,
    required this.layoutInput,
  });
}

final class _FailedCandidate {
  final String token;
  final TailwindParseFailure failure;
  const _FailedCandidate({required this.token, required this.failure});
}

final class _CandidateProgram {
  final List<_CompiledCandidate> candidates;
  final List<_FailedCandidate> failures;
  _CandidateProgram({
    required Iterable<_CompiledCandidate> candidates,
    required Iterable<_FailedCandidate> failures,
  }) : candidates = List.unmodifiable(candidates),
       failures = List.unmodifiable(failures);
}

final class _DiagnosticCollector {
  final _byToken = <String, TwDiagnostic>{};

  List<TwDiagnostic> get diagnostics => .unmodifiable(_byToken.values);

  void add(TwDiagnostic diagnostic) {
    _byToken.putIfAbsent(diagnostic.token, () => diagnostic);
  }

  bool containsToken(String token) => _byToken.containsKey(token);

  void addAll(Iterable<TwDiagnostic> diagnostics) {
    for (final diagnostic in diagnostics) {
      add(diagnostic);
    }
  }

  void replay(
    TwDiagnosticCallback? onDiagnostic,
    void Function(String token)? legacyOnUnsupported,
  ) {
    for (final diagnostic in _byToken.values) {
      onDiagnostic?.call(diagnostic);
      legacyOnUnsupported?.call(diagnostic.token);
    }
  }
}

final class _CompilationArtifacts<S extends Object> {
  final S styler;
  final TwCompiledLayoutPlan layoutPlan;

  const _CompilationArtifacts({required this.styler, required this.layoutPlan});
}

/// Source-internal compilation modes used by Mix Winds widgets.
///
/// This type is intentionally not exported from the package barrel.
enum TwWidgetCompilationMode { boxOrFlex, inline, text, icon }

/// Source-internal, candidate-free handoff from compilation to widgets.
///
/// Only the stylers required by [mode] are populated. This keeps parsed
/// candidates private while allowing target inference and inline multi-output
/// compilation to share one candidate program.
final class TwWidgetCompilation {
  final TwWidgetCompilationMode mode;
  final BoxStyler? boxStyler;
  final FlexBoxStyler? flexStyler;
  final TextStyler? textStyler;
  final IconStyler? iconStyler;
  final bool wantsFlex;
  final bool hasBoxUtilities;
  final TwCompiledLayoutPlan layoutPlan;
  final TwCompiledLayoutPlan parentLayoutPlan;
  final List<TwDiagnostic> diagnostics;

  TwWidgetCompilation({
    required this.mode,
    required this.boxStyler,
    required this.flexStyler,
    required this.textStyler,
    required this.iconStyler,
    required this.wantsFlex,
    required this.hasBoxUtilities,
    required this.layoutPlan,
    required this.parentLayoutPlan,
    required List<TwDiagnostic> diagnostics,
  }) : diagnostics = List.unmodifiable(diagnostics);
}

final class TwTranslator {
  final TwConfig config;

  final TwDiagnosticCallback? onDiagnostic;
  final void Function(String token)? legacyOnUnsupported;
  static const _parser = TailwindCandidateParser(
    registry: defaultTailwindParserRegistry,
  );
  static final _staticUtilityOrder = <String, int>{
    for (final entry in generatedStaticUtilityRoots.indexed) entry.$2: entry.$1,
  };
  static final _functionalUtilityOrder = <String, int>{
    for (final entry in generatedFunctionalUtilityRoots.indexed)
      entry.$2: entry.$1,
  };
  const TwTranslator({
    required this.config,
    this.onDiagnostic,
    this.legacyOnUnsupported,
  });

  void _emitDiagnostic(TwDiagnostic diagnostic) {
    onDiagnostic?.call(diagnostic);
    legacyOnUnsupported?.call(diagnostic.token);
  }

  void _reportParseFailure(String token, TailwindParseFailure failure) {
    final reason = failure.errors.map((error) => error.message).join('; ');
    _emitDiagnostic(
      TwDiagnostic(
        token: token,
        code: .invalidCandidate,
        reason: reason,
        workaround: 'Correct the Tailwind candidate syntax.',
      ),
    );
  }

  bool _reportBlockingRoute(String token, TwRoute route) {
    if (route.kind != .ignored && route.kind != .unsupported) {
      return false;
    }

    _emitDiagnostic(route.toDiagnostic(token));

    return true;
  }

  void _reportUnsupported(
    String token, {
    TwDiagnosticCode code = .unsupportedValue,
    required String reason,
    String? workaround,
  }) {
    _emitDiagnostic(
      TwDiagnostic(
        token: token,
        code: code,
        reason: reason,
        workaround: workaround,
      ),
    );
  }

  _CandidateProgram _compileProgram(Iterable<String> tokens) {
    final candidates = <_CompiledCandidate>[];
    final failures = <_FailedCandidate>[];
    for (final token in tokens) {
      final parsed = _parser.parseCandidate(token);
      switch (parsed) {
        case TailwindParseSuccess(:final candidate):
          final route = routeCandidate(
            candidate,
            breakpoints: config.breakpoints,
          );
          candidates.add(
            _CompiledCandidate(
              token: token,
              candidate: candidate,
              route: route,
              variantPath: _variantPath(candidate.variants),
              layoutInput: _layoutInput(candidate, route),
            ),
          );
        case TailwindParseFailure():
          failures.add(_FailedCandidate(token: token, failure: parsed));
      }
    }

    // The generated registry preserves the pinned snapshot's root order. A
    // natural raw-candidate tie-breaker makes values within one root stable too.
    candidates.sort(_compareCompiledCandidates);

    return _CandidateProgram(candidates: candidates, failures: failures);
  }

  void _reportParseFailures(_CandidateProgram program) {
    for (final failed in program.failures) {
      _reportParseFailure(failed.token, failed.failure);
    }
  }

  int _compareCompiledCandidates(
    _CompiledCandidate left,
    _CompiledCandidate right,
  ) {
    final leftOrder = _utilityOrder(left.candidate.utility);
    final rightOrder = _utilityOrder(right.candidate.utility);
    final kind = leftOrder.$1.compareTo(rightOrder.$1);
    if (kind != 0) return kind;

    final root = leftOrder.$2.compareTo(rightOrder.$2);
    if (root != 0) return root;

    final utility = _compareNatural(
      left.candidate.utility.raw,
      right.candidate.utility.raw,
    );
    if (utility != 0) return utility;

    final candidate = _compareNatural(left.candidate.raw, right.candidate.raw);

    return candidate != 0
        ? candidate
        : left.candidate.raw.compareTo(right.candidate.raw);
  }

  (int, int) _utilityOrder(TailwindUtility utility) {
    return switch (utility) {
      TailwindStaticUtility(:final root) => (
        0,
        _staticUtilityOrder[root] ?? generatedStaticUtilityRoots.length,
      ),
      TailwindFunctionalUtility(:final root) => (
        1,
        _functionalUtilityOrder[root] ?? generatedFunctionalUtilityRoots.length,
      ),
      TailwindArbitraryProperty() => (2, 0),
      TailwindUnresolvedUtility() => (3, 0),
    };
  }

  int _compareNatural(String left, String right) {
    var leftIndex = 0;
    var rightIndex = 0;
    while (leftIndex < left.length && rightIndex < right.length) {
      final leftDigit = _isDigit(left.codeUnitAt(leftIndex));
      final rightDigit = _isDigit(right.codeUnitAt(rightIndex));
      if (leftDigit && rightDigit) {
        final leftEnd = _digitRunEnd(left, leftIndex);
        final rightEnd = _digitRunEnd(right, rightIndex);
        final leftNumber = BigInt.parse(left.substring(leftIndex, leftEnd));
        final rightNumber = BigInt.parse(right.substring(rightIndex, rightEnd));
        final number = leftNumber.compareTo(rightNumber);
        if (number != 0) return number;
        leftIndex = leftEnd;
        rightIndex = rightEnd;
        continue;
      }

      final character = left
          .codeUnitAt(leftIndex)
          .compareTo(right.codeUnitAt(rightIndex));
      if (character != 0) return character;
      leftIndex++;
      rightIndex++;
    }

    return (left.length - leftIndex).compareTo(right.length - rightIndex);
  }

  bool _isDigit(int codeUnit) => codeUnit >= 0x30 && codeUnit <= 0x39;

  int _digitRunEnd(String value, int start) {
    var end = start;
    while (end < value.length && _isDigit(value.codeUnitAt(end))) {
      end++;
    }

    return end;
  }

  S _translate<S>(
    _CandidateProgram program, {
    required TwTarget target,
    required S Function(_GroupContext context) build,
    required S Function(S base, S other) merge,
    required S Function(List<TwRuntimeVariant> path, S style) wrapVariant,
    void Function(_GroupContext context)? afterBase,
  }) {
    final groups = _buildGroups(program, target);
    final baseContext = groups[_VariantPath.base] ?? _GroupContext(target);
    afterBase?.call(baseContext);

    final hasVariantTransform = groups.entries.any(
      (entry) => entry.key != .base && entry.value.transform.hasAnyTransform,
    );
    if (hasVariantTransform && !baseContext.transform.hasAnyTransform) {
      baseContext.transform.needsIdentity = true;
    }

    var result = build(baseContext);

    for (final entry in groups.entries) {
      if (entry.key == .base) continue;
      final context = entry.value;
      if (context.transform.hasAnyTransform &&
          baseContext.transform.hasAnyTransform) {
        context.transform.inheritUnsetFrom(baseContext.transform);
      }
      if (context.border.hasStructure && baseContext.border.hasStructure) {
        context.border.inheritUnsetFrom(baseContext.border);
      }
      if (context.gradient.hasAnyPart && baseContext.gradient.hasAnyPart) {
        context.gradient.inheritUnsetFrom(baseContext.gradient);
      }
      final child = build(context);
      result = merge(result, wrapVariant(entry.key.parts, child));
    }

    return result;
  }

  Map<_VariantPath, _GroupContext> _buildGroups(
    _CandidateProgram program,
    TwTarget target,
  ) {
    _reportParseFailures(program);
    final groups = <_VariantPath, _GroupContext>{};
    _GroupContext groupFor(_VariantPath path) {
      return groups.putIfAbsent(path, () => _GroupContext(target));
    }

    for (final compiled in program.candidates) {
      final _CompiledCandidate(:token, :candidate, :route, :variantPath) =
          compiled;
      if (_isLayoutOwnedCandidate(compiled, target)) continue;
      if (_reportBlockingRoute(token, route)) continue;
      if (route.kind == .widgetLayer) {
        if (!_isSupportedWidgetLayerUtility(candidate.utility)) {
          _reportUnsupported(
            token,
            reason: 'This value is unsupported by the Flutter widget layer.',
          );
        } else if (!_isWidgetLayerUtilitySupportedForTarget(
          candidate.utility,
          target,
        )) {
          _reportUnsupported(
            token,
            code: .unsupportedForTarget,
            reason:
                'This widget-layer utility cannot be represented for the '
                'selected target.',
            workaround: 'Compile it for a compatible box or flex target.',
          );
        } else if (_isRootLayoutWidgetUtility(candidate.utility) &&
            !_hasOnlyBreakpointVariants(candidate.variants)) {
          _reportUnsupported(
            token,
            code: .widgetLayerVariantUnsupported,
            reason:
                'Widget-layer layout utilities only support breakpoint variants.',
            workaround: 'Move interactive state to a supported styler utility.',
          );
        }
        continue;
      }

      if (variantPath == null) {
        _reportUnsupported(
          token,
          code: .unsupportedVariant,
          reason: 'The variant chain cannot be represented at runtime.',
        );
        continue;
      }
      final group = groupFor(variantPath);

      if (route.kind == .gradient) {
        if (!_applyGradient(group.gradient, candidate)) {
          _reportUnsupported(
            token,
            reason: 'The gradient value cannot be represented in Flutter.',
          );
        }
        continue;
      }

      final handled = _applyStyleCandidate(group, candidate, target);
      if (!handled) {
        _reportUnsupported(
          token,
          code: .unsupportedUtility,
          reason: 'This utility has no translation for the selected target.',
          workaround:
              'Use a utility marked implemented or adapted in the ledger.',
        );
      }
    }

    return groups;
  }

  bool _applyStyleCandidate(
    _GroupContext group,
    TailwindCandidate candidate,
    TwTarget target,
  ) {
    final utility = candidate.utility;
    final raw = utility.raw;
    final root = tailwindUtilityRoot(utility);
    final value = tailwindUtilityValue(utility);
    final modifier = tailwindUtilityModifier(utility);
    final negative = tailwindUtilityNegative(utility);

    if (target == .flexBox) {
      if (_applyFlexUtility(group, raw, root, value, modifier, negative)) {
        return true;
      }
    }

    if (target == .text) {
      return _applyTextUtility(group, raw, root, value, modifier);
    }

    return _applyBoxLikeUtility(group, raw, root, value, modifier, negative);
  }

  bool _applyFlexUtility(
    _GroupContext group,
    String raw,
    String root,
    TailwindValue? value,
    TailwindModifier? _,
    bool negative,
  ) {
    switch (raw) {
      case 'inline-flex':
        group.direction = .horizontal;
        group.mainAxisSize = .min;
        group.hasBaseFlex = true;

        return true;
      case 'flex':
      case 'flex-row':
        group.direction = .horizontal;
        group.hasBaseFlex = true;

        return true;
      case 'flex-col':
        group.direction = .vertical;
        group.hasBaseFlex = true;

        return true;
      case 'items-start':
        group.crossAxisAlignment = .start;

        return true;
      case 'items-center':
        group.crossAxisAlignment = .center;

        return true;
      case 'items-end':
        group.crossAxisAlignment = .end;

        return true;
      case 'items-stretch':
        group.crossAxisAlignment = .stretch;

        return true;
      case 'items-baseline':
        group.crossAxisAlignment = .baseline;
        group.textBaseline = .alphabetic;

        return true;
      case 'justify-start':
        group.mainAxisAlignment = .start;

        return true;
      case 'justify-center':
        group.mainAxisAlignment = .center;

        return true;
      case 'justify-end':
        group.mainAxisAlignment = .end;

        return true;
      case 'justify-between':
        group.mainAxisAlignment = .spaceBetween;

        return true;
      case 'justify-around':
        group.mainAxisAlignment = .spaceAround;

        return true;
      case 'justify-evenly':
        group.mainAxisAlignment = .spaceEvenly;

        return true;
    }

    if (root == 'gap') {
      final length = _spaceLength(value, negative: negative);
      if (length == null) return false;
      group.spacing = length;

      return true;
    }

    return false;
  }

  bool _applyBoxLikeUtility(
    _GroupContext group,
    String raw,
    String root,
    TailwindValue? value,
    TailwindModifier? modifier,
    bool negative,
  ) {
    if (_applySpacing(group, root, value, negative: negative)) return true;
    if (_applySizing(group, root, value, negative: negative)) return true;
    if (_applyBorder(group, raw, root, value, modifier)) return true;
    if (_applyRadius(group, root, value)) return true;
    if (_applyTransform(group.transform, root, value, negative)) return true;

    switch (root) {
      case 'bg':
        final color = _color(value, modifier);
        if (color == null) return false;
        group.decoration.color = color;

        return true;
      case 'opacity':
        final opacity = _opacity(value);
        if (opacity == null) return false;
        group.modifiers.add(OpacityModifierMix(opacity: opacity));

        return true;
      case 'blur':
        final sigma = _blur(value);
        if (sigma == null) return false;
        group.modifiers.add(BlurModifierMix(sigma: sigma));

        return true;
      case 'shadow':
        final shadows = _boxShadowMixes(raw, value);
        if (shadows == null) return false;
        group.decoration.boxShadow = shadows;

        return true;
      case 'text':
      case 'size':
        return _applyDefaultTextUtility(group, root, value, modifier);
    }

    if (raw == 'overflow-hidden' || raw == 'overflow-clip') {
      group.decoration.ensurePresent = true;
      group.clipBehavior = .hardEdge;

      return true;
    }
    if (raw == 'overflow-visible') {
      group.clipBehavior = .none;

      return true;
    }
    if (_applyDefaultTextStatic(group, raw)) return true;

    return false;
  }

  bool _applyTextUtility(
    _GroupContext group,
    String raw,
    String root,
    TailwindValue? value,
    TailwindModifier? modifier,
  ) {
    if (root == 'text' || root == 'size') {
      if (_applyTextStyleUtility(() => group.textStyle, value, modifier)) {
        return true;
      }
    }

    switch (raw) {
      case 'text-left':
        group.textAlign = .left;

        return true;
      case 'text-center':
        group.textAlign = .center;

        return true;
      case 'text-right':
        group.textAlign = .right;

        return true;
      case 'text-justify':
        group.textAlign = .justify;

        return true;
      case 'text-start':
        group.textAlign = .start;

        return true;
      case 'text-end':
        group.textAlign = .end;

        return true;
      case 'uppercase':
        group.textDirectives.add(const UppercaseStringDirective());

        return true;
      case 'lowercase':
        group.textDirectives.add(const LowercaseStringDirective());

        return true;
      case 'capitalize':
        group.textDirectives.add(const CapitalizeStringDirective());

        return true;
      case 'truncate':
        group.overflow = .ellipsis;
        group.maxLines = 1;
        group.softWrap = false;

        return true;
      case 'leading-even':
        group.textHeightBehavior.leadingDistribution = .even;

        return true;
      case 'leading-trim':
        group.textHeightBehavior
          ..leadingDistribution = .even
          ..applyHeightToFirstAscent = false
          ..applyHeightToLastDescent = false;

        return true;
    }

    if (_applyFontWeight(group.textStyle, raw)) return true;
    if (_applyLineHeight(group.textStyle, raw)) return true;
    if (_applyTracking(group.textStyle, raw)) return true;
    if (_applyTextShadow(group.textStyle, raw)) return true;

    return false;
  }

  bool _applyDefaultTextUtility(
    _GroupContext group,
    String root,
    TailwindValue? value,
    TailwindModifier? modifier,
  ) {
    if (root == 'text' || root == 'size') {
      return _applyTextStyleUtility(
        () => group.ensureDefaultTextStyle(),
        value,
        modifier,
      );
    }

    return false;
  }

  bool _applyTextStyleUtility(
    _TextStyleAccum Function() style,
    TailwindValue? value,
    TailwindModifier? modifier,
  ) {
    final key = tailwindValueKey(value);
    final size = key == null ? null : config.fontSizes[key];
    if (size != null) {
      final lineHeight = twDefaultLineHeights[key];
      style()
        ..fontSize = size
        ..fontSizeHeight = lineHeight;

      return true;
    }

    final arbitraryLength = _arbitraryLength(value);
    if (arbitraryLength != null) {
      style().fontSize = arbitraryLength;

      return true;
    }

    final color = _color(value, modifier);
    if (color != null) {
      style().color = color;

      return true;
    }

    return false;
  }

  bool _applyDefaultTextStatic(_GroupContext group, String raw) {
    final style = group.ensureDefaultTextStyle();
    if (_applyFontWeight(style, raw)) return true;
    if (_applyLineHeight(style, raw)) return true;
    if (_applyTracking(style, raw)) return true;
    if (_applyTextShadow(style, raw)) return true;

    return false;
  }

  bool _applySpacing(
    _GroupContext group,
    String root,
    TailwindValue? value, {
    required bool negative,
  }) {
    final edges = switch (root) {
      'p' || 'px' || 'py' || 'pt' || 'pr' || 'pb' || 'pl' => group.padding,
      'm' || 'mx' || 'my' || 'mt' || 'mr' || 'mb' || 'ml' => group.margin,
      _ => null,
    };
    if (edges == null) return false;
    final length = _spaceLength(value, negative: negative);
    if (length == null) return false;
    if (identical(edges, group.margin) && length < 0) return true;
    edges.set(length, sides: _axisOrSide(root));

    return true;
  }

  bool _applySizing(
    _GroupContext group,
    String root,
    TailwindValue? value, {
    required bool negative,
  }) {
    if (root == 'w-auto') {
      group.constraints
        ..minWidth = 0
        ..maxWidth = .infinity;

      return true;
    }
    if (root == 'h-auto') {
      group.constraints
        ..minHeight = 0
        ..maxHeight = .infinity;

      return true;
    }
    if (!sizingRoots.contains(root)) return false;
    if (negative) return false;
    final key = tailwindValueKey(value);
    if (key == 'auto') {
      switch (root) {
        case 'w':
          group.constraints
            ..minWidth = 0
            ..maxWidth = .infinity;

          return true;
        case 'h':
          group.constraints
            ..minHeight = 0
            ..maxHeight = .infinity;

          return true;
      }
    }
    final length = _sizingLength(root, value);
    if (length == null) return _isWidgetLayerSize(value);

    switch (root) {
      case 'w':
        group.constraints
          ..minWidth = length
          ..maxWidth = length;
      case 'h':
        group.constraints
          ..minHeight = length
          ..maxHeight = length;
      case 'min-w':
        group.constraints.minWidth = length;
      case 'min-h':
        group.constraints.minHeight = length;
      case 'max-w':
        group.constraints.maxWidth = length;
      case 'max-h':
        group.constraints.maxHeight = length;
      default:
        return false;
    }

    return true;
  }

  bool _applyRadius(_GroupContext group, String root, TailwindValue? value) {
    if (!root.startsWith('rounded')) return false;
    final key = tailwindValueKey(value) ?? '';
    final radius = config.radii[key];
    if (radius == null) return false;
    final corner = Radius.circular(radius);
    switch (root) {
      case 'rounded':
        group.decoration.borderRadius
          ..topLeft = corner
          ..topRight = corner
          ..bottomLeft = corner
          ..bottomRight = corner;
      case 'rounded-t':
        group.decoration.borderRadius
          ..topLeft = corner
          ..topRight = corner;
      case 'rounded-b':
        group.decoration.borderRadius
          ..bottomLeft = corner
          ..bottomRight = corner;
      case 'rounded-l':
        group.decoration.borderRadius
          ..topLeft = corner
          ..bottomLeft = corner;
      case 'rounded-r':
        group.decoration.borderRadius
          ..topRight = corner
          ..bottomRight = corner;
      case 'rounded-tl':
        group.decoration.borderRadius.topLeft = corner;
      case 'rounded-tr':
        group.decoration.borderRadius.topRight = corner;
      case 'rounded-bl':
        group.decoration.borderRadius.bottomLeft = corner;
      case 'rounded-br':
        group.decoration.borderRadius.bottomRight = corner;
      default:
        return false;
    }

    return true;
  }

  bool _applyBorder(
    _GroupContext group,
    String raw,
    String root,
    TailwindValue? value,
    TailwindModifier? modifier,
  ) {
    if (!root.startsWith('border')) return false;
    final key = tailwindValueKey(value) ?? '';
    final color = _color(value, modifier);
    final width = config.borderWidths[key] ?? (key.isEmpty ? 1.0 : null);

    if (color != null && width == null) {
      group.border.setColor(color, root);

      return true;
    }
    if (width == null) return false;

    switch (root) {
      case 'border':
        group.border.setAll(width);
      case 'border-t':
        group.border.topWidth = width;
      case 'border-r':
        group.border.rightWidth = width;
      case 'border-b':
        group.border.bottomWidth = width;
      case 'border-l':
        group.border.leftWidth = width;
      case 'border-x':
        group.border.setHorizontal(width);
      case 'border-y':
        group.border.setVertical(width);
      default:
        return raw.startsWith('border-') && color != null;
    }

    return true;
  }

  bool _applyTransform(
    TransformAccum transform,
    String root,
    TailwindValue? value,
    bool negative,
  ) {
    final key = tailwindValueKey(value);
    switch (root) {
      case 'scale':
        final scale = key == null ? null : config.scaleOf(key);
        if (scale == null) return false;
        transform.scale = scale;

        return true;
      case 'rotate':
        final rotate = key == null ? null : config.rotationOf(key);
        if (rotate == null) return false;
        transform.rotateDeg = negative ? -rotate : rotate;

        return true;
      case 'translate-x':
        final length = _spaceLength(value, negative: negative);
        if (length == null) return false;
        transform.translateX = length;

        return true;
      case 'translate-y':
        final length = _spaceLength(value, negative: negative);
        if (length == null) return false;
        transform.translateY = length;

        return true;
    }

    return false;
  }

  bool _applyGradient(GradientAccum gradient, TailwindCandidate candidate) {
    final utility = candidate.utility;
    final raw = utility.raw;
    final root = tailwindUtilityRoot(utility);
    final value = tailwindUtilityValue(utility);
    if (raw.startsWith('bg-gradient-')) {
      final directionKey = raw.substring(12);
      final direction = gradientDirections[directionKey];
      if (direction == null) return false;
      gradient.directionKey = directionKey;
      gradient.direction = direction;

      return true;
    } else if (root == 'bg-linear' || raw.startsWith('bg-linear-')) {
      final key = tailwindValueKey(value);
      final directionKey = key ?? raw.substring(10);
      final direction = gradientDirections[directionKey];
      if (direction == null) return false;
      gradient.directionKey = directionKey;
      gradient.direction = direction;

      return true;
    } else if (root == 'from') {
      final color = _color(value, tailwindUtilityModifier(utility));
      if (color == null) return false;
      gradient.fromColor = color;

      return true;
    } else if (root == 'via') {
      final color = _color(value, tailwindUtilityModifier(utility));
      if (color == null) return false;
      gradient.viaColor = color;

      return true;
    } else if (root == 'to') {
      final color = _color(value, tailwindUtilityModifier(utility));
      if (color == null) return false;
      gradient.toColor = color;

      return true;
    }

    return false;
  }

  S _wrapBoxVariant<S>(List<TwRuntimeVariant> path, S style) {
    var wrapped = style as BoxStyler;
    for (final part in path.reversed) {
      wrapped = _newBoxVariant(part, wrapped);
    }

    return wrapped as S;
  }

  S _wrapFlexVariant<S>(List<TwRuntimeVariant> path, S style) {
    var wrapped = style as FlexBoxStyler;
    for (final part in path.reversed) {
      wrapped = _newFlexVariant(part, wrapped);
    }

    return wrapped as S;
  }

  S _wrapTextVariant<S>(List<TwRuntimeVariant> path, S style) {
    var wrapped = style as TextStyler;
    for (final part in path.reversed) {
      wrapped = _newTextVariant(part, wrapped);
    }

    return wrapped as S;
  }

  BoxStyler _newBoxVariant(TwRuntimeVariant part, BoxStyler style) {
    return switch (part.kind) {
      .hover => BoxStyler().onHovered(style),
      .focus => BoxStyler().onFocused(style),
      .focusVisible => BoxStyler().onFocusVisible(style),
      .pressed => BoxStyler().onPressed(style),
      .disabled => BoxStyler().onDisabled(style),
      .enabled => BoxStyler().onEnabled(style),
      .dark => BoxStyler().onDark(style),
      .light => BoxStyler().onLight(style),
      .breakpoint => BoxStyler().onBreakpoint(
        Breakpoint(minWidth: part.breakpoint!),
        style,
      ),
      .notHover => BoxStyler().onNot(
        ContextVariant.widgetState(.hovered),
        style,
      ),
    };
  }

  FlexBoxStyler _newFlexVariant(TwRuntimeVariant part, FlexBoxStyler style) {
    return switch (part.kind) {
      .hover => FlexBoxStyler().onHovered(style),
      .focus => FlexBoxStyler().onFocused(style),
      .focusVisible => FlexBoxStyler().onFocusVisible(style),
      .pressed => FlexBoxStyler().onPressed(style),
      .disabled => FlexBoxStyler().onDisabled(style),
      .enabled => FlexBoxStyler().onEnabled(style),
      .dark => FlexBoxStyler().onDark(style),
      .light => FlexBoxStyler().onLight(style),
      .breakpoint => FlexBoxStyler().onBreakpoint(
        Breakpoint(minWidth: part.breakpoint!),
        style,
      ),
      .notHover => FlexBoxStyler().onNot(
        ContextVariant.widgetState(.hovered),
        style,
      ),
    };
  }

  TextStyler _newTextVariant(TwRuntimeVariant part, TextStyler style) {
    return switch (part.kind) {
      .hover => TextStyler().onHovered(style),
      .focus => TextStyler().onFocused(style),
      .focusVisible => TextStyler().onFocusVisible(style),
      .pressed => TextStyler().onPressed(style),
      .disabled => TextStyler().onDisabled(style),
      .enabled => TextStyler().onEnabled(style),
      .dark => TextStyler().onDark(style),
      .light => TextStyler().onLight(style),
      .breakpoint => TextStyler().onBreakpoint(
        Breakpoint(minWidth: part.breakpoint!),
        style,
      ),
      .notHover => TextStyler().onNot(
        ContextVariant.widgetState(.hovered),
        style,
      ),
    };
  }

  _VariantPath? _variantPath(List<TailwindVariant> variants) {
    final parts = <TwRuntimeVariant>[];
    for (final variant in variants) {
      final part = runtimeVariantFor(variant, breakpoints: config.breakpoints);
      if (part == null) return null;
      parts.add(part);
    }

    return parts.isEmpty
        ? _VariantPath.base
        : _VariantPath(List.unmodifiable(parts));
  }

  bool _isSupportedWidgetLayerUtility(TailwindUtility utility) {
    if (_isBasisUtility(utility)) {
      return _isSupportedBasisUtility(utility);
    }

    final root = tailwindUtilityRoot(utility);
    if (root == 'gap-x' || root == 'gap-y') {
      return !tailwindUtilityNegative(utility) &&
          _spaceLengthForUtility(utility) != null;
    }

    if (sizingRoots.contains(root)) {
      final key = tailwindValueKey(tailwindUtilityValue(utility));
      final isFraction = key != null && parseFractionToken(key) != null;

      return switch (root) {
        'w' || 'h' => key == 'full' || key == 'screen' || isFraction,
        'min-w' || 'min-h' => key == 'screen',
        _ => false,
      };
    }

    return true;
  }

  bool _isWidgetLayerUtilitySupportedForTarget(
    TailwindUtility utility,
    TwTarget target,
  ) {
    if (_isAnimationUtility(utility)) return true;
    if (target == .text) return false;

    final root = tailwindUtilityRoot(utility);

    return target == .flexBox || (root != 'gap-x' && root != 'gap-y');
  }

  bool _isLayoutOwnedCandidate(_CompiledCandidate compiled, TwTarget target) {
    final inset = compiled.layoutInput?.inset;

    return switch (target) {
      .text => inset?.kind == .margin,
      .box || .flexBox => false,
    };
  }

  bool _hasOnlyBreakpointVariants(List<TailwindVariant> variants) {
    for (final variant in variants) {
      if (variant is! TailwindStaticVariant ||
          !config.breakpoints.containsKey(variant.root)) {
        return false;
      }
    }

    return true;
  }

  bool _isRootLayoutWidgetUtility(TailwindUtility utility) {
    final raw = utility.raw;
    final root = tailwindUtilityRoot(utility);
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
        root == 'gap-y') {
      return true;
    }
    if (sizingRoots.contains(root)) {
      final valueKey = tailwindValueKey(tailwindUtilityValue(utility));

      return valueKey == 'full' ||
          valueKey == 'screen' ||
          valueKey == 'auto' ||
          valueKey?.contains('/') == true;
    }

    return false;
  }

  bool _isBasisUtility(TailwindUtility utility) {
    final raw = utility.raw;

    return raw.startsWith('basis-') || tailwindUtilityRoot(utility) == 'basis';
  }

  bool _isSupportedBasisUtility(TailwindUtility utility) {
    if (tailwindUtilityNegative(utility)) return false;

    final key = _basisKey(utility);
    if (key == null || key.isEmpty) return false;
    if (key == 'auto') return true;

    return config.hasSpace(key);
  }

  String? _basisKey(TailwindUtility utility) {
    final raw = utility.raw;
    if (raw.startsWith('basis-')) {
      return raw.substring(6);
    }

    if (tailwindUtilityRoot(utility) == 'basis') {
      return tailwindValueKey(tailwindUtilityValue(utility));
    }

    return null;
  }

  double? _spaceLength(TailwindValue? value, {required bool negative}) {
    final key = tailwindValueKey(value);
    final resolved = key == null ? null : config.space[key];
    final length = resolved ?? _arbitraryLength(value);
    if (length == null) return null;

    return negative ? -length : length;
  }

  double? _spaceLengthForUtility(TailwindUtility utility) {
    final parsed = _spaceLength(tailwindUtilityValue(utility), negative: false);
    if (parsed != null) return parsed;

    final raw = utility.raw;
    final root = tailwindUtilityRoot(utility);
    final prefix = '$root-';
    if (!raw.startsWith(prefix)) return null;

    final key = raw.substring(prefix.length);
    final configured = config.space[key];
    if (configured != null) return configured;
    if (key == 'px') return 1;
    if (!key.startsWith('[') || !key.endsWith(']')) return null;

    return parseCssLength(key.substring(1, key.length - 1));
  }

  double? _sizingLength(String root, TailwindValue? value) {
    final key = tailwindValueKey(value);
    if (root == 'max-w' && key != null) {
      final maxWidth = kTailwindMaxWidthPresets[key];
      if (maxWidth != null) return maxWidth;
    }

    return _spaceLength(value, negative: false);
  }

  double? _arbitraryLength(TailwindValue? value) {
    return value is TailwindArbitraryValue ? parseCssLength(value.value) : null;
  }

  Color? _color(TailwindValue? value, TailwindModifier? modifier) {
    if (value is TailwindArbitraryValue) {
      final parsed = _hexColor(value.value);

      return _applyOpacity(parsed, modifier);
    }
    if (value is TailwindCssVariableValue) return null;
    final key = tailwindValueKey(value);
    if (key == null || key.isEmpty) return null;

    return _applyOpacity(config.colorOf(key), modifier);
  }

  Color? _applyOpacity(Color? color, TailwindModifier? modifier) {
    if (color == null || modifier == null) return color;
    final percent = switch (modifier) {
      TailwindNamedModifier(:final raw) => double.tryParse(raw),
      TailwindArbitraryModifier(:final value) => _arbitraryOpacityPercent(
        value,
      ),
      TailwindCssVariableModifier() => null,
    };
    if (percent == null || percent < 0 || percent > 100) return null;

    return color.withAlpha((percent * 255 / 100).round());
  }

  /// Tailwind arbitrary opacity modifiers: `[50%]` is a 0–100 percentage,
  /// while `[0.5]` is a 0–1 alpha fraction. Both normalize to the 0–100 scale.
  double? _arbitraryOpacityPercent(String value) {
    if (value.contains('%')) return double.tryParse(value.replaceAll('%', ''));
    final fraction = double.tryParse(value);

    return fraction == null ? null : fraction * 100;
  }

  Color? _hexColor(String value) {
    if (!value.startsWith('#')) return null;
    final hex = value.substring(1);
    if (hex.length != 3 &&
        hex.length != 4 &&
        hex.length != 6 &&
        hex.length != 8) {
      return null;
    }
    if (int.tryParse(hex, radix: 16) == null) return null;

    String expand(int index) => '${hex[index]}${hex[index]}';
    final r = hex.length <= 4 ? expand(0) : hex.substring(0, 2);
    final g = hex.length <= 4 ? expand(1) : hex.substring(2, 4);
    final b = hex.length <= 4 ? expand(2) : hex.substring(4, 6);
    final a = switch (hex.length) {
      4 => expand(3),
      8 => hex.substring(6, 8),
      _ => 'ff',
    };
    final argb = int.parse('$a$r$g$b', radix: 16);

    return Color(argb);
  }

  double? _opacity(TailwindValue? value) {
    final key = tailwindValueKey(value);
    if (key == null) return null;
    final numeric = double.tryParse(key);
    if (numeric == null) return null;

    return numeric / 100;
  }

  double? _blur(TailwindValue? value) {
    final key = tailwindValueKey(value) ?? '';

    return config.blurOf(key);
  }

  List<BoxShadowMix>? _boxShadowMixes(String raw, TailwindValue? value) {
    final key = raw == 'shadow'
        ? 'shadow'
        : 'shadow-${tailwindValueKey(value) ?? 'null'}';
    final shadows = raw == 'shadow-none'
        ? const <BoxShadowMix>[]
        : kTailwindBoxShadowPresets[key];
    if (shadows == null) return null;

    return List.of(shadows, growable: false);
  }

  bool _applyFontWeight(_TextStyleAccum style, String raw) {
    final weight = switch (raw) {
      'font-thin' => FontWeight.w100,
      'font-extralight' => FontWeight.w200,
      'font-light' => FontWeight.w300,
      'font-normal' => FontWeight.w400,
      'font-medium' => FontWeight.w500,
      'font-semibold' => FontWeight.w600,
      'font-bold' => FontWeight.w700,
      'font-extrabold' => FontWeight.w800,
      'font-black' => FontWeight.w900,
      _ => null,
    };
    if (weight == null) return false;
    style.fontWeight = weight;

    return true;
  }

  bool _applyLineHeight(_TextStyleAccum style, String raw) {
    final key = raw.startsWith('leading-') ? raw.substring(8) : null;
    final height = key == null ? null : twDefaultLeading[key];
    if (height == null) return false;
    style.explicitHeight = height;

    return true;
  }

  bool _applyTracking(_TextStyleAccum style, String raw) {
    final key = raw.startsWith('tracking-') ? raw.substring(9) : null;
    final tracking = key == null ? null : twDefaultTracking[key];
    if (tracking == null) return false;
    style.trackingEm = tracking;

    return true;
  }

  bool _applyTextShadow(_TextStyleAccum style, String raw) {
    final shadows = switch (raw) {
      'text-shadow-none' => const <Shadow>[],
      'text-shadow-2xs' => kTextShadowPresets[TextShadowPreset.twoXs]!,
      'text-shadow-xs' => kTextShadowPresets[TextShadowPreset.xs]!,
      'text-shadow-sm' => kTextShadowPresets[TextShadowPreset.sm]!,
      'text-shadow-md' => kTextShadowPresets[TextShadowPreset.md]!,
      'text-shadow-lg' => kTextShadowPresets[TextShadowPreset.lg]!,
      _ => null,
    };
    if (shadows == null) return false;
    style.shadows = shadows.map(ShadowMix.value).toList(growable: false);

    return true;
  }

  bool _isWidgetLayerSize(TailwindValue? value) {
    final key = tailwindValueKey(value);

    return key == 'full' ||
        key == 'screen' ||
        key == 'auto' ||
        key?.contains('/') == true;
  }

  String _axisOrSide(String root) {
    if (root.length == 1) return 'all';

    return switch (root.substring(root.length - 1)) {
      'x' => 'x',
      'y' => 'y',
      't' => 'top',
      'r' => 'right',
      'b' => 'bottom',
      'l' => 'left',
      _ => 'all',
    };
  }

  BoxStyler _translateBoxProgram(_CandidateProgram program) {
    return _translate<BoxStyler>(
      program,
      target: .box,
      build: (context) => context.toBoxStyler(config),
      merge: (base, other) => base.merge(other),
      wrapVariant: _wrapBoxVariant,
    );
  }

  FlexBoxStyler _translateFlexProgram(_CandidateProgram program) {
    return _translate<FlexBoxStyler>(
      program,
      target: .flexBox,
      build: (context) => context.toFlexBoxStyler(config),
      merge: (base, other) => base.merge(other),
      wrapVariant: _wrapFlexVariant,
      afterBase: (context) {
        if (!context.hasBaseFlex) {
          context.direction = .vertical;
        }
      },
    );
  }

  TextStyler _translateTextProgram(_CandidateProgram program) {
    return _translate<TextStyler>(
      program,
      target: .text,
      build: (context) => context.toTextStyler(config),
      merge: (base, other) => base.merge(other),
      wrapVariant: _wrapTextVariant,
    );
  }

  IconStyler _translateIconProgram(_CandidateProgram program) {
    double? width;
    double? height;
    Color? color;
    double? opacity;

    _reportParseFailures(program);
    for (final compiled in program.candidates) {
      final _CompiledCandidate(:token, :candidate, :route) = compiled;

      if (compiled.layoutInput?.iconLogicalMargin != null) {
        continue;
      }
      if (_reportBlockingRoute(token, route)) continue;
      if (route.kind == .widgetLayer &&
          _isAnimationUtility(candidate.utility)) {
        continue;
      }
      if (candidate.variants.isNotEmpty || route.kind != .style) {
        _reportUnsupported(
          token,
          code: .unsupportedForTarget,
          reason: 'This candidate cannot be applied to an icon target.',
          workaround: 'Apply the variant or box utility to a wrapping Div.',
        );
        continue;
      }

      final utility = candidate.utility;
      if (tailwindUtilityNegative(utility)) {
        _reportUnsupported(
          token,
          reason: 'Negative icon sizing and opacity values are unsupported.',
        );
        continue;
      }
      final root = tailwindUtilityRoot(utility);
      final value = tailwindUtilityValue(utility);
      var handled = false;

      switch (root) {
        case 'w':
          final resolved = _sizingLength('w', value);
          if (resolved != null) {
            width = resolved;
            handled = true;
          }
        case 'h':
          final resolved = _sizingLength('h', value);
          if (resolved != null) {
            height = resolved;
            handled = true;
          }
        case 'text':
          final resolved = _color(value, tailwindUtilityModifier(utility));
          if (resolved != null) {
            color = resolved;
            handled = true;
          }
        case 'opacity':
          final resolved = _opacity(value);
          if (resolved != null) {
            opacity = resolved;
            handled = true;
          }
      }

      if (!handled) {
        _reportUnsupported(
          token,
          code: .unsupportedForTarget,
          reason: 'This utility has no supported icon translation.',
        );
      }
    }

    final size = (width != null && height != null)
        ? (width < height ? width : height)
        : (width ?? height);

    return IconStyler(color: color, size: size, opacity: opacity);
  }

  bool _isAnimationUtility(TailwindUtility utility) {
    final raw = utility.raw;
    final root = tailwindUtilityRoot(utility);

    return transitionTriggerTokens.contains(raw) ||
        raw == 'transition-none' ||
        _easeTokens.containsKey(raw) ||
        root == 'duration' ||
        root == 'delay';
  }

  bool _programWantsFlex(_CandidateProgram program) {
    return program.candidates.any(
      (compiled) =>
          compiled.route.kind != .ignored &&
          compiled.route.kind != .unsupported &&
          isFlexContainerCandidate(compiled.candidate),
    );
  }

  bool _programHasBoxUtilities(_CandidateProgram program) {
    return program.candidates.any(
      (compiled) =>
          compiled.route.kind != .ignored &&
          compiled.route.kind != .unsupported &&
          isBoxStylingCandidate(compiled.candidate),
    );
  }

  TwLayoutUtilityInput? _layoutInput(
    TailwindCandidate candidate,
    TwRoute route,
  ) {
    final utility = candidate.utility;
    final logicalMargin = _layoutLogicalMargin(utility);
    if (route.kind == .ignored ||
        (route.kind == .unsupported && logicalMargin == null) ||
        (route.kind == .widgetLayer &&
            !_isSupportedWidgetLayerUtility(utility))) {
      return null;
    }

    var minWidth = 0.0;
    for (final variant in candidate.variants) {
      if (variant is! TailwindStaticVariant) return null;
      final breakpoint = config.breakpoints[variant.root];
      if (breakpoint == null) return null;
      minWidth = breakpoint;
    }

    return TwLayoutUtilityInput(
      breakpointMinWidth: minWidth,
      dimension: _layoutDimension(utility),
      flexContainer: _layoutFlexContainer(
        candidate,
        establishesBaseFlex: candidate.variants.isEmpty,
      ),
      flexItem: _layoutFlexItem(utility),
      inset: _layoutInset(utility),
      iconLogicalMargin: logicalMargin,
    );
  }

  TwLayoutDimensionDeclaration? _layoutDimension(TailwindUtility utility) {
    final raw = utility.raw;
    final root = tailwindUtilityRoot(utility);
    if (tailwindUtilityNegative(utility)) return null;

    final staticDimension = switch (raw) {
      'w-auto' => (property: TwLayoutDimensionProperty.width, key: 'auto'),
      'h-auto' => (property: TwLayoutDimensionProperty.height, key: 'auto'),
      'min-w-auto' => (
        property: TwLayoutDimensionProperty.minWidth,
        key: 'auto',
      ),
      'min-h-auto' => (
        property: TwLayoutDimensionProperty.minHeight,
        key: 'auto',
      ),
      'w-screen' => (property: TwLayoutDimensionProperty.width, key: 'screen'),
      'h-screen' => (property: TwLayoutDimensionProperty.height, key: 'screen'),
      'min-w-screen' => (
        property: TwLayoutDimensionProperty.minWidth,
        key: 'screen',
      ),
      'min-h-screen' => (
        property: TwLayoutDimensionProperty.minHeight,
        key: 'screen',
      ),
      'max-w-screen' => (
        property: TwLayoutDimensionProperty.maxWidth,
        key: 'screen',
      ),
      'max-h-screen' => (
        property: TwLayoutDimensionProperty.maxHeight,
        key: 'screen',
      ),
      _ => null,
    };
    final property =
        staticDimension?.property ??
        switch (root) {
          'w' => .width,
          'h' => .height,
          'min-w' => .minWidth,
          'min-h' => .minHeight,
          'max-w' => .maxWidth,
          'max-h' => .maxHeight,
          _ => null,
        };
    if (property == null) return null;

    final value = tailwindUtilityValue(utility);
    final key = staticDimension?.key ?? tailwindValueKey(value);
    final TwDimensionIntent? intent;
    if (key == 'auto') {
      intent = const TwDimensionIntent.auto();
    } else if (key == 'full') {
      intent = const TwDimensionIntent.full();
    } else if (key == 'screen') {
      intent = const TwDimensionIntent.screen();
    } else {
      final fraction = key == null ? null : parseFractionToken(key);
      final pixels = _sizingLength(root, value);
      intent = fraction != null
          ? TwDimensionIntent.fraction(fraction)
          : pixels != null
          ? TwDimensionIntent.fixed(pixels)
          : null;
    }
    if (intent == null) return null;

    return TwLayoutDimensionDeclaration(property: property, intent: intent);
  }

  TwLayoutFlexContainerDeclaration? _layoutFlexContainer(
    TailwindCandidate candidate, {
    required bool establishesBaseFlex,
  }) {
    if (!isFlexContainerCandidate(candidate)) return null;

    final utility = candidate.utility;
    final raw = utility.raw;
    final root = tailwindUtilityRoot(utility);
    final isAxisUtility =
        raw == 'flex' ||
        raw == 'inline-flex' ||
        raw == 'flex-row' ||
        raw == 'flex-col';
    final display = switch (raw) {
      'flex' => TwFlexDisplay.flex,
      'inline-flex' => TwFlexDisplay.inlineFlex,
      _ => null,
    };
    final axis = switch (raw) {
      'flex' || 'inline-flex' || 'flex-row' => TwFlexAxis.horizontal,
      'flex-col' => TwFlexAxis.vertical,
      _ => null,
    };
    final gapAxis = switch (root) {
      'gap' => TwLayoutGapAxis.all,
      'gap-x' => TwLayoutGapAxis.horizontal,
      'gap-y' => TwLayoutGapAxis.vertical,
      _ => null,
    };
    final gap = gapAxis == null || tailwindUtilityNegative(utility)
        ? null
        : _spaceLengthForUtility(utility);

    return TwLayoutFlexContainerDeclaration(
      establishesBaseFlex: establishesBaseFlex && isAxisUtility,
      display: display,
      axis: axis,
      gapAxis: gap == null ? null : gapAxis,
      gap: gap,
      explicitItems: raw.startsWith('items-'),
    );
  }

  TwLayoutFlexItemDeclaration? _layoutFlexItem(TailwindUtility utility) {
    final raw = utility.raw;
    final shorthand = switch (raw) {
      'flex-1' => const TwLayoutFlexItemDeclaration(
        basis: .zero,
        explicitBasis: false,
        grow: 1,
        shrink: 1,
        behavior: TwFlexBehavior(flex: 1, fit: .tight),
      ),
      'flex-auto' => const TwLayoutFlexItemDeclaration(
        basis: .auto,
        explicitBasis: false,
        grow: 1,
        shrink: 1,
        behavior: TwFlexBehavior(flex: 1, fit: .loose),
      ),
      'flex-initial' => const TwLayoutFlexItemDeclaration(
        basis: .auto,
        explicitBasis: false,
        grow: 0,
        shrink: 1,
        behavior: TwFlexBehavior(flex: 0, fit: .loose),
      ),
      'flex-none' => const TwLayoutFlexItemDeclaration(
        basis: .auto,
        explicitBasis: false,
        grow: 0,
        shrink: 0,
        behavior: TwFlexBehavior(flex: 0, fit: .loose),
      ),
      _ => null,
    };
    if (shorthand != null) return shorthand;

    if (_isBasisUtility(utility) && _isSupportedBasisUtility(utility)) {
      final key = _basisKey(utility)!;
      final pixels = config.space[key];
      final basis = key == 'auto'
          ? TwFlexBasis.auto
          : pixels == 0
          ? TwFlexBasis.zero
          : TwFlexBasis.fixed(pixels!);

      return TwLayoutFlexItemDeclaration(
        basis: basis,
        explicitBasis: true,
        basisPriority: 1,
      );
    }

    final grow = switch (raw) {
      'grow' => 1.0,
      'grow-0' => 0.0,
      _ => null,
    };
    if (grow != null) {
      return TwLayoutFlexItemDeclaration(
        grow: grow,
        growPriority: 1,
        behavior: TwFlexBehavior(
          flex: grow > 0 ? 1 : 0,
          fit: grow > 0 ? .tight : .loose,
        ),
      );
    }

    final shrink = switch (raw) {
      'shrink' || 'flex-shrink' => 1.0,
      'shrink-0' || 'flex-shrink-0' => 0.0,
      _ => null,
    };
    if (shrink != null) {
      return TwLayoutFlexItemDeclaration(
        shrink: shrink,
        shrinkPriority: 1,
        behavior: TwFlexBehavior(
          flex: shrink > 0 ? 1 : 0,
          fit: shrink > 0 ? .tight : .loose,
        ),
      );
    }

    final alignment = switch (raw) {
      'self-start' => TwSelfAlignment.start,
      'self-center' => TwSelfAlignment.center,
      'self-end' => TwSelfAlignment.end,
      _ => null,
    };

    return alignment == null
        ? null
        : TwLayoutFlexItemDeclaration(selfAlignment: alignment);
  }

  TwLayoutInsetDeclaration? _layoutInset(TailwindUtility utility) {
    if (tailwindUtilityNegative(utility)) return null;
    final root = tailwindUtilityRoot(utility);
    final spacingSides = _layoutSpacingSides(root);
    if (spacingSides != null) {
      final value = _spaceLengthForUtility(utility);
      if (value == null) return null;

      return TwLayoutInsetDeclaration(
        kind: root.startsWith('m') ? .margin : .padding,
        sides: spacingSides,
        value: value,
      );
    }

    final borderSides = switch (root) {
      'border' => TwLayoutInsetSides.all,
      'border-x' => TwLayoutInsetSides.horizontal,
      'border-y' => TwLayoutInsetSides.vertical,
      'border-t' => TwLayoutInsetSides.top,
      'border-r' => TwLayoutInsetSides.right,
      'border-b' => TwLayoutInsetSides.bottom,
      'border-l' => TwLayoutInsetSides.left,
      _ => null,
    };
    if (borderSides == null) return null;
    final key = tailwindValueKey(tailwindUtilityValue(utility)) ?? '';
    final width = config.borderWidths[key] ?? (key.isEmpty ? 1.0 : null);
    if (width == null) return null;

    return TwLayoutInsetDeclaration(
      kind: .border,
      sides: borderSides,
      value: width,
    );
  }

  TwLayoutLogicalInsetDeclaration? _layoutLogicalMargin(
    TailwindUtility utility,
  ) {
    if (tailwindUtilityNegative(utility)) return null;
    final sides = switch (tailwindUtilityRoot(utility)) {
      'ms' => TwLayoutLogicalInsetSides.start,
      'me' => TwLayoutLogicalInsetSides.end,
      'ml' => TwLayoutLogicalInsetSides.left,
      'mr' => TwLayoutLogicalInsetSides.right,
      _ => null,
    };
    if (sides == null) return null;
    final value = _spaceLengthForUtility(utility);

    return value == null
        ? null
        : TwLayoutLogicalInsetDeclaration(sides: sides, value: value);
  }

  TwLayoutInsetSides? _layoutSpacingSides(String root) => switch (root) {
    'm' || 'p' => .all,
    'mx' || 'px' => .horizontal,
    'my' || 'py' => .vertical,
    'mt' || 'pt' => .top,
    'mr' || 'pr' => .right,
    'mb' || 'pb' => .bottom,
    'ml' || 'pl' => .left,
    _ => null,
  };

  TwCompiledLayoutPlan _buildLayoutPlan(_CandidateProgram program) {
    final builder = TwLayoutPlanBuilder();
    for (final compiled in program.candidates) {
      if (compiled.layoutInput case final input?) builder.add(input);
    }

    return builder.build();
  }

  TwCompiledLayoutPlan _boxLayoutPlan(TwCompiledLayoutPlan plan) => .new(
    dimensions: plan.dimensions,
    flexItem: plan.flexItem,
    externalMargin: plan.externalMargin,
    zeroBasisInsets: plan.zeroBasisInsets,
  );

  TwCompiledLayoutPlan _flexLayoutPlan(TwCompiledLayoutPlan plan) => .new(
    dimensions: plan.dimensions,
    flexContainer: plan.flexContainer.asFlexTarget(),
    flexItem: plan.flexItem,
    externalMargin: plan.externalMargin,
    zeroBasisInsets: plan.zeroBasisInsets,
  );

  TwCompiledLayoutPlan _inlineLayoutPlan(TwCompiledLayoutPlan plan) =>
      .new(externalMargin: plan.externalMargin);

  TwCompiledLayoutPlan _textLayoutPlan(TwCompiledLayoutPlan plan) =>
      .new(externalMargin: plan.externalMargin);

  TwCompiledLayoutPlan _iconLayoutPlan(TwCompiledLayoutPlan plan) =>
      .new(iconLogicalMargin: plan.iconLogicalMargin);

  CurveAnimationConfig? _parseAnimationProgram(
    _CandidateProgram program, {
    required bool reportSharedDiagnostics,
  }) {
    var hasTransition = false;
    var hasTransitionNone = false;
    var duration = const Duration(milliseconds: 150);
    Curve curve = Curves.easeOut;
    var delay = Duration.zero;

    if (reportSharedDiagnostics) _reportParseFailures(program);
    for (final compiled in program.candidates) {
      final _CompiledCandidate(:token, :candidate, :route) = compiled;
      if (route.kind == .ignored || route.kind == .unsupported) {
        if (reportSharedDiagnostics) _reportBlockingRoute(token, route);
        continue;
      }

      final base = candidate.utility.raw;
      if (transitionTriggerTokens.contains(base)) {
        hasTransition = true;
      } else if (base == 'transition-none') {
        hasTransitionNone = true;
      } else if (base.startsWith('duration-')) {
        final ms = config.durationOf(base.substring(9));
        if (ms != null) {
          duration = Duration(milliseconds: ms);
        } else {
          _reportUnsupported(
            token,
            reason: 'The transition duration is not in the configured scale.',
            workaround: 'Use a duration key from TwConfig.durations.',
          );
        }
      } else if (_easeTokens.containsKey(base)) {
        curve = _easeTokens[base]!;
      } else if (base.startsWith('delay-')) {
        final ms = config.delayOf(base.substring(6));
        if (ms != null) {
          delay = Duration(milliseconds: ms);
        } else {
          _reportUnsupported(
            token,
            reason: 'The transition delay is not in the configured scale.',
            workaround: 'Use a delay key from TwConfig.delays.',
          );
        }
      }
    }

    if (hasTransitionNone || !hasTransition) return null;

    return CurveAnimationConfig(duration: duration, curve: curve, delay: delay);
  }

  TwCompilation<S> _compile<S extends Object>(
    String classNames, {
    required _CompilationArtifacts<S> Function(
      TwTranslator worker,
      _CandidateProgram program,
    )
    build,
    required S Function(S styler, CurveAnimationConfig animation)
    attachAnimation,
  }) {
    final program = _compileProgram(splitTailwindTokens(classNames));
    final collector = _DiagnosticCollector();
    final worker = TwTranslator(config: config, onDiagnostic: collector.add);
    final artifacts = build(worker, program);
    final animation = worker._parseAnimationProgram(
      program,
      reportSharedDiagnostics: false,
    );
    final styler = animation == null
        ? artifacts.styler
        : attachAnimation(artifacts.styler, animation);
    final compilation = TwCompilation<S>(
      styler: styler,
      layoutPlan: artifacts.layoutPlan,
      diagnostics: collector.diagnostics,
    );
    collector.replay(onDiagnostic, legacyOnUnsupported);

    return compilation;
  }

  TwCompilation<BoxStyler> compileBox(String classNames) => _compile<BoxStyler>(
    classNames,
    build: (worker, program) {
      final plan = worker._buildLayoutPlan(program);

      return _CompilationArtifacts(
        styler: worker._translateBoxProgram(program),
        layoutPlan: worker._boxLayoutPlan(plan),
      );
    },
    attachAnimation: (styler, animation) => styler.animate(animation),
  );

  TwCompilation<FlexBoxStyler> compileFlex(String classNames) =>
      _compile<FlexBoxStyler>(
        classNames,
        build: (worker, program) {
          final plan = worker._buildLayoutPlan(program);

          return _CompilationArtifacts(
            styler: worker._translateFlexProgram(program),
            layoutPlan: worker._flexLayoutPlan(plan),
          );
        },
        attachAnimation: (styler, animation) => styler.animate(animation),
      );

  TwCompilation<TextStyler> compileText(String classNames) =>
      _compile<TextStyler>(
        classNames,
        build: (worker, program) {
          final plan = worker._buildLayoutPlan(program);

          return _CompilationArtifacts(
            styler: worker._translateTextProgram(program),
            layoutPlan: worker._textLayoutPlan(plan),
          );
        },
        attachAnimation: (styler, animation) => styler.animate(animation),
      );

  TwCompilation<IconStyler> compileIcon(String classNames) =>
      _compile<IconStyler>(
        classNames,
        build: (worker, program) {
          final plan = worker._buildLayoutPlan(program);

          return _CompilationArtifacts(
            styler: worker._translateIconProgram(program),
            layoutPlan: worker._iconLayoutPlan(plan),
          );
        },
        attachAnimation: (styler, animation) => styler.animate(animation),
      );

  /// Compiles the widget-facing outputs for [mode] from one candidate program.
  ///
  /// Parsed candidate records stay private to this library. The widget layer
  /// receives only target inference, typed stylers, diagnostics, and the
  /// semantic layout plan.
  TwWidgetCompilation compileForWidget(
    String classNames,
    TwWidgetCompilationMode mode, {
    bool? forceFlex,
  }) {
    final program = _compileProgram(splitTailwindTokens(classNames));
    final inferredFlex = _programWantsFlex(program);
    final wantsFlex = mode == .boxOrFlex ? (forceFlex ?? inferredFlex) : false;
    final hasBoxUtilities = _programHasBoxUtilities(program);
    final fullLayoutPlan = _buildLayoutPlan(program);
    final collector = _DiagnosticCollector();
    final targetCollectors = <_DiagnosticCollector>[];
    TwTranslator workerForTarget() {
      final targetCollector = _DiagnosticCollector();
      targetCollectors.add(targetCollector);

      return TwTranslator(config: config, onDiagnostic: targetCollector.add);
    }

    BoxStyler? boxStyler;
    FlexBoxStyler? flexStyler;
    TextStyler? textStyler;
    IconStyler? iconStyler;

    switch (mode) {
      case .boxOrFlex:
        if (wantsFlex) {
          flexStyler = workerForTarget()._translateFlexProgram(program);
        } else {
          boxStyler = workerForTarget()._translateBoxProgram(program);
        }
      case .inline:
        if (hasBoxUtilities) {
          boxStyler = workerForTarget()._translateBoxProgram(program);
        }
        textStyler = workerForTarget()._translateTextProgram(program);
      case .text:
        textStyler = workerForTarget()._translateTextProgram(program);
      case .icon:
        iconStyler = workerForTarget()._translateIconProgram(program);
    }

    final firstTargetCollector = targetCollectors.first;
    if (targetCollectors.length == 1) {
      collector.addAll(firstTargetCollector.diagnostics);
    } else {
      collector.addAll(
        firstTargetCollector.diagnostics.where(
          (diagnostic) => targetCollectors
              .skip(1)
              .every((other) => other.containsToken(diagnostic.token)),
        ),
      );
    }

    final animationWorker = TwTranslator(
      config: config,
      onDiagnostic: collector.add,
    );
    final animation = animationWorker._parseAnimationProgram(
      program,
      reportSharedDiagnostics: false,
    );
    if (animation != null) {
      boxStyler = boxStyler?.animate(animation);
      flexStyler = flexStyler?.animate(animation);
      textStyler = textStyler?.animate(animation);
      iconStyler = iconStyler?.animate(animation);
    }
    final layoutPlan = switch (mode) {
      .boxOrFlex =>
        wantsFlex
            ? _flexLayoutPlan(fullLayoutPlan)
            : _boxLayoutPlan(fullLayoutPlan),
      .inline => _inlineLayoutPlan(fullLayoutPlan),
      .text => _textLayoutPlan(fullLayoutPlan),
      .icon => _iconLayoutPlan(fullLayoutPlan),
    };
    final compilation = TwWidgetCompilation(
      mode: mode,
      boxStyler: boxStyler,
      flexStyler: flexStyler,
      textStyler: textStyler,
      iconStyler: iconStyler,
      wantsFlex: wantsFlex,
      hasBoxUtilities: hasBoxUtilities,
      layoutPlan: layoutPlan,
      parentLayoutPlan: fullLayoutPlan,
      diagnostics: collector.diagnostics,
    );
    collector.replay(onDiagnostic, legacyOnUnsupported);

    return compilation;
  }

  BoxStyler translateBox(String classNames) =>
      _translateBoxProgram(_compileProgram(splitTailwindTokens(classNames)));

  FlexBoxStyler translateFlex(String classNames) =>
      _translateFlexProgram(_compileProgram(splitTailwindTokens(classNames)));

  TextStyler translateText(String classNames) =>
      _translateTextProgram(_compileProgram(splitTailwindTokens(classNames)));

  IconStyler translateIcon(String classNames) =>
      _translateIconProgram(_compileProgram(splitTailwindTokens(classNames)));
}

const _easeTokens = {
  'ease-linear': Curves.linear,
  'ease-in': Curves.easeIn,
  'ease-out': Curves.easeOut,
  'ease-in-out': Curves.easeInOut,
};

final class _GroupContext {
  final TwTarget target;

  final padding = _EdgeAccum();
  final margin = _EdgeAccum();
  final constraints = _ConstraintsAccum();
  final decoration = _DecorationAccum();
  final modifiers = <ModifierMix>[];
  final textStyle = _TextStyleAccum();
  final defaultTextStyle = _TextStyleAccum();
  final textHeightBehavior = _TextHeightBehaviorAccum();
  final textDirectives = <Directive<String>>[];
  final transform = TransformAccum();
  final border = BorderAccum();
  final gradient = GradientAccum();
  Clip? clipBehavior;
  Axis? direction;

  MainAxisAlignment? mainAxisAlignment;
  CrossAxisAlignment? crossAxisAlignment;
  MainAxisSize? mainAxisSize;
  TextBaseline? textBaseline;
  double? spacing;
  TextAlign? textAlign;
  TextOverflow? overflow;
  int? maxLines;
  bool? softWrap;
  bool hasBaseFlex = false;
  int? _defaultTextStyleInsertIndex;
  _GroupContext(this.target);

  BoxDecorationMix? _decorationMix(TwConfig config) {
    final gradientMix = gradient.toGradientMix(config.gradientStrategy);
    final borderMix = border.hasStructure
        ? border.toMix(
            defaultColor: config.colorOf('gray-200') ?? const Color(0xFFE5E7EB),
          )
        : null;

    return decoration.toMix(border: borderMix, gradient: gradientMix);
  }

  WidgetModifierConfig? _modifierConfig(TwConfig config) {
    if (modifiers.isEmpty && _defaultTextStyleInsertIndex == null) return null;

    final output = List.of(modifiers);
    if (_defaultTextStyleInsertIndex case final index?) {
      output.insert(
        index,
        DefaultTextStyleModifierMix(
          style: defaultTextStyle.toMix(
            defaultFontSize: config.textDefaults.fontSize,
          ),
        ),
      );
    }

    return WidgetModifierConfig.modifiers(output);
  }

  _TextStyleAccum ensureDefaultTextStyle() {
    _defaultTextStyleInsertIndex ??= modifiers.length;

    return defaultTextStyle;
  }

  BoxStyler toBoxStyler(TwConfig config) {
    final hasTransform = transform.hasAnyTransform;

    return BoxStyler(
      padding: padding.toMix(),
      margin: margin.toMix(),
      constraints: constraints.toMix(),
      decoration: _decorationMix(config),
      transform: hasTransform ? transform.toMatrix4() : null,
      transformAlignment: hasTransform ? Alignment.center : null,
      clipBehavior: clipBehavior,
      modifier: _modifierConfig(config),
    );
  }

  FlexBoxStyler toFlexBoxStyler(TwConfig config) {
    final hasTransform = transform.hasAnyTransform;

    return FlexBoxStyler(
      decoration: _decorationMix(config),
      padding: padding.toMix(),
      margin: margin.toMix(),
      constraints: constraints.toMix(),
      transform: hasTransform ? transform.toMatrix4() : null,
      transformAlignment: hasTransform ? Alignment.center : null,
      clipBehavior: clipBehavior,
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      spacing: spacing,
      modifier: _modifierConfig(config),
    );
  }

  TextStyler toTextStyler(TwConfig config) {
    return TextStyler(
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: textStyle.toMix(
        defaultHeight: config.textDefaults.lineHeight,
        defaultFontSize: config.textDefaults.fontSize,
      ),
      textHeightBehavior: textHeightBehavior.toMix(),
      softWrap: softWrap,
      textDirectives: textDirectives.isEmpty
          ? null
          : List.unmodifiable(textDirectives),
      modifier: _modifierConfig(config),
    );
  }
}

final class _EdgeAccum {
  double? left;
  double? top;
  double? right;
  double? bottom;

  bool get hasAny =>
      left != null || top != null || right != null || bottom != null;

  void set(double value, {required String sides}) {
    switch (sides) {
      case 'all':
        left = value;
        top = value;
        right = value;
        bottom = value;
      case 'x':
        left = value;
        right = value;
      case 'y':
        top = value;
        bottom = value;
      case 'top':
        top = value;
      case 'right':
        right = value;
      case 'bottom':
        bottom = value;
      case 'left':
        left = value;
    }
  }

  EdgeInsetsMix? toMix() {
    if (!hasAny) return null;

    return EdgeInsetsMix(top: top, bottom: bottom, left: left, right: right);
  }
}

final class _ConstraintsAccum {
  double? minWidth;
  double? maxWidth;
  double? minHeight;
  double? maxHeight;

  bool get hasAny =>
      minWidth != null ||
      maxWidth != null ||
      minHeight != null ||
      maxHeight != null;

  BoxConstraintsMix? toMix() {
    if (!hasAny) return null;

    return BoxConstraintsMix(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
  }
}

final class _DecorationAccum {
  Color? color;
  List<BoxShadowMix>? boxShadow;
  bool ensurePresent = false;
  final borderRadius = _BorderRadiusAccum();

  bool get hasAny =>
      ensurePresent ||
      color != null ||
      boxShadow != null ||
      borderRadius.hasAny;

  BoxDecorationMix? toMix({BoxBorderMix? border, GradientMix? gradient}) {
    if (!hasAny && border == null && gradient == null) return null;

    return BoxDecorationMix(
      border: border,
      borderRadius: borderRadius.toMix(),
      color: color,
      gradient: gradient,
      boxShadow: boxShadow,
    );
  }
}

final class _BorderRadiusAccum {
  Radius? topLeft;
  Radius? topRight;
  Radius? bottomLeft;
  Radius? bottomRight;

  bool get hasAny =>
      topLeft != null ||
      topRight != null ||
      bottomLeft != null ||
      bottomRight != null;

  BorderRadiusMix? toMix() {
    if (!hasAny) return null;

    return BorderRadiusMix(
      topLeft: topLeft,
      topRight: topRight,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
    );
  }
}

final class _TextStyleAccum {
  Color? color;
  double? fontSize;
  double? fontSizeHeight;
  FontWeight? fontWeight;
  double? explicitHeight;
  double? trackingEm;
  List<ShadowMix>? shadows;

  bool get hasAny =>
      color != null ||
      fontSize != null ||
      fontSizeHeight != null ||
      fontWeight != null ||
      explicitHeight != null ||
      trackingEm != null ||
      shadows != null;

  TextStyleMix? toMix({
    double? defaultHeight,
    required double defaultFontSize,
  }) {
    final resolvedHeight = explicitHeight ?? fontSizeHeight ?? defaultHeight;
    final resolvedLetterSpacing = trackingEm == null
        ? null
        : trackingEm! * (fontSize ?? defaultFontSize);
    if (!hasAny && resolvedHeight == null) return null;

    return TextStyleMix(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: resolvedLetterSpacing,
      shadows: shadows,
      height: resolvedHeight,
    );
  }
}

final class _TextHeightBehaviorAccum {
  bool? applyHeightToFirstAscent;
  bool? applyHeightToLastDescent;
  TextLeadingDistribution? leadingDistribution;

  bool get hasAny =>
      applyHeightToFirstAscent != null ||
      applyHeightToLastDescent != null ||
      leadingDistribution != null;

  TextHeightBehaviorMix? toMix() {
    if (!hasAny) return null;

    return TextHeightBehaviorMix(
      applyHeightToFirstAscent: applyHeightToFirstAscent,
      applyHeightToLastDescent: applyHeightToLastDescent,
      leadingDistribution: leadingDistribution,
    );
  }
}

final class _VariantPath {
  static const base = _VariantPath([]);

  final List<TwRuntimeVariant> parts;

  const _VariantPath(this.parts);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _VariantPath &&
          parts.length == other.parts.length &&
          _partsEqual(parts, other.parts);

  @override
  int get hashCode => Object.hashAll(parts);
}

bool _partsEqual(List<TwRuntimeVariant> a, List<TwRuntimeVariant> b) {
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }

  return true;
}
