import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/helpers/component_builder.dart';

part 'select.g.dart';
part 'select_widget.dart';
part 'select_style.dart';
part 'button/select_button.dart';
part 'button/select_button_widget.dart';
part 'menu/select_menu.dart';
part 'menu/select_menu_widget.dart';

@MixableSpec()
class SelectSpec extends Spec<SelectSpec> with _$SelectSpec, Diagnosticable {
  @MixableProperty(dto: MixableFieldDto(type: 'SelectButtonSpecAttribute'))
  final SelectButtonSpec button;

  @MixableProperty(dto: MixableFieldDto(type: 'SelectMenuSpecAttribute'))
  final SelectMenuSpec menu;

  @MixableProperty(dto: MixableFieldDto(type: 'SelectMenuItemSpecAttribute'))
  final SelectMenuItemSpec item;

  static const of = _$SelectSpec.of;

  static const from = _$SelectSpec.from;

  const SelectSpec({
    SelectButtonSpec? button,
    SelectMenuSpec? menu,
    SelectMenuItemSpec? item,
    super.modifiers,
    super.animated,
  })  : button = button ?? const SelectButtonSpec(),
        item = item ?? const SelectMenuItemSpec(),
        menu = menu ?? const SelectMenuSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
