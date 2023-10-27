import 'package:flutter/material.dart';

import '../../attributes/strut_style_attribute.dart';
import '../../attributes/value_attributes.dart';
import '../../core/dto/border_dto.dart';
import '../../core/dto/dtos.dart';
import '../../core/dto/radius_dto.dart';

extension StrutStyleExt on StrutStyle {
  StrutStyleAttribute get attr => StrutStyleAttribute.from(this);
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
  DoubleDto get dto => DoubleDto(this);
}

// Extension for TextAlign
extension TextAlignExt on TextAlign {
  TextAlignAttribute get attr => TextAlignAttribute(this);
}

// Extension for Alignment
extension AlignmentGeometryExt on AlignmentGeometry {
  AlignmentGeometryDto get dto {
    if (this is Alignment) return (this as Alignment).dto;
    if (this is AlignmentDirectional) return (this as AlignmentDirectional).dto;
    throw UnimplementedError();
  }

  AlignmentGeometryAttribute get attr => AlignmentGeometryAttribute(dto);
}

extension ColorExt on Color {
  ColorDto get dto => ColorDto(this);
}

extension AlignmentExt on Alignment {
  AlignmentGeometryDto get dto => AlignmentGeometryDto(x: x.dto, y: y.dto);
  AlignmentGeometryAttribute get attr => AlignmentGeometryAttribute(dto);
}

extension AligmentDirectionalExt on AlignmentDirectional {
  AlignmentGeometryDto get dto => AlignmentGeometryDto(
        start: start.dto,
        y: y.dto,
      );
  AlignmentGeometryAttribute get attr => AlignmentGeometryAttribute(dto);
}

// Extension for MainAxisAlignment
extension MainAxisAlignmentExt on MainAxisAlignment {
  MainAxisAlignmentAttribute get attr => MainAxisAlignmentAttribute(this);
}

// Extension for CrossAxisAlignment
extension CrossAxisAlignmentExt on CrossAxisAlignment {
  CrossAxisAlignmentAttribute get attr => CrossAxisAlignmentAttribute(this);
}

// Extension for TextDirection
extension TextDirectionExt on TextDirection {
  TextDirectionAttribute get attr => TextDirectionAttribute(this);
}

// Extension for Axis
extension AxisExt on Axis {
  AxisAttribute get attr => AxisAttribute(this);
}

// Extension for BlendMode
extension BlendModeExt on BlendMode {
  BlendModeAttribute get attr => BlendModeAttribute(this);
}

// Extension for BoxFit
extension BoxFitExt on BoxFit {
  BoxFitAttribute get attr => BoxFitAttribute(this);
}

extension BorderRadiusGeometryExt on BorderRadiusGeometry {
  BorderRadiusGeometryDto get dto {
    if (this is BorderRadius) return (this as BorderRadius).dto;
    if (this is BorderRadiusDirectional) {
      return (this as BorderRadiusDirectional).dto;
    }

    throw UnimplementedError();
  }

  BorderRadiusGeometryAttribute get attr => BorderRadiusGeometryAttribute(dto);
}

extension BorderRadiusDirectionalExrt on BorderRadiusDirectional {
  BorderRadiusGeometryDto get dto => BorderRadiusGeometryDto(
        topStart: topStart.dto,
        topEnd: topEnd.dto,
        bottomStart: bottomStart.dto,
        bottomEnd: bottomEnd.dto,
      );

  BorderRadiusGeometryAttribute get attr => BorderRadiusGeometryAttribute(dto);
}

// Extension for BorderRadius
extension BorderRadiusExt on BorderRadius {
  BorderRadiusGeometryDto get dto => BorderRadiusGeometryDto(
        topLeft: topLeft.dto,
        topRight: topRight.dto,
        bottomLeft: bottomLeft.dto,
        bottomRight: bottomRight.dto,
      );
  BorderRadiusGeometryAttribute get attr => BorderRadiusGeometryAttribute(dto);
}

extension RadiusExt on Radius {
  RadiusDto get dto => RadiusDto(x: x.dto, y: y.dto);
}

extension Matrix4Ext on Matrix4 {
  TransformAttribute get attr => TransformAttribute(this);

  /// Merge [other] into this matrix.
  Matrix4 merge(Matrix4? other) {
    if (other == null || other == this) return this;

    return clone()..multiply(other);
  }
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
