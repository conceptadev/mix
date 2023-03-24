import 'package:flutter/material.dart';

import '../../helpers/dto/double.dto.dart';
import 'flex.attributes.dart';

/// The FlexUtility class is responsible for creating FlexAttributes objects
/// with various directional and sizing information. This allows widgets
/// to be organized in a more intuitive and easier way.
class FlexUtility {
  const FlexUtility._();

  // Create a FlexAttribues for the direction axis
  static FlexAttributes direction(Axis direction) {
    return FlexAttributes(
      direction: direction,
    );
  }

  // Create a FlexAttribues for the direction vertical axis
  static FlexAttributes verticalDirection(VerticalDirection verticalDirection) {
    return FlexAttributes(
      verticalDirection: verticalDirection,
    );
  }

  // Create a FlexAttribues for the main axis
  static FlexAttributes mainAxis(MainAxisAlignment mainAxisAlignment) {
    return FlexAttributes(
      mainAxisAlignment: mainAxisAlignment,
    );
  }

  // Create a FlexAttribues for the main axis size
  static FlexAttributes mainAxisSize(MainAxisSize mainAxisSize) {
    return FlexAttributes(
      mainAxisSize: mainAxisSize,
    );
  }

  // Create a FlexAttribues for the cross axis
  static FlexAttributes crossAxis(CrossAxisAlignment crossAxisAlignment) {
    return FlexAttributes(
      crossAxisAlignment: crossAxisAlignment,
    );
  }

  // Create a FlexAttribues for gap size
  static FlexAttributes gap(double gapSize) {
    return FlexAttributes(
      gapSize: DoubleDto.from(gapSize),
    );
  }
}
