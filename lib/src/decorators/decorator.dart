import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../factory/mix_provider_data.dart';

abstract class Decorator extends Attribute {
  const Decorator({super.key});

  Widget render(Widget child, MixData mix) {
    return build(child, mix);
  }

  @override
  Decorator merge(covariant Decorator other);

  Widget build(Widget child, MixData mix);
}
