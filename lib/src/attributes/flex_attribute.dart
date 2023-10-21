import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'axis_attribute.dart';
import 'clip_attribute.dart';
import 'cross_axis_alignment_attribute.dart';
import 'main_axis_alignment_attribute.dart';
import 'main_axis_size_attribute.dart';
import 'style_attribute.dart';
import 'text_baseline_attribute.dart';
import 'text_direction_attribute.dart';
import 'vertical_direction_attribute.dart';

class FlexAttributes extends SpecAttribute<FlexSpec> {
  final AxisAttribute? direction;
  final MainAxisAlignmentAttribute? mainAxisAlignment;
  final CrossAxisAlignmentAttribute? crossAxisAlignment;
  final MainAxisSizeAttribute? mainAxisSize;
  final VerticalDirectionAttribute? verticalDirection;
  final TextDirectionAttribute? textDirection;
  final TextBaselineAttribute? textBaseline;
  final ClipAttribute? clipBehavior;
  const FlexAttributes({
    this.crossAxisAlignment,
    this.direction,
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
      mainAxisAlignment: other.mainAxisAlignment ?? mainAxisAlignment,
      mainAxisSize: other.mainAxisSize ?? mainAxisSize,
      verticalDirection: other.verticalDirection ?? verticalDirection,
      textDirection: other.textDirection ?? textDirection,
      textBaseline: other.textBaseline ?? textBaseline,
      clipBehavior: other.clipBehavior ?? clipBehavior,
    );
  }

  @override
  FlexSpec resolve(MixData mix) {
    return FlexSpec(
      crossAxisAlignment: resolveAttr(crossAxisAlignment, mix),
      mainAxisAlignment: resolveAttr(mainAxisAlignment, mix),
      mainAxisSize: resolveAttr(mainAxisSize, mix),
      verticalDirection: resolveAttr(verticalDirection, mix),
      direction: resolveAttr(direction, mix),
      textDirection: resolveAttr(textDirection, mix),
      textBaseline: resolveAttr(textBaseline, mix),
      clipBehavior: resolveAttr(clipBehavior, mix),
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
      ];
}

class FlexSpec extends Spec<FlexSpec> {
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final Clip? clipBehavior;

  const FlexSpec({
    required this.crossAxisAlignment,
    required this.mainAxisAlignment,
    required this.mainAxisSize,
    required this.verticalDirection,
    required this.direction,
    required this.textDirection,
    required this.textBaseline,
    required this.clipBehavior,
  });

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
      ];
}
