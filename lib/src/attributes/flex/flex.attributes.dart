import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../resolvable_attribute.dart';

class FlexAttributes extends ResolvableAttribute<FlexAttributesResolved> {
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final double? gapSize;

  const FlexAttributes({
    this.crossAxisAlignment,
    this.direction,
    this.gapSize,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.verticalDirection,
  });

  @override
  FlexAttributes merge(FlexAttributes? other) {
    if (other == null) return this;

    return FlexAttributes(
      crossAxisAlignment: other.crossAxisAlignment ?? crossAxisAlignment,
      direction: other.direction ?? direction,
      gapSize: other.gapSize ?? gapSize,
      mainAxisAlignment: other.mainAxisAlignment ?? mainAxisAlignment,
      mainAxisSize: other.mainAxisSize ?? mainAxisSize,
      verticalDirection: other.verticalDirection ?? verticalDirection,
    );
  }

  @override
  FlexAttributesResolved resolve(MixData mix) {
    return FlexAttributesResolved(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      direction: direction,
      gapSize: gapSize,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      verticalDirection: verticalDirection ?? VerticalDirection.down,
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

class FlexAttributesResolved {
  final Axis? direction;
  final MainAxisAlignment mainAxisAlignment;

  final CrossAxisAlignment crossAxisAlignment;

  final MainAxisSize mainAxisSize;

  final VerticalDirection verticalDirection;

  final double? gapSize;

  const FlexAttributesResolved({
    required this.crossAxisAlignment,
    this.direction,
    this.gapSize,
    required this.mainAxisAlignment,
    required this.mainAxisSize,
    required this.verticalDirection,
  });
}
