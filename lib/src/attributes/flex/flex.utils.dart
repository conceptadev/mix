import 'package:flutter/material.dart';
import 'package:mix/src/attributes/flex/flex.attributes.dart';

class FlexUtils {
  const FlexUtils._();

  static FlexAttributes direction(Axis direction) {
    return FlexAttributes(
      direction: direction,
    );
  }

  static FlexAttributes verticalDirection(VerticalDirection verticalDirection) {
    return FlexAttributes(
      verticalDirection: verticalDirection,
    );
  }

  static FlexAttributes mainAxis(MainAxisAlignment mainAxisAlignment) {
    return FlexAttributes(
      mainAxisAlignment: mainAxisAlignment,
    );
  }

  static FlexAttributes mainAxisSize(MainAxisSize mainAxisSize) {
    return FlexAttributes(
      mainAxisSize: mainAxisSize,
    );
  }

  static FlexAttributes crossAxis(CrossAxisAlignment crossAxisAlignment) {
    return FlexAttributes(
      crossAxisAlignment: crossAxisAlignment,
    );
  }

  static FlexAttributes gap(double gapSize) {
    return FlexAttributes(
      gapSize: gapSize,
    );
  }
}
