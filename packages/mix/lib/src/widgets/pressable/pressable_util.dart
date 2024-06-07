import 'package:flutter/material.dart';

import '../../variants/context_variant.dart';
import 'pressable_state.dart';

/// Applies styles when the widget is pressed.
class OnPressVariant extends WidgetContextVariant<bool> {
  const OnPressVariant();

  @override
  bool builder(BuildContext context) => PressableState.pressOf(context);

  @override
  bool when(BuildContext context) => builder(context);
}

/// Applies styles when the widget is long pressed.
class OnLongPressVariant extends WidgetContextVariant<bool> {
  const OnLongPressVariant();

  @override
  bool builder(BuildContext context) => PressableState.longPressOf(context);

  @override
  bool when(BuildContext context) => builder(context);
}

@immutable

/// Applies styles when widget is hovered over.
class OnHoverVariant extends WidgetContextVariant<PointerPosition?> {
  const OnHoverVariant();

  @override
  PointerPosition? builder(BuildContext context) =>
      PressableState.pointerPositionOf(context);

  @override
  bool when(BuildContext context) => PressableState.hoverOf(context);
}

/// Applies styles when the widget is enabled.
class OnEnabledVariant extends WidgetContextVariant<bool> {
  const OnEnabledVariant();

  @override
  bool builder(BuildContext context) => PressableState.enabledOf(context);

  @override
  bool when(BuildContext context) => builder(context);
}

/// Applies styles when the widget is disabled.
class OnDisabledVariant extends WidgetContextVariant<bool> {
  const OnDisabledVariant();

  @override
  bool builder(BuildContext context) => PressableState.disabledOf(context);

  @override
  bool when(BuildContext context) => builder(context);
}

/// Applies styles when the widget has focus.
class OnFocusVariant extends WidgetContextVariant<bool> {
  const OnFocusVariant();

  @override
  bool builder(BuildContext context) => PressableState.focusOf(context);

  @override
  bool when(BuildContext context) => builder(context);
}
