import 'package:flutter/widgets.dart';

import 'pressable_state.dart';

class PressableNotifier extends InheritedWidget {
  const PressableNotifier({
    super.key,
    required super.child,
    required this.state,
    this.focus = false,
  });

  static PressableNotifier? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PressableNotifier>();
  }

  final PressableState state;

  final bool focus;

  @override
  bool updateShouldNotify(PressableNotifier oldWidget) {
    return oldWidget.focus != focus || oldWidget.state != state;
  }
}
