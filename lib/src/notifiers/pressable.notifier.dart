import 'package:flutter/widgets.dart';

class PressableNotifier extends InheritedWidget {
  const PressableNotifier({
    Key? key,
    required Widget child,
    this.hovering = false,
    this.pressing = false,
    this.focused = false,
    this.disabled = false,
  }) : super(key: key, child: child);

  final bool hovering;
  final bool pressing;
  final bool focused;
  final bool disabled;

  bool get isNone => !hovering && !pressing && !focused && !disabled;

  static PressableNotifier? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PressableNotifier>();
  }

  @override
  bool updateShouldNotify(PressableNotifier oldWidget) {
    return hovering != oldWidget.hovering ||
        pressing != oldWidget.pressing ||
        focused != oldWidget.focused ||
        disabled != oldWidget.disabled;
  }
}
