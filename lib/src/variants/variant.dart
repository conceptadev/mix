import 'package:flutter/material.dart';

import '../attributes/variant_attribute.dart';
import '../core/attribute.dart';
import '../factory/style_mix.dart';
import '../helpers/compare_mixin.dart';

/// An immutable class representing a styling variant.
///
/// Variants encapsulate a set of styles that can be applied together under certain conditions
/// in your application, making it easy to switch between different sets of styles.
///
/// You can think of variant as a switch that applies a certain set of styles when it's turned on.
///
/// The `Variant` class is designed to be immutable and can be used in conjunction
/// with [Style] and [Attribute] to define specific styling rules.
///
/// Example Usage:
/// ```dart
///    const outlinedVariant = Variant('outlined');
///    const filledVariant = Variant('filled');

///    final style = Style(
///     // shared attributes between all variants
///      text.style(fontSize: 16),
///      padding(10, 20),
///      outlinedVariant(
///        border(color: Colors.black, width: 1),
///         extStyle(color: Colors.black),
///      ),
///      filledVariant(
///        backgroundColor(Colors.black),
///        text.style(color: Colors.white),
///      ),
///    );
/// ```
@immutable
class Variant with Comparable {
  final String name;

  /// Constructs a `Variant` with the given [name].
  ///
  /// The [name] parameter uniquely identifies the variant and is used in style resolution.
  const Variant(this.name);

  /// Combines this variant with another [variant] using an 'AND' operation.
  ///
  /// This operator returns a [MultiVariant] that represents a combination of both
  /// variants. It is useful for defining styles that should be applied when
  /// multiple conditions are met.
  ///
  /// Example:
  /// ```dart
  /// final combinedVariant = variant1 & variant2;
  /// ```
  MultiVariant operator &(Variant variant) => MultiVariant.and([this, variant]);

  /// Combines this variant with another [variant] using an 'OR' operation.
  ///
  /// This operator returns a [MultiVariant] that represents either of the variants.
  /// It is useful for defining styles that should be applied when any one of
  /// multiple conditions is met.
  ///
  /// Example:
  /// ```dart
  /// final eitherVariant = variant1 | variant2;
  /// ```
  MultiVariant operator |(Variant variant) => MultiVariant.or([this, variant]);

  /// Defines styles to be applied when this variant is active.
  ///
  /// You can define up to 20 styling [`Attribute`]s to be applied when this `Variant` is activated.
  /// Null values are ignored and do not affect the resulting styling rules.
  VariantAttribute call([
    Attribute? p1,
    Attribute? p2,
    Attribute? p3,
    Attribute? p4,
    Attribute? p5,
    Attribute? p6,
    Attribute? p7,
    Attribute? p8,
    Attribute? p9,
    Attribute? p10,
    Attribute? p11,
    Attribute? p12,
    Attribute? p13,
    Attribute? p14,
    Attribute? p15,
    Attribute? p16,
    Attribute? p17,
    Attribute? p18,
    Attribute? p19,
    Attribute? p20,
  ]) {
    final params = [
      p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, //
      p11, p12, p13, p14, p15, p16, p17, p18, p19, p20,
    ].whereType<Attribute>();

    return VariantAttribute(this, Style.create(params));
  }

  @override
  get props => [name];
}

/// A typedef for a function that determines if a specific context condition is met.
typedef WhenContextFunction = bool Function(BuildContext context);

/// A variant of styling that is applied based on specific context conditions.
///
/// `ContextVariant` extends the functionality of the `Variant` class by introducing
/// context-sensitive styling. It uses a condition function to determine if the variant's
/// styles should be applied, based on the current build context.
///
/// Example:
/// Creating an `onDark` variant that applies styles when the app's theme is in dark mode:
/// ```dart
/// final onDark = ContextVariant(
///   'on-dark',
///   ( context) => Theme.of(context).brightness == Brightness.dark,
/// )
///
/// final style = Style(
///   text.style(fontSize: 16),
///   onDark(
///     text.style(color: Colors.white),
///   ),
/// );
/// ```
///
/// This example defines a `ContextVariant` onDark, which checks if the current
/// theme brightness is dark. If true, the associated styles are applied.
@immutable
class ContextVariant extends Variant {
  /// A function that defines the condition under which this variant should be applied.
  ///
  /// The [when] function takes a [BuildContext] and returns a boolean indicating whether
  /// the condition for this variant is met in the given context. This allows for dynamic
  /// styling changes based on runtime context conditions, such as theme brightness or screen size.
  final WhenContextFunction when;

