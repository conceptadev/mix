import 'package:flutter/material.dart';

import '../base_attribute.dart';
import '../primitives/size.dart';

class ConstraintsAttribute extends Attribute<BoxConstraints> {
  ConstraintsAttribute({
    this.width,
    this.minWidth,
    this.maxWidth,
    this.height,
    this.minHeight,
    this.maxHeight,
  });

  final double? width;
  final double? minWidth;
  final double? maxWidth;
  final double? height;
  final double? minHeight;
  final double? maxHeight;

  factory ConstraintsAttribute.fromAttributes({
    final WidthAttribute? width,
    final MinWidthAttribute? minWidth,
    final MaxWidthAttribute? maxWidth,
    final HeightAttribute? height,
    final MinHeightAttribute? minHeight,
    final MaxHeightAttribute? maxHeight,
  }) {
    return ConstraintsAttribute(
      width: width?.value,
      maxWidth: maxWidth?.value,
      minWidth: minWidth?.value,
      height: height?.value,
      maxHeight: maxHeight?.value,
      minHeight: minHeight?.value,
    );
  }

  BoxConstraints get value {
    BoxConstraints? constraints;

    if (minWidth != null ||
        maxWidth != null ||
        minHeight != null ||
        maxHeight != null) {
      constraints = BoxConstraints(
        minHeight: minHeight ?? 0.0,
        maxHeight: maxHeight ?? double.infinity,
        minWidth: minWidth ?? 0.0,
        maxWidth: maxWidth ?? double.infinity,
      );
    }

    // If there are min or max constraints
    if (constraints != null) {
      return constraints.tighten(
        width: width,
        height: height,
      );
    } else {
      return BoxConstraints.tightFor(
        width: width,
        height: height,
      );
    }
  }
}

// /// Merges Border radius
// ConstraintsAttribute mergeConstraintsAttribute(
//   ConstraintsAttribute? attribute,
//   ConstraintsAttribute other,
// ) {
//   attribute ??= ConstraintsAttribute();
//   return attribute.copyWith(
//     width: other.width,
//     minWidth: other.minWidth,
//     maxWidth: other.maxWidth,
//     height: other.height,
//     minHeight: other.minHeight,
//     maxHeight: other.maxHeight,
//   );
// }
