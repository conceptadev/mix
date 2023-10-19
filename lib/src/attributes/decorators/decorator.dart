import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../style_attribute.dart';

abstract class Decorator<T> extends StyleAttribute<T> {
  const Decorator({super.key});

  @override
  Decorator merge(covariant Decorator? other);

  Widget build(Widget child, MixData mix);
}
