import 'package:flutter/widgets.dart';

import '../../helpers/compare_mixin.dart';

@immutable
class WidgetStateData with Comparable {
  final bool focus;
  final bool hover;
  final WidgetStatus status;
  final WidgetState state;

  const WidgetStateData({
    required this.focus,
    required this.status,
    required this.state,
    required this.hover,
  });

  const WidgetStateData.none()
      : focus = false,
        hover = false,
        status = WidgetStatus.disabled,
        state = WidgetState.none;

  WidgetStateData copyWith({
    bool? focus,
    bool? hover,
    WidgetStatus? status,
    WidgetState? state,
  }) {
    return WidgetStateData(
      focus: focus ?? this.focus,
      status: status ?? this.status,
      state: state ?? this.state,
      hover: hover ?? this.hover,
    );
  }

  @override
  get props => [focus, status, state, hover];
}

enum WidgetStatus {
  enabled,
  disabled,
}

enum WidgetState {
  none,
  pressed,
  longPressed,
}

class WidgetStateNotifier extends InheritedWidget {
  const WidgetStateNotifier({
    super.key,
    required super.child,
    required this.data,
  });

  static WidgetStateData? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<WidgetStateNotifier>()
        ?.data;
  }

  final WidgetStateData data;

  @override
  bool updateShouldNotify(WidgetStateNotifier oldWidget) {
    return oldWidget.data != data;
  }
}
