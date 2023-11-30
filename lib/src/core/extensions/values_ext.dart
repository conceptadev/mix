import 'package:flutter/material.dart';

import '../../attributes/border/border_attribute.dart';
import '../../attributes/border/border_dto.dart';
import '../../attributes/border/border_radius_attribute.dart';
import '../../attributes/color/color_dto.dart';
import '../../attributes/constraints/constraints_attribute.dart';
import '../../attributes/decoration/decoration_attribute.dart';
import '../../attributes/gradient/gradient_attribute.dart';
import '../../attributes/gradient/gradient_dto.dart';
import '../../attributes/scalars/scalars_attribute.dart';
import '../../attributes/shadow/shadow_dto.dart';
import '../../attributes/spacing/spacing_dto.dart';
import '../../attributes/strut_style/strut_style_attribute.dart';
import '../../attributes/text_style/text_style_attribute.dart';

extension StrutStyleExt on StrutStyle {
  StrutStyleAttribute toAttribute() {
    return StrutStyleAttribute(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: height,
      leading: leading,
      forceStrutHeight: forceStrutHeight,
    );
  }

  StrutStyle merge(StrutStyle? other) {
    return StrutStyle(
      fontFamily: other?.fontFamily ?? fontFamily,
      fontFamilyFallback: other?.fontFamilyFallback ?? fontFamilyFallback,
      fontSize: other?.fontSize ?? fontSize,
      height: other?.height ?? height,
      leadingDistribution: other?.leadingDistribution ?? leadingDistribution,
      leading: other?.leading ?? leading,
      fontWeight: other?.fontWeight ?? fontWeight,
      fontStyle: other?.fontStyle ?? fontStyle,
      forceStrutHeight: other?.forceStrutHeight ?? forceStrutHeight,
      debugLabel: other?.debugLabel ?? debugLabel,
    );
  }
}

extension GradientExt on Gradient {
  GradientAttribute toAttribute() => GradientAttribute.from(this);
}

extension LinearGradientExt on LinearGradient {
  LinearGradientDto toDto() => LinearGradientDto.from(this);
}

extension RadialGradientExt on RadialGradient {
  RadialGradientDto toDto() => RadialGradientDto.from(this);
}

extension SweepGradientExt on SweepGradient {
  SweepGradientDto toDto() => SweepGradientDto.from(this);
}

extension BoxBorderExt on BoxBorder {
  BoxBorderAttribute toAttribute() {
    if (this is Border) return (this as Border).toAttribute();
    if (this is BorderDirectional) {
      return (this as BorderDirectional).toAttribute();
    }

    throw UnimplementedError();
  }
}

extension BorderExt on Border {
  BorderAttribute toAttribute() => BorderAttribute.only(
        top: top.toDto(),
        bottom: bottom.toDto(),
        left: left.toDto(),
        right: right.toDto(),
      );
}

extension BorderDirectionalExt on BorderDirectional {
  BorderDirectionalAttribute toAttribute() => BorderDirectionalAttribute.only(
        top: top.toDto(),
        bottom: bottom.toDto(),
        start: start.toDto(),
        end: end.toDto(),
      );
}

extension EdgeInsetsGeometryExt on EdgeInsetsGeometry {
  SpacingDto toDto() {
    if (this is EdgeInsets) return (this as EdgeInsets).toDto();
    if (this is EdgeInsetsDirectional) {
      return (this as EdgeInsetsDirectional).toDto();
    }

    throw UnimplementedError();
  }
}

extension EdgeInsetsExt on EdgeInsets {
  SpacingDto toDto() => SpacingDto(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      );
}

extension EdgeInsetsDirectionalExt on EdgeInsetsDirectional {
  SpacingDto toDto() =>
      SpacingDto(top: top, bottom: bottom, start: start, end: end);
}

extension DoubleExt on double {
  Radius toRadius() => Radius.circular(this);
}

extension ColorExt on Color {
  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    String updatedHexString = hexString.replaceFirst('#', '');
    if (updatedHexString.length == 6) updatedHexString = 'ff$updatedHexString';

