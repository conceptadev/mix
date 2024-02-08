import 'package:flutter/widgets.dart';

import '../../helpers/compare_mixin.dart';

@immutable
class PressableStateData with Comparable {
  final bool focused;

  final bool disabled;
  final PressableState state;
  final Alignment cursorAlignment;
  final Offset cursorOffset;

  const PressableStateData({
    required this.focused,
    required this.disabled,
    required this.state,
    required this.cursorAlignment,
    required this.cursorOffset,
  });

  const PressableStateData.none()
      : focused = false,
        disabled = true,
        cursorOffset = Offset.zero,
        cursorAlignment = Alignment.center,
        state = PressableState.none;

  PressableStateData copyWith({
    bool? focused,
    bool? disabled,
    PressableState? state,
    Alignment? cursorAlignment,
    Offset? cursorOffset,
  }) {
    return PressableStateData(
      focused: focused ?? this.focused,
      disabled: disabled ?? this.disabled,
      state: state ?? this.state,
      cursorAlignment: cursorAlignment ?? this.cursorAlignment,
      cursorOffset: cursorOffset ?? this.cursorOffset,
    );
  }

  @override
  get props => [focused, disabled, state];
}

enum PressableState {
  none,
  hovered,
  pressed,
  longPressed,
}

class PressableStateNotifier extends InheritedWidget {
  const PressableStateNotifier({
    super.key,
    required super.child,
    required this.data,
  });

  static PressableStateData? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PressableStateNotifier>()
        ?.data;
  }

  final PressableStateData data;

  @override
  bool updateShouldNotify(PressableStateNotifier oldWidget) {
    return oldWidget.data != data;
  }
}
