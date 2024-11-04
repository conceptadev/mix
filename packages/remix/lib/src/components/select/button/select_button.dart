part of '../select.dart';

@MixableSpec()
class SelectButtonSpec extends Spec<SelectButtonSpec>
    with _$SelectButtonSpec, Diagnosticable {
  final BoxSpec container;
  final FlexSpec layout;
  final TextSpec label;
  final IconSpec icon;

  /// {@macro select_button_spec_of}
  static const of = _$SelectButtonSpec.of;

  static const from = _$SelectButtonSpec.from;

  const SelectButtonSpec({
    BoxSpec? container,
    FlexSpec? layout,
    IconSpec? icon,
    TextSpec? label,
    super.modifiers,
    super.animated,
  })  : layout = layout ?? const FlexSpec(),
        container = container ?? const BoxSpec(),
        icon = icon ?? const IconSpec(),
        label = label ?? const TextSpec();

  Widget call({required String text, required IconData trailingIcon}) =>
      SelectButtonSpecWidget(
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
