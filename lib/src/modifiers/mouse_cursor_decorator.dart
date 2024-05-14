// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/modifier.dart';
import '../factory/mix_provider_data.dart';

class MouseCursorDecoratorSpec
    extends WidgetModifierSpec<MouseCursorDecoratorSpec> {
  final MouseCursor? mouseCursor;

  const MouseCursorDecoratorSpec(this.mouseCursor);

  @override
  MouseCursorDecoratorSpec lerp(MouseCursorDecoratorSpec? other, double t) {
    return MouseCursorDecoratorSpec(mouseCursor);
  }

  @override
  MouseCursorDecoratorSpec copyWith({MouseCursor? mouseCursor}) {
    return MouseCursorDecoratorSpec(mouseCursor ?? this.mouseCursor);
  }

  @override
  get props => [mouseCursor];

  @override
  Widget build(Widget child) {
    return MouseRegion(cursor: mouseCursor ?? MouseCursor.defer, child: child);
  }
}

class MouseCursorDecoratorAttribute extends WidgetModifierAttribute<
    MouseCursorDecoratorAttribute, MouseCursorDecoratorSpec> {
  final MouseCursor? mouseCursor;

  const MouseCursorDecoratorAttribute(this.mouseCursor);

  @override
  MouseCursorDecoratorSpec resolve(MixData mix) {
    return MouseCursorDecoratorSpec(mouseCursor);
  }

  @override
  MouseCursorDecoratorAttribute merge(MouseCursorDecoratorAttribute? other) {
    return MouseCursorDecoratorAttribute(mouseCursor);
  }

  @override
  get props => [mouseCursor];
}

class MouseCursorWidgetUtility<T extends Attribute>
    extends MixUtility<T, MouseCursorDecoratorAttribute> {
  const MouseCursorWidgetUtility(super.builder);
  T call(MouseCursor? mouseCursor) {
    return builder(MouseCursorDecoratorAttribute(mouseCursor));
  }
}
