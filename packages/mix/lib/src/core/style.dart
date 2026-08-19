// The platform-neutral style machinery — the variant fold, VariantStyle,
// identity merging — lives in package:mix_core's `StyleBase`. This file
// binds it to Flutter (`C = BuildContext`, envelope `R = StyleSpec<S>`) and
// adds the Flutter-only surface: widget modifiers, animation configuration,
// and widget-tree style inheritance.

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_core/mix_core.dart' as core;

import '../animation/animation_config.dart';
import '../modifiers/widget_modifier_config.dart';
import 'mix_element.dart';
import 'providers/style_provider.dart';
import 'spec.dart';
import 'style_spec.dart';
import 'widget_modifier.dart';

/// Marker interface for style-related elements.
@internal
sealed class StyleElement {
  const StyleElement();
}

/// Field metadata exposed by Styler classes produced by Mix's generator.
///
/// Protocols and tooling can use this capability to inspect a Styler's complete
/// field surface without duplicating generated field names. Handwritten Stylers
/// can implement this interface when they want to expose the same metadata.
abstract interface class StylerFieldMetadata {
  /// Names of every field represented by the Styler's [Mix.props].
  Set<String> get $stylerFieldNames;
}

/// Variant wrapper for conditional styling.
typedef VariantStyle<S extends Spec<S>> =
    core.VariantStyle<BuildContext, StyleSpec<S>, Style<S>>;

/// Base class for style classes that can be resolved to specifications.
///
/// Provides variant support, modifiers, and animation configuration for styled elements.
abstract class Style<S extends Spec<S>>
    extends core.StyleBase<BuildContext, StyleSpec<S>, Style<S>>
    implements StyleElement, Mix<StyleSpec<S>> {
  final WidgetModifierConfig? $modifier;
  final AnimationConfig? $animation;

  const Style({
    required super.variants,
    required WidgetModifierConfig? modifier,
    required AnimationConfig? animation,
  }) : $modifier = modifier,
       $animation = animation;

  /// Gets the closest [Style] from the widget tree.
  ///
  /// Throws a [FlutterError] if no [Style] is found in the widget tree.
  static Style<S> of<S extends Spec<S>>(BuildContext context) {
    final style = maybeOf<S>(context);
    if (style == null) {
      throw FlutterError.fromParts([
        ErrorSummary(
          'Style.of() called with a context that does not contain a Style of type $S.',
        ),
        ErrorDescription(
          'No Style<$S> ancestor could be found starting from the context that was passed to Style.of().',
        ),
        context.describeElement('The context used was'),
        ErrorHint(
          'If you are using StyleBuilder, set inheritable: true to provide the style to descendant widgets.',
        ),
      ]);
    }

    return style;
  }

  /// Gets the closest [Style] from the widget tree, or null if not found.
  static Style<S>? maybeOf<S extends Spec<S>>(BuildContext context) {
    final provider = context.getInheritedWidgetOfExactType<StyleProvider<S>>();

    return provider?.style;
  }

  /// Widget states declared anywhere in this style's variant tree.
  ///
  /// The traversal (with its identity-based cycle guard) lives in
  /// [core.StyleBase.stateDependencies]; mix narrows the element type to
  /// [WidgetState] via [ContextVariant.widgetStateDependencies].
  @internal
  Set<WidgetState> get widgetStates =>
      stateDependencies.whereType<WidgetState>().toSet();

  /// Resolves this attribute to its concrete value using the provided [BuildContext].
  @override
  StyleSpec<S> resolve(BuildContext context);

  /// Merges this attribute with another attribute of the same type.
  @override
  Style<S> merge(covariant Style<S>? other);

  /// Default implementation uses runtimeType as the merge key
  @override
  Object get mergeKey => S;
}

/// A no-op [Style] that resolves to a provided [Spec].
///
/// This is useful for widget defaults where a concrete generated styler should
/// not be required just to identify the default resolved spec.
final class IdentityStyle<S extends Spec<S>> extends Style<S>
    with Diagnosticable
    implements core.IdentityElement {
  /// The spec used when this identity style is resolved.
  final S spec;

  /// Creates an identity style that resolves to [spec].
  const IdentityStyle(this.spec)
    : super(variants: null, modifier: null, animation: null);

  @override
  Style<S> merge(covariant Style<S>? other) {
    return other ?? this;
  }

  @override
  StyleSpec<S> resolve(BuildContext context) {
    return StyleSpec(spec: spec);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<S>('spec', spec));
  }

  @override
  List<Object?> get props => [spec];
}

abstract class ModifierMix<S extends WidgetModifier<S>> extends Mix<S>
    implements StyleElement {
  const ModifierMix();

  @override
  ModifierMix<S> merge(covariant ModifierMix<S>? other);

  @override
  S resolve(BuildContext context);

  @override
  Type get mergeKey => S;
}
