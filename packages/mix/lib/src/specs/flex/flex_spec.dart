import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

// ignore: avoid-importing-entrypoint-exports
import '../../../mix.dart';

part 'flex_spec.g.dart';

@MixableSpec()
final class FlexSpec extends Spec<FlexSpec> with FlexSpecMixable {
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
