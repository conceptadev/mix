import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../resolvable_attribute.dart';

class FlexAttributes extends ResolvableAttribute<FlexAttributesResolved> {
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final Clip? clipBehavior;
  final double? gapSize;

  const FlexAttributes({
    this.crossAxisAlignment,
    this.direction,
    this.gapSize,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.verticalDirection,
    this.textDirection,
    this.textBaseline,
    this.clipBehavior,
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
      textDirection: other.textDirection ?? textDirection,
      textBaseline: other.textBaseline ?? textBaseline,
      clipBehavior: other.clipBehavior ?? clipBehavior,
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
      textDirection: textDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
    );
  }

  @override
  List<Object?> get props => [
        direction,
        mainAxisAlignment,
        crossAxisAlignment,
        mainAxisSize,
        verticalDirection,
        textDirection,
        textBaseline,
        clipBehavior,
        gapSize,
      ];
}

class FlexAttributesResolved {
  final Axis? direction;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final VerticalDirection verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final Clip? clipBehavior;
  final double? gapSize;

  const FlexAttributesResolved({
    required this.crossAxisAlignment,
    this.direction,
    this.gapSize,
    required this.mainAxisAlignment,
    required this.mainAxisSize,
    required this.verticalDirection,
    this.textDirection,
    this.textBaseline,
    this.clipBehavior,
  });
}
