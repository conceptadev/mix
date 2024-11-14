part of '../accordion.dart';

@MixableSpec()
base class AccordionHeaderSpec extends Spec<AccordionHeaderSpec>
    with _$AccordionHeaderSpec {
  final FlexBoxSpec flexContainer;
  final IconSpec leadingIcon;
  final TextSpec text;
  final IconSpec trailingIcon;

  /// {@macro avatar_spec_of}
  static const of = _$AccordionHeaderSpec.of;

  static const from = _$AccordionHeaderSpec.from;

  const AccordionHeaderSpec({
    FlexBoxSpec? flexContainer,
    IconSpec? leadingIcon,
    TextSpec? text,
    IconSpec? trailingIcon,
    super.animated,
  })  : flexContainer = flexContainer ?? const FlexBoxSpec(),
        leadingIcon = leadingIcon ?? const IconSpec(),
        text = text ?? const TextSpec(),
        trailingIcon = trailingIcon ?? const IconSpec();
}
