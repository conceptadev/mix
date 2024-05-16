// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/modifier.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';

class VisibilityModifierSpec extends ModifierSpec<VisibilityModifierSpec> {
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

class VisibilityModifierAttribute extends ModifierAttribute<
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

class VisibilityUtility<T extends Attribute>
    extends MixUtility<T, VisibilityModifierAttribute> {
  const VisibilityUtility(super.builder);
  T on() => builder(const VisibilityModifierAttribute(true));
  T off() => builder(const VisibilityModifierAttribute(false));

  T call(bool value) => builder(VisibilityModifierAttribute(value));
}
