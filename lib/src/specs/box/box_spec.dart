import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider.dart';
import '../../factory/mix_provider_data.dart';
import '../../helpers/lerp_helpers.dart';
import 'box_attribute.dart';

/// A specification class that defines layout and styling attributes for a box.
///
/// Use [BoxSpec] to configure various properties such as alignment, padding,
/// margin, width, height, decoration, and more for a box.
///
/// To retrieve an instance of [BoxSpec], use the [BoxSpec.of] method with a
/// [BuildContext], or the [BoxSpec.from] method with [MixData].
class BoxSpec extends Spec<BoxSpec> {
  /// Aligns the child within the box.
  final AlignmentGeometry? alignment;

  /// Adds empty space inside the box.
  final EdgeInsetsGeometry? padding;

  /// Adds empty space around the box.
  final EdgeInsetsGeometry? margin;

  /// Applies additional constraints to the child.
  final BoxConstraints? constraints;

  /// Paints a decoration behind the child.
  final Decoration? decoration;

  /// Paints a decoration in front of the child.
  final Decoration? foregroundDecoration;

  /// Applies a transformation matrix before painting the box.
  final Matrix4? transform;

  /// Aligns the origin of the coordinate system for the [transform].
  final AlignmentGeometry? transformAlignment;

  /// Defines the clip behavior for the box when [BoxConstraints] has a negative
  /// minimum extent.
  final Clip? clipBehavior;

  /// Specifies the width of the box.
  final double? width;

  /// Specifies the height of the box.
  final double? height;

  /// Creates a [BoxSpec] with the given properties.
  ///
  /// All parameters are required to ensure explicit configuration of each
  /// attribute.
  const BoxSpec({
    required this.alignment,
    required this.padding,
    required this.margin,
    required this.constraints,
    required this.decoration,
    required this.foregroundDecoration,
    required this.transform,
    required this.transformAlignment,
    required this.clipBehavior,
    required this.width,
    required this.height,
    super.animatedData,
  });

  /// Creates an empty [BoxSpec] with all properties set to null.
  ///
  /// This can be used as a default value when no specific box specification
  /// is needed.
  const BoxSpec.empty()
      : alignment = null,
        padding = null,
        margin = null,
        constraints = null,
        decoration = null,
        foregroundDecoration = null,
        transformAlignment = null,
        transform = null,
        width = null,
        height = null,
        clipBehavior = null;

  /// Retrieves the [BoxSpec] from the nearest [Mix] ancestor.
  ///
  /// If no ancestor is found, returns [BoxSpec.empty].
  static BoxSpec of(BuildContext context) {
    final mix = Mix.of(context);

    return mix.attributeOf<BoxSpecAttribute>()?.resolve(mix) ??
        const BoxSpec.empty();
  }

  /// Retrieves the [BoxSpec] from the given [MixData].
  ///
  /// If not found, returns [BoxSpec.empty].
  static BoxSpec from(MixData mix) {
    return mix.attributeOf<BoxSpecAttribute>()?.resolve(mix) ??
        const BoxSpec.empty();
  }

  /// Returns a new [BoxSpec] with the specified properties replaced.
  ///
  /// This method is useful for creating modified copies of an existing
  /// [BoxSpec] with some attributes changed.
  @override
  BoxSpec copyWith({
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxConstraints? constraints,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip? clipBehavior,
  }) {
    return BoxSpec(
      alignment: alignment ?? this.alignment,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      constraints: constraints ?? this.constraints,
      decoration: decoration ?? this.decoration,
      foregroundDecoration: foregroundDecoration ?? this.foregroundDecoration,
      transform: transform ?? this.transform,
      transformAlignment: transformAlignment ?? this.transformAlignment,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      width: width ?? this.width,
      height: height ?? this.height,
      animatedData: animatedData ?? animatedData,
    );
  }

  /// Linearly interpolates between two [BoxSpec] instances.
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging
  /// from 0.0 to 1.0.
  @override
  BoxSpec lerp(BoxSpec? other, double t) {
    if (other == null) return this;

    return BoxSpec(
      alignment: AlignmentGeometry.lerp(alignment, other.alignment, t),
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t),
      margin: EdgeInsetsGeometry.lerp(margin, other.margin, t),
      constraints: BoxConstraints.lerp(constraints, other.constraints, t),
      decoration: Decoration.lerp(decoration, other.decoration, t),
      foregroundDecoration: Decoration.lerp(
        foregroundDecoration,
        other.foregroundDecoration,
        t,
      ),
      transform: lerpMatrix4(transform, other.transform, t),
      transformAlignment: AlignmentGeometry.lerp(
        transformAlignment,
        other.transformAlignment,
        t,
      ),
      clipBehavior: lerpSnap(clipBehavior, other.clipBehavior, t),
      width: lerpDouble(width, other.width, t),
      height: lerpDouble(height, other.height, t),
    );
  }

  /// Returns a list of properties that constitute this [BoxSpec].
  ///
  /// This is typically used for equality comparisons.
  @override
  List<Object?> get props => [
        alignment,
        width,
        height,
        padding,
        margin,
        constraints,
        decoration,
        foregroundDecoration,
        transform,
        transformAlignment,
        clipBehavior,
      ];
}

/// A tween that interpolates between two [BoxSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different box specifications.
class BoxSpecTween extends Tween<BoxSpec?> {
  /// Creates a [BoxSpecTween] with the optional [begin] and [end] values.
  BoxSpecTween({super.begin, super.end});

  /// Returns the interpolated [BoxSpec] at the given progress [t].
  ///
  /// The parameter [t] typically ranges from 0.0 to 1.0.
  @override
  BoxSpec lerp(double t) {
    if (begin == null && end == null) return const BoxSpec.empty();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
