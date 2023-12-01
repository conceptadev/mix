import 'package:flutter/material.dart';

import '../../core/attribute.dart';
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

class BoxDecorationUtility<T extends StyleAttribute>
    extends MixUtility<T, BoxDecorationAttribute> {
  static const selfBuilder = BoxDecorationUtility(MixUtility.selfBuilder);

  const BoxDecorationUtility(super.builder);

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

  ColorUtility<T> get color {
    return ColorUtility((ColorDto color) => _only(color: color));
  }

  BorderUtility<T> get border {
    return BorderUtility((BoxBorderAttribute border) => _only(border: border));
  }

  BorderRadiusGeometryUtility<T> get borderRadius {
    return BorderRadiusGeometryUtility(
      (BorderRadiusGeometryAttribute borderRadius) =>
          _only(borderRadius: borderRadius),
    );
  }

  BoxShapeUtility<T> get shape {
    return BoxShapeUtility((BoxShape shape) => _only(shape: shape));
  }

  ElevationUtility<T> get elevation {
    return ElevationUtility((List<BoxShadowDto> boxShadow) {
      return _only(boxShadow: boxShadow);
    });
  }

  GradientUtility<T> get gradient {
    return GradientUtility((GradientDto gradient) {
      return _only(gradient: GradientAttribute(gradient));
    });
  }

  BoxShadowListUtility<T> get boxShadow {
    return BoxShadowListUtility((List<BoxShadowDto> boxShadow) {
      return _only(boxShadow: boxShadow);
    });
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
      color: color?.toDto(),
      border: border?.toAttribute(),
      borderRadius: borderRadius?.toAttribute(),
      gradient: gradient?.toAttribute(),
      boxShadow: boxShadow?.toDto(),
      shape: shape,
    );
  }
}