  /// Constructs a `ContextVariant` with a given [name] and a context condition function [when].
  ///
  /// The [name] uniquely identifies the variant and is used in style resolution, while the
  /// [when] function determines the applicability of the variant based on the given context.
  const ContextVariant(super.name, this.when);

  @override
  ContextVariantAttribute call([
    Attribute? p1,
    Attribute? p2,
    Attribute? p3,
    Attribute? p4,
    Attribute? p5,
    Attribute? p6,
    Attribute? p7,
    Attribute? p8,
    Attribute? p9,
    Attribute? p10,
    Attribute? p11,
    Attribute? p12,
    Attribute? p13,
    Attribute? p14,
    Attribute? p15,
    Attribute? p16,
    Attribute? p17,
    Attribute? p18,
    Attribute? p19,
    Attribute? p20,
  ]) {
    final params = [
      p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, //
      p11, p12, p13, p14, p15, p16, p17, p18, p19, p20,
    ].whereType<Attribute>();

    // Create a ContextVariantAttribute using the collected parameters.
    return ContextVariantAttribute(this, Style.create(params));
  }

  @override
  get props => [name, when];
}

enum MultiVariantOperator { and, or }

/// `MultiVariant` is a specialized form of `Variant` that allows combining multiple
/// variants together, using logical operations. This enables complex style definitions
/// that depend on multiple conditions.
///
/// The class supports two types of combinations:
/// - `MultiVariantType.and`: Applies styles when all included variants are active.
/// - `MultiVariantType.or`: Applies styles when any of the included variants are active.
///
/// `MultiVariant` also incorporates context-aware variants, allowing styles to adapt
/// based on the build context. This feature is especially useful for responsive
/// design or theming.
///
/// Example Usage:
/// ```dart
/// final variantA = Variant('A');
/// final variantB = Variant('B');
/// final combinedAndVariant = MultiVariant.and([variantA, variantB]);
/// final combinedOrVariant = MultiVariant.or([variantA, variantB]);
///
/// final style = Style(
///   text.style(fontSize: 16),
///   combinedAndVariant(
///     text.style(color: Colors.blue),
///   ),
///   combinedOrVariant(
///     text.style(color: Colors.green),
///   ),
/// );
/// ```
///
/// In this example, `combinedAndVariant` applies its styles only when both `variantA`
/// and `variantB` are active, while `combinedOrVariant` applies its styles if either
/// `variantA` or `variantB` is active. This allows for flexible and dynamic styling
/// based on multiple conditions.

@immutable
class MultiVariant extends Variant {
  /// A list of [Variant] instances contained within this `MultiVariant`.
  final List<Variant> variants;

  /// The type operator of this `MultiVariant`, defining its category or specific behavior.
  ///
  /// This field is crucial in differentiating various `MultiVariant` instances and
  /// understanding and applying their behavior.
  final MultiVariantOperator operatorType;

  const MultiVariant._(super.name, this.variants, {required this.operatorType});

  factory MultiVariant(
    Iterable<Variant> variants, {
    required MultiVariantOperator type,
  }) {
    final sortedVariants = variants.toList()
      ..sort(((a, b) => a.name.compareTo(b.name)));
    final combinedName = sortedVariants.map((e) => e.name).join('-');

    return MultiVariant._(combinedName, sortedVariants, operatorType: type);
  }

  /// Factory constructor to create a `MultiVariant` where all provided variants need to be active (`MultiVariantType.and`).
  ///
  /// It initializes a `MultiVariant` with the given [variants] and sets the type to `MultiVariantType.and`.
  factory MultiVariant.and(Iterable<Variant> variants) {
    return MultiVariant(variants, type: MultiVariantOperator.and);
  }

  /// Factory constructor to create a `MultiVariant` where any one of the provided variants needs to be active (`MultiVariantType.or`).
  ///
  /// It initializes a `MultiVariant` with the given [variants] and sets the type to `MultiVariantType.or`.
  factory MultiVariant.or(Iterable<Variant> variants) {
    return MultiVariant(variants, type: MultiVariantOperator.or);
  }

