import 'dart:core';

import 'package:flutter/material.dart';

import '../attributes/variant_attribute.dart';
import '../core/attribute.dart';
import '../factory/style_mix.dart';
import 'variant.dart';

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
///   when: (BuildContext context) => Theme.of(context).brightness == Brightness.dark,
/// )
///
/// final style = StyleMix(
///   textStyle(fontSize: 16),
///   onDark(
///     textStyle(color: Colors.white),
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
  const ContextVariant(super.name, {required this.when});

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

@immutable
class GestureVariant extends ContextVariant {
  const GestureVariant(super.name, {required super.when});
}
