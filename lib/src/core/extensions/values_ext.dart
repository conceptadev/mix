import 'package:flutter/material.dart';

import '../../attributes/border/border_dto.dart';
import '../../attributes/border/border_radius_dto.dart';
import '../../attributes/constraints/constraints_dto.dart';
import '../../attributes/decoration/decoration_dto.dart';
import '../../attributes/gradient/gradient_dto.dart';
import '../../attributes/shadow/shadow_dto.dart';
import '../../attributes/spacing/spacing_dto.dart';
import '../../attributes/strut_style/strut_style_dto.dart';
import '../../attributes/text_style/text_style_dto.dart';

// @nodoc
extension StrutStyleExt on StrutStyle {
  StrutStyleDto toDto() => StrutStyleDto.from(this);
}

// @nodoc
extension GradientExt on Gradient {
  // toDto
  GradientDto toDto() {
    if (this is LinearGradient) return (this as LinearGradient).toDto();
    if (this is RadialGradient) return (this as RadialGradient).toDto();
    if (this is SweepGradient) return (this as SweepGradient).toDto();

    throw UnimplementedError();
  }
}

// @nodoc
extension LinearGradientExt on LinearGradient {
  LinearGradientDto toDto() => LinearGradientDto.from(this);
}

// @nodoc
extension RadialGradientExt on RadialGradient {
  RadialGradientDto toDto() => RadialGradientDto.from(this);
}

// @nodoc
extension SweepGradientExt on SweepGradient {
  SweepGradientDto toDto() => SweepGradientDto.from(this);
}

// @nodoc
extension BoxBorderExt on BoxBorder {
  BoxBorderDto toDto() => BoxBorderDto.from(this);
}

// @nodoc
extension EdgeInsetsGeometryExt on EdgeInsetsGeometry {
  SpacingDto toDto() => SpacingDto.from(this);
}

// @nodoc
extension DoubleExt on double {
  Radius toRadius() => Radius.circular(this);
}

// @nodoc
extension BoxConstraintsExt on BoxConstraints {
  BoxConstraintsDto toDto() => BoxConstraintsDto.from(this);
}

// @nodoc
extension DecorationExt on Decoration {
  DecorationDto toDto() {
    if (this is BoxDecoration) return (this as BoxDecoration).toDto();
    if (this is ShapeDecoration) return (this as ShapeDecoration).toDto();

    throw UnimplementedError('$runtimeType is not implemented.');
  }
}

// @nodoc
extension BoxDecorationExt on BoxDecoration {
  BoxDecorationDto toDto() => BoxDecorationDto.from(this);
}

// @nodoc
extension ShapeDecorationExt on ShapeDecoration {
  ShapeDecorationDto toDto() => ShapeDecorationDto.from(this);
}

// @nodoc
extension BorderRadiusGeometryExt on BorderRadiusGeometry {
  BorderRadiusGeometryDto toDto() {
    return BorderRadiusGeometryDto.from(this);
  }
}

// @nodoc
extension Matrix4Ext on Matrix4 {
  /// Merge [other] into this matrix.
  Matrix4 merge(Matrix4? other) {
    if (other == null || other == this) return this;

    return clone()..multiply(other);
  }
}

// @nodoc
extension BorderSideExt on BorderSide {
  BorderSideDto toDto() => BorderSideDto.from(this);
}

// @nodoc
extension ShadowExt on Shadow {
  ShadowDto toDto() => ShadowDto.from(this);
}

// @nodoc
extension ListShadowExt on List<Shadow> {
  List<ShadowDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

// @nodoc
extension BoxShadowExt on BoxShadow {
  BoxShadowDto toDto() => BoxShadowDto.from(this);
}

// @nodoc
extension ListBoxShadowExt on List<BoxShadow> {
  List<BoxShadowDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

// @nodoc
extension TextStyleExt on TextStyle {
  TextStyleDto toDto() => TextStyleDto.as(this);
}
