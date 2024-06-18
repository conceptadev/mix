import 'package:flutter/material.dart';

import 'spec.dart';
import 'factory/mix_data.dart';

abstract base class WidgetModifierSpec<Self extends WidgetModifierSpec<Self>>
    extends Spec<Self> {
  @override
  const WidgetModifierSpec({super.animated});

  static WidgetModifierSpec? lerpValue(
    WidgetModifierSpec? begin,
    WidgetModifierSpec? end,
    double t,
  ) {
    if (begin != null && end != null) {
      assert(
        begin.runtimeType == end.runtimeType,
        'You can only lerp the same type of ModifierSpec',
      );

      return begin.lerp(end, t) as WidgetModifierSpec?;
    }

    return begin ?? end;
  }

  Widget build(Widget child);
}

abstract base class WidgetModifierAttribute<
    Self extends WidgetModifierAttribute<Self, Value>,
    Value extends WidgetModifierSpec<Value>> extends SpecAttribute<Value> {
  const WidgetModifierAttribute();

  @override
  Value resolve(MixData mix);
}
