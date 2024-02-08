import 'package:flutter/widgets.dart';

import '../../helpers/compare_mixin.dart';

@immutable
class PressableStateData with Comparable {
  final bool focus;

  final bool disabled;
  final PressableState state;

  const PressableStateData({
    required this.focus,
    required this.disabled,
    required this.state,
  });

  const PressableStateData.none()
      : focus = false,
        disabled = true,
        state = PressableState.none;

  PressableStateData copyWith({
    bool? focus,
    bool? disabled,
    PressableState? state,
  }) {
    return PressableStateData(
      focus: focus ?? this.focus,
      disabled: disabled ?? this.disabled,
      state: state ?? this.state,
    );
  }

  @override
  get props => [focus, disabled, state];
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
