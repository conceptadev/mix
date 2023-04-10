import 'package:flutter/material.dart';

import 'flex.attributes.dart';

/// The FlexUtility class is responsible for creating FlexAttributes objects
/// with various directional and sizing information. This allows widgets
/// to be organized in a more intuitive and easier way.
class FlexUtilities {
  const FlexUtilities();

  // Create a FlexAttribues for the direction axis
  StyledFlexAttributes direction(Axis direction) {
    return StyledFlexAttributes(
      direction: direction,
    );
  }

  // Create a FlexAttribues for the direction vertical axis
  StyledFlexAttributes verticalDirection(VerticalDirection verticalDirection) {
    return StyledFlexAttributes(
      verticalDirection: verticalDirection,
    );
  }

  // Create a FlexAttribues for the main axis
  StyledFlexAttributes mainAxisAlignment(MainAxisAlignment mainAxisAlignment) {
    return StyledFlexAttributes(
      mainAxisAlignment: mainAxisAlignment,
    );
  }

  // Create a FlexAttribues for the main axis size
  StyledFlexAttributes mainAxisSize(MainAxisSize mainAxisSize) {
    return StyledFlexAttributes(
      mainAxisSize: mainAxisSize,
    );
  }

  // Create a FlexAttribues for the cross axis
  StyledFlexAttributes crossAxis(CrossAxisAlignment crossAxisAlignment) {
    return StyledFlexAttributes(
      crossAxisAlignment: crossAxisAlignment,
    );
  }

  // Create a FlexAttribues for gap size
  StyledFlexAttributes gap(double gapSize) {
    return StyledFlexAttributes(
      gapSize: gapSize,
    );
  }

  @Deprecated('Use mainAxisAlignment instead')
  StyledFlexAttributes mainAxis(MainAxisAlignment mainAxis) {
    return mainAxisAlignment(mainAxis);
  }
}
