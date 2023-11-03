import 'package:flutter/material.dart';

import '../../attributes/alignment_attribute.dart';
import '../../attributes/border_attribute.dart';
import '../../attributes/color_attribute.dart';
import '../../attributes/constraints_attribute.dart';
import '../../attributes/scalar_attribute.dart';
import '../../attributes/shadow_attribute.dart';
import '../../attributes/strut_style_attribute.dart';
import '../../attributes/text_style_attribute.dart';

extension StrutStyleExt on StrutStyle {
  StrutStyleAttribute toAttribute() {
    return StrutStyleAttribute.only(
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
  ColorAttribute get toDto => ColorAttribute(this);
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

extension AlignmentExt on Alignment {
  AlignmentGeometryAttribute toAttribute() =>
      AlignmentGeometryAttribute(x: x, y: y);
}

extension AligmentDirectionalExt on AlignmentDirectional {
  AlignmentGeometryAttribute toAttribute() =>
      AlignmentGeometryAttribute(start: start, y: y);
}

extension BoxConstraintsExt on BoxConstraints {
  BoxConstraintsAttribute get toDto => BoxConstraintsAttribute(
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

extension BorderRadiusGeometryExt on BorderRadiusGeometry {
  BorderRadiusGeometryAttribute get toDto {
    if (this is BorderRadius) return (this as BorderRadius).toDto;
    if (this is BorderRadiusDirectional) {
      return (this as BorderRadiusDirectional).toDto;
    }

    throw UnimplementedError();
  }
}

extension BorderRadiusDirectionalExrt on BorderRadiusDirectional {
  BorderRadiusGeometryAttribute get toDto => BorderRadiusGeometryAttribute(
        topStart: topStart,
        topEnd: topEnd,
        bottomStart: bottomStart,
        bottomEnd: bottomEnd,
      );
}

// Extension for BorderRadius
extension BorderRadiusExt on BorderRadius {
  BorderRadiusGeometryAttribute get toDto => BorderRadiusGeometryAttribute(
        topLeft: topLeft,
        topRight: topRight,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
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

extension BorderSideExt on BorderSide {
  BorderSideAttribute get toDto => BorderSideAttribute(
        color: color.toDto,
        strokeAlign: strokeAlign,
        style: style,
        width: width,
      );
}

extension BoxBorderExt on BoxBorder {
  BoxBorderAttribute get toDto {
    if (this is Border) return (this as Border).toDto;
    if (this is BorderDirectional) return (this as BorderDirectional).toDto;

    throw UnimplementedError();
  }
}

extension ShadowExt on Shadow {
  ShadowAttribute get toDto => ShadowAttribute(
        blurRadius: blurRadius,
        color: color.toDto,
        offset: offset,
      );
}

extension BoxShadowExt on BoxShadow {
  BoxShadowAttribute get toDto => BoxShadowAttribute(
        color: color.toDto,
        offset: offset,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      );
}

extension TextStyleExt on TextStyle {
  TextStyleAttribute get toDto => TextStyleAttribute(
        background: background,
        color: color?.toDto,
        debugLabel: debugLabel,
        decoration: decoration,
        decorationColor: decorationColor?.toDto,
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
        shadows: shadows?.map((e) => e.toDto).toList(),
        textBaseline: textBaseline,
        wordSpacing: wordSpacing,
      );
}

extension BorderExt on Border {
  BoxBorderAttribute get toDto => BoxBorderAttribute(
        top: top.toDto,
        bottom: bottom.toDto,
        left: left.toDto,
        right: right.toDto,
      );
}

extension BorderDirectionalExt on BorderDirectional {
  BoxBorderAttribute get toDto => BoxBorderAttribute(
        top: top.toDto,
        start: start.toDto,
        end: end.toDto,
        bottom: bottom.toDto,
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
