import 'package:flutter/material.dart';

import '../attributes/variant_attribute.dart';
import '../core/attribute.dart';
import '../factory/style_mix.dart';
import '../helpers/compare_mixin.dart';
import 'multi_variant.dart';

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

///    final style = StyleMix(
///     // shared attributes between all variants
///      textStyle(fontSize: 16),
///      padding(10, 20),
///      outlinedVariant(
///        border(color: Colors.black, width: 1),
///         extStyle(color: Colors.black),
///      ),
///      filledVariant(
///        backgroundColor(Colors.black),
///        textStyle(color: Colors.white),
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
