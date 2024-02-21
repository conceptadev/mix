// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';

class VisibilityWidgetSpec extends DecoratorSpec<VisibilityWidgetSpec> {
  final bool visible;
  const VisibilityWidgetSpec(this.visible);

  @override
  VisibilityWidgetSpec lerp(VisibilityWidgetSpec? other, double t) {
    return VisibilityWidgetSpec(
      lerpSnap(visible, other?.visible, t) ?? visible,
    );
  }

  @override
  VisibilityWidgetSpec copyWith({bool? visible}) {
    return VisibilityWidgetSpec(visible ?? this.visible);
  }

  @override
  get props => [visible];

  @override
  Widget build(Widget child) {
    return Visibility(visible: visible, child: child);
  }
}

class VisibilityWidgetDecorator
    extends WidgetDecorator<VisibilityWidgetDecorator, VisibilityWidgetSpec> {
  final bool visible;
  const VisibilityWidgetDecorator(this.visible);

  @override
  VisibilityWidgetDecorator merge(VisibilityWidgetDecorator? other) {
    return VisibilityWidgetDecorator(other?.visible ?? visible);
  }

  @override
  VisibilityWidgetSpec resolve(MixData mix) {
    return VisibilityWidgetSpec(visible);
  }

  @override
  get props => [visible];
}

class VisibilityUtility<T extends StyleAttribute>
    extends MixUtility<T, VisibilityWidgetDecorator> {
  const VisibilityUtility(super.builder);
  T on() => builder(const VisibilityWidgetDecorator(true));
  T off() => builder(const VisibilityWidgetDecorator(false));

  T call(bool value) => builder(VisibilityWidgetDecorator(value));
}
