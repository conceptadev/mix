// ignore_for_file: avoid-inferrable-type-arguments

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'gesture_mix_state.dart';
import 'interactive_mix_state.dart';

enum WidgetMixState {
  hovered,
  focused,
  pressed,
  dragged,
  selected,
  disabled,
  idle,
}

final class WidgetStateModel {
  const WidgetStateModel._();

  static bool enabledOf(BuildContext context) {
    return InteractiveMixState.maybeOf(context)?.enabled ?? true;
  }

  static bool disabledOf(BuildContext context) {
    return !enabledOf(context);
  }

  static bool hoverOf(BuildContext context) {
    return InteractiveMixState.maybeOf(context)?.hovered ?? false;
  }

  static bool focusOf(BuildContext context) {
    return InteractiveMixState.maybeOf(context)?.focused ?? false;
  }

  static bool pressOf(BuildContext context) {
    return GestureMixState.maybeOf(context)?.pressed ?? false;
  }

  static bool longPressOf(BuildContext context) {
    return GestureMixState.maybeOf(context)?.longPressed ?? false;
  }

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
