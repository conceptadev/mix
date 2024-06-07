import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../helpers/compare_mixin.dart';
import 'attribute.dart';

@immutable
abstract class Dto<Value> with Comparable, Mergeable {
  const Dto();

  Value resolve(MixData mix);
}
