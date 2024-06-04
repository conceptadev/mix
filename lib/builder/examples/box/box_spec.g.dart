import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import 'box_attribute.g.dart';

/// A specification that defines the visual properties of BoxTestSpec.
///
/// To retrieve an instance of [BoxTestSpec], use the [BoxTestSpec.of] method with a
/// [BuildContext], or the [BoxTestSpec.from] method with [MixData]
class BoxTestSpec extends Spec<BoxTestSpec> {
  /// Creates a [BoxTestSpec] with the given fields
  ///
// All parameters are optional
  const BoxTestSpec({
    this.alignment,
    this.padding,
    this.margin,
    this.constraints,
    this.decoration,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
    this.clipBehavior,
    this.width,
    this.height,
    super.animated,
  });

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

  /// Retrieves the [BoxTestSpec] from the nearest [Mix] ancestor.
  ///
  /// If no ancestor is found, returns [BoxTestSpec].
  static BoxTestSpec of(BuildContext context) {
    final mix = Mix.of(context);

    return BoxTestSpec.from(mix);
  }

  /// Retrieves the [BoxTestSpec] from a MixData.
  static BoxTestSpec from(MixData mix) {
    return mix.attributeOf<BoxTestSpecAttribute>()?.resolve(mix) ??
        const BoxTestSpec();
  }

  /// Creates a copy of this [BoxTestSpec] but with the given fields
  /// replaced with the new values.
  @override
  BoxTestSpec copyWith({
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxConstraints? constraints,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip? clipBehavior,
    double? width,
    double? height,
    AnimatedData? animated,
  }) {
    return BoxTestSpec(
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
      animated: animated ?? this.animated,
    );
  }

  @override
  BoxTestSpec lerp(
    BoxTestSpec? other,
    double t,
  ) {
    if (other == null) return this;

    return BoxTestSpec(
      alignment: AlignmentGeometry.lerp(
        alignment,
        other.alignment,
        t,
      ),
      padding: EdgeInsetsGeometry.lerp(
        padding,
        other.padding,
        t,
      ),
      margin: EdgeInsetsGeometry.lerp(
        margin,
        other.margin,
        t,
      ),
      constraints: BoxConstraints.lerp(
        constraints,
        other.constraints,
        t,
      ),
      decoration: Decoration.lerp(
        decoration,
        other.decoration,
        t,
      ),
      foregroundDecoration: Decoration.lerp(
        foregroundDecoration,
        other.foregroundDecoration,
        t,
      ),
      transform: Matrix4Tween(
        begin: transform,
        end: other.transform,
      ).lerp(t),
      transformAlignment: AlignmentGeometry.lerp(
        transformAlignment,
        other.transformAlignment,
        t,
      ),
      clipBehavior: t < 0.5 ? clipBehavior : other.clipBehavior,
      width: lerpDouble(
        width,
        other.width,
        t,
      ),
      height: lerpDouble(
        height,
        other.height,
        t,
      ),
      animated: t < 0.5 ? animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [BoxTestSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BoxTestSpec] instances for equality.
  @override
  List<Object?> get props {
    return [
      alignment,
      padding,
      margin,
      constraints,
      decoration,
      foregroundDecoration,
      transform,
      transformAlignment,
      clipBehavior,
      width,
      height,
      animated,
    ];
  }
}

/// A tween that interpolates between two [BoxTestSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different BoxTestSpec specifications.
class BoxTestSpecTween extends Tween<BoxTestSpec?> {
  BoxTestSpecTween({
    super.begin,
    super.end,
  });

  @override
  BoxTestSpec lerp(double t) {
    if (begin == null && end == null) return const BoxTestSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
