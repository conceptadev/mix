import 'package:flutter/material.dart';

import '../../variants/context_variant.dart';
import 'widget_state.dart';

/// Applies styles when the widget is pressed.
class OnPressVariant extends WidgetStateVariant<bool> {
  const OnPressVariant();

  @override
  bool builder(BuildContext context) => WidgetStateModel.pressOf(context);

  @override
  bool when(BuildContext context) => builder(context);
}

/// Applies styles when the widget is long pressed.
class OnLongPressVariant extends WidgetStateVariant<bool> {
  const OnLongPressVariant();

  @override
  bool builder(BuildContext context) => WidgetStateModel.longPressOf(context);

  @override
  bool when(BuildContext context) => builder(context);
}

@immutable

/// Applies styles when widget is hovered over.
class OnHoverVariant extends WidgetStateVariant<PointerPosition?> {
  const OnHoverVariant();

  @override
  PointerPosition? builder(BuildContext context) =>
      WidgetStateModel.pointerPositionOf(context);

  @override
  bool when(BuildContext context) => WidgetStateModel.hoverOf(context);
}

/// Applies styles when the widget is enabled.
class OnEnabledVariant extends WidgetStateVariant<bool> {
  const OnEnabledVariant();

  @override
  bool builder(BuildContext context) => WidgetStateModel.enabledOf(context);

  @override
  bool when(BuildContext context) => builder(context);
}

/// Applies styles when the widget is disabled.
class OnDisabledVariant extends WidgetStateVariant<bool> {
  const OnDisabledVariant();

  @override
  bool builder(BuildContext context) => WidgetStateModel.disabledOf(context);

  @override
  bool when(BuildContext context) => builder(context);
}

/// Applies styles when the widget has focus.
class OnFocusVariant extends WidgetStateVariant<bool> {
  const OnFocusVariant();

  @override
  bool builder(BuildContext context) => WidgetStateModel.focusOf(context);

  @override
  bool when(BuildContext context) => builder(context);
}
