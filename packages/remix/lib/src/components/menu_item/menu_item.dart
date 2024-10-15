import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../helpers/component_builder.dart';
import '../../theme/remix_theme.dart';
import '../../theme/remix_tokens.dart';

part 'menu_item.g.dart';
part 'menu_item_style.dart';
part 'menu_item_theme.dart';
part 'menu_item_widget.dart';

@MixableSpec()
class MenuItemSpec extends Spec<MenuItemSpec>
    with _$MenuItemSpec, Diagnosticable {
  final BoxSpec container;
  final FlexSpec mainFlex;
  final FlexSpec textFlex;
  final IconSpec icon;
  final TextSpec title;
  final TextSpec subtitle;

  /// {@macro button_spec_of}
  static const of = _$MenuItemSpec.of;

  static const from = _$MenuItemSpec.from;

  const MenuItemSpec({
    FlexSpec? mainFlex,
    FlexSpec? textFlex,
    IconSpec? icon,
    TextSpec? title,
    TextSpec? subtitle,
    BoxSpec? container,
    super.modifiers,
    super.animated,
  })  : mainFlex = mainFlex ?? const FlexSpec(),
        textFlex = textFlex ?? const FlexSpec(),
        icon = icon ?? const IconSpec(),
        title = title ?? const TextSpec(),
        subtitle = subtitle ?? const TextSpec(),
        container = container ?? const BoxSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
