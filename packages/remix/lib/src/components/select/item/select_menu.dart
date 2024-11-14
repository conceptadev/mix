part of '../select.dart';

@MixableSpec()
base class SelectMenuItemSpec extends Spec<SelectMenuItemSpec>
    with _$SelectMenuItemSpec, Diagnosticable {
  final IconSpec icon;
  final TextSpec text;
  final FlexBoxSpec flexContainer;

  static const of = _$SelectMenuItemSpec.of;

  static const from = _$SelectMenuItemSpec.from;

  const SelectMenuItemSpec({
    IconSpec? icon,
    TextSpec? text,
    FlexBoxSpec? flexContainer,
    super.modifiers,
    super.animated,
  })  : icon = icon ?? const IconSpec(),
        text = text ?? const TextSpec(),
        flexContainer = flexContainer ?? const FlexBoxSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
