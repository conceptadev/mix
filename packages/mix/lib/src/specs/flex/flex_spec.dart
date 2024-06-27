// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports,
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'flex_spec.g.dart';

@MixableSpec()
final class FlexSpec extends Spec<FlexSpec> with _$FlexSpec {
  @MixableProperty(
    utilities: [
      MixableUtility(
        properties: [
          (path: 'horizontal', alias: 'row'),
          (path: 'vertical', alias: 'column'),
        ],
      ),
    ],
  )
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final Clip? clipBehavior;
  @MixableProperty(
    dto: MixableFieldDto(type: SpacingSideDto),
    utilities: [MixableUtility(type: GapUtility)],
  )
  final double? gap;

  static const of = _$FlexSpec.of;

  static const from = _$FlexSpec.from;

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

  Widget call({List<Widget> children = const [], required Axis direction}) {
    return FlexSpecWidget(
      spec: this,
      direction: direction,
      children: children,
    );
  }
}
