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
import 'scalar_util.dart';

const boxDecoration = BoxDecorationUtility();

final backgroundColor = boxDecoration.color;
final bgColor = boxDecoration.color;
final elevation = boxDecoration.elevation;

class BoxDecorationUtility {
  const BoxDecorationUtility();

  BoxDecorationAttribute _color(ColorAttribute color) => BoxDecorationAttribute(
        color: color,
      );

  BoxDecorationAttribute _shape(BoxShape shape) => BoxDecorationAttribute(
        shape: shape,
      );

  BoxDecorationAttribute _border(BoxBorderAttribute border) =>
      BoxDecorationAttribute(border: border);

  BoxDecorationAttribute _borderRadius(
    BorderRadiusGeometryAttribute borderRadius,
  ) =>
      BoxDecorationAttribute(borderRadius: borderRadius);

  BoxDecorationAttribute _gradient(GradientAttribute gradient) =>
      BoxDecorationAttribute(gradient: gradient);

  BoxDecorationAttribute _boxShadow(List<BoxShadowAttribute> boxShadow) =>
      BoxDecorationAttribute(boxShadow: boxShadow);

  ColorUtility<BoxDecorationAttribute> get color => ColorUtility(_color);
  BorderUtility<BoxDecorationAttribute> get border => BorderUtility(_border);
  BorderRadiusUtility<BoxDecorationAttribute> get borderRadius =>
      BorderRadiusUtility(_borderRadius);

  BoxShapeUtility<BoxDecorationAttribute> get shape => BoxShapeUtility(_shape);

  BoxDecorationAttribute elevation(int value) {
    assert(kElevationToShadow.containsKey(value), 'Invalid elevation value');

    return BoxDecorationAttribute(
      boxShadow: kElevationToShadow[value]!.toAttribute(),
    );
  }

  BoxDecorationAttribute as(BoxDecoration decoration) {
    return BoxDecorationAttribute(
      color: decoration.color?.toAttribute(),
      border: decoration.border?.toAttribute(),
      borderRadius: decoration.borderRadius?.toAttribute(),
      gradient: decoration.gradient?.toAttribute(),
      boxShadow: decoration.boxShadow?.toAttribute(),
      shape: decoration.shape,
    );
  }

  BoxDecorationAttribute call({
    Color? color,
    BoxBorderAttribute? border,
    BorderRadiusAttribute? borderRadius,
    GradientAttribute? gradient,
    List<BoxShadowAttribute>? boxShadow,
    BoxShape? shape,
  }) {
    return BoxDecorationAttribute(
      color: color?.toAttribute(),
      border: border,
      borderRadius: borderRadius,
      gradient: gradient,
      boxShadow: boxShadow,
      shape: shape,
    );
  }
}
