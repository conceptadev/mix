import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/helpers/component_builder.dart';
import 'package:remix/helpers/spec/composited_transform_follower_spec.dart';

part 'select.g.dart';
part 'select_widget.dart';
part 'select_style.dart';
part 'button/select_button.dart';
part 'button/select_button_widget.dart';
part 'item/select_menu.dart';
part 'item/select_menu_widget.dart';

@MixableSpec()
class SelectSpec extends Spec<SelectSpec> with _$SelectSpec, Diagnosticable {
  @MixableProperty(dto: MixableFieldDto(type: 'SelectButtonSpecAttribute'))
  final SelectButtonSpec button;

  @MixableProperty(dto: MixableFieldDto(type: 'SelectMenuSpecAttribute'))
  final SelectMenuSpec menu;

  @MixableProperty(dto: MixableFieldDto(type: 'SelectMenuItemSpecAttribute'))
  final SelectMenuItemSpec item;

  @MixableProperty(
    dto: MixableFieldDto(
      type: 'CompositedTransformFollowerSpecAttribute',
    ),
  )
  final CompositedTransformFollowerSpec position;

  static const of = _$SelectSpec.of;

  static const from = _$SelectSpec.from;

  const SelectSpec({
    SelectButtonSpec? button,
    SelectMenuSpec? menu,
    SelectMenuItemSpec? item,
    CompositedTransformFollowerSpec? position,
    super.modifiers,
    super.animated,
  })  : button = button ?? const SelectButtonSpec(),
        item = item ?? const SelectMenuItemSpec(),
        menu = menu ?? const SelectMenuSpec(),
        position = position ?? const CompositedTransformFollowerSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}

@MixableSpec()
base class SelectMenuSpec extends Spec<SelectMenuSpec>
    with _$SelectMenuSpec, Diagnosticable {
  final BoxSpec container;
  final FlexSpec flex;

  static const of = _$SelectMenuSpec.of;

  static const from = _$SelectMenuSpec.from;

  const SelectMenuSpec({
    BoxSpec? container,
    FlexSpec? flex,
    super.modifiers,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        flex = flex ?? const FlexSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
