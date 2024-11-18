import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../core/theme/remix_theme.dart';
import '../../helpers/component_builder.dart';
import '../../helpers/spec/composited_transform_follower_spec.dart';

part 'button/select_button.dart';
part 'button/select_button_widget.dart';
part 'item/select_menu.dart';
part 'item/select_menu_widget.dart';
part 'select.g.dart';
part 'select_style.dart';
part 'select_widget.dart';

final $select = SelectSpecUtility.self;

@MixableSpec()
class SelectSpec extends Spec<SelectSpec> with _$SelectSpec, Diagnosticable {
  @MixableProperty(dto: MixableFieldDto(type: 'SelectButtonSpecAttribute'))
  final SelectButtonSpec button;

  @MixableProperty(dto: MixableFieldDto(type: 'SelectMenuSpecAttribute'))
  final SelectMenuSpec menu;

  @MixableProperty(dto: MixableFieldDto(type: 'SelectMenuItemSpecAttribute'))
  final SelectMenuItemSpec item;

  @MixableProperty(
    dto: MixableFieldDto(type: 'CompositedTransformFollowerSpecAttribute'),
  )
  final CompositedTransformFollowerSpec position;

  /// {@macro select_spec_of}
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
  final FlexBoxSpec container;
  final bool autoWidth;

  /// {@macro select_menu_spec_of}
  static const of = _$SelectMenuSpec.of;

  static const from = _$SelectMenuSpec.from;

  const SelectMenuSpec({
    FlexBoxSpec? container,
    bool? autoWidth,
    super.modifiers,
    super.animated,
  })  : container = container ?? const FlexBoxSpec(),
        autoWidth = autoWidth ?? true;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
