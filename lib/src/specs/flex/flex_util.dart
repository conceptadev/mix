import 'package:flutter/material.dart';

import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/spacing/spacing_util.dart';
import 'flex_attribute.dart';

/// A utility class for building [FlexSpecAttribute]s.
const flex = FlexSpecUtility();

/// FlexSpecUtility
///
/// A utility class to create `FlexSpecAttribute` by creating a nested API.
/// This allows a composable way to create `FlexSpecAttribute` without
/// having to manually create a `FlexSpecAttribute` and provide all the
/// properties.
/// See also:
/// * [FlexSpecAttribute]
class FlexSpecUtility extends SpecUtility<FlexSpecAttribute> {
  const FlexSpecUtility();

  /// Sets the flex direction (axis) of the layout.
  ///
  /// Returns an `AxisUtility` to set the axis to horizontal or vertical.
  AxisUtility<FlexSpecAttribute> get direction {
    return AxisUtility((direction) => only(direction: direction));
  }

  /// Sets the main axis alignment.
  ///
  /// Returns a `MainAxisAlignmentUtility` to set the alignment.
  MainAxisAlignmentUtility<FlexSpecAttribute> get mainAxisAlignment {
    return MainAxisAlignmentUtility(
      (mainAxisAlignment) => only(mainAxisAlignment: mainAxisAlignment),
    );
  }

  /// Sets the cross axis alignment.
  ///
  /// Returns a `CrossAxisAlignmentUtility` to set the alignment.
  CrossAxisAlignmentUtility<FlexSpecAttribute> get crossAxisAlignment {
    return CrossAxisAlignmentUtility(
      (crossAxisAlignment) => only(crossAxisAlignment: crossAxisAlignment),
    );
  }

  /// Sets the main axis size.
  ///
  /// Returns a `MainAxisSizeUtility` to set the size.
  MainAxisSizeUtility<FlexSpecAttribute> get mainAxisSize {
    return MainAxisSizeUtility(
      (mainAxisSize) => only(mainAxisSize: mainAxisSize),
    );
  }

  /// Sets the vertical direction.
  ///
  /// Returns a `VerticalDirectionUtility` to set the direction.
  VerticalDirectionUtility<FlexSpecAttribute> get verticalDirection {
    return VerticalDirectionUtility(
      (verticalDirection) => only(verticalDirection: verticalDirection),
    );
  }

  /// Sets the text direction.
  ///
  /// Returns a `TextDirectionUtility` to set the direction.
  TextDirectionUtility<FlexSpecAttribute> get textDirection {
    return TextDirectionUtility(
      (textDirection) => only(textDirection: textDirection),
    );
  }

  /// Sets the text baseline alignment.
  ///
  /// Returns a `TextBaselineUtility` to set the alignment.
  TextBaselineUtility<FlexSpecAttribute> get textBaseline {
    return TextBaselineUtility(
      (textBaseline) => only(textBaseline: textBaseline),
    );
  }

  /// Sets the clip behavior.
  ///
  /// Returns a `ClipUtility` to set the behavior.
  ClipUtility<FlexSpecAttribute> get clipBehavior {
    return ClipUtility((clipBehavior) => only(clipBehavior: clipBehavior));
  }

  /// Sets the gap (spacing) between children.
  ///
  /// Returns a `SpacingSideUtility` to set the gap.
  SpacingSideUtility<FlexSpecAttribute> get gap {
    return SpacingSideUtility((gap) => only(gap: gap));
  }

  /// Creates a `FlexSpecAttribute` with the specified properties.
  FlexSpecAttribute only({
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
    return FlexSpecAttribute(
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
  }

  /// Shorthand for setting the direction to horizontal.
  FlexSpecAttribute row() => direction.horizontal();

  /// Shorthand for setting the direction to vertical.
  FlexSpecAttribute column() => direction.vertical();
}
