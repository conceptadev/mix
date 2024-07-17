// ignore_for_file: avoid-inferrable-type-arguments

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'gesturable_builder.dart';
import 'interactive_widget.dart';

enum WidgetMixState {
  idle,
  disabled,
  hovered,
  pressed,
  longPressed,
}

final class WidgetStateModel {
  static const enabledOf = InteractiveState.enabledOf;

  static const disabledOf = InteractiveState.disabledOf;

  static const hoverOf = InteractiveState.hoveredOf;

  static const focusOf = InteractiveState.focusedOf;

  static const pressOf = GesturableState.pressedOf;

  static const longPressOf = GesturableState.longPressedOf;

  static const pointerPositionOf = InteractiveState.pointerPositionOf;

  const WidgetStateModel._();

  static WidgetMixState stateOf(BuildContext context) {
    final enabled = enabledOf(context);
    final longPressed = longPressOf(context);
    final hovered = hoverOf(context);

    final pressed = pressOf(context);

    if (!enabled) {
      return WidgetMixState.disabled;
    }
    if (longPressed) return WidgetMixState.longPressed;
    if (pressed) return WidgetMixState.pressed;
    if (hovered) return WidgetMixState.hovered;

    return WidgetMixState.idle;
  }
}
