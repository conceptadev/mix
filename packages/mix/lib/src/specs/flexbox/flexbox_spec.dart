import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../attributes/animated/animated_data.dart';
import '../../attributes/animated/animated_data_dto.dart';
import '../../attributes/animated/animated_util.dart';
import '../../attributes/modifiers/widget_modifiers_data.dart';
import '../../attributes/modifiers/widget_modifiers_data_dto.dart';
import '../../attributes/modifiers/widget_modifiers_util.dart';
import '../../core/attribute.dart';
import '../../core/factory/mix_data.dart';
import '../../core/factory/mix_provider.dart';
import '../../core/spec.dart';
import '../box/box_spec.dart';
import '../flex/flex_spec.dart';
import 'flexbox_widget.dart';

part 'flexbox_spec.g.dart';

const _boxUtility = MixableUtility(
  properties: [
    (path: 'alignment', alias: 'alignment'),
    (path: 'padding', alias: 'padding'),
    (path: 'margin', alias: 'margin'),
    (path: 'constraints', alias: 'constraints'),
    (path: 'constraints.minWidth', alias: 'minWidth'),
    (path: 'constraints.maxWidth', alias: 'maxWidth'),
    (path: 'constraints.minHeight', alias: 'minHeight'),
    (path: 'constraints.maxHeight', alias: 'maxHeight'),
    (path: 'decoration.color', alias: 'color'),
    (path: 'decoration.border', alias: 'border'),
    (path: 'decoration.border.directional', alias: 'borderDirectional'),
    (path: 'decoration.borderRadius', alias: 'borderRadius'),
    (
      path: 'decoration.borderRadius.directional',
      alias: 'borderRadiusDirectional',
    ),
    (path: 'decoration.gradient', alias: 'gradient'),
    (path: 'decoration.gradient.sweep', alias: 'sweepGradient'),
    (path: 'decoration.gradient.radial', alias: 'radialGradient'),
    (path: 'decoration.gradient.linear', alias: 'linearGradient'),
    (path: 'decoration.boxShadows', alias: 'shadows'),
    (path: 'decoration.boxShadow', alias: 'shadow'),
    (path: 'decoration.elevation', alias: 'elevation'),
    (path: 'shape', alias: 'shape'),
    (path: 'foregroundDecoration', alias: 'foregroundDecoration'),
    (path: 'transform', alias: 'transform'),
    (path: 'transformAlignment', alias: 'transformAlignment'),
    (path: 'clipBehavior', alias: 'clipBehavior'),
    (path: 'width', alias: 'width'),
    (path: 'height', alias: 'height'),
  ],
);

const _flexUtility = MixableUtility(
  properties: [
    (path: 'direction', alias: 'direction'),
    (path: 'mainAxisAlignment', alias: 'mainAxisAlignment'),
    (path: 'crossAxisAlignment', alias: 'crossAxisAlignment'),
    (path: 'mainAxisSize', alias: 'mainAxisSize'),
    (path: 'verticalDirection', alias: 'verticalDirection'),
    (path: 'textDirection', alias: 'textDirection'),
    (path: 'textBaseline', alias: 'textBaseline'),
    (path: 'gap', alias: 'gap'),
  ],
);

@MixableSpec()
final class FlexBoxSpec extends Spec<FlexBoxSpec>
    with _$FlexBoxSpec, Diagnosticable {
  @MixableProperty(utilities: [_boxUtility])
  final BoxSpec box;

  @MixableProperty(utilities: [_flexUtility])
  final FlexSpec flex;

  static const of = _$FlexBoxSpec.of;
  static const from = _$FlexBoxSpec.from;

  const FlexBoxSpec({
    super.animated,
    super.modifiers,
    BoxSpec? box,
    FlexSpec? flex,
  })  : box = box ?? const BoxSpec(),
        flex = flex ?? const FlexSpec();

  Widget call({List<Widget> children = const [], required Axis direction}) {
    return (isAnimated)
        ? AnimatedFlexBoxSpecWidget(
            spec: this,
            children: children,
            direction: direction,
            curve: animated!.curve,
            duration: animated!.duration,
            onEnd: animated!.onEnd,
          )
        : FlexBoxSpecWidget(
            spec: this,
            children: children,
            direction: direction,
          );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
