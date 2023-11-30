import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/mix_provider_data.dart';

abstract class Decorator extends StyleAttribute {
  final Key? key;
  const Decorator({required this.key});
}

abstract class WrapDecorator<Self extends WrapDecorator<Self>> extends Decorator
    with Mergeable<Self> {
  const WrapDecorator({super.key});

  @override
  Type get type => Self;

  Widget build(Widget child, MixData mix);
}
