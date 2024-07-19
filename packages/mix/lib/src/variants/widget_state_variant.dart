import 'package:flutter/widgets.dart';

import '../core/factory/style_mix.dart';
import '../core/internal/mix_state/gesture_mix_state.dart';
import '../core/internal/mix_state/interactive_mix_state.dart';
import '../core/internal/mix_state/mouse_region_widget_state.dart';
import '../core/variant.dart';
import 'context_variant.dart';

@immutable
abstract class MixStateVariant<Value> extends ContextVariant {
  @override
  final priority = VariantPriority.highest;

  const MixStateVariant();

  ContextVariantBuilder event(Style Function(Value) fn) {
    return ContextVariantBuilder(
      (BuildContext context) => fn(builder(context)),
      this,
    );
  }

  @protected
  Value builder(BuildContext context);
}

@immutable
abstract class InteractiveMixStateVariant<Value>
    extends MixStateVariant<Value> {
  final InteractiveMixState _state;
  const InteractiveMixStateVariant(this._state);

  @override
  bool when(BuildContext context) =>
      InteractiveMixState.of(context).has(_state);
}

@immutable
abstract class GestureMixStateVariant extends MixStateVariant<bool> {
  final GestureMixState _state;
  const GestureMixStateVariant(this._state);

  @override
  bool builder(BuildContext context) => when(context);

  @override
  bool when(BuildContext context) => GestureMixState.of(context).has(_state);
}

/// Applies styles when the widget is pressed.
class OnPressVariant extends GestureMixStateVariant {
  const OnPressVariant() : super(GestureMixState.pressed);
}

/// Applies styles when the widget is long pressed.
class OnLongPressVariant extends GestureMixStateVariant {
  const OnLongPressVariant() : super(GestureMixState.longPressed);
}

/// Applies styles when widget is hovered over.
class OnHoverVariant extends InteractiveMixStateVariant<PointerPosition?> {
  const OnHoverVariant() : super(InteractiveMixState.hovered);

  @override
  PointerPosition builder(BuildContext context) =>
      const PointerPosition(position: Alignment.center, offset: Offset.zero);
}

/// Applies styles when the widget is enabled.
class OnEnabledVariant extends InteractiveMixStateVariant<bool> {
  const OnEnabledVariant() : super(InteractiveMixState.disabled);

  @override
  bool builder(BuildContext context) => when(context);

  @override
  bool when(BuildContext context) => !super.when(context);
}

/// Applies styles when the widget is disabled.
class OnDisabledVariant extends InteractiveMixStateVariant<bool> {
  const OnDisabledVariant() : super(InteractiveMixState.disabled);

  @override
  bool builder(BuildContext context) => when(context);
}

/// Applies styles when the widget has focus.
class OnFocusVariant extends InteractiveMixStateVariant<bool> {
  const OnFocusVariant() : super(InteractiveMixState.focused);

  @override
  bool builder(BuildContext context) => when(context);
}
