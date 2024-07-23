import 'package:flutter/widgets.dart';

import '../core/factory/style_mix.dart';
import '../core/variant.dart';
import '../core/widget_state/internal/mouse_region_mix_state.dart';
import '../core/widget_state/widget_state_controller.dart';
import 'context_variant.dart';

@immutable
abstract class MixWidgetStateVariant<Value> extends ContextVariant {
  @override
  final priority = VariantPriority.highest;

  const MixWidgetStateVariant();

  ContextVariantBuilder event(Style Function(Value) fn) {
    return ContextVariantBuilder(
      (BuildContext context) => fn(builder(context)),
      this,
    );
  }

  @protected
  Value builder(BuildContext context);
}

abstract class _ToggleMixStateVariant extends MixWidgetStateVariant<bool> {
  final MixWidgetState _state;
  const _ToggleMixStateVariant(this._state);

  @override
  bool builder(BuildContext context) => when(context);

  @override
  bool when(BuildContext context) => MixWidgetState.hasStateOf(context, _state);
}

/// Applies styles when widget is hovered over.
class OnHoverVariant extends MixWidgetStateVariant<PointerPosition?> {
  const OnHoverVariant();

  @override
  PointerPosition builder(BuildContext context) {
    final pointerPosition =
        MouseRegionMixWidgetState.of(context)?.pointerPosition;

    return when(context) && pointerPosition != null
        ? pointerPosition
        : const PointerPosition(
            position: Alignment.center,
            offset: Offset.zero,
          );
  }

  @override
  bool when(BuildContext context) => MixWidgetState.hasStateOf(
        context,
        MixWidgetState.hovered,
      );
}

/// Applies styles when the widget is pressed.
class OnPressVariant extends _ToggleMixStateVariant {
  const OnPressVariant() : super(MixWidgetState.pressed);
}

/// Applies styles when the widget is long pressed.
class OnLongPressVariant extends _ToggleMixStateVariant {
  const OnLongPressVariant() : super(MixWidgetState.longPressed);
}

/// Applies styles when the widget is disabled.
class OnDisabledVariant extends _ToggleMixStateVariant {
  const OnDisabledVariant() : super(MixWidgetState.disabled);
}

/// Applies styles when the widget has focus.
class OnFocusedVariant extends _ToggleMixStateVariant {
  const OnFocusedVariant() : super(MixWidgetState.focused);
}

/// Applies styles when the widget is selected
class OnSelectedVariant extends _ToggleMixStateVariant {
  const OnSelectedVariant() : super(MixWidgetState.selected);
}

/// Applies styles when the widget is dragged.
class OnDraggedVariant extends _ToggleMixStateVariant {
  const OnDraggedVariant() : super(MixWidgetState.dragged);
}
