import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/mix_provider_data.dart';

abstract class Decorator<T extends Decorator<T>> extends StyleAttribute {
  final Key? key;
  const Decorator({required this.key});

  /// Linearly interpolate with another [Decorator] object.

  Decorator<T> lerp(covariant Decorator<T>? other, double t);

  /// The extension's type.
  @override
  Object get type => T;
}

abstract class BoxDecorator<Self extends BoxDecorator<Self>>
    extends Decorator<Self> with Mergeable<Self> {
  const BoxDecorator({super.key});

  @override
  Type get type => Self;

  Widget build(Widget child, MixData mix);
}
