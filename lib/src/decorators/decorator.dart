import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/mix_provider_data.dart';

abstract class Decorator extends StyleAttribute {
  final Key? key;
  const Decorator({required this.key});
}

abstract class WrapDecorator extends Decorator {
  const WrapDecorator({super.key});

  Widget build(Widget child, MixData mix);
}
