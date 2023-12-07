import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'flex_spec.dart';

class FlexSpecAttribute
    extends ResolvableAttribute<FlexSpecAttribute, FlexSpec> {
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final Clip? clipBehavior;
  final double? gap;

  const FlexSpecAttribute({
    this.direction,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
    this.verticalDirection,
    this.textDirection,
    this.textBaseline,
    this.clipBehavior,
    this.gap,
  });

  static FlexSpecAttribute of(MixData mix) {
    return mix.attributeOf<FlexSpecAttribute>() ?? const FlexSpecAttribute();
  }

  @override
  FlexSpec resolve(MixData mix) {
    return FlexSpec(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      verticalDirection: verticalDirection,
      direction: direction,
      textDirection: textDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
      gap: gap,
    );
  }

  @override
  FlexSpecAttribute merge(covariant FlexSpecAttribute? other) {
    if (other == null) return this;

    return FlexSpecAttribute(
      direction: other.direction ?? direction,
      mainAxisAlignment: other.mainAxisAlignment ?? mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment ?? crossAxisAlignment,
      mainAxisSize: other.mainAxisSize ?? mainAxisSize,
      verticalDirection: other.verticalDirection ?? verticalDirection,
      textDirection: other.textDirection ?? textDirection,
      textBaseline: other.textBaseline ?? textBaseline,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      gap: other.gap ?? gap,
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
        gap,
      ];
}
