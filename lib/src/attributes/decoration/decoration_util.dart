import 'package:flutter/material.dart';

import '../../core/attribute.dart';
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
import 'image/decoration_image_dto.dart';
import 'image/decoration_image_util.dart';

class BoxDecorationUtility<T extends StyleAttribute>
    extends DtoUtility<T, BoxDecorationDto, BoxDecoration> {
  late final gradient = GradientUtility((v) => only(gradient: v));
  late final boxShadow = BoxShadowUtility((v) => only(boxShadow: [v]));
  late final boxShadows = BoxShadowListUtility((v) => only(boxShadow: v));
  late final color = ColorUtility((v) => only(color: v));
  late final border = BorderUtility((v) => only(border: v));

  late final borderRadius = BorderRadiusUtility(
    (v) => only(borderRadius: v),
  );

  late final backgroundBlendMode =
      BlendModeUtility((v) => only(backgroundBlendMode: v));
  late final borderDirectional =
      BorderDirectionalUtility((v) => only(border: v));
  late final borderRadiusDirectional =
      BorderRadiusDirectionalUtility((v) => only(borderRadius: v));
  late final shape = BoxShapeUtility((v) => only(shape: v));
  late final elevation = ElevationUtility((v) => only(boxShadow: v));
  late final image = DecorationImageUtility((v) => only(image: v));

  BoxDecorationUtility(super.builder)
      : super(valueToDto: BoxDecorationDto.from);

  T call({
    Color? color,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    Gradient? gradient,
    List<BoxShadow>? boxShadow,
    BoxShape? shape,
    BlendMode? backgroundBlendMode,
  }) {
    return only(
      color: ColorDto.maybeFrom(color),
      border: BoxBorderDto.maybeFrom(border),
      borderRadius: BorderRadiusGeometryDto.maybeFrom(borderRadius),
      gradient: GradientDto.maybeFrom(gradient),
      boxShadow: boxShadow?.map(BoxShadowDto.from).toList(),
      shape: shape,
      backgroundBlendMode: backgroundBlendMode,
    );
  }

  @override
  T only({
    ColorDto? color,
    BoxBorderDto? border,
    BorderRadiusGeometryDto? borderRadius,
    GradientDto? gradient,
    List<BoxShadowDto>? boxShadow,
    BoxShape? shape,
    BlendMode? backgroundBlendMode,
    DecorationImageDto? image,
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
        image: image,
      ),
    );
  }
}

class ShapeDecorationUtility<T extends StyleAttribute>
    extends DtoUtility<T, ShapeDecorationDto, ShapeDecoration> {
  late final color = ColorUtility<T>((v) => only(color: v));
  late final gradient = GradientUtility<T>((v) => only(gradient: v));
  late final shadows = BoxShadowListUtility<T>((v) => only(shadows: v));
  late final shape = ShapeBorderUtility<T>((v) => only(shape: v));

  ShapeDecorationUtility(super.builder)
      : super(valueToDto: ShapeDecorationDto.from);

  T call({
    Color? color,
    Gradient? gradient,
    List<BoxShadow>? shadows,
    ShapeBorder? shape,
  }) {
    return only(
      color: ColorDto.maybeFrom(color),
      gradient: GradientDto.maybeFrom(gradient),
      shadows: shadows?.map(BoxShadowDto.from).toList(),
      shape: ShapeBorderDto.maybeFrom(shape),
    );
  }

  @override
  T only({
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
}
