// The Prop engine lives in package:mix_core, generic over an opaque
// resolution-context type `C`. This subclass binds it to [BuildContext]
// under the original public name and API:
//
// - the static factories keep their single type parameter and mix's
//   token-reference sentinel detection ([getTokenFromValue]);
// - [mergeProp]/[directives] re-wrap engine results so every [Prop] a mix
//   caller sees is a mix [Prop] (generated code stores fields as `Prop<V>`
//   and `MixOps.merge` casts on that assumption);
// - every creation and merge entry point calls [ensureMixBindings] so the
//   engine's converter registry and debug hooks are wired before first use.

import 'package:flutter/widgets.dart';
import 'package:mix_core/mix_core.dart' as core;

import '../theme/tokens/mix_token.dart';
import '../theme/tokens/token_refs.dart';
import 'converter_registry.dart';
import 'directive.dart';
import 'internal/mix_bindings.dart';
import 'mix_element.dart';

/// A property that can hold values, tokens, or Mix types.
///
/// [Prop] is the foundation of the Mix styling system. It provides:
/// - Storage for values through different source types
/// - Token resolution via [BuildContext]
/// - Merging capabilities with different strategies
/// - Directive application for value transformations
/// - Animation configuration support
///
/// ## Value Creation
/// Use [Prop.value] for regular values - it creates a `ValueSource` without conversion.
/// Use [Prop.mix] for explicit Mix values - it creates a `MixSource`.
///
/// ## Conversion Behavior
/// Type conversion to Mix types happens ONLY during resolution when Mix values
/// are present in the property. [Prop.value] never auto-converts values.
@immutable
class Prop<V> extends core.Prop<BuildContext, V> {
  /// Creates a new property by copying all fields from another property.
  ///
  /// Used by subclasses that need to wrap existing properties.
  Prop.fromProp(super.other) : super.fromProp();

  /// Creates a property that references a token.
  ///
  /// The token is resolved via [MixToken.resolve] during resolution.
  /// Optionally accepts [directives] configuration.
  factory Prop.token(MixToken<V> token, {List<Directive<V>>? directives}) {
    ensureMixBindings();

    return Prop.fromProp(
      core.Prop<BuildContext, V>.token(token, directives: directives),
    );
  }

  /// Creates a property with only directives.
  ///
  /// This property has no value source and is used for applying
  /// transformations when merged with other properties.
  const Prop.directives(super.directives) : super.directives();

  // Factory methods

  /// Creates a property from a direct value.
  ///
  /// If [value] is already a [Prop], returns it unchanged.
  /// Detects token references and creates appropriate source types.
  ///
  /// Does not auto-convert values to Mix types. Use [Prop.mix] for Mix values.
  ///
  /// The pass-through checks below mirror ones the engine also performs, and
  /// cannot be delegated to it: the engine returns the original property,
  /// which [Prop.fromProp] would then copy into a plain [Prop], discarding
  /// the token-reference subclass (`ColorRef`, `TextStyleMixRef`, ...).
  static Prop<V> value<V>(V value) {
    ensureMixBindings();
    if (value is Prop<V>) return value;

    // Detect sentinel-backed token refs (DoubleRef) without crashing when V
    // is nullable and value is null.
    if (value case final Object object) {
      final token = getTokenFromValue<V>(object);
      if (token != null) {
        return Prop.token(token);
      }
    }

    return Prop.fromProp(core.Prop.value<BuildContext, V>(value));
  }

  /// Creates a property from a [Mix] value.
  ///
  /// Use this when you explicitly want to store a Mix value
  /// for accumulation merging behavior.
  /// Preserves token references (MixRef objects) instead of wrapping them in MixSource.
  static Prop<V> mix<V>(Mix<V> mix) {
    ensureMixBindings();
    // Check if mix is already a token reference (MixRef)
    // MixRef objects are Prop<V> instances with TokenSource that implement Mix interfaces
    // ignore: avoid-unrelated-type-assertions
    if (mix is Prop<V>) {
      // ignore: avoid-unrelated-type-casts
      final prop = mix as Prop<V>;
      if (prop.hasToken) {
        return prop; // Return token reference directly to preserve TokenSource
      }
    }

    return Prop.fromProp(core.Prop.mix<BuildContext, V>(mix));
  }

  /// Creates a property from a nullable value.
  ///
  /// Returns `null` if [value] is `null`, otherwise calls [Prop.value].
  static Prop<V>? maybe<V>(V? value) {
    if (value == null) return null;

    return Prop.value(value);
  }

  /// Creates a property from a nullable [Mix] value.
  ///
  /// Returns `null` if [value] is `null`, otherwise calls [Prop.mix].
  /// Preserves token references (MixRef objects) instead of wrapping them in MixSource.
  static Prop<V>? maybeMix<V>(Mix<V>? value) {
    if (value == null) return null;

    return Prop.mix(value);
  }

  /// Creates a property from a regular value by converting it to a Mix.
  ///
  /// Uses the converter registry to transform the value into a Mix type,
  /// then wraps it in a Prop. Returns null if conversion is not possible.
  static Prop<V>? mixValue<V>(V value) {
    final converted = MixConverterRegistry.instance.tryConvert<V>(value);
    if (converted == null) return null;

    return Prop.mix(converted as Mix<V>);
  }

  // Methods

  /// Returns a new property with the given directives merged with existing ones.
  @override
  Prop<V> directives(List<Directive<V>> directives) {
    return mergeProp(Prop.directives(directives));
  }

  /// Merges this property with another property.
  ///
  /// Always accumulates all sources from both properties.
  /// During resolution, the behavior depends on the source types:
  /// - Mix sources: merged using accumulation strategy
  /// - Regular values: last value wins during resolution
  ///
  /// Directives are merged from both properties.
  @override
  Prop<V> mergeProp(covariant core.Prop<BuildContext, V>? other) {
    if (other == null) return this;
    ensureMixBindings();

    return Prop.fromProp(super.mergeProp(other));
  }
}
