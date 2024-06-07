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

class DecorationUtility<T extends Attribute>
    extends MixUtility<T, DecorationDto> {
  DecorationUtility(super.builder);

  late final box = BoxDecorationUtility(builder);
  late final shape = ShapeDecorationUtility(builder);

  T as(Decoration decoration) {
    if (decoration is BoxDecoration) {
      return box.as(decoration);
    } else if (decoration is ShapeDecoration) {
      return shape.as(decoration);
    }
    throw UnimplementedError(
      'Cannot create $T from decoration of type ${decoration.runtimeType}',
    );
  }
}

class BoxDecorationUtility<T extends Attribute>
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
      : super(valueToDto: (value) => value.toDto());

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
      color: color?.toDto(),
      border: border?.toDto(),
      borderRadius: borderRadius?.toDto(),
      gradient: gradient?.toDto(),
      boxShadow: boxShadow?.map((e) => e.toDto()).toList(),
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

class ShapeDecorationUtility<T extends Attribute>
    extends DtoUtility<T, ShapeDecorationDto, ShapeDecoration> {
  late final color = ColorUtility<T>((v) => only(color: v));
  late final gradient = GradientUtility<T>((v) => only(gradient: v));
  late final shadows = BoxShadowListUtility<T>((v) => only(shadows: v));
  late final shape = ShapeBorderUtility<T>((v) => only(shape: v));

  ShapeDecorationUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  T call({
    Color? color,
    Gradient? gradient,
    List<BoxShadow>? shadows,
    ShapeBorder? shape,
  }) {
    return only(
      color: color?.toDto(),
      gradient: gradient?.toDto(),
      shadows: shadows?.map((e) => e.toDto()).toList(),
      shape: shape?.toDto(),
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
