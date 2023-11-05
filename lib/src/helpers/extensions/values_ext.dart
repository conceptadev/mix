import 'package:flutter/material.dart';

import '../../attributes/alignment_attribute.dart';
import '../../attributes/border_attribute.dart';
import '../../attributes/color_attribute.dart';
import '../../attributes/constraints_attribute.dart';
import '../../attributes/decoration_attribute.dart';
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

extension ColorExt on Color {
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

extension ShapeDecorationExt on ShapeDecoration {
  ShapeDecorationAttribute toAttribute() => ShapeDecorationAttribute(
        color: color?.toAttribute(),
        shape: shape,
        gradient: gradient?.toAttribute(),
        boxShadow: shadows?.map((e) => e.toAttribute()).toList(),
      );
}

extension AlignmentExt on Alignment {
  AlignmentGeometryAttribute toAttribute() =>
      AlignmentGeometryAttribute(x: x, y: y);
}

extension AligmentDirectionalExt on AlignmentDirectional {
  AlignmentGeometryAttribute toAttribute() =>
      AlignmentGeometryAttribute(start: start, y: y);
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
  BorderRadiusGeometryAttribute toAttribute() => BorderRadiusGeometryAttribute(
        topStart: topStart,
        topEnd: topEnd,
        bottomStart: bottomStart,
        bottomEnd: bottomEnd,
      );
}

// Extension for BorderRadius
extension BorderRadiusExt on BorderRadius {
  BorderRadiusGeometryAttribute toAttribute() => BorderRadiusGeometryAttribute(
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

extension TextStyleExt on TextStyle {
  TextStyleAttribute toAttribute() => TextStyleAttribute(
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
        height: height,
        letterSpacing: letterSpacing,
        locale: locale,
        shadows: shadows?.map((e) => e.toAttribute()).toList(),
        textBaseline: textBaseline,
        wordSpacing: wordSpacing,
      );
}

extension BorderExt on Border {
  BoxBorderAttribute toAttribute() => BoxBorderAttribute(
        top: top.toAttribute(),
        bottom: bottom.toAttribute(),
        left: left.toAttribute(),
        right: right.toAttribute(),
      );
}

extension BorderDirectionalExt on BorderDirectional {
  BoxBorderAttribute toAttribute() => BoxBorderAttribute(
        top: top.toAttribute(),
        start: start.toAttribute(),
        end: end.toAttribute(),
        bottom: bottom.toAttribute(),
      );
}

extension IterableExt<T> on Iterable<T> {
  Iterable<T> sorted([Comparator<T>? compare]) {
    List<T> newList = List.of(this);
    newList.sort(compare);

    return newList;
  }
}

extension ListExt<T> on List<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (T element in this) {
      if (test(element)) {
        return element;
      }
    }

    return null;
  }
}
