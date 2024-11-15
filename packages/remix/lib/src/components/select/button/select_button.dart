part of '../select.dart';

@MixableSpec()
class SelectButtonSpec extends Spec<SelectButtonSpec>
    with _$SelectButtonSpec, Diagnosticable {
  final FlexBoxSpec container;
  final TextSpec label;
  final IconSpec icon;

  /// {@macro select_button_spec_of}
  static const of = _$SelectButtonSpec.of;

  static const from = _$SelectButtonSpec.from;

  const SelectButtonSpec({
    FlexBoxSpec? container,
    IconSpec? icon,
    TextSpec? label,
    super.modifiers,
    super.animated,
  })  : container = container ?? const FlexBoxSpec(),
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
