import 'package:flutter/material.dart';

import '../../attributes/clip_behavior_attribute.dart';
import '../../attributes/text_direction_attribute.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'flex_mixture.dart';

class FlexAttribute extends ResolvableAttribute<FlexMixture> {
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final TextDirectionAttribute? textDirection;
  final TextBaseline? textBaseline;
  final ClipBehaviorAttribute? clipBehavior;
  final double? gap;

  const FlexAttribute({
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

  @override
  FlexMixture resolve(MixData mix) {
    return FlexMixture(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      verticalDirection: verticalDirection,
      direction: direction,
      textDirection: textDirection?.value,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior?.value,
      gap: gap,
    );
  }

  @override
  FlexAttribute merge(covariant FlexAttribute? other) {
    if (other == null) return this;

    return FlexAttribute(
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
