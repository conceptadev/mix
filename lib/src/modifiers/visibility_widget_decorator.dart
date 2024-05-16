// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';

class VisibilityDecoratorSpec extends DecoratorSpec<VisibilityDecoratorSpec> {
  final bool visible;
  const VisibilityDecoratorSpec(this.visible);

  @override
  VisibilityDecoratorSpec lerp(VisibilityDecoratorSpec? other, double t) {
    return VisibilityDecoratorSpec(
      lerpSnap(visible, other?.visible, t) ?? visible,
    );
  }

  @override
  VisibilityDecoratorSpec copyWith({bool? visible}) {
    return VisibilityDecoratorSpec(visible ?? this.visible);
  }

  @override
  get props => [visible];

  @override
  Widget build(Widget child) {
    return Visibility(visible: visible, child: child);
  }
}

class VisibilityDecoratorAttribute extends DecoratorAttribute<
    VisibilityDecoratorAttribute, VisibilityDecoratorSpec> {
  final bool visible;
  const VisibilityDecoratorAttribute(this.visible);

  @override
  VisibilityDecoratorAttribute merge(VisibilityDecoratorAttribute? other) {
    return VisibilityDecoratorAttribute(other?.visible ?? visible);
  }

  @override
  VisibilityDecoratorSpec resolve(MixData mix) {
    return VisibilityDecoratorSpec(visible);
  }

  @override
  get props => [visible];
}

class VisibilityUtility<T extends Attribute>
    extends MixUtility<T, VisibilityDecoratorAttribute> {
  const VisibilityUtility(super.builder);
  T on() => builder(const VisibilityDecoratorAttribute(true));
  T off() => builder(const VisibilityDecoratorAttribute(false));

  T call(bool value) => builder(VisibilityDecoratorAttribute(value));
}
