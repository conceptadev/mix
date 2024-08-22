part of '../select.dart';

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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
