// ignore_for_file: avoid-inferrable-type-arguments

import 'package:flutter/widgets.dart';

import '../../helpers/compare_mixin.dart';

enum PressableStateAspect {
  currentState,
  enabled,
  hovered,
  focused,
  pressed,
  longPressed,
  pointerPosition
}

enum PressableCurrentState {
  idle,
  hovered,
  pressed,
  longPressed,
}

class PressableState extends InheritedModel<PressableStateAspect> {
  const PressableState({
    super.key,
    required super.child,
    required this.enabled,
    required this.hovered,
    required this.focused,
    required this.pressed,
    required this.longPressed,
    required this.pointerPosition,
  });

  factory PressableState.none({Key? key, required Widget child}) {
    return PressableState(
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

  static PressableState of(
    BuildContext context, [
    PressableStateAspect? aspect,
  ]) {
    final PressableState? result = maybeOf(context, aspect);
    assert(result != null, 'Unable to find an instance of PressableState...');

    return result!;
  }

  static PressableState? maybeOf(
    BuildContext context, [
    PressableStateAspect? aspect,
  ]) {
    return InheritedModel.inheritFrom<PressableState>(context, aspect: aspect);
  }

  static PressableState aspectOf(
    BuildContext context,
    PressableStateAspect aspect,
  ) {
    return of(context, aspect);
  }

  static bool enabledOf(BuildContext context) {
    return of(context, PressableStateAspect.enabled).enabled;
  }

  static bool disabledOf(BuildContext context) {
    return !enabledOf(context);
  }

  static bool hoverOf(BuildContext context) {
    return of(context, PressableStateAspect.hovered).hovered;
  }

  static bool focusOf(BuildContext context) {
    return of(context, PressableStateAspect.focused).focused;
  }

  static bool pressOf(BuildContext context) {
    return of(context, PressableStateAspect.pressed).pressed;
  }

  static bool longPressOf(BuildContext context) {
    return of(context, PressableStateAspect.longPressed).longPressed;
  }

  static PointerPosition? pointerPositionOf(BuildContext context) {
    return of(context, PressableStateAspect.pointerPosition).pointerPosition;
  }

  static PressableCurrentState stateOf(BuildContext context) {
    return of(context, PressableStateAspect.currentState).currentState;
  }

  final bool enabled;
  final bool hovered;
  final bool focused;
  final bool pressed;
  final bool longPressed;

  final PointerPosition? pointerPosition;

  PressableCurrentState get currentState {
    if (enabled) {
      // Long pressed has priority over pressed
      // Due to delay of removing the _press state
      if (longPressed) return PressableCurrentState.longPressed;

      if (pressed) return PressableCurrentState.pressed;
    }

    if (hovered) return PressableCurrentState.hovered;

    return PressableCurrentState.idle;
  }

  bool get disabled => !enabled;

  @override
  bool updateShouldNotify(PressableState oldWidget) {
    return oldWidget.enabled != enabled ||
        oldWidget.hovered != hovered ||
        oldWidget.focused != focused ||
        oldWidget.pressed != pressed ||
        oldWidget.longPressed != longPressed ||
        oldWidget.pointerPosition != pointerPosition;
  }

  @override
  bool updateShouldNotifyDependent(
    PressableState oldWidget,
    Set<PressableStateAspect> dependencies,
  ) {
    return dependencies.contains(PressableStateAspect.enabled) &&
            oldWidget.enabled != enabled ||
        dependencies.contains(PressableStateAspect.hovered) &&
            oldWidget.hovered != hovered ||
        dependencies.contains(PressableStateAspect.focused) &&
            oldWidget.focused != focused ||
        dependencies.contains(PressableStateAspect.pressed) &&
            oldWidget.pressed != pressed ||
        dependencies.contains(PressableStateAspect.longPressed) &&
            oldWidget.longPressed != longPressed ||
        dependencies.contains(PressableStateAspect.pointerPosition) &&
            oldWidget.pointerPosition != pointerPosition ||
        dependencies.contains(PressableStateAspect.currentState) &&
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
