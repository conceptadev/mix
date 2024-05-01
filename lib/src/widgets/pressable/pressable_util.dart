import 'package:flutter/material.dart';

import '../../attributes/nested_style/nested_style_attribute.dart';
import '../../core/attribute.dart';
import '../../factory/style_mix.dart';
import '../../variants/variant.dart';
import 'pressable_state.dart';

const onPressed = OnPressedVariant();
const onLongPressed = OnLongPressedVariant();
const onHover = OnHoverVariant();
const onEnabled = OnEnabledVariant();
const onDisabled = OnDisabledVariant();
const onFocused = OnFocusedVariant();
const onMouseHover = OnMouseHoverBuilder.new;

/// Global context variants for handling common widget states and gestures.
mixin ContextVariantEventMixin<T extends ContextVariant> on ContextVariant {
  ContectVariantEventBuilder<T> onEvent(Style Function(bool) fn) {
    return ContectVariantEventBuilder(fn, variant: this as T, key: key);
  }
}

/// Applies styles when the widget is pressed.
class OnPressedVariant extends ContextVariant
    with ContextVariantEventMixin<OnPressedVariant> {
  const OnPressedVariant({super.key})
      : super(priority: VariantPriority.highest);

  @override
  bool build(BuildContext context) => PressableState.pressedOf(context);
}

/// Applies styles when the widget is long pressed.
class OnLongPressedVariant extends ContextVariant
    with ContextVariantEventMixin<OnLongPressedVariant> {
  const OnLongPressedVariant({super.key})
      : super(priority: VariantPriority.highest);

  @override
  bool build(BuildContext context) => PressableState.longPressedOf(context);
}

@immutable

/// Applies styles when widget is hovered over.
class OnHoverVariant extends ContextVariant
    with ContextVariantEventMixin<OnHoverVariant> {
  const OnHoverVariant({super.key}) : super(priority: VariantPriority.highest);

  @override
  bool build(BuildContext context) => PressableState.hoveredOf(context);
}

/// Applies styles when the widget is enabled.
class OnEnabledVariant extends ContextVariant
    with ContextVariantEventMixin<OnEnabledVariant> {
  const OnEnabledVariant({super.key})
      : super(priority: VariantPriority.highest);

  @override
  bool build(BuildContext context) => PressableState.enabledOf(context);
}

/// Applies styles when the widget is disabled.
class OnDisabledVariant extends ContextVariant
    with ContextVariantEventMixin<OnDisabledVariant> {
  const OnDisabledVariant({super.key})
      : super(priority: VariantPriority.highest);

  @override
  bool build(BuildContext context) => !PressableState.enabledOf(context);
}

/// Applies styles when the widget has focus.
class OnFocusedVariant extends ContextVariant
    with ContextVariantEventMixin<OnFocusedVariant> {
  const OnFocusedVariant({super.key})
      : super(priority: VariantPriority.highest);

  @override
  bool build(BuildContext context) => PressableState.focusedOf(context);
}

@immutable
class OnMouseHoverBuilder extends StyleAttributeBuilder<PointerPosition?> {
  const OnMouseHoverBuilder(super.fn, {super.key});

  @override
  Attribute builder(BuildContext context) {
    return NestedStyleAttribute(
      fn(PressableState.pointerPositionOf(context)),
    );
  }
}
