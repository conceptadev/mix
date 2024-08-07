import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/components/accordion/header/accordion_header.dart';

import '../../helpers/variant.dart';

part 'accordion.g.dart';
part 'accordion_style.dart';
part 'accordion_variants.dart';
part 'accordion_widget.dart';
part 'accordion_blank.dart';

@MixableSpec()
base class AccordionSpec extends Spec<AccordionSpec> with _$AccordionSpec {
  final BoxSpec container;
  @MixableProperty(dto: MixableFieldDto(type: 'AccordionHeaderSpecAttribute'))
  final AccordionHeaderSpec headerContainer;
  final BoxSpec contentContainer;
  final FlexSpec flex;
  final IconSpec icon;

  /// {@macro avatar_spec_of}
  static const of = _$AccordionSpec.of;

  static const from = _$AccordionSpec.from;

  const AccordionSpec({
    BoxSpec? container,
    AccordionHeaderSpec? headerContainer,
    BoxSpec? contentContainer,
    FlexSpec? flex,
    IconSpec? icon,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        headerContainer = headerContainer ?? const AccordionHeaderSpec(),
        contentContainer = contentContainer ?? const BoxSpec(),
        flex = flex ?? const FlexSpec(),
        icon = icon ?? const IconSpec();
}
