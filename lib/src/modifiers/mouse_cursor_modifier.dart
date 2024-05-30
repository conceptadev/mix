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

  T defer() => builder(const MouseCursorDecoratorAttribute(MouseCursor.defer));
  T uncontrolled() =>
      builder(const MouseCursorDecoratorAttribute(MouseCursor.uncontrolled));

  T none() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.none));

  T basic() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.basic));

  T click() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.click));

  T forbidden() => builder(
        const MouseCursorDecoratorAttribute(SystemMouseCursors.forbidden),
      );

  T wait() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.wait));

  T progress() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.progress));

  T contextMenu() => builder(
        const MouseCursorDecoratorAttribute(SystemMouseCursors.contextMenu),
      );

  T help() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.help));

  T text() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.text));

  T verticalText() => builder(
        const MouseCursorDecoratorAttribute(SystemMouseCursors.verticalText),
      );

  T cell() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.cell));

  T precise() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.precise));

  T move() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.move));

  T grab() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.grab));

  T grabbing() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.grabbing));

  T noDrop() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.noDrop));

  T alias() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.alias));

  T copy() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.copy));

  T disappearing() => builder(
        const MouseCursorDecoratorAttribute(SystemMouseCursors.disappearing),
      );

  T allScroll() => builder(
        const MouseCursorDecoratorAttribute(SystemMouseCursors.allScroll),
      );

  T resizeLeftRight() => builder(
        const MouseCursorDecoratorAttribute(SystemMouseCursors.resizeLeftRight),
      );

  T resizeUpDown() => builder(
        const MouseCursorDecoratorAttribute(SystemMouseCursors.resizeUpDown),
      );

  T resizeUpLeftDownRight() => builder(const MouseCursorDecoratorAttribute(
        SystemMouseCursors.resizeUpLeftDownRight,
      ));

  T resizeUpRightDownLeft() => builder(const MouseCursorDecoratorAttribute(
        SystemMouseCursors.resizeUpRightDownLeft,
      ));

  T resizeUp() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.resizeUp));

  T resizeDown() => builder(
        const MouseCursorDecoratorAttribute(SystemMouseCursors.resizeDown),
      );

  T resizeLeft() => builder(
        const MouseCursorDecoratorAttribute(SystemMouseCursors.resizeLeft),
      );

  T resizeRight() => builder(
        const MouseCursorDecoratorAttribute(SystemMouseCursors.resizeRight),
      );

  T resizeUpLeft() => builder(
        const MouseCursorDecoratorAttribute(SystemMouseCursors.resizeUpLeft),
      );

  T resizeUpRight() => builder(
        const MouseCursorDecoratorAttribute(SystemMouseCursors.resizeUpRight),
      );

  T resizeDownLeft() => builder(
        const MouseCursorDecoratorAttribute(SystemMouseCursors.resizeDownLeft),
      );

  T resizeDownRight() => builder(
        const MouseCursorDecoratorAttribute(SystemMouseCursors.resizeDownRight),
      );

  T resizeColumn() => builder(
        const MouseCursorDecoratorAttribute(SystemMouseCursors.resizeColumn),
      );

  T resizeRow() => builder(
        const MouseCursorDecoratorAttribute(SystemMouseCursors.resizeRow),
      );

  T zoomIn() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.zoomIn));

  T zoomOut() =>
      builder(const MouseCursorDecoratorAttribute(SystemMouseCursors.zoomOut));
}
