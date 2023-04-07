import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';

class FlexAttributes extends WidgetStyleAttributes {
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final double? gapSize;

  const FlexAttributes({
    this.direction,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
    this.verticalDirection,
    this.gapSize,
  });

  @override
  FlexAttributes merge(FlexAttributes? other) {
    if (other == null) return this;

    return FlexAttributes(
      direction: other.direction ?? direction,
      mainAxisAlignment: other.mainAxisAlignment ?? mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment ?? crossAxisAlignment,
      mainAxisSize: other.mainAxisSize ?? mainAxisSize,
      verticalDirection: other.verticalDirection ?? verticalDirection,
      gapSize: other.gapSize ?? gapSize,
    );
  }

  @override
  FlexAttributes copyWith({
    Axis? direction,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
    VerticalDirection? verticalDirection,
    double? gapSize,
  }) {
    return FlexAttributes(
      direction: direction ?? this.direction,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      mainAxisSize: mainAxisSize ?? this.mainAxisSize,
      verticalDirection: verticalDirection ?? this.verticalDirection,
      gapSize: gapSize ?? this.gapSize,
    );
  }

  @override
  get props => [
        direction,
        mainAxisAlignment,
        crossAxisAlignment,
        mainAxisSize,
        verticalDirection,
        gapSize,
      ];
}
