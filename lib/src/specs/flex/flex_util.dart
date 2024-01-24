import 'package:flutter/material.dart';

import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/spacing/spacing_util.dart';
import '../../core/attribute.dart';
import 'flex_attribute.dart';

/// A utility class for building [FlexSpecAttribute]s.
final flex = FlexSpecUtility.selfBuilder;

class FlexSpecUtility<T extends StyleAttribute>
    extends MixUtility<T, FlexSpecAttribute> {
  static final selfBuilder = FlexSpecUtility((value) => value);

  const FlexSpecUtility(super.builder);

  AxisUtility<T> get direction {
    return AxisUtility((direction) => only(direction: direction));
  }

  MainAxisAlignmentUtility<T> get mainAxisAlignment {
    return MainAxisAlignmentUtility(
      (mainAxisAlignment) => only(mainAxisAlignment: mainAxisAlignment),
    );
  }

  CrossAxisAlignmentUtility<T> get crossAxisAlignment {
    return CrossAxisAlignmentUtility(
      (crossAxisAlignment) => only(crossAxisAlignment: crossAxisAlignment),
    );
  }

  MainAxisSizeUtility<T> get mainAxisSize {
    return MainAxisSizeUtility(
      (mainAxisSize) => only(mainAxisSize: mainAxisSize),
    );
  }

  VerticalDirectionUtility<T> get verticalDirection {
    return VerticalDirectionUtility(
      (verticalDirection) => only(verticalDirection: verticalDirection),
    );
  }

  TextDirectionUtility<T> get textDirection {
    return TextDirectionUtility(
      (textDirection) => only(textDirection: textDirection),
    );
  }

  TextBaselineUtility<T> get textBaseline {
    return TextBaselineUtility(
      (textBaseline) => only(textBaseline: textBaseline),
    );
  }

  ClipUtility<T> get clipBehavior {
    return ClipUtility((clipBehavior) => only(clipBehavior: clipBehavior));
  }

  SpacingSideUtility<T> get gap {
    return SpacingSideUtility((gap) => only(gap: gap));
  }

  T only({
    Axis? direction,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
    VerticalDirection? verticalDirection,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    Clip? clipBehavior,
    double? gap,
  }) {
    final attriubte = FlexSpecAttribute(
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
      gap: gap,
    );

    return builder(attriubte);
  }

  T row() => direction.horizontal();
  T column() => direction.vertical();
}
