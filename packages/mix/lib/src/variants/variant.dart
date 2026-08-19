// The variant base types (Variant, NamedVariant, EnumVariant, the helper
// predicates) live in package:mix_core. This file binds ContextVariant to
// Flutter's BuildContext and provides the concrete Flutter context variants
// (media queries, widget states, platform checks).

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix_core/mix_core.dart' as core;

import '../core/breakpoint.dart';
import '../core/providers/focus_highlight_mode_provider.dart';
import '../core/providers/widget_state_provider.dart';
import '../core/providers/widget_state_style_override.dart';
import '../core/spec.dart';
import '../core/style.dart';
import '../theme/tokens/token_refs.dart';
import '../theme/tokens/value_tokens.dart';

export 'package:mix_core/mix_core.dart'
    show
        EnumVariant,
        NamedVariant,
        Variant,
        hasAllVariants,
        hasAnyVariant,
        hasVariant;

/// Variants that automatically apply based on context conditions.
@immutable
class ContextVariant extends core.ContextVariant<BuildContext> {
  const ContextVariant(super.key, super.shouldApply);

  static WidgetStateVariant widgetState(WidgetState state) {
    return WidgetStateVariant(state);
  }

  static FocusVisibleVariant focusVisible() {
    return FocusVisibleVariant();
  }

  static OrientationVariant orientation(Orientation orientation) {
    return OrientationVariant(orientation);
  }

  static ContextVariant not(ContextVariant variant) {
    return NotVariant(variant);
  }

  static ContextVariant breakpoint(Breakpoint breakpoint) {
    return BreakpointVariant(breakpoint);
  }

  static ContextVariant brightness(Brightness brightness) {
    return BrightnessVariant(brightness);
  }

  static ContextVariant size(String name, bool Function(Size) condition) {
    return ContextVariant(
      'media_query_size_$name',
      (context) => condition(MediaQuery.sizeOf(context)),
    );
  }

  // Directionality
  static DirectionalityVariant directionality(TextDirection direction) {
    return DirectionalityVariant(direction);
  }

  // Platform
  static PlatformVariant platform(TargetPlatform platform) {
    return PlatformVariant(platform);
  }

  // Web
  static WebVariant web() {
    return WebVariant();
  }

  // Responsive breakpoints
  static ContextVariant mobile() {
    return ContextVariant.breakpoint(BreakpointToken.mobile());
  }

  static ContextVariant tablet() {
    return ContextVariant.breakpoint(BreakpointToken.tablet());
  }

  static ContextVariant desktop() {
    return ContextVariant.breakpoint(BreakpointToken.desktop());
  }

  /// Widget states that must be tracked for this variant to be evaluated.
  ///
  /// [Style.widgetStates] uses this declaration to discover dependencies in a
  /// complete nested style. [StyleBuilder] can then install automatic tracking
  /// for pointer-driven states such as hovered and pressed. Other states, such
  /// as focused and disabled, still require an ancestor state scope or an
  /// external [WidgetStatesController]. Subclasses that read widget state —
  /// directly, or by delegating to another variant the way [NotVariant] does —
  /// must override this getter.
  ///
  /// Discovery does not execute context closures, so states introduced by a
  /// [ContextVariantBuilder], or read by a plain [ContextVariant] closure,
  /// cannot contribute automatic dependencies.
  ///
  /// Discovery is static: dependencies nested under variants that are inactive
  /// in the current context (for example hover declared inside a dark-mode
  /// branch while in light mode) still count, so state tracking may be installed
  /// before the enclosing variant activates.
  Set<WidgetState> get widgetStateDependencies => const {};

  /// The engine reads state dependencies through this platform-neutral
  /// getter; mix code uses the [WidgetState]-typed
  /// [widgetStateDependencies] instead.
  @override
  Set<Object> get stateDependencies => widgetStateDependencies;
}

/// Context variant that applies for a media-query orientation.
final class OrientationVariant extends ContextVariant {
  final Orientation orientation;

  OrientationVariant(this.orientation)
    : super(
        'media_query_orientation_${orientation.name}',
        (context) => MediaQuery.orientationOf(context) == orientation,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrientationVariant && other.orientation == orientation;

  @override
  int get hashCode => orientation.hashCode;
}

/// Context variant that applies for a platform brightness.
final class BrightnessVariant extends ContextVariant {
  final Brightness brightness;

  BrightnessVariant(this.brightness)
    : super(
        'media_query_platform_brightness_${brightness.name}',
        (context) => MediaQuery.platformBrightnessOf(context) == brightness,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrightnessVariant && other.brightness == brightness;

  @override
  int get hashCode => brightness.hashCode;
}

/// Context variant that applies for a concrete or token-backed breakpoint.
final class BreakpointVariant extends ContextVariant {
  final Breakpoint breakpoint;

