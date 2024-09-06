import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../helpers/component_builder.dart';

part 'segmented_control.g.dart';
part 'segmented_control_widget.dart';
part 'item/segmented_control_button.dart';
part 'item/segmented_control_button_widget.dart';
// part 'segmented_control_style.dart';
// part 'segmented_control_theme.dart';

final $segmentedControl = SegmentedControlSpecUtility.self;

@MixableSpec()
class SegmentedControlSpec extends Spec<SegmentedControlSpec>
    with _$SegmentedControlSpec, Diagnosticable {
  final BoxSpec container;
  final FlexSpec flex;

  @MixableProperty(
    dto: MixableFieldDto(type: 'SegmentedControlButtonSpecAttribute'),
  )
  final SegmentedControlButtonSpec item;

  static const of = _$SegmentedControlSpec.of;

  static const from = _$SegmentedControlSpec.from;

  const SegmentedControlSpec({
    BoxSpec? container,
    FlexSpec? flex,
    SegmentedControlButtonSpec? item,
    super.modifiers,
    super.animated,
  })  : flex = flex ?? const FlexSpec(),
        container = container ?? const BoxSpec(),
        item = item ?? const SegmentedControlButtonSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
