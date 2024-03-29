import 'package:flutter/material.dart';

import '../../attributes/nested_style/nested_style_attribute.dart';
import '../../core/attribute.dart';
import '../../factory/style_mix.dart';
import '../../utils/context_variant_util/on_helper_util.dart';
import '../../variants/variant.dart';
import 'pressable_state.dart';

/// Global context variants for handling common widget states and gestures.

/// Applies styles when the widget is pressed.
final onPressed = PressableStateVariant(
  (context) => PressableState.pressedOf(context),
);

/// Applies styles when the widget is long pressed.
final onLongPressed = PressableStateVariant(
  (context) => PressableState.longPressedOf(context),
);

/// Applies styles when widget is hovered over.
final onHover = PressableStateVariant(
  (context) => PressableState.hoveredOf(context),
);

/// Applies styles when the widget is disabled.
final onEnabled = PressableStateVariant(
  (context) => PressableState.enabledOf(context),
);

/// Applies styles when the widget is enabled.
final onDisabled = onNot(onEnabled);

const onMouseHover = OnMouseHoverBuilder.new;

/// Applies styles when the widget has focus.dar
const onFocused = PressableStateVariant(PressableState.focusedOf);

const onPressedEvent = OnPressedEventBuilder.new;
const onLongPressedEvent = OnLongPressedEventBuilder.new;
const onHoverEvent = OnHoverEventBuilder.new;
const onEnabledEvent = OnEnabledEventBuilder.new;
const onDisabledEvent = OnDisabledEventBuilder.new;
const onFocusedEvent = OnFocusedEventBuilder.new;

/// Helper class for creating widget state-based context variants.
@immutable
class PressableStateVariant extends ContextVariant {
  const PressableStateVariant(super.when);
}

@immutable
class OnDisabledEventBuilder
    extends StyleAttributeBuilder<OnDisabledEventBuilder> {
  final Attribute Function(bool disabled) fn;
  const OnDisabledEventBuilder(this.fn);

  @override
  Attribute builder(BuildContext context) {
    return fn(!PressableState.enabledOf(context));
  }

  @override
  get props => [fn];
}

@immutable
class OnFocusedEventBuilder
    extends StyleAttributeBuilder<OnFocusedEventBuilder> {
  final Attribute Function(bool focused) fn;
  const OnFocusedEventBuilder(this.fn);

  @override
  Attribute builder(BuildContext context) {
    return fn(PressableState.focusedOf(context));
  }

  @override
  get props => [fn];
}

@immutable
class OnPressedEventBuilder
    extends StyleAttributeBuilder<OnPressedEventBuilder> {
  final Attribute Function(bool pressed) fn;
  const OnPressedEventBuilder(this.fn);

  @override
  Attribute builder(BuildContext context) {
    return fn(PressableState.pressedOf(context));
  }

  @override
  get props => [fn];
}

@immutable
class OnLongPressedEventBuilder
    extends StyleAttributeBuilder<OnLongPressedEventBuilder> {
  final Attribute Function(bool longPressed) fn;
  const OnLongPressedEventBuilder(this.fn);

  @override
  Attribute builder(BuildContext context) {
    return fn(PressableState.longPressedOf(context));
  }

  @override
  get props => [fn];
}

@immutable
class OnHoverEventBuilder extends StyleAttributeBuilder<OnHoverEventBuilder> {
  final Attribute Function(bool hovered) fn;
  const OnHoverEventBuilder(this.fn);

  @override
  Attribute builder(BuildContext context) {
    return fn(PressableState.hoveredOf(context));
  }

  @override
  get props => [fn];
}

@immutable
class OnEnabledEventBuilder
    extends StyleAttributeBuilder<OnEnabledEventBuilder> {
  final Attribute Function(bool enabled) fn;
  const OnEnabledEventBuilder(this.fn);

  @override
  Attribute builder(BuildContext context) {
    return fn(PressableState.enabledOf(context));
  }

  @override
  get props => [fn];
}

@immutable
class OnMouseHoverBuilder extends StyleAttributeBuilder<OnMouseHoverBuilder>
    with Mergeable<OnMouseHoverBuilder> {
  final List<Style Function(PointerPosition event)> builders;
  const OnMouseHoverBuilder.raw(this.builders);

  factory OnMouseHoverBuilder(Style Function(PointerPosition event) builder) {
    return OnMouseHoverBuilder.raw([builder]);
  }

  @override
  OnMouseHoverBuilder merge(OnMouseHoverBuilder? other) {
    if (other == null) return this;

    return OnMouseHoverBuilder.raw([...builders, ...other.builders]);
  }

  @override
  Attribute? builder(BuildContext context) {
    final position = PressableState.pointerPositionOf(context);

    if (position == null) {
      return null;
    }

    final styles = <Style>[];

    for (final fn in builders) {
      final style = fn(position);

      styles.add(style);
    }

    return NestedStyleAttribute(Style.combine(styles));
  }

  @override
  get props => [builders];
}
