import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:mix/foundation.dart';

import '../factory/mix_provider_data.dart';

/// Utility class for configuring [BoxDefAttribute] properties.
///
/// This class provides methods to set individual properties of a [BoxDefAttribute].
///
/// Use the methods of this class to configure specific properties of a [BoxDefAttribute].
class BoxDefUtility<T extends Attribute>
    extends SpecUtility<T, BoxDefAttribute> {
  BoxDefUtility(super.builder);

  late final alignment = AlignmentUtility((v) => only(alignment: v));

  late final padding = SpacingUtility((v) => only(padding: v));

  late final margin = SpacingUtility((v) => only(margin: v));

  late final constraints = BoxConstraintsUtility((v) => only(constraints: v));

  late final decoration = DecorationUtility((v) => only(decoration: v));

  late final foregroundDecoration =
      DecorationUtility((v) => only(foregroundDecoration: v));

  late final transform = Matrix4Utility((v) => only(transform: v));

  late final transformAlignment =
      AlignmentUtility((v) => only(transformAlignment: v));

  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));

  late final width = DoubleUtility((v) => only(width: v));

  late final height = DoubleUtility((v) => only(height: v));

  late final animated = AnimatedUtility((v) => only(animated: v));

  @override
  T only({
    AlignmentGeometry? alignment,
    SpacingDto? padding,
    SpacingDto? margin,
    BoxConstraintsDto? constraints,
    DecorationDto? decoration,
    DecorationDto? foregroundDecoration,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip? clipBehavior,
    double? width,
    double? height,
    AnimatedDataDto? animated,
  }) {
    return builder(
      BoxDefAttribute(
        alignment: alignment,
        padding: padding,
        margin: margin,
        constraints: constraints,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        transform: transform,
        transformAlignment: transformAlignment,
        clipBehavior: clipBehavior,
        width: width,
        height: height,
        animated: animated,
      ),
    );
  }
}

mixin BoxDefMixin on Spec<BoxDef> {
  /// Creates a copy of this [BoxDef] but with the given fields
  /// replaced with the new values.
  @override
  BoxDef copyWith({
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
    return BoxDef(
      alignment: alignment ?? _$this.alignment,
      padding: padding ?? _$this.padding,
      margin: margin ?? _$this.margin,
      constraints: constraints ?? _$this.constraints,
      decoration: decoration ?? _$this.decoration,
      foregroundDecoration: foregroundDecoration ?? _$this.foregroundDecoration,
      transform: transform ?? _$this.transform,
      transformAlignment: transformAlignment ?? _$this.transformAlignment,
      clipBehavior: clipBehavior ?? _$this.clipBehavior,
      width: width ?? _$this.width,
      height: height ?? _$this.height,
      animated: animated ?? _$this.animated,
    );
  }

  @override
  BoxDef lerp(
    BoxDef? other,
    double t,
  ) {
    if (other == null) return _$this;

    return BoxDef(
      alignment: AlignmentGeometry.lerp(
        _$this.alignment,
        other._$this.alignment,
        t,
      ),
      padding: EdgeInsetsGeometry.lerp(
        _$this.padding,
        other._$this.padding,
        t,
      ),
      margin: EdgeInsetsGeometry.lerp(
        _$this.margin,
        other._$this.margin,
        t,
      ),
      constraints: BoxConstraints.lerp(
        _$this.constraints,
        other._$this.constraints,
        t,
      ),
      decoration: Decoration.lerp(
        _$this.decoration,
        other._$this.decoration,
        t,
      ),
      foregroundDecoration: Decoration.lerp(
        _$this.foregroundDecoration,
        other._$this.foregroundDecoration,
        t,
      ),
      transform: Matrix4Tween(
        begin: _$this.transform,
        end: other._$this.transform,
      ).lerp(t),
      transformAlignment: AlignmentGeometry.lerp(
        _$this.transformAlignment,
        other._$this.transformAlignment,
        t,
      ),
      clipBehavior: t < 0.5 ? _$this.clipBehavior : other._$this.clipBehavior,
      width: lerpDouble(
        _$this.width,
        other._$this.width,
        t,
      ),
      height: lerpDouble(
        _$this.height,
        other._$this.height,
        t,
      ),
      animated: t < 0.5 ? _$this.animated : other._$this.animated,
    );
  }

  /// The list of properties that constitute the state of this [BoxDef].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BoxDef] instances for equality.
  @override
  List<Object?> get props {
    return [
      _$this.alignment,
      _$this.padding,
      _$this.margin,
      _$this.constraints,
      _$this.decoration,
      _$this.foregroundDecoration,
      _$this.transform,
      _$this.transformAlignment,
      _$this.clipBehavior,
      _$this.width,
      _$this.height,
      _$this.animated,
    ];
  }

  BoxDef get _$this => this as BoxDef;
}

/// Represents the attributes of a [BoxDef].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [BoxDef].
///
/// Use this class to configure the attributes of a [BoxDef] and pass it to
/// the [BoxDef] constructor.
class BoxDefAttribute extends SpecAttribute<BoxDef> {
  const BoxDefAttribute({
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

  final AlignmentGeometry? alignment;

  final SpacingDto? padding;

  final SpacingDto? margin;

  final BoxConstraintsDto? constraints;

  final DecorationDto? decoration;

  final DecorationDto? foregroundDecoration;

  final Matrix4? transform;

  final AlignmentGeometry? transformAlignment;

  final Clip? clipBehavior;

  final double? width;

  final double? height;

  @override
  BoxDef resolve(MixData mix) {
    return BoxDef(
      alignment: alignment,
      padding: padding?.resolve(mix),
      margin: margin?.resolve(mix),
      constraints: constraints?.resolve(mix),
      decoration: decoration?.resolve(mix),
      foregroundDecoration: foregroundDecoration?.resolve(mix),
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      width: width,
      height: height,
      animated: animated?.resolve(mix),
    );
  }

  @override
  BoxDefAttribute merge(BoxDefAttribute? other) {
    if (other == null) return this;

    return BoxDefAttribute(
      alignment: other.alignment ?? alignment,
      padding: padding?.merge(other.padding) ?? other.padding,
      margin: margin?.merge(other.margin) ?? other.margin,
      constraints: constraints?.merge(other.constraints) ?? other.constraints,
      decoration: decoration?.merge(other.decoration) ?? other.decoration,
      foregroundDecoration:
          foregroundDecoration?.merge(other.foregroundDecoration) ??
              other.foregroundDecoration,
      transform: other.transform ?? transform,
      transformAlignment: other.transformAlignment ?? transformAlignment,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      width: other.width ?? width,
      height: other.height ?? height,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [BoxDefAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BoxDefAttribute] instances for equality.
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

/// A tween that interpolates between two [BoxDef] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [BoxDef] specifications.
class BoxDefTween extends Tween<BoxDef?> {
  BoxDefTween({
    super.begin,
    super.end,
  });

  @override
  BoxDef lerp(double t) {
    if (begin == null && end == null) return const BoxDef();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
