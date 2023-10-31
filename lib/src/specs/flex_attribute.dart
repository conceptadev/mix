import 'package:flutter/material.dart';

import '../attributes/visual_attributes.dart';
import '../core/attribute.dart';
import '../factory/mix_provider_data.dart';

class FlexSpec extends MixExtension<FlexSpec> {
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

  static FlexSpec resolve(MixData mix) {
    return FlexSpec(
      crossAxisAlignment:
          mix.get<CrossAxisAlignmentAttribute, CrossAxisAlignment>(),
      mainAxisAlignment:
          mix.get<MainAxisAlignmentAttribute, MainAxisAlignment>(),
      mainAxisSize: mix.get<MainAxisSizeAttribute, MainAxisSize>(),
      verticalDirection:
          mix.get<VerticalDirectionAttribute, VerticalDirection>(),
      direction: mix.get<AxisAttribute, Axis>(),
      textDirection: mix.get<TextDirectionAttribute, TextDirection>(),
      textBaseline: mix.get<TextBaselineAttribute, TextBaseline>(),
      clipBehavior: mix.get<ClipAttribute, Clip>(),
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
