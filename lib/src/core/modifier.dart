import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

abstract class ModifierSpec<Self extends ModifierSpec<Self>>
    extends Spec<Self> {
  const ModifierSpec();

  static ModifierSpec? lerpValue(
    ModifierSpec? begin,
    ModifierSpec? end,
    double t,
  ) {
    if (begin != null && end != null) {
      assert(
        begin.runtimeType == end.runtimeType,
        'You can only lerp the same type of ModifierSpec',
      );

      return begin.lerp(end, t) as ModifierSpec?;
    }

    return begin ?? end;
  }

  Widget build(Widget child);
}

abstract class ModifierAttribute<Self extends ModifierAttribute<Self, Value>,
    Value extends ModifierSpec<Value>> extends SpecAttribute<Value> {
  const ModifierAttribute();

  @override
  Value resolve(MixData mix);
}