    return Color(int.parse(updatedHexString, radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  ColorDto toDto() => ColorDto(this);
}

// Extension for Alignment
extension AlignmentGeometryExt on AlignmentGeometry {
  AlignmentGeometryAttribute toAttribute() {
    return AlignmentGeometryAttribute(this);
  }
}

extension ShapeDecorationExt on ShapeDecoration {
  ShapeDecorationAttribute toAttribute() => ShapeDecorationAttribute(
        color: color?.toDto(),
        shape: shape,
        gradient: gradient?.toAttribute(),
        boxShadow: shadows?.map((e) => e.toDto()).toList(),
      );
}

extension BoxConstraintsExt on BoxConstraints {
  BoxConstraintsAttribute toAttribute() => BoxConstraintsAttribute(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      );
}

// Extension for Axis
extension AxisExt on Axis {
  AxisAttribute toAttribute() => AxisAttribute(this);
}

extension BoxDecorationExt on BoxDecoration {
  BoxDecorationAttribute toAttribute() => BoxDecorationAttribute(
        color: color?.toDto(),
        border: border?.toAttribute(),
        borderRadius: borderRadius?.toAttribute(),
        gradient: gradient?.toAttribute(),
        boxShadow: boxShadow?.map((e) => e.toDto()).toList(),
        shape: shape,
      );
}

extension BorderRadiusGeometryExt on BorderRadiusGeometry {
  BorderRadiusGeometryAttribute toAttribute() {
    if (this is BorderRadius) return (this as BorderRadius).toAttribute();
    if (this is BorderRadiusDirectional) {
      return (this as BorderRadiusDirectional).toAttribute();
    }

    throw UnimplementedError();
  }
}

extension BorderRadiusExt on BorderRadius {
  BorderRadiusAttribute toAttribute() => BorderRadiusAttribute.only(
        topLeft: topLeft,
        topRight: topRight,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
      );
}

extension BorderRadiusDirectionalExrt on BorderRadiusDirectional {
  BorderRadiusDirectionalAttribute toAttribute() =>
      BorderRadiusDirectionalAttribute.only(
        topStart: topStart,
        topEnd: topEnd,
        bottomStart: bottomStart,
        bottomEnd: bottomEnd,
      );
}

extension Matrix4Ext on Matrix4 {
  TransformAttribute toAttribute() => TransformAttribute(this);

  /// Merge [other] into this matrix.
  Matrix4 merge(Matrix4? other) {
    if (other == null || other == this) return this;

    return clone()..multiply(other);
  }
}

extension ClipExt on Clip {
  ClipBehaviorAttribute toAttribute() => ClipBehaviorAttribute(this);
}

extension BorderSideExt on BorderSide {
  BorderSideDto toDto() => BorderSideDto(
        color: color.toDto(),
        strokeAlign: strokeAlign,
        style: style,
        width: width,
      );
}

extension ShadowExt on Shadow {
  ShadowDto toDto() => ShadowDto(
        blurRadius: blurRadius,
        color: color.toDto(),
        offset: offset,
      );
}

extension ListShadowExt on List<Shadow> {
  List<ShadowDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

extension BoxShadowExt on BoxShadow {
  BoxShadowDto toDto() => BoxShadowDto(
        color: color.toDto(),
        offset: offset,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      );
}

extension ListBoxShadowExt on List<BoxShadow> {
  List<BoxShadowDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

extension TextStyleExt on TextStyle {
  TextStyleDto toDto() => TextStyleDto(
        background: background,
        color: color?.toDto(),
        debugLabel: debugLabel,
        decoration: decoration,
        decorationColor: decorationColor?.toDto(),
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontFeatures: fontFeatures,
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        foreground: foreground,
        height: height,
        letterSpacing: letterSpacing,
        locale: locale,
        shadows: shadows?.map((e) => e.toDto()).toList(),
        textBaseline: textBaseline,
        wordSpacing: wordSpacing,
      );

  TextStyleAttribute toAttribute() => TextStyleAttribute(toDto());
}
