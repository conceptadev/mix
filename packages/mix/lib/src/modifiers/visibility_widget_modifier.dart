// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/modifier.dart';
import '../core/utility.dart';
import '../internal/lerp_helpers.dart';

final class VisibilityModifierSpec
    extends WidgetModifierSpec<VisibilityModifierSpec> {
  final bool visible;
  const VisibilityModifierSpec(this.visible);

  @override
  VisibilityModifierSpec lerp(VisibilityModifierSpec? other, double t) {
    return VisibilityModifierSpec(
      lerpSnap(visible, other?.visible, t) ?? visible,
    );
  }

  @override
  VisibilityModifierSpec copyWith({bool? visible}) {
    return VisibilityModifierSpec(visible ?? this.visible);
  }

  @override
  get props => [visible];

  @override
  Widget build(Widget child) {
    return Visibility(visible: visible, child: child);
  }
}

final class VisibilityModifierAttribute extends WidgetModifierAttribute<
    VisibilityModifierAttribute, VisibilityModifierSpec> {
  final bool visible;
  const VisibilityModifierAttribute(this.visible);

  @override
  VisibilityModifierAttribute merge(VisibilityModifierAttribute? other) {
    return VisibilityModifierAttribute(other?.visible ?? visible);
  }

  @override
  VisibilityModifierSpec resolve(MixData mix) {
    return VisibilityModifierSpec(visible);
  }

  @override
  get props => [visible];
}

final class VisibilityUtility<T extends Attribute>
    extends MixUtility<T, VisibilityModifierAttribute> {
  const VisibilityUtility(super.builder);
  T on() => builder(const VisibilityModifierAttribute(true));
  T off() => builder(const VisibilityModifierAttribute(false));

  T call(bool value) => builder(VisibilityModifierAttribute(value));
}
