import 'package:flutter/material.dart';

import '../../attributes/alignment_geometry_attribute.dart';
import '../../attributes/axis_attribute.dart';
import '../../attributes/blend_mode_attribute.dart';
import '../../attributes/border_radius_geometry_attribute.dart';
import '../../attributes/box_fit_attribute.dart';
import '../../attributes/color_attribute.dart';
import '../../attributes/cross_axis_alignment_attribute.dart';
import '../../attributes/curve_attribute.dart';
import '../../attributes/main_axis_alignment_attribute.dart';
import '../../attributes/matrix4_attribute.dart';
import '../../attributes/strut_style_attribute.dart';
import '../../attributes/text_align_attribute.dart';
import '../../attributes/text_direction_attribute.dart';

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

// Extension for TextAlign
extension TextAlignExt on TextAlign {
  TextAlignAttribute get attr => TextAlignAttribute(this);
}

// Extension for Alignment
extension AlignmentGeometryExt on AlignmentGeometry {
  AlignmentGeometryAttribute get attr => AlignmentGeometryAttribute.from(this);
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

// Extension for Color
extension ColorExt on Color {
  ColorAttribute get attr => ColorAttribute.from(this);
}

// Extension for BlendMode
extension BlendModeExt on BlendMode {
  BlendModeAttribute get attr => BlendModeAttribute(this);
}

// Extension for BoxFit
extension BoxFitExt on BoxFit {
  BoxFitAttribute get attr => BoxFitAttribute(this);
}

// Extension for BorderRadius
extension BorderRadiusExt on BorderRadius {
  BorderRadiusAttribute get attr => BorderRadiusAttribute.from(this);
}

// Extension for Curve
extension CurveExt on Curve {
  CurveAttribute get attr => CurveAttribute(this);
}

extension Matrix4Ext on Matrix4 {
  Matrix4Attribute get attr => Matrix4Attribute(this);

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
