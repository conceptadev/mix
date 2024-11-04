import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../theme/remix_theme.dart';
import '../../theme/remix_tokens.dart';

part 'button/segmented_control_button.dart';
part 'button/segmented_control_button_widget.dart';
part 'segmented_control.g.dart';
part 'segmented_control_style.dart';
part 'segmented_control_theme.dart';
part 'segmented_control_widget.dart';

final $segmentedControl = SegmentedControlSpecUtility.self;

@MixableSpec()
class SegmentedControlSpec extends Spec<SegmentedControlSpec>
    with _$SegmentedControlSpec, Diagnosticable {
  final BoxSpec container;
  final FlexSpec layout;
  final BoxSpec divider;
  final bool showDivider;

  @MixableProperty(dto: MixableFieldDto(type: 'SegmentButtonSpecAttribute'))
  final SegmentButtonSpec item;

  /// {@macro segmented_control_spec_of}
  static const of = _$SegmentedControlSpec.of;

  static const from = _$SegmentedControlSpec.from;

  const SegmentedControlSpec({
    BoxSpec? container,
    FlexSpec? layout,
    bool? showDivider,
    BoxSpec? divider,
    SegmentButtonSpec? item,
    super.modifiers,
    super.animated,
  })  : layout = layout ?? const FlexSpec(),
        container = container ?? const BoxSpec(),
        showDivider = showDivider ?? false,
        item = item ?? const SegmentButtonSpec(),
        divider = divider ?? const BoxSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
