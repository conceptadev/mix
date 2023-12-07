import 'package:flutter/widgets.dart';

import '../../helpers/compare_mixin.dart';

@immutable
class GestureData with Comparable {
  final bool focus;
  final bool hover;
  final GestureStatus status;
  final GestureState state;

  const GestureData({
    required this.focus,
    required this.status,
    required this.state,
    required this.hover,
  });

  const GestureData.none()
      : focus = false,
        hover = false,
        status = GestureStatus.disabled,
        state = GestureState.none;

  GestureData copyWith({
    bool? focus,
    bool? hover,
    GestureStatus? status,
    GestureState? state,
  }) {
    return GestureData(
      focus: focus ?? this.focus,
      status: status ?? this.status,
      state: state ?? this.state,
      hover: hover ?? this.hover,
    );
  }

  @override
  get props => [focus, status, state, hover];
}

enum GestureStatus {
  enabled,
  disabled,
}

enum GestureState {
  none,
  pressed,
  longPressed,
}

class GestureStateNotifier extends InheritedWidget {
  const GestureStateNotifier({
    super.key,
    required super.child,
    required this.data,
  });

  static GestureData? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GestureStateNotifier>()
        ?.data;
  }

  final GestureData data;

  @override
  bool updateShouldNotify(GestureStateNotifier oldWidget) {
    return oldWidget.data != data;
  }
}
