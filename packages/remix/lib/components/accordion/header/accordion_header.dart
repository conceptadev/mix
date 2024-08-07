import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'accordion_header.g.dart';
part 'accordion_header_spec_widget.dart';

@MixableSpec()
base class AccordionHeaderSpec extends Spec<AccordionHeaderSpec>
    with _$AccordionHeaderSpec {
  final BoxSpec container;
  final FlexSpec flex;
  final IconSpec leadingIcon;
  final TextSpec text;
  final IconSpec trailingIcon;

  /// {@macro avatar_spec_of}
  static const of = _$AccordionHeaderSpec.of;

  static const from = _$AccordionHeaderSpec.from;

  const AccordionHeaderSpec({
    BoxSpec? container,
    FlexSpec? flex,
    IconSpec? leadingIcon,
    TextSpec? text,
    IconSpec? trailingIcon,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        flex = flex ?? const FlexSpec(),
        leadingIcon = leadingIcon ?? const IconSpec(),
        text = text ?? const TextSpec(),
        trailingIcon = trailingIcon ?? const IconSpec();
}
