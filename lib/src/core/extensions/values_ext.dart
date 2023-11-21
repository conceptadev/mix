import 'dart:math';

import 'package:flutter/material.dart';

import '../../attributes/alignment_attribute.dart';
import '../../attributes/attribute.dart';
import '../../attributes/border/border_attribute.dart';
import '../../attributes/border/border_radius_attribute.dart';
import '../../attributes/color_attribute.dart';
import '../../attributes/constraints_attribute.dart';
import '../../attributes/decoration_attribute.dart';
import '../../attributes/edge_insets_attribute.dart';
import '../../attributes/scalar_attribute.dart';
import '../../attributes/shadow_attribute.dart';
import '../../attributes/strut_style_attribute.dart';
import '../../attributes/text_style_attribute.dart';

extension StrutStyleExt on StrutStyle {
  StrutStyleDto toAttribute() {
    return StrutStyleDto(
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

// Extension for TextAlign
extension TextAlignExt on TextAlign {
  TextAlignAttribute toAttribute() => TextAlignAttribute(this);
}

extension GradientExt on Gradient {
  GradientAttribute toAttribute() => GradientAttribute(this);
}

extension EdgeInsetsGeometryExt on EdgeInsetsGeometry {
  EdgeInsetsGeometryDto toDto() {
    if (this is EdgeInsets) return (this as EdgeInsets).toDto();
    if (this is EdgeInsetsDirectional) {
      return (this as EdgeInsetsDirectional).toDto();
    }

    throw UnimplementedError();
  }
}

extension EdgeInsetsExt on EdgeInsets {
  EdgeInsetsDto toDto() => EdgeInsetsDto(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      );
}

extension EdgeInsetsDirectionalExt on EdgeInsetsDirectional {
  EdgeInsetsDirectionalDto toDto() => EdgeInsetsDirectionalDto(
        top: top,
        bottom: bottom,
        start: start,
        end: end,
      );
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
  AlignmentGeometryDto toDto() {
    if (this is Alignment) return (this as Alignment).toDto();
    if (this is AlignmentDirectional) {
      return (this as AlignmentDirectional).toDto();
    }

    throw UnimplementedError();
  }

  AlignmentGeometryAttribute toAttribute() {
    if (this is Alignment) return (this as Alignment).toAttribute();
    if (this is AlignmentDirectional) {
      return (this as AlignmentDirectional).toAttribute();
    }

    throw UnimplementedError();
  }
}

extension AlignmentExt on Alignment {
  AlignmentDto toDto() => AlignmentDto(x: x, y: y);

  AlignmentAttribute toAttribute() => AlignmentAttribute(toDto());
}

extension AlignmentDirectionalExt on AlignmentDirectional {
  AligmentDirectionalDto toDto() => AligmentDirectionalDto(
        start: start,
        y: y,
      );

  AlignmentDirectionalAttribute toAttribute() =>
      AlignmentDirectionalAttribute(toDto());
}

extension ShapeDecorationExt on ShapeDecoration {
  ShapeDecorationDto toDto() => ShapeDecorationDto(
        color: color?.toDto(),
        shape: shape,
        gradient: gradient?.toAttribute(),
        boxShadow: shadows?.map((e) => e.toDto()).toList(),
      );

  ShapeDecorationAttribute toAttribute() => ShapeDecorationAttribute(toDto());
}

extension BoxConstraintsExt on BoxConstraints {
  BoxConstraintsDto toDto() => BoxConstraintsDto(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      );
  BoxConstraintsAttribute toAttribute() => BoxConstraintsAttribute(toDto());
}

// Extension for MainAxisAlignment
extension MainAxisAlignmentExt on MainAxisAlignment {
  MainAxisAlignmentAttribute toAttribute() => MainAxisAlignmentAttribute(this);
}

// Extension for CrossAxisAlignment
extension CrossAxisAlignmentExt on CrossAxisAlignment {
  CrossAxisAlignmentAttribute toAttribute() =>
      CrossAxisAlignmentAttribute(this);
}

extension MainAxisSizeExt on MainAxisSize {
  MainAxisSizeAttribute toAttribute() => MainAxisSizeAttribute(this);
}

extension TextOverflowExt on TextOverflow {
  TextOverflowAttribute toAttribute() => TextOverflowAttribute(this);
}

extension VerticalDirectionExt on VerticalDirection {
  VerticalDirectionAttribute toAttribute() => VerticalDirectionAttribute(this);
}

extension ClipExt on Clip {
  ClipAttribute toAttribute() => ClipAttribute(this);
}

extension TextWidthBasisExt on TextWidthBasis {
  TextWidthBasisAttribute toAttribute() => TextWidthBasisAttribute(this);
}

extension TextHeightBehaviorExt on TextHeightBehavior {
  TextHeightBehaviorAttribute toAttribute() =>
      TextHeightBehaviorAttribute(this);
}

// Extension for TextDirection
extension TextDirectionExt on TextDirection {
  TextDirectionAttribute toAttribute() => TextDirectionAttribute(this);
}

extension ImageRepeatExt on ImageRepeat {
  ImageRepeatAttribute toAttribute() => ImageRepeatAttribute(this);
}

// Extension for Axis
extension AxisExt on Axis {
  AxisAttribute toAttribute() => AxisAttribute(this);
}

// Extension for BlendMode
extension BlendModeExt on BlendMode {
  BlendModeAttribute toAttribute() => BlendModeAttribute(this);
}

// Extension for BoxFit
extension BoxFitExt on BoxFit {
  BoxFitAttribute toAttribute() => BoxFitAttribute(this);
}

extension BoxDecorationExt on BoxDecoration {
  BoxDecorationDto toDto() => BoxDecorationDto(
        color: color?.toDto(),
        border: border?.toAttribute(),
        borderRadius: borderRadius?.toAttribute(),
        gradient: gradient?.toAttribute(),
        boxShadow: boxShadow?.map((e) => e.toDto()).toList(),
        shape: shape.toAttribute(),
      );

  BoxDecorationAttribute toAttribute() => BoxDecorationAttribute(toDto());
}

extension BoxShapeExt on BoxShape {
  BoxShapeAttribute toAttribute() => BoxShapeAttribute(this);
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

extension BorderRadiusDirectionalExrt on BorderRadiusDirectional {
  BorderRadiusDirectionalDto toDto() => BorderRadiusDirectionalDto(
        topStart: topStart,
        topEnd: topEnd,
        bottomStart: bottomStart,
        bottomEnd: bottomEnd,
      );

  BorderRadiusDirectionalAttribute toAttribute() =>
      BorderRadiusDirectionalAttribute(toDto());
}

// Extension for BorderRadius
extension BorderRadiusExt on BorderRadius {
  BorderRadiusDto toDto() => BorderRadiusDto(
        topLeft: topLeft,
        topRight: topRight,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
      );

  BorderRadiusAttribute toAttribute() => BorderRadiusAttribute(toDto());
}

extension TextBaseLineExt on TextBaseline {
  TextBaselineAttribute toAttribute() => TextBaselineAttribute(this);
}

extension Matrix4Ext on Matrix4 {
  TransformAttribute toAttribute() => TransformAttribute(this);

  /// Merge [other] into this matrix.
  Matrix4 merge(Matrix4? other) {
    if (other == null || other == this) return this;

    return clone()..multiply(other);
  }
}

extension BorderSideExt on BorderSide {
  BorderSideDto toDto() => BorderSideDto(
        color: color.toDto(),
        strokeAlign: strokeAlign,
        style: style,
        width: width,
      );
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

extension ShadowExt on Shadow {
  ShadowDto toDto() => ShadowDto(
        blurRadius: blurRadius,
        color: color.toDto(),
        offset: offset,
      );
  ShadowAttribute toAttribute() => ShadowAttribute(toDto());
}

extension BoxShadowExt on BoxShadow {
  BoxShadowDto toDto() => BoxShadowDto(
        color: color.toDto(),
        offset: offset,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      );

  BoxShadowAttribute toAttribute() => BoxShadowAttribute(toDto());
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

  TextStyleAttribute toAttribute() => TextStyleAttribute(
        TextStyleListDto([toDto()]),
      );
}

extension BorderExt on Border {
  BorderDto toDto() => BorderDto(
        top: top.toDto(),
        bottom: bottom.toDto(),
        left: left.toDto(),
        right: right.toDto(),
      );

  BorderAttribute toAttribute() => BorderAttribute(toDto());
}

extension BorderDirectionalExt on BorderDirectional {
  BorderDirectionalDto toDto() => BorderDirectionalDto(
        start: start.toDto(),
        end: end.toDto(),
        top: top.toDto(),
        bottom: bottom.toDto(),
      );

  BorderDirectionalAttribute toAttribute() =>
      BorderDirectionalAttribute(toDto());
}

extension ListExt<T> on List<T> {
  List<T> merge(List<T>? other) {
    if (other == null) return this;

    if (isEmpty) return other;

    final listLength = length;
    final otherLength = other.length;
    final maxLength = max(listLength, otherLength);

    return List<T>.generate(maxLength, (int index) {
      if (index < listLength && index < otherLength) {
        final currentValue = this[index];
        final otherValue = other[index];
        if (currentValue is Mergeable) {
          return currentValue.merge(otherValue);
        }

        return otherValue ?? currentValue;
      } else if (index < listLength) {
        return this[index];
      }

      return other[index];
    });
  }
}
