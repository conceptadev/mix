part of '../select.dart';

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

  Widget call(XSelectMenuItemBuilder children) => XSelectMenuSpecWidget(
        spec: this,
        children: children,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}

@MixableSpec()
base class SelectMenuItemSpec extends Spec<SelectMenuItemSpec>
    with _$SelectMenuItemSpec, Diagnosticable {
  final IconSpec icon;
  final TextSpec text;
  final BoxSpec container;
  final FlexSpec flex;

  static const of = _$SelectMenuItemSpec.of;

  static const from = _$SelectMenuItemSpec.from;

  const SelectMenuItemSpec({
    IconSpec? icon,
    TextSpec? text,
    BoxSpec? container,
    FlexSpec? flex,
    super.modifiers,
    super.animated,
  })  : icon = icon ?? const IconSpec(),
        text = text ?? const TextSpec(),
        container = container ?? const BoxSpec(),
        flex = flex ?? const FlexSpec();

  Widget call(IconData icon, String text) => XSelectMenuItemSpecWidget(
        spec: this,
        icon: icon,
        text: text,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
