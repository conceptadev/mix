import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../core/attribute.dart';
import '../../core/models/animated_data.dart';
import '../../core/models/mix_data.dart';
import '../../core/spec.dart';
import '../../exports/dtos.dart';
import '../../exports/utilities.dart';
import '../../factory/mix_provider.dart';

part 'flex_spec.g.dart';

@MixableSpec()
class FlexSpec extends Spec<FlexSpec> with FlexSpecMixable {
  @MixableField(
    utility: MixableFieldUtility(
      properties: [
        MixableFieldProperty('horizontal', alias: 'row'),
        MixableFieldProperty('vertical', alias: 'column'),
      ],
    ),
  )
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final Clip? clipBehavior;
  @MixableField(utility: MixableFieldUtility(type: SpacingSideUtility))
  final double? gap;

  static const of = FlexSpecMixable.of;

  static const from = FlexSpecMixable.from;

  const FlexSpec({
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.verticalDirection,
    this.direction,
    this.textDirection,
    this.textBaseline,
    this.clipBehavior,
    this.gap,
    super.animated,
  });
}
