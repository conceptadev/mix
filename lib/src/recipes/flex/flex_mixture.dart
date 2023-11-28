import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'flex_attribute.dart';

class FlexMixture extends Mixture<FlexMixture> {
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final Clip? clipBehavior;
  final double? gap;

  const FlexMixture({
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

  const FlexMixture.empty()
      : crossAxisAlignment = null,
        mainAxisAlignment = null,
        mainAxisSize = null,
        verticalDirection = null,
        direction = null,
        textDirection = null,
        textBaseline = null,
        clipBehavior = null,
        gap = null;

  static FlexMixture resolve(MixData mix) {
    final recipe = mix.attributeOf<FlexMixAttribute>()?.resolve(mix);

    return recipe ?? const FlexMixAttribute().resolve(mix);
  }

  @override
  FlexMixture lerp(FlexMixture other, double t) {
    return FlexMixture(
      crossAxisAlignment:
          lerpSnap(crossAxisAlignment, other.crossAxisAlignment, t),
      mainAxisAlignment:
          lerpSnap(mainAxisAlignment, other.mainAxisAlignment, t),
      mainAxisSize: lerpSnap(mainAxisSize, other.mainAxisSize, t),
      verticalDirection:
          lerpSnap(verticalDirection, other.verticalDirection, t),
      direction: lerpSnap(direction, other.direction, t),
      textDirection: lerpSnap(textDirection, other.textDirection, t),
      textBaseline: lerpSnap(textBaseline, other.textBaseline, t),
      clipBehavior: lerpSnap(clipBehavior, other.clipBehavior, t),
      gap: lerpDouble(gap, other.gap, t),
    );
  }

  @override
  FlexMixture merge(FlexMixture? other) {
    return copyWith(
      direction: other?.direction,
      mainAxisAlignment: other?.mainAxisAlignment,
      crossAxisAlignment: other?.crossAxisAlignment,
      mainAxisSize: other?.mainAxisSize,
      verticalDirection: other?.verticalDirection,
      textDirection: other?.textDirection,
      textBaseline: other?.textBaseline,
      clipBehavior: other?.clipBehavior,
      gap: other?.gap,
    );
  }

  @override
  FlexMixture copyWith({
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
    return FlexMixture(
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
