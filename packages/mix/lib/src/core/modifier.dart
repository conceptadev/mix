import 'package:flutter/material.dart';

import 'core.dart';

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

// ignore: avoid-dynamic
typedef InlineModifierSpec = Set<WidgetModifierSpec<dynamic>>;

class ModifierDto extends Dto<InlineModifierSpec> {
  final Set<WidgetModifierAttribute> modifiers;

  const ModifierDto(this.modifiers);

  @override
  ModifierDto merge(ModifierDto? other) {
    if (other == null) return this;
    final thisMap = AttributeMap(modifiers);
    final otherMap = AttributeMap(other.modifiers);
    final mergedMap = thisMap.merge(otherMap).values.toSet();

    return ModifierDto(mergedMap);
  }

  @override
  InlineModifierSpec resolve(MixData mix) {
    return modifiers.map((e) => e.resolve(mix)).toSet();
  }

  @override
  Set<WidgetModifierSpec<WidgetModifierSpec>> get defaultValue => {};
  @override
  List<Object?> get props => [modifiers];
}
