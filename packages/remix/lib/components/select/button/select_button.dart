part of '../select.dart';

@MixableSpec()
class SelectButtonSpec extends Spec<SelectButtonSpec>
    with _$SelectButtonSpec, Diagnosticable {
  final BoxSpec container;
  final FlexSpec flex;
  final TextSpec label;
  final IconSpec icon;

  static const of = _$SelectButtonSpec.of;

  static const from = _$SelectButtonSpec.from;

  const SelectButtonSpec({
    BoxSpec? container,
    FlexSpec? flex,
    IconSpec? icon,
    TextSpec? label,
    super.modifiers,
    super.animated,
  })  : flex = flex ?? const FlexSpec(),
        container = container ?? const BoxSpec(),
        icon = icon ?? const IconSpec(),
        label = label ?? const TextSpec();

  Widget call({
    required String text,
    required IconData trailingIcon,
  }) =>
      XSelectButtonSpecWidget(
        spec: this,
        text: text,
        trailingIcon: trailingIcon,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
