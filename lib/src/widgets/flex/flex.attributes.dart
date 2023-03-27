import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';

///
/// ## Widget
/// - [FlexBox](FlexBox-class.html)
///
/// {@category Attributes}
class FlexAttributes extends WidgetAttributes {
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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FlexAttributes &&
        other.direction == direction &&
        other.mainAxisAlignment == mainAxisAlignment &&
        other.crossAxisAlignment == crossAxisAlignment &&
        other.mainAxisSize == mainAxisSize &&
        other.verticalDirection == verticalDirection &&
        other.gapSize == gapSize;
  }

  @override
  int get hashCode {
    return direction.hashCode ^
        mainAxisAlignment.hashCode ^
        crossAxisAlignment.hashCode ^
        mainAxisSize.hashCode ^
        verticalDirection.hashCode ^
        gapSize.hashCode;
  }
}
