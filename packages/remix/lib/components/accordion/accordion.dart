import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/components/accordion/header/accordion_header.dart';
import 'package:remix/tokens/remix_tokens.dart';
import 'dart:math' as math;

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
  final AccordionHeaderSpec header;
  final BoxSpec contentContainer;
  final FlexSpec flex;

  /// {@macro avatar_spec_of}
  static const of = _$AccordionSpec.of;

  static const from = _$AccordionSpec.from;

  const AccordionSpec({
    BoxSpec? container,
    AccordionHeaderSpec? header,
    BoxSpec? contentContainer,
    FlexSpec? flex,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        header = header ?? const AccordionHeaderSpec(),
        contentContainer = contentContainer ?? const BoxSpec(),
        flex = flex ?? const FlexSpec();
}
