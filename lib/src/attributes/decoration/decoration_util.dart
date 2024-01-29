import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/values_ext.dart';
import '../border/border_dto.dart';
import '../border/border_radius_dto.dart';
import '../border/border_radius_util.dart';
import '../border/border_util.dart';
import '../border/shape_border_dto.dart';
import '../border/shape_border_util.dart';
import '../color/color_dto.dart';
import '../color/color_util.dart';
import '../gradient/gradient_dto.dart';
import '../gradient/gradient_util.dart';
import '../scalars/scalar_util.dart';
import '../shadow/shadow_dto.dart';
import '../shadow/shadow_util.dart';
import 'decoration_dto.dart';

class DecorationUtility<T extends StyleAttribute>
    extends DtoUtility<T, DecorationDto, Decoration> {
  const DecorationUtility(super.builder)
      : super(valueToDto: DecorationDto.from);

  BoxDecorationUtility<T> get box {
    return BoxDecorationUtility((BoxDecorationDto boxDecoration) {
      return builder(boxDecoration);
    });
  }

  ShapeDecorationUtility<T> get shape {
    return ShapeDecorationUtility((ShapeDecorationDto shapeDecoration) {
      return builder(shapeDecoration);
    });
  }
}

class BoxDecorationUtility<T extends StyleAttribute>
    extends DtoUtility<T, BoxDecorationDto, BoxDecoration> {
  const BoxDecorationUtility(super.builder)
      : super(valueToDto: BoxDecorationDto.from);

  T _only({
    ColorDto? color,
    BoxBorderDto? border,
    BorderRadiusGeometryDto? borderRadius,
    GradientDto? gradient,
    List<BoxShadowDto>? boxShadow,
    BoxShape? shape,
    BlendMode? backgroundBlendMode,
  }) {
    return builder(
      BoxDecorationDto(
        color: color,
        border: border,
        borderRadius: borderRadius,
        gradient: gradient,
        boxShadow: boxShadow,
        shape: shape,
        backgroundBlendMode: backgroundBlendMode,
      ),
    );
  }

  ColorUtility<T> get color {
    return ColorUtility((ColorDto color) => _only(color: color));
  }

  BorderUtility<T> get border {
    return BorderUtility((border) => _only(border: border));
  }

  BlendModeUtility<T> get backgroundBlendMode {
    return BlendModeUtility(
        (blendMode) => _only(backgroundBlendMode: blendMode));
  }

  BorderDirectionalUtility<T> get borderDirectional {
    return BorderDirectionalUtility((borderDirectional) {
      return _only(border: borderDirectional);
    });
  }

  BorderRadiusGeometryUtility<T> get borderRadius {
    return BorderRadiusGeometryUtility(
      (borderRadius) => _only(borderRadius: borderRadius),
    );
  }

  BorderRadiusDirectionalUtility<T> get borderRadiusDirectional {
    return BorderRadiusDirectionalUtility(
      (borderRadiusDirectional) => _only(borderRadius: borderRadiusDirectional),
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
      return _only(gradient: gradient);
    });
  }

  BoxShadowListUtility<T> get boxShadows {
    return BoxShadowListUtility((List<BoxShadowDto> boxShadows) {
      return _only(boxShadow: boxShadows);
    });
  }

  BoxShadowUtility<T> get boxShadow {
    return BoxShadowUtility((BoxShadowDto boxShadow) {
      return _only(boxShadow: [boxShadow]);
    });
  }

  T call({
    Color? color,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    Gradient? gradient,
    List<BoxShadow>? boxShadow,
    BoxShape? shape,
    BlendMode? backgroundBlendMode,
  }) {
    return _only(
      color: color?.toDto(),
      border: border?.toDto(),
      borderRadius: borderRadius?.toDto(),
      gradient: gradient?.toDto(),
      boxShadow: boxShadow?.toDto(),
      shape: shape,
      backgroundBlendMode: backgroundBlendMode,
    );
  }
}

class ShapeDecorationUtility<T extends StyleAttribute>
    extends DtoUtility<T, ShapeDecorationDto, ShapeDecoration> {
  const ShapeDecorationUtility(super.builder)
      : super(valueToDto: ShapeDecorationDto.from);

  T _only({
    ColorDto? color,
    GradientDto? gradient,
    List<BoxShadowDto>? shadows,
    ShapeBorderDto? shape,
  }) {
    return builder(
      ShapeDecorationDto(
        color: color,
        shape: shape,
        gradient: gradient,
        shadows: shadows,
      ),
    );
  }

  ColorUtility<T> get color {
    return ColorUtility((ColorDto color) => _only(color: color));
  }

  GradientUtility<T> get gradient {
    return GradientUtility((GradientDto gradient) => _only(gradient: gradient));
  }

  BoxShadowListUtility<T> get shadows {
    return BoxShadowListUtility(
      (List<BoxShadowDto> shadows) => _only(shadows: shadows),
    );
  }

  ShapeBorderUtility<T> get shape {
    return ShapeBorderUtility((shape) => _only(shape: shape));
  }

  T call({
    Color? color,
    Gradient? gradient,
    List<BoxShadow>? shadows,
    ShapeBorder? shape,
  }) {
    return _only(
      color: ColorDto.maybeFrom(color),
      gradient: GradientDto.maybeFrom(gradient),
      shadows: shadows?.map(BoxShadowDto.from).toList(),
      shape: ShapeBorderDto.maybeFrom(shape),
    );
  }
}
