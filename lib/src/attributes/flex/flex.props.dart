import 'package:flutter/material.dart';

class FlexProps {
  final Axis? direction;
  final double? gapSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final VerticalDirection verticalDirection;

  const FlexProps({
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.mainAxisSize,
    required this.verticalDirection,
    this.direction,
    this.gapSize,
  });
}
