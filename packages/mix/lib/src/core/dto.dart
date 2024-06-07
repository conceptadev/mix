import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../internal/compare_mixin.dart';
import 'attribute.dart';

@immutable
abstract class Dto<Value> with EqualityMixin, MergeableMixin {
  const Dto();

  Value resolve(MixData mix);
}
