import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/mix_provider_data.dart';

abstract class Decorator<T> extends StyleAttribute with Mergeable<T> {
  final Key? key;
  const Decorator({required this.key});
}

abstract class WrapDecorator<T> extends Decorator<T> {
  const WrapDecorator({super.key});

  Widget build(Widget child, MixData mix);
}