  /// Removes specified variants from this `MultiVariant`.
  ///
  /// This method returns a new variant after removing the specified [variantsToRemove].
  /// If only one variant remains after removal, it returns that single variant instead of a `MultiVariant`.
  /// This is useful for dynamically adjusting styles by excluding certain variants.
  ///
  /// Example:
  /// ```dart
  /// final combinedVariant = MultiVariant.and([variantA, variantB, variantC]);
  /// final updatedVariant = combinedVariant.remove([variantA]);
  /// ```
  /// In this example, `updatedVariant` will be a combination of `variantB` and `variantC`.
  /// This is useful for procedurally applying variants based on runtime conditions.
  Variant remove(Iterable<Variant> variantsToRemove) {
    final updatedVariants = variants..removeWhere(variantsToRemove.contains);

    return updatedVariants.length == 1
        ? updatedVariants.first
        : MultiVariant(updatedVariants, type: operatorType);
  }

  /// Determines if the current `MultiVariant` matches a set of provided variants.
  ///
  /// This method evaluates whether the variants within this `MultiVariant` align with the given [matchVariants] based on its `type`:
  /// - `MultiVariantType.and`: Returns true if every variant in this `MultiVariant` is present in [matchVariants].
  /// - `MultiVariantType.or`: Returns true if at least one of the variants in this `MultiVariant` is present in [matchVariants].
  ///
  /// This method is particularly useful for checking if a composite style, represented by this `MultiVariant`,
  /// should be applied based on a specific set of active variants.
  ///
  /// Example:
  /// ```dart
  /// final combinedVariant = MultiVariant.and([variantA, variantB]);
  /// bool isMatched = combinedVariant.matches([variantA, variantB, variantC]);
  /// ```
  /// Here, `isMatched` will be true for `MultiVariantType.and` if both `variantA` and `variantB` are included in the provided list.
  /// For `MultiVariantType.or`, `isMatched` would be true if either `variantA` or `variantB` is in the list.
  bool matches(Iterable<Variant> matchVariants) {
    final matchSet = matchVariants.toSet();
    final variantSet = variants.toSet();

    return operatorType == MultiVariantOperator.and
        ? variantSet.difference(matchSet).isEmpty
        : variantSet.intersection(matchSet).isNotEmpty;
  }

  /// Evaluates if the `MultiVariant` should be applied based on the build context.
  ///
  /// For `MultiVariantType.or`, it returns true if any of the context-aware variants (`ContextVariant`)
  /// evaluates true in the given [context]. For `MultiVariantType.and`, it returns true only if all context-aware
  /// variants evaluate true, and if all variants in the `MultiVariant` are context-aware.
  ///
  /// This method enables context-sensitive styling, allowing the application of styles based on runtime
  /// conditions like screen size, orientation, or theme.
  ///
  /// Example:
  /// ```dart
  /// final combinedVariant = MultiVariant.or([contextVariantA, contextVariantB]);
  /// bool isApplicable = combinedVariant.when(context);
  /// ```
  /// `isApplicable` will be true if either `contextVariantA` or `contextVariantB` is applicable in the given context.
  bool when(BuildContext context) {
    final contextVariants = variants.whereType<ContextVariant>();

    return operatorType == MultiVariantOperator.or
        ? contextVariants.any((variant) => variant.when(context))
        : contextVariants.length == variants.length &&
            contextVariants.every((variant) => variant.when(context));
  }

  /// A method for creating a new `MultiVariantAttribute` instance.
  ///
  /// It takes up to 20 optional [Attribute] parameters and creates a new `MultiVariantAttribute` using these attributes.
  /// This method allows for easy creation of a `MultiVariantAttribute` with custom attributes.
  @override
  MultiVariantAttribute call([
    Attribute? p1,
    Attribute? p2,
    Attribute? p3,
    Attribute? p4,
    Attribute? p5,
    Attribute? p6,
    Attribute? p7,
    Attribute? p8,
    Attribute? p9,
    Attribute? p10,
    Attribute? p11,
    Attribute? p12,
    Attribute? p13,
    Attribute? p14,
    Attribute? p15,
    Attribute? p16,
    Attribute? p17,
    Attribute? p18,
    Attribute? p19,
    Attribute? p20,
  ]) {
    final params = [
      p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, //
      p11, p12, p13, p14, p15, p16, p17, p18, p19, p20,
    ].whereType<Attribute>();

    return MultiVariantAttribute(this, Style.create(params));
  }

  @override
  get props => [name, variants];
}
