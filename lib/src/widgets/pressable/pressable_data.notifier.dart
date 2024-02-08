import 'package:flutter/widgets.dart';

import '../../helpers/compare_mixin.dart';

enum PressableDataAspect { focused, disabled, state, cursorPosition }

@immutable
class PressableCursorPosition {
  final Alignment alignment;
  final Offset offset;

  const PressableCursorPosition({
    required this.alignment,
    required this.offset,
  });
}

@immutable
class PressableStateData with Comparable {
  final bool focused;

  final bool disabled;
  final PressableState state;
  final PressableCursorPosition cursorPosition;

  const PressableStateData({
    required this.focused,
    required this.disabled,
    required this.state,
    required this.cursorPosition,
  });

  const PressableStateData.none()
      : focused = false,
        disabled = true,
        cursorPosition = const PressableCursorPosition(
          alignment: Alignment.center,
          offset: Offset.zero,
        ),
        state = PressableState.none;

  PressableStateData copyWith({
    bool? focused,
    bool? disabled,
    PressableState? state,
    PressableCursorPosition? cursorPosition,
  }) {
    return PressableStateData(
      focused: focused ?? this.focused,
      disabled: disabled ?? this.disabled,
      state: state ?? this.state,
      cursorPosition: cursorPosition ?? this.cursorPosition,
    );
  }

  @override
  get props => [focused, disabled, state, cursorPosition];
}

enum PressableState {
  none,
  hovered,
  pressed,
  longPressed,
}

class PressableDataNotifier extends InheritedModel<PressableDataAspect> {
  const PressableDataNotifier({
    super.key,
    required super.child,
    required this.data,
  });

  static PressableStateData of(
    BuildContext context, {
    PressableDataAspect? aspect,
  }) {
    final model = InheritedModel.inheritFrom<PressableDataNotifier>(
      context,
      aspect: aspect,
    );

    assert(model != null, 'PressableDataNotifier not found in widget tree.');

    return model!.data;
  }

  static bool isDisabledOf(BuildContext context) {
    return of(context, aspect: PressableDataAspect.disabled).disabled;
  }

  static PressableCursorPosition cursorPositionOf(BuildContext context) {
    return of(context, aspect: PressableDataAspect.cursorPosition)
        .cursorPosition;
  }

  static bool isFocusedOf(BuildContext context) {
    return of(context, aspect: PressableDataAspect.focused).focused;
  }

  static PressableState stateOf(BuildContext context) {
    return of(context, aspect: PressableDataAspect.state).state;
  }

  final PressableStateData data;

  @override
  bool updateShouldNotify(PressableDataNotifier oldWidget) {
    return oldWidget.data != data;
  }

  @override
  bool updateShouldNotifyDependent(
    PressableDataNotifier oldWidget,
    Set<PressableDataAspect> dependencies,
  ) {
    if (oldWidget.data.focused != data.focused &&
        dependencies.contains(PressableDataAspect.focused)) {
      return true;
    }
    if (oldWidget.data.disabled != data.disabled &&
        dependencies.contains(PressableDataAspect.disabled)) {
      return true;
    }

    if (oldWidget.data.state != data.state &&
        dependencies.contains(PressableDataAspect.state)) {
      return true;
    }

    return false;
  }
}
