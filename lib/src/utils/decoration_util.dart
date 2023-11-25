import 'package:flutter/material.dart';

import '../attributes/border/border_attribute.dart';
import '../attributes/border/border_radius_attribute.dart';
import '../attributes/color_attribute.dart';
import '../attributes/decoration/decoration_attribute.dart';
import '../attributes/gradient_attribute.dart';
import '../attributes/shadow_attribute.dart';
import '../core/extensions/values_ext.dart';
import 'border_radius_util.dart';
import 'border_util.dart';
import 'helper_util.dart';
import 'scalar_util.dart';

const boxDecoration = BoxDecorationUtility.selfBuilder;

final backgroundColor = boxDecoration.color;
final bgColor = boxDecoration.color;
final elevation = boxDecoration.elevation;

class BoxDecorationUtility<T> extends MixUtility<T, BoxDecorationAttribute> {
  static const selfBuilder = BoxDecorationUtility(MixUtility.selfBuilder);

  const BoxDecorationUtility(super.builder);

  T _color(ColorAttribute color) => _only(color: color);

  T _shape(BoxShape shape) => _only(shape: shape);

  T _border(BoxBorderAttribute border) => _only(border: border);

  T _borderRadius(BorderRadiusGeometryAttribute borderRadius) =>
      _only(borderRadius: borderRadius);

  T _gradient(GradientAttribute gradient) => _only(gradient: gradient);

  T _boxShadow(Iterable<BoxShadowAttribute> boxShadow) =>
      _only(boxShadow: boxShadow.toList());

  T _only({
    ColorAttribute? color,
    BoxBorderAttribute? border,
    BorderRadiusGeometryAttribute? borderRadius,
    GradientAttribute? gradient,
    List<BoxShadowAttribute>? boxShadow,
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

    return as(decoration);
  }

  ColorUtility<T> get color => ColorUtility(_color);
  BorderUtility<T> get border => BorderUtility(_border);
  BorderRadiusUtility<T> get borderRadius => BorderRadiusUtility(_borderRadius);

  BoxShapeUtility<T> get shape => BoxShapeUtility(_shape);
  SpreadFunctionParams<BoxShadowAttribute, T> get boxShadow =>
      SpreadFunctionParams(_boxShadow);

  T elevation(int value) {
    assert(kElevationToShadow.containsKey(value), 'Invalid elevation value');

    return _only(boxShadow: kElevationToShadow[value]!.toAttribute());
  }

  T call({
    Color? color,
    BoxBorder? border,
    BorderRadius? borderRadius,
    Gradient? gradient,
    List<BoxShadow>? boxShadow,
    BoxShape? shape,
  }) {
    return _only(
      color: color?.toAttribute(),
      border: border?.toAttribute(),
      borderRadius: borderRadius?.toAttribute(),
      gradient: gradient?.toAttribute(),
      boxShadow: boxShadow?.toAttribute(),
      shape: shape,
    );
  }
}
