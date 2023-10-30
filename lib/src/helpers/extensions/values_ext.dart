import 'package:flutter/material.dart';

import '../../attributes/strut_style_attribute.dart';
import '../../attributes/value_attributes.dart';
import '../../core/dto/border_dto.dart';
import '../../core/dto/dtos.dart';
import '../../core/dto/radius_dto.dart';
import '../../core/dto/shadow_dto.dart';
import '../../core/dto/text_style_dto.dart';

extension StrutStyleExt on StrutStyle {
  StrutStyleAttribute get toAttribute {
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

extension DoubleExt on double {
  DoubleDto get toDto => DoubleDto(this);
}

// Extension for TextAlign
extension TextAlignExt on TextAlign {
  TextAlignAttribute get toAttribute => TextAlignAttribute(this);
}

extension GradientExt on Gradient {
  GradientAttribute get toAttribute => GradientAttribute(this);
}

extension ColorExt on Color {
  ColorDto get toDto => ColorDto(this);
}

// Extension for Alignment
extension AlignmentGeometryExt on AlignmentGeometry {
  AlignmentGeometryDto get toDto {
    if (this is Alignment) return (this as Alignment).toDto;
    if (this is AlignmentDirectional) {
      return (this as AlignmentDirectional).toDto;
    }
    throw UnimplementedError();
  }

  AlignmentGeometryAttribute get toAttribute =>
      AlignmentGeometryAttribute(toDto);
}

extension AlignmentExt on Alignment {
  AlignmentGeometryDto get toDto =>
      AlignmentGeometryDto(x: x.toDto, y: y.toDto);
  AlignmentGeometryAttribute get toAttribute =>
      AlignmentGeometryAttribute(toDto);
}

extension AligmentDirectionalExt on AlignmentDirectional {
  AlignmentGeometryDto get toDto => AlignmentGeometryDto(
        start: start.toDto,
        y: y.toDto,
      );
  AlignmentGeometryAttribute get toAttribute =>
      AlignmentGeometryAttribute(toDto);
}

// Extensions for EdgeInsetsGeometry, similar to AlignmentGeometry
extension EdgeInsetsGeometryExt on EdgeInsetsGeometry {
  EdgeInsetsGeometryDto get toDto {
    if (this is EdgeInsets) return (this as EdgeInsets).toDto;
    if (this is EdgeInsetsDirectional) {
      return (this as EdgeInsetsDirectional).toDto;
    }
    throw UnimplementedError();
  }

  SpaceGeometryDto get toSpace {
    if (this is EdgeInsets) return (this as EdgeInsets).toSpace;
    if (this is EdgeInsetsDirectional) {
      return (this as EdgeInsetsDirectional).toSpace;
    }
    throw UnimplementedError();
  }
}

// Extensions for EdgeInsets, similar to Alignment
extension EdgeInsetsExt on EdgeInsets {
  EdgeInsetsGeometryDto get toDto => EdgeInsetsGeometryDto(
        top: top.toDto,
        bottom: bottom.toDto,
        left: left.toDto,
        right: right.toDto,
      );

  SpaceGeometryDto get toSpace => SpaceGeometryDto(
        top: top.toDto,
        bottom: bottom.toDto,
        left: left.toDto,
        right: right.toDto,
      );
}

// Extensions for EdgeInsetsDirectional, similar to AlignmentDirectional
extension EdgeInsetsDirectionalExt on EdgeInsetsDirectional {
  EdgeInsetsGeometryDto get toDto => EdgeInsetsGeometryDto(
        top: top.toDto,
        bottom: bottom.toDto,
        start: start.toDto,
        end: end.toDto,
        isDirectional: true,
      );

  SpaceGeometryDto get toSpace => SpaceGeometryDto(
        top: top.toDto,
        bottom: bottom.toDto,
        start: start.toDto,
        end: end.toDto,
        isDirectional: true,
      );
}

// Extension for MainAxisAlignment
extension MainAxisAlignmentExt on MainAxisAlignment {
  MainAxisAlignmentAttribute get toAttribute =>
      MainAxisAlignmentAttribute(this);
}

// Extension for CrossAxisAlignment
extension CrossAxisAlignmentExt on CrossAxisAlignment {
  CrossAxisAlignmentAttribute get toAttribute =>
      CrossAxisAlignmentAttribute(this);
}

// Extension for TextDirection
extension TextDirectionExt on TextDirection {
  TextDirectionAttribute get toAttribute => TextDirectionAttribute(this);
}

// Extension for Axis
extension AxisExt on Axis {
  AxisAttribute get toAttribute => AxisAttribute(this);
}

// Extension for BlendMode
extension BlendModeExt on BlendMode {
  BlendModeAttribute get toAttribute => BlendModeAttribute(this);
}

// Extension for BoxFit
extension BoxFitExt on BoxFit {
  BoxFitAttribute get toAttribute => BoxFitAttribute(this);
}

extension BorderRadiusGeometryExt on BorderRadiusGeometry {
  BorderRadiusGeometryDto get toDto {
    if (this is BorderRadius) return (this as BorderRadius).toDto;
    if (this is BorderRadiusDirectional) {
      return (this as BorderRadiusDirectional).toDto;
    }

    throw UnimplementedError();
  }

  BorderRadiusGeometryAttribute get toAttribute =>
      BorderRadiusGeometryAttribute(toDto);
}

extension BorderRadiusDirectionalExrt on BorderRadiusDirectional {
  BorderRadiusGeometryDto get toDto => BorderRadiusGeometryDto(
        topStart: topStart.toDto,
        topEnd: topEnd.toDto,
        bottomStart: bottomStart.toDto,
        bottomEnd: bottomEnd.toDto,
      );

  BorderRadiusGeometryAttribute get toAttribute =>
      BorderRadiusGeometryAttribute(toDto);
}

// Extension for BorderRadius
extension BorderRadiusExt on BorderRadius {
  BorderRadiusGeometryDto get toDto => BorderRadiusGeometryDto(
        topLeft: topLeft.toDto,
        topRight: topRight.toDto,
        bottomLeft: bottomLeft.toDto,
        bottomRight: bottomRight.toDto,
      );
  BorderRadiusGeometryAttribute get toAttribute =>
      BorderRadiusGeometryAttribute(toDto);
}

extension RadiusExt on Radius {
  RadiusDto get toDto => RadiusDto(x: x.toDto, y: y.toDto);
}

extension Matrix4Ext on Matrix4 {
  TransformAttribute get toAttribute => TransformAttribute(this);

  /// Merge [other] into this matrix.
  Matrix4 merge(Matrix4? other) {
    if (other == null || other == this) return this;

    return clone()..multiply(other);
  }
}

extension BorderSideExt on BorderSide {
  BorderSideDto get toDto => BorderSideDto(
        color: color.toDto,
        strokeAlign: strokeAlign.toDto,
        style: style,
        width: width.toDto,
      );
}

extension BoxBorderExt on BoxBorder {
  BoxBorderDto get toDto {
    if (this is Border) return (this as Border).toDto;
    if (this is BorderDirectional) return (this as BorderDirectional).toDto;

    throw UnimplementedError();
  }

  BoxBorderAttribute get toAttribute => BoxBorderAttribute(toDto);
}

extension ShadowExt on Shadow {
  ShadowDto get toDto => ShadowDto(
        blurRadius: blurRadius.toDto,
        color: color.toDto,
        offset: offset,
      );
}

extension BoxShadowExt on BoxShadow {
  BoxShadowDto get toDto => BoxShadowDto(
        color: color.toDto,
        offset: offset,
        blurRadius: blurRadius.toDto,
        spreadRadius: spreadRadius.toDto,
      );
}

extension TextStyleExt on TextStyle {
  TextStyleDto get toDto => TextStyleDto(
        background: background,
        color: color?.toDto,
        debugLabel: debugLabel,
        decoration: decoration,
        decorationColor: decorationColor?.toDto,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness?.toDto,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontFeatures: fontFeatures,
        fontSize: fontSize?.toDto,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        foreground: foreground,
        height: height?.toDto,
        letterSpacing: letterSpacing?.toDto,
        locale: locale,
        shadows: shadows?.map((e) => e.toDto).toList(),
        textBaseline: textBaseline,
        wordSpacing: wordSpacing?.toDto,
      );
}

extension BorderExt on Border {
  BoxBorderDto get toDto => BoxBorderDto(
        top: top.toDto,
        bottom: bottom.toDto,
        left: left.toDto,
        right: right.toDto,
      );

  BoxBorderAttribute get toAttribute => BoxBorderAttribute(toDto);
}

extension BorderDirectionalExt on BorderDirectional {
  BoxBorderDto get toDto => BoxBorderDto(
        top: top.toDto,
        start: start.toDto,
        end: end.toDto,
        bottom: bottom.toDto,
      );

  BoxBorderAttribute get toAttribute => BoxBorderAttribute(toDto);
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
