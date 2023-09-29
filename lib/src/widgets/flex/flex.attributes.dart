import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';

@Deprecated('Use FlexStyleAttributes instead')
typedef FlexAttributes = StyledFlexAttributes;

class StyledFlexAttributes extends StyledWidgetAttributes {
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final double? gapSize;

  const StyledFlexAttributes({
    this.crossAxisAlignment,
    this.direction,
    this.gapSize,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.verticalDirection,
  });

  @override
  get props => [
        direction,
        mainAxisAlignment,
        crossAxisAlignment,
        mainAxisSize,
        verticalDirection,
        gapSize,
      ];
  @override
  StyledFlexAttributes merge(StyledFlexAttributes? other) {
    if (other == null) return this;

    return StyledFlexAttributes(
      crossAxisAlignment: other.crossAxisAlignment ?? crossAxisAlignment,
      direction: other.direction ?? direction,
      gapSize: other.gapSize ?? gapSize,
      mainAxisAlignment: other.mainAxisAlignment ?? mainAxisAlignment,
      mainAxisSize: other.mainAxisSize ?? mainAxisSize,
      verticalDirection: other.verticalDirection ?? verticalDirection,
    );
  }

  @override
  StyledFlexAttributes copyWith({
    CrossAxisAlignment? crossAxisAlignment,
    Axis? direction,
    double? gapSize,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    VerticalDirection? verticalDirection,
  }) {
    return StyledFlexAttributes(
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      direction: direction ?? this.direction,
      gapSize: gapSize ?? this.gapSize,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      mainAxisSize: mainAxisSize ?? this.mainAxisSize,
      verticalDirection: verticalDirection ?? this.verticalDirection,
    );
  }
}
