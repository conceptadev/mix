import 'package:flutter/material.dart';

import 'flex.attributes.dart';

/// The FlexUtility class is responsible for creating FlexAttributes objects
/// with various directional and sizing information. This allows widgets
/// to be organized in a more intuitive and easier way.
class FlexUtilities {
  const FlexUtilities();

  // Create a FlexAttribues for the direction axis
  FlexAttributes direction(Axis direction) {
    return FlexAttributes(
      direction: direction,
    );
  }

  // Create a FlexAttribues for the direction vertical axis
  FlexAttributes verticalDirection(VerticalDirection verticalDirection) {
    return FlexAttributes(
      verticalDirection: verticalDirection,
    );
  }

  // Create a FlexAttribues for the main axis
  FlexAttributes mainAxisAlignment(MainAxisAlignment mainAxisAlignment) {
    return FlexAttributes(
      mainAxisAlignment: mainAxisAlignment,
    );
  }

  // Create a FlexAttribues for the main axis size
  FlexAttributes mainAxisSize(MainAxisSize mainAxisSize) {
    return FlexAttributes(
      mainAxisSize: mainAxisSize,
    );
  }

  // Create a FlexAttribues for the cross axis
  FlexAttributes crossAxis(CrossAxisAlignment crossAxisAlignment) {
    return FlexAttributes(
      crossAxisAlignment: crossAxisAlignment,
    );
  }

  // Create a FlexAttribues for gap size
  FlexAttributes gap(double gapSize) {
    return FlexAttributes(
      gapSize: gapSize,
    );
  }

  @Deprecated('Use mainAxisAlignment instead')
  FlexAttributes mainAxis(MainAxisAlignment mainAxis) {
    return mainAxisAlignment(mainAxis);
  }
}
