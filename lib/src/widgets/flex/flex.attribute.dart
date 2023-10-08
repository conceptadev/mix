import 'package:flutter/material.dart';

import '../../attributes/enum/axis.attribute.dart';
import '../../attributes/enum/clip.attribute.dart';
import '../../attributes/enum/vertical_direction/vertical_direction.attribute.dart';
import '../../attributes/flex/cross_axis_alignment.attribute.dart';
import '../../attributes/flex/gap_size.attribute.dart';
import '../../attributes/flex/main_axis_alignment.attribute.dart';
import '../../attributes/flex/main_axis_size.attribute.dart';
import '../../attributes/resolvable_attribute.dart';
import '../../attributes/text/text_baseline.attribute.dart';
import '../../attributes/text/text_direction/text_direction.attribute.dart';
import '../../factory/mix_provider_data.dart';

class FlexAttributes extends WidgetAttributes<FlexAttributesResolved> {
  final AxisAttribute? direction;
  final MainAxisAlignmentAttribute? mainAxisAlignment;
  final CrossAxisAlignmentAttribute? crossAxisAlignment;
  final MainAxisSizeAttribute? mainAxisSize;
  final VerticalDirectionAttribute? verticalDirection;
  final TextDirectionAttribute? textDirection;
  final TextBaselineAttribute? textBaseline;
  final ClipAttribute? clipBehavior;
  final GapSizeAttribute? gapSize;

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
      crossAxisAlignment: resolveAttribute(crossAxisAlignment, mix),
      mainAxisAlignment: resolveAttribute(mainAxisAlignment, mix),
      mainAxisSize: resolveAttribute(mainAxisSize, mix),
      verticalDirection: resolveAttribute(verticalDirection, mix),
      direction: resolveAttribute(direction, mix),
      gapSize: resolveAttribute(gapSize, mix),
      textDirection: resolveAttribute(textDirection, mix),
      textBaseline: resolveAttribute(textBaseline, mix),
      clipBehavior: resolveAttribute(clipBehavior, mix),
      animation: resolveAttribute(animation, mix),
      visible: resolveAttribute(visible, mix),
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

class FlexAttributesResolved extends WidgetAttributesResolved {
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final Clip? clipBehavior;
  final double? gapSize;

  const FlexAttributesResolved({
    required this.crossAxisAlignment,
    required this.mainAxisAlignment,
    required this.mainAxisSize,
    required this.verticalDirection,
    required this.direction,
    required this.gapSize,
    required this.textDirection,
    required this.textBaseline,
    required this.clipBehavior,
    required super.animation,
    required super.visible,
  });

  @override
  get props => [
        crossAxisAlignment,
        mainAxisAlignment,
        mainAxisSize,
        verticalDirection,
        direction,
        gapSize,
        textDirection,
        textBaseline,
        clipBehavior,
        super.animation,
        super.visible,
      ];
}
