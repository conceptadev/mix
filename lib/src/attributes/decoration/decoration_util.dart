import 'package:flutter/material.dart';

import '../../core/extensions/values_ext.dart';
import '../border/border_attribute.dart';
import '../border/border_radius_attribute.dart';
import '../border/border_radius_util.dart';
import '../border/border_util.dart';
import '../color/color_dto.dart';
import '../color/color_util.dart';
import '../gradient/gradient_attribute.dart';
import '../gradient/gradient_dto.dart';
import '../gradient/gradient_util.dart';
import '../scalars/scalar_util.dart';
import '../shadow/shadow_dto.dart';
import '../shadow/shadow_util.dart';
import 'decoration_attribute.dart';

class BoxDecorationUtility<T> extends MixUtility<T, BoxDecorationAttribute> {
  static const selfBuilder = BoxDecorationUtility(MixUtility.selfBuilder);

  const BoxDecorationUtility(super.builder);

  T _color(ColorDto color) => _only(color: color);

  T _shape(BoxShape shape) => _only(shape: shape);

  T _border(BoxBorderAttribute border) => _only(border: border);

  T _borderRadius(BorderRadiusGeometryAttribute borderRadius) =>
      _only(borderRadius: borderRadius);

  T _gradient(GradientDto gradient) =>
      _only(gradient: GradientAttribute(gradient));

  T _only({
    ColorDto? color,
    BoxBorderAttribute? border,
    BorderRadiusGeometryAttribute? borderRadius,
    GradientAttribute? gradient,
    List<BoxShadowDto>? boxShadow,
    BoxShape? shape,
  }) {
    final decoration = BoxDecorationAttribute(
      color: color,
      border: border,
      borderRadius: borderRadius,
      gradient: gradient,
      boxShadow: boxShadow,
      shape: shape,
    );

    return builder(decoration);
  }

  T _boxShadow(List<BoxShadowDto> boxShadow) => _only(boxShadow: boxShadow);

  ColorUtility<T> get color => ColorUtility(_color);
  BorderUtility<T> get border => BorderUtility(_border);
  BorderRadiusGeometryUtility<T> get borderRadius =>
      BorderRadiusGeometryUtility(_borderRadius);

  BoxShapeUtility<T> get shape => BoxShapeUtility(_shape);

  ElevationUtility<T> get elevation => ElevationUtility(_boxShadow);
  GradientUtility<T> get gradient => GradientUtility(_gradient);

  BoxShadowListUtility<T> get boxShadow => BoxShadowListUtility(_boxShadow);

  T call({
    Color? color,
    BoxBorder? border,
    BorderRadius? borderRadius,
    Gradient? gradient,
    List<BoxShadow>? boxShadow,
    BoxShape? shape,
  }) {
    return _only(
      color: color?.toDto(),
      border: border?.toAttribute(),
      borderRadius: borderRadius?.toAttribute(),
      gradient: gradient?.toAttribute(),
      boxShadow: boxShadow?.toDto(),
      shape: shape,
    );
  }
}
