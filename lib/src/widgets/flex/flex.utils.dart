import 'package:flutter/material.dart';

import 'flex.attributes.dart';

/// ## Widget
/// - [FlexBox](FlexBox-class.html)
///
/// Utility functions and short utils are listed in [Static Methods](#static-methods)
///
/// {@category Utilities}
class FlexUtility {
  const FlexUtility._();

  /// Short Utils: flexDirection
  static FlexAttributes direction(Axis direction) {
    return FlexAttributes(
      direction: direction,
    );
  }

  /// Short Utils: verticalDirection
  static FlexAttributes verticalDirection(VerticalDirection verticalDirection) {
    return FlexAttributes(
      verticalDirection: verticalDirection,
    );
  }

  /// Short Utils: mainAxis
  static FlexAttributes mainAxis(MainAxisAlignment mainAxisAlignment) {
    return FlexAttributes(
      mainAxisAlignment: mainAxisAlignment,
    );
  }

  /// Short Utils: mainAxisSize
  static FlexAttributes mainAxisSize(MainAxisSize mainAxisSize) {
    return FlexAttributes(
      mainAxisSize: mainAxisSize,
    );
  }

  /// Short Utils: crossAxis
  static FlexAttributes crossAxis(CrossAxisAlignment crossAxisAlignment) {
    return FlexAttributes(
      crossAxisAlignment: crossAxisAlignment,
    );
  }

  /// Short Utils: gap
  static FlexAttributes gap(double gapSize) {
    return FlexAttributes(
      gapSize: gapSize,
    );
  }
}
