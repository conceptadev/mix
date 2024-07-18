import 'package:flutter/widgets.dart';

import '../core/factory/style_mix.dart';
import '../core/internal/widget_state/interactive_widget.dart';
import '../core/internal/widget_state/widget_state.dart';
import '../core/variant.dart';
import 'context_variant.dart';

@immutable
abstract class WidgetStateVariant<Value> extends ContextVariant {
  @override
  final priority = VariantPriority.highest;

  const WidgetStateVariant();

  ContextVariantBuilder event(Style Function(Value) fn) {
    return ContextVariantBuilder(
      (BuildContext context) => fn(builder(context)),
      this,
    );
  }

  @protected
  Value builder(BuildContext context);
}

/// Applies styles when the widget is pressed.
class OnPressVariant extends WidgetStateVariant<bool> {
  const OnPressVariant();

  @override
  bool builder(BuildContext context) => WidgetStateModel.pressOf(context);

  @override
  bool when(BuildContext context) => builder(context);
}

class OnWidgetStateVariant extends WidgetStateVariant<WidgetMixState> {
  const OnWidgetStateVariant();

  @override
  WidgetMixState builder(BuildContext context) =>
      WidgetStateModel.stateOf(context);

  @override
  bool when(BuildContext context) => builder(context) != WidgetMixState.idle;
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
