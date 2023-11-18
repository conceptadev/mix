import 'dart:ui';

import 'package:flutter/material.dart';

import '../../attributes/alignment_attribute.dart';
import '../../attributes/border/border_attribute.dart';
import '../../attributes/border/border_radius_attribute.dart';
import '../../attributes/color_attribute.dart';
import '../../attributes/constraints_attribute.dart';
import '../../attributes/decoration_attribute.dart';
import '../../attributes/edge_insets_attribute.dart';
import '../../attributes/scalar_attribute.dart';
import '../../attributes/shadow_attribute.dart';
import '../../attributes/space_attribute.dart';
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
  EdgeInsetsGeometryAttribute toAttribute() {
    if (this is EdgeInsets) return (this as EdgeInsets).toAttribute();
    if (this is EdgeInsetsDirectional) {
      return (this as EdgeInsetsDirectional).toAttribute();
    }

    throw UnimplementedError();
  }

  PaddingGeometryAttribute toPadding() {
    if (this is EdgeInsets) return (this as EdgeInsets).toPadding();
    if (this is EdgeInsetsDirectional) {
      return (this as EdgeInsetsDirectional).toPadding();
    }

    throw UnimplementedError();
  }

  MarginGeometryAttribute toMargin() {
    if (this is EdgeInsets) return (this as EdgeInsets).toMargin();
    if (this is EdgeInsetsDirectional) {
      return (this as EdgeInsetsDirectional).toMargin();
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

  PaddingAttribute toPadding() => PaddingAttribute(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      );

  MarginAttribute toMargin() => MarginAttribute(
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

  PaddingDirectionalAttribute toPadding() => PaddingDirectionalAttribute(
        top: top,
        bottom: bottom,
        start: start,
        end: end,
      );

  MarginDirectionalAttribute toMargin() => MarginDirectionalAttribute(
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
    if (this is Alignment) return (this as Alignment).toAttribute();
    if (this is AlignmentDirectional) {
      return (this as AlignmentDirectional).toAttribute();
    }
    throw UnimplementedError();
  }
}

extension PaintExt on Paint {
  PaintAttribute toAttribute() => PaintAttribute(this);
}

extension ShapeDecorationExt on ShapeDecoration {
  ShapeDecorationAttribute toAttribute() => ShapeDecorationAttribute(
        color: color?.toAttribute(),
        shape: shape,
        gradient: gradient?.toAttribute(),
        boxShadow: shadows?.map((e) => e.toAttribute()).toList(),
      );
}

extension AlignmentExt on Alignment {
  AlignmentAttribute toAttribute() => AlignmentAttribute(x, y);
}

extension AlignmentDirectionalExt on AlignmentDirectional {
  AlignmentDirectionalAttribute toAttribute() =>
      AlignmentDirectionalAttribute(start, y);
}

extension BoxConstraintsExt on BoxConstraints {
  BoxConstraintsAttribute toAttribute() => BoxConstraintsAttribute(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      );
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
  BoxDecorationAttribute toAttribute() => BoxDecorationAttribute(
        border: border?.toAttribute(),
        borderRadius: borderRadius?.toAttribute(),
        gradient: gradient?.toAttribute(),
        boxShadow: boxShadow?.map((e) => e.toAttribute()).toList(),
        color: color?.toAttribute(),
        shape: shape.toAttribute(),
      );
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
  BorderRadiusDirectionalAttribute toAttribute() =>
      BorderRadiusDirectionalAttribute(
        topStart: topStart,
        topEnd: topEnd,
        bottomStart: bottomStart,
        bottomEnd: bottomEnd,
      );
}

// Extension for BorderRadius
extension BorderRadiusExt on BorderRadius {
  BorderRadiusAttribute toAttribute() => BorderRadiusAttribute(
        topLeft: topLeft,
        topRight: topRight,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
      );
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
  BorderSideAttribute toAttribute() => BorderSideAttribute(
        color: color.toAttribute(),
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
  ShadowAttribute toAttribute() => ShadowAttribute(
        blurRadius: blurRadius,
        color: color.toAttribute(),
        offset: offset,
      );
}

extension BoxShadowExt on BoxShadow {
  BoxShadowAttribute toAttribute() => BoxShadowAttribute(
        color: color.toAttribute(),
        offset: offset,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      );
}

extension TextDecorationExt on TextDecoration {
  TextDecorationAttribute toAttribute() => TextDecorationAttribute(this);
}

extension TextDecorationStyleExt on TextDecorationStyle {
  TextDecorationStyleAttribute toAttribute() =>
      TextDecorationStyleAttribute(this);
}

extension TextStyleExt on TextStyle {
  TextStyleAttribute toAttribute() => TextStyleAttribute(
        background: background?.toAttribute(),
        color: color?.toAttribute(),
        decoration: decoration?.toAttribute(),
        decorationColor: decorationColor?.toAttribute(),
        decorationStyle: decorationStyle?.toAttribute(),
        decorationThickness: decorationThickness,
        foreground: foreground?.toAttribute(),
        height: height,
        shadows: shadows?.map((e) => e.toAttribute()).toList(),
        fontFamily: FontFamilyAttribute.maybe(fontFamily),
        fontSize: FontSizeAttribute.maybe(fontSize),
        fontStyle: FontStyleAttribute.maybe(fontStyle),
        fontWeight: FontWeightAttribute.maybe(fontWeight),
        letterSpacing: LetterSpacingAttribute.maybe(letterSpacing),
        wordSpacing: WordSpacingAttribute.maybe(wordSpacing),
        textBaseline: textBaseline?.toAttribute(),
        fontFeatures: fontFeatures,
      );
}

extension FontFeatureExt on FontFeature {
  FontFeatureAttribute toAttribute() => FontFeatureAttribute(this);
}

extension BorderExt on Border {
  BorderAttribute toAttribute() => BorderAttribute(
        left: left.toAttribute(),
        right: right.toAttribute(),
        top: top.toAttribute(),
        bottom: bottom.toAttribute(),
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
