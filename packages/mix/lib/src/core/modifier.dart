import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'attribute.dart';
import 'factory/mix_data.dart';
import 'spec.dart';
import 'utility.dart';

abstract base class WidgetModifierSpec<Self extends WidgetModifierSpec<Self>>
    extends Spec<Self> {
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
        Value extends WidgetModifierSpec<Value>> extends SpecAttribute<Value>
    with Diagnosticable {
  const WidgetModifierAttribute();

  @override
  Value resolve(MixData mix);
}

abstract base class WidgetModifierUtility<
    T extends Attribute,
    D extends WidgetModifierAttribute<D, Value>,
    Value extends WidgetModifierSpec<Value>> extends MixUtility<T, D> {
  const WidgetModifierUtility(super.builder);
}
