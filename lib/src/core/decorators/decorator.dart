import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../attribute.dart';

abstract class Decorator<T> extends VisualAttribute<T> {
  const Decorator();

  @override
  Decorator merge(covariant Decorator? other);

  Widget build(Widget child, MixData mix);
}