  BreakpointVariant(this.breakpoint)
    : super(_breakpointKey(breakpoint), (context) {
        if (breakpoint case final BreakpointRef ref) {
          return ref.token.resolve(context).matches(MediaQuery.sizeOf(context));
        }

        return breakpoint.matches(MediaQuery.sizeOf(context));
      });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreakpointVariant && other.breakpoint == breakpoint;

  @override
  int get hashCode => breakpoint.hashCode;
}

/// Context variant that applies when another context variant does not.
final class NotVariant extends ContextVariant {
  final ContextVariant inner;

  NotVariant(this.inner)
    : super('not_${inner.key}', (context) => !inner.when(context));

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is NotVariant && other.inner == inner;

  @override
  Set<WidgetState> get widgetStateDependencies => inner.widgetStateDependencies;

  @override
  int get hashCode => inner.hashCode;
}

/// Context variant that applies for inherited text direction.
final class DirectionalityVariant extends ContextVariant {
  final TextDirection direction;

  DirectionalityVariant(this.direction)
    : super(
        'directionality_${direction.name}',
        (context) => Directionality.of(context) == direction,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DirectionalityVariant && other.direction == direction;

  @override
  int get hashCode => direction.hashCode;
}

/// Context variant that applies for the current default target platform.
final class PlatformVariant extends ContextVariant {
  final TargetPlatform platform;

  PlatformVariant(this.platform)
    : super(
        'platform_${platform.name}',
        (_) => defaultTargetPlatform == platform,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlatformVariant && other.platform == platform;

  @override
  int get hashCode => platform.hashCode;
}

/// Context variant that applies when running on the web.
final class WebVariant extends ContextVariant {
  WebVariant() : super('web', (_) => kIsWeb);

  @override
  bool operator ==(Object other) => other is WebVariant;

  @override
  int get hashCode => key.hashCode;
}

final class WidgetStateVariant extends ContextVariant {
  final WidgetState state;

  WidgetStateVariant(this.state)
    : super('widget_state_${state.name}', (context) {
        final override = WidgetStateStyleOverride.maybeOf(context);
        if (override != null) return override.states.contains(state);

        return WidgetStateProvider.hasStateOf(context, state);
      });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WidgetStateVariant && other.state == state;

  @override
  Set<WidgetState> get widgetStateDependencies => {state};

  @override
  int get hashCode => state.hashCode;
}

/// Context variant that applies to traditionally highlighted keyboard focus.
///
/// Modality changes are reactive inside Mix-managed widget-state scopes and
/// apply on the next rebuild under a manually mounted [WidgetStateProvider].
final class FocusVisibleVariant extends ContextVariant {
  FocusVisibleVariant()
    : super('focus_visible', (context) {
        // A forced state override is authoritative and skips the modality
        // check: preview tooling asks for the focus-visible look directly and
        // has no real input modality to read.
        final override = WidgetStateStyleOverride.maybeOf(context);
        if (override != null) {
          return override.states.contains(WidgetState.focused);
        }

        return WidgetStateProvider.hasStateOf(context, .focused) &&
            FocusHighlightModeProvider.of(context) == .traditional;
      });

  @override
  bool operator ==(Object other) => other is FocusVisibleVariant;

  @override
  Set<WidgetState> get widgetStateDependencies => const {.focused};

  @override
  int get hashCode => key.hashCode;
}

String _breakpointKey(Breakpoint breakpoint) {
  if (breakpoint case final BreakpointRef ref) {
    return 'breakpoint_${ref.token.name}';
  }

  return 'breakpoint_${breakpoint.minWidth ?? '0.0'}_${breakpoint.maxWidth ?? 'infinity'}';
}

/// Variant that dynamically builds a Style based on build context.
typedef ContextVariantBuilder<S extends Style<Object?>> =
    core.ContextVariantBuilder<BuildContext, S>;

/// Interface for design system components that adapt their styling
/// based on active variants and user modifications.
typedef StyleVariation<S extends Spec<S>> =
    core.StyleVariation<BuildContext, Style<S>>;

// Common named variants
const primary = core.NamedVariant('primary');
const secondary = core.NamedVariant('secondary');
const outlined = core.NamedVariant('outlined');
const solid = core.NamedVariant('solid');
const danger = core.NamedVariant('danger');

// Size variants
const small = core.NamedVariant('small');
const large = core.NamedVariant('large');
