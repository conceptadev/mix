import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'flex_attribute.dart';

class FlexRecipeMix extends RecipeMix<FlexRecipeMix> {
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final Clip? clipBehavior;
  final double? gap;

  const FlexRecipeMix({
    required this.crossAxisAlignment,
    required this.mainAxisAlignment,
    required this.mainAxisSize,
    required this.verticalDirection,
    required this.direction,
    required this.textDirection,
    required this.textBaseline,
    required this.clipBehavior,
    required this.gap,
  });

  const FlexRecipeMix.empty()
      : crossAxisAlignment = null,
        mainAxisAlignment = null,
        mainAxisSize = null,
        verticalDirection = null,
        direction = null,
        textDirection = null,
        textBaseline = null,
        clipBehavior = null,
        gap = null;

  static FlexRecipeMix resolve(MixData mix) {
    final recipe = mix.attributeOfType<FlexAttribute>()?.resolve(mix);

    return recipe ?? const FlexRecipeMix.empty();
  }

  @override
  FlexRecipeMix lerp(FlexRecipeMix other, double t) {
    return FlexRecipeMix(
      crossAxisAlignment: snap(crossAxisAlignment, other.crossAxisAlignment, t),
      mainAxisAlignment: snap(mainAxisAlignment, other.mainAxisAlignment, t),
      mainAxisSize: snap(mainAxisSize, other.mainAxisSize, t),
      verticalDirection: snap(verticalDirection, other.verticalDirection, t),
      direction: snap(direction, other.direction, t),
      textDirection: snap(textDirection, other.textDirection, t),
      textBaseline: snap(textBaseline, other.textBaseline, t),
      clipBehavior: snap(clipBehavior, other.clipBehavior, t),
      gap: lerpDouble(gap, other.gap, t),
    );
  }

  @override
  FlexRecipeMix copyWith({
    Axis? direction,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
    VerticalDirection? verticalDirection,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    Clip? clipBehavior,
    double? gap,
  }) {
    return FlexRecipeMix(
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      mainAxisSize: mainAxisSize ?? this.mainAxisSize,
      verticalDirection: verticalDirection ?? this.verticalDirection,
      direction: direction ?? this.direction,
      textDirection: textDirection ?? this.textDirection,
      textBaseline: textBaseline ?? this.textBaseline,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      gap: gap ?? this.gap,
    );
  }

  @override
  List<Object?> get props => [
        crossAxisAlignment,
        mainAxisAlignment,
        mainAxisSize,
        verticalDirection,
        direction,
        textDirection,
        textBaseline,
        clipBehavior,
        gap,
      ];
}
