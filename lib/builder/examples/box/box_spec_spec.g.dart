import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import 'box_spec_attribute.g.dart';

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
    super.animated,
    this.clipBehavior,
    this.constraints,
    this.decoration,
    this.foregroundDecoration,
    this.height,
    this.mapTest,
    this.margin,
    this.padding,
    this.transform,
    this.transformAlignment,
    this.width,
  });

  final AlignmentGeometry? alignment;

  final Clip? clipBehavior;

  final BoxConstraints? constraints;

  final Decoration? decoration;

  final Decoration? foregroundDecoration;

  final double? height;

  final Map<String, dynamic>? mapTest;

  final EdgeInsetsGeometry? margin;

  final EdgeInsetsGeometry? padding;

  final Matrix4? transform;

  final AlignmentGeometry? transformAlignment;

  final double? width;

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
    AnimatedData? animated,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? height,
    Map<String, dynamic>? mapTest,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    double? width,
  }) {
    return BoxTestSpec(
      alignment: alignment ?? this.alignment,
      animated: animated ?? this.animated,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      constraints: constraints ?? this.constraints,
      decoration: decoration ?? this.decoration,
      foregroundDecoration: foregroundDecoration ?? this.foregroundDecoration,
      height: height ?? this.height,
      mapTest: mapTest ?? this.mapTest,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      transform: transform ?? this.transform,
      transformAlignment: transformAlignment ?? this.transformAlignment,
      width: width ?? this.width,
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
      animated: t < 0.5 ? animated : other.animated,
      clipBehavior: t < 0.5 ? clipBehavior : other.clipBehavior,
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
      height: lerpDouble(
        height,
        other.height,
        t,
      ),
      mapTest: t < 0.5 ? mapTest : other.mapTest,
      margin: EdgeInsetsGeometry.lerp(
        margin,
        other.margin,
        t,
      ),
      padding: EdgeInsetsGeometry.lerp(
        padding,
        other.padding,
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
      width: lerpDouble(
        width,
        other.width,
        t,
      ),
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
      animated,
      clipBehavior,
      constraints,
      decoration,
      foregroundDecoration,
      height,
      mapTest,
      margin,
      padding,
      transform,
      transformAlignment,
      width,
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoxTestSpec &&
        other.alignment == alignment &&
        other.animated == animated &&
        other.clipBehavior == clipBehavior &&
        other.constraints == constraints &&
        other.decoration == decoration &&
        other.foregroundDecoration == foregroundDecoration &&
        other.height == height &&
        mapEquals(
          mapTest,
          other.mapTest,
        ) &&
        other.margin == margin &&
        other.padding == padding &&
        other.transform == transform &&
        other.transformAlignment == transformAlignment &&
        other.width == width;
  }

  @override
  int get hashCode {
    return alignment.hashCode ^
        animated.hashCode ^
        clipBehavior.hashCode ^
        constraints.hashCode ^
        decoration.hashCode ^
        foregroundDecoration.hashCode ^
        height.hashCode ^
        mapTest.hashCode ^
        margin.hashCode ^
        padding.hashCode ^
        transform.hashCode ^
        transformAlignment.hashCode ^
        width.hashCode;
  }
}

/// A tween that interpolates between two [BoxTestSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [BoxTestSpec] specifications.
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
