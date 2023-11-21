import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../attributes/scalar_attribute.dart';
import '../factory/mix_provider_data.dart';

class FlexSpec extends StyleRecipe<FlexSpec> {
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final Clip? clipBehavior;
  final double? gap;

  const FlexSpec({
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

  static FlexSpec resolve(MixData mix) {
    return FlexSpec(
      crossAxisAlignment:
          mix.attributeOfType<CrossAxisAlignmentAttribute>()?.resolve(mix),
      mainAxisAlignment:
          mix.attributeOfType<MainAxisAlignmentAttribute>()?.resolve(mix),
      mainAxisSize: mix.attributeOfType<MainAxisSizeAttribute>()?.resolve(mix),
      verticalDirection:
          mix.attributeOfType<VerticalDirectionAttribute>()?.resolve(mix),
      direction: mix.attributeOfType<AxisAttribute>()?.resolve(mix),
      textDirection:
          mix.attributeOfType<TextDirectionAttribute>()?.resolve(mix),
      textBaseline: mix.attributeOfType<TextBaselineAttribute>()?.resolve(mix),
      clipBehavior: mix.attributeOfType<ClipAttribute>()?.resolve(mix),
      gap: mix.attributeOfType<GapAttribute>()?.resolve(mix),
    );
  }

  @override
  FlexSpec lerp(FlexSpec other, double t) {
    return FlexSpec(
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
  FlexSpec copyWith({
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
    return FlexSpec(
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
