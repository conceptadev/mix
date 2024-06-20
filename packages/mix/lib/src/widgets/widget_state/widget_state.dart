// ignore_for_file: avoid-inferrable-type-arguments

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../internal/compare_mixin.dart';

enum WidgetStateAspect {
  currentState,
  enabled,
  hovered,
  focused,
  pressed,
  longPressed,
  pointerPosition
}

enum MixWidgetState {
  idle,
  hovered,
  pressed,
  longPressed,
}

final class WidgetStateModel extends InheritedModel<WidgetStateAspect> {
  const WidgetStateModel({
    super.key,
    required super.child,
    required this.enabled,
    required this.hovered,
    required this.focused,
    required this.pressed,
    required this.longPressed,
    required this.pointerPosition,
  });

  factory WidgetStateModel.none({Key? key, required Widget child}) {
    return WidgetStateModel(
      key: key,
      enabled: false,
      hovered: false,
      focused: false,
      pressed: false,
      longPressed: false,
      pointerPosition: null,
      child: child,
    );
  }

  static WidgetStateModel of(
    BuildContext context, [
    WidgetStateAspect? aspect,
  ]) {
    final WidgetStateModel? result = maybeOf(context, aspect);
    assert(result != null, 'Unable to find an instance of PressableState...');

    return result!;
  }

  static WidgetStateModel? maybeOf(
    BuildContext context, [
    WidgetStateAspect? aspect,
  ]) {
    return InheritedModel.inheritFrom<WidgetStateModel>(context,
        aspect: aspect);
  }

  static WidgetStateModel aspectOf(
    BuildContext context,
    WidgetStateAspect aspect,
  ) {
    return of(context, aspect);
  }

  static bool enabledOf(BuildContext context) {
    return of(context, WidgetStateAspect.enabled).enabled;
  }

  static bool disabledOf(BuildContext context) {
    return !enabledOf(context);
  }

  static bool hoverOf(BuildContext context) {
    return of(context, WidgetStateAspect.hovered).hovered;
  }

  static bool focusOf(BuildContext context) {
    return of(context, WidgetStateAspect.focused).focused;
  }

  static bool pressOf(BuildContext context) {
    return of(context, WidgetStateAspect.pressed).pressed;
  }

  static bool longPressOf(BuildContext context) {
    return of(context, WidgetStateAspect.longPressed).longPressed;
  }

  static PointerPosition? pointerPositionOf(BuildContext context) {
    return of(context, WidgetStateAspect.pointerPosition).pointerPosition;
  }

  static MixWidgetState stateOf(BuildContext context) {
    return of(context, WidgetStateAspect.currentState).currentState;
  }

  final bool enabled;
  final bool hovered;
  final bool focused;
  final bool pressed;
  final bool longPressed;

  final PointerPosition? pointerPosition;

  MixWidgetState get currentState {
    if (enabled) {
      // Long pressed has priority over pressed
      // Due to delay of removing the _press state
      if (longPressed) return MixWidgetState.longPressed;

      if (pressed) return MixWidgetState.pressed;
    }

    if (hovered) return MixWidgetState.hovered;

    return MixWidgetState.idle;
  }

  bool get disabled => !enabled;

  @override
  bool updateShouldNotify(WidgetStateModel oldWidget) {
    return oldWidget.enabled != enabled ||
        oldWidget.hovered != hovered ||
        oldWidget.focused != focused ||
        oldWidget.pressed != pressed ||
        oldWidget.longPressed != longPressed ||
        oldWidget.pointerPosition != pointerPosition;
  }

  @override
  bool updateShouldNotifyDependent(
    WidgetStateModel oldWidget,
    Set<WidgetStateAspect> dependencies,
  ) {
    return dependencies.contains(WidgetStateAspect.enabled) &&
            oldWidget.enabled != enabled ||
        dependencies.contains(WidgetStateAspect.hovered) &&
            oldWidget.hovered != hovered ||
        dependencies.contains(WidgetStateAspect.focused) &&
            oldWidget.focused != focused ||
        dependencies.contains(WidgetStateAspect.pressed) &&
            oldWidget.pressed != pressed ||
        dependencies.contains(WidgetStateAspect.longPressed) &&
            oldWidget.longPressed != longPressed ||
        dependencies.contains(WidgetStateAspect.pointerPosition) &&
            oldWidget.pointerPosition != pointerPosition ||
        dependencies.contains(WidgetStateAspect.currentState) &&
            oldWidget.currentState != currentState;
  }
}

class PointerPosition with EqualityMixin {
  final Alignment position;
  final Offset offset;
  const PointerPosition({required this.position, required this.offset});

  @override
  get props => [position, offset];
}
