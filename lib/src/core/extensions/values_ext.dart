import 'dart:math';

import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../attributes/border/border_attribute.dart';
import '../../attributes/border/border_radius_attribute.dart';
import '../../attributes/color_attribute.dart';
import '../../attributes/constraints/constraints_attribute.dart';
import '../../attributes/edge_insets_attribute.dart';
import '../../attributes/gradient_attribute.dart';
import '../../attributes/render/alignment_attribute.dart';
import '../../attributes/render/decoration_attribute.dart';
import '../../attributes/scalar_attribute.dart';
import '../../attributes/shadow_attribute.dart';
import '../../attributes/strut_style_attribute.dart';
import '../../attributes/text_style_attribute.dart';

extension StrutStyleExt on StrutStyle {
  StrutStyleAttribute toAttribute() {
    return StrutStyleAttribute(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: this.height,
      leading: leading,
      forceStrutHeight: forceStrutHeight,
    );
  }

  StrutStyle merge(StrutStyle? other) {
    return StrutStyle(
      fontFamily: other?.fontFamily ?? fontFamily,
      fontFamilyFallback: other?.fontFamilyFallback ?? fontFamilyFallback,
      fontSize: other?.fontSize ?? fontSize,
      height: other?.height ?? this.height,
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
  GradientAttribute toAttribute() {
    if (this is LinearGradient) return (this as LinearGradient).toAttribute();
    if (this is RadialGradient) return (this as RadialGradient).toAttribute();
    if (this is SweepGradient) return (this as SweepGradient).toAttribute();

    throw UnimplementedError();
  }
}

extension LinearGradientExt on LinearGradient {
  LinearGradientAttribute toAttribute() => LinearGradientAttribute(
        begin: begin,
        end: end,
        colors: colors.map((e) => e.toAttribute()).toList(),
        stops: stops,
        tileMode: tileMode,
        transform: transform,
      );
}

extension RadialGradientExt on RadialGradient {
  RadialGradientAttribute toAttribute() => RadialGradientAttribute(
        center: center,
        radius: radius,
        colors: colors.map((e) => e.toAttribute()).toList(),
        stops: stops,
        tileMode: tileMode,
        focal: focal,
        transform: transform,
      );
}

extension SweepGradientExt on SweepGradient {
  SweepGradientAttribute toAttribute() => SweepGradientAttribute(
        center: center,
        startAngle: startAngle,
        endAngle: endAngle,
        colors: colors.map((e) => e.toAttribute()).toList(),
        stops: stops,
        tileMode: tileMode,
        transform: transform,
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

extension BorderExt on Border {
  BorderAttribute toAttribute() => BorderAttribute(
        top: top.toAttribute(),
        bottom: bottom.toAttribute(),
        left: left.toAttribute(),
        right: right.toAttribute(),
      );
}

extension BorderDirectionalExt on BorderDirectional {
  BorderDirectionalAttribute toAttribute() => BorderDirectionalAttribute(
        start: start.toAttribute(),
        end: end.toAttribute(),
        top: top.toAttribute(),
        bottom: bottom.toAttribute(),
      );
}

extension EdgeInsetsGeometryExt on EdgeInsetsGeometry {
  EdgeInsetsGeometryAttribute toAttribute() {
    if (this is EdgeInsets) return (this as EdgeInsets).toAttribute();
    if (this is EdgeInsetsDirectional) {
      return (this as EdgeInsetsDirectional).toAttribute();
    }

    throw UnimplementedError();
  }
}

extension EdgeInsetsExt on EdgeInsets {
  EdgeInsetsAttribute toAttribute() => EdgeInsetsAttribute(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      );
}

extension EdgeInsetsDirectionalExt on EdgeInsetsDirectional {
  EdgeInsetsDirectionalAttribute toAttribute() =>
      EdgeInsetsDirectionalAttribute(
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

  ColorAttribute toAttribute() => ColorAttribute(this);
}

// Extension for Alignment
extension AlignmentGeometryExt on AlignmentGeometry {
  AlignmentGeometryAttribute toAttribute() {
    return AlignmentGeometryAttribute(this);
  }
}

extension ShapeDecorationExt on ShapeDecoration {
  ShapeDecorationAttribute toAttribute() => ShapeDecorationAttribute(
        color: color?.toAttribute(),
        shape: shape,
        gradient: gradient?.toAttribute(),
        boxShadow: shadows?.map((e) => e.toAttribute()).toList(),
      );
}

extension BoxConstraintsExt on BoxConstraints {
  BoxConstraintsAttribute toAttribute() => BoxConstraintsAttribute(
        minWidth: this.minWidth,
        maxWidth: this.maxWidth,
        minHeight: this.minHeight,
        maxHeight: this.maxHeight,
      );
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
  BoxDecorationAttribute toAttribute() => BoxDecorationAttribute(
        color: color?.toAttribute(),
        border: border?.toAttribute(),
        borderRadius: borderRadius?.toAttribute(),
        gradient: gradient?.toAttribute(),
        boxShadow: boxShadow?.map((e) => e.toAttribute()).toList(),
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
  BorderRadiusAttribute toAttribute() => BorderRadiusAttribute(
        topLeft: topLeft,
        topRight: topRight,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
      );
}

extension BorderRadiusDirectionalExrt on BorderRadiusDirectional {
  BorderRadiusDirectionalAttribute toAttribute() =>
      BorderRadiusDirectionalAttribute(
        topStart: topStart,
        topEnd: topEnd,
        bottomStart: bottomStart,
        bottomEnd: bottomEnd,
      );
}

// Extension for BorderRadius
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
  BorderSideAttribute toAttribute() => BorderSideAttribute(
        color: color.toAttribute(),
        strokeAlign: strokeAlign,
        style: style,
        width: this.width,
      );
}

extension ShadowExt on Shadow {
  ShadowAttribute toAttribute() => ShadowAttribute(
        blurRadius: blurRadius,
        color: color.toAttribute(),
        offset: offset,
      );
}

extension ListShadowExt on List<Shadow> {
  List<ShadowAttribute> toAttribute() {
    return map((e) => e.toAttribute()).toList();
  }
}

extension BoxShadowExt on BoxShadow {
  BoxShadowAttribute toAttribute() => BoxShadowAttribute(
        color: color.toAttribute(),
        offset: offset,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      );
}

extension ListBoxShadowExt on List<BoxShadow> {
  List<BoxShadowAttribute> toAttribute() {
    return map((e) => e.toAttribute()).toList();
  }
}

extension TextStyleExt on TextStyle {
  TextStyleDto toDto() => TextStyleDto(
        background: background,
        color: color?.toAttribute(),
        debugLabel: debugLabel,
        decoration: decoration,
        decorationColor: decorationColor?.toAttribute(),
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontFeatures: fontFeatures,
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        foreground: foreground,
        height: this.height,
        letterSpacing: letterSpacing,
        locale: locale,
        shadows: shadows?.map((e) => e.toAttribute()).toList(),
        textBaseline: textBaseline,
        wordSpacing: wordSpacing,
      );

  TextStyleAttribute toAttribute() => TextStyleAttribute(toDto());
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
