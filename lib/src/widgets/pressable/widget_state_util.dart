import 'package:flutter/material.dart';

import '../../helpers/string_ext.dart';
import '../../variants/variant.dart';
import 'pressable_state.notifier.dart';

/// Global context variants for handling common widget states and gestures.

/// Applies styles when the widget is pressed.
final onPressed = _onState(PressableState.pressed);

/// Applies styles when the widget is long pressed.
final onLongPressed = _onState(PressableState.longPressed);

/// Applies styles when the widget is disabled.
final onDisabled = _onDisabled(true);

/// Applies styles when the widget is enabled.
final onEnabled = _onDisabled(false);

/// Applies styles when the widget has focus.dar
final onFocused = ContextVariant(
  'on-focused',

  /// Applies the variant only when the GestureStateNotifier's focus property is true.
  (context) => PressableStateNotifier.of(context)?.focus == true,
);

/// Applies styles when the widget is being hovered over.
final onHover = ContextVariant(
  'on-hover',

  /// Applies the variant only when the GestureStateNotifier's hover property is true.
  (context) =>
      PressableStateNotifier.of(context)?.state == PressableState.hovered,
);

/// Helper class for creating widget state-based context variants.
@immutable
class WidgetStateVariant extends ContextVariant {
  const WidgetStateVariant(super.name, super.when);
}

/// Creates a [WidgetStateVariant] based on the specified [state].
///
/// This function constructs a WidgetStateVariant with a name based on the provided state and a condition that checks if the GestureStateNotifier in the context matches the given state.
WidgetStateVariant _onState(PressableState state) {
  return WidgetStateVariant(
    'on-${state.name.paramCase}',
    (context) => PressableStateNotifier.of(context)?.state == state,
  );
}

/// Creates a [WidgetStateVariant] based on the specified [status].
///
/// Similar to `_onState`, this function creates a WidgetStateVariant with a condition that checks if the GestureStateNotifier in the context matches the provided status.
WidgetStateVariant _onDisabled(bool disabled) {
  return WidgetStateVariant(
    'on-${disabled ? 'disabled' : 'enabled'}',
    (context) => PressableStateNotifier.of(context)?.disabled == disabled,
  );
}
