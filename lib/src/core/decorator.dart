import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

abstract class DecoratorSpec<Self extends DecoratorSpec<Self>>
    extends Spec<Self> {
  const DecoratorSpec();

  static DecoratorSpec? lerpValue(
    DecoratorSpec? begin,
    DecoratorSpec? end,
    double t,
  ) {
    if (begin != null && end != null) {
      assert(
        begin.runtimeType == end.runtimeType,
        'You can only lerp the same type of DecoratorSpec',
      );

      return begin.lerp(end, t) as DecoratorSpec?;
    }

    return begin ?? end;
  }

  Widget build(Widget child);
}

abstract class DecoratorAttribute<Self extends DecoratorAttribute<Self, Value>,
    Value extends DecoratorSpec<Value>> extends SpecAttribute<Value> {
  const DecoratorAttribute();

  @override
  Value resolve(MixData mix);
}
