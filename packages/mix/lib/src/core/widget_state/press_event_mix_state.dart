import 'package:flutter/widgets.dart';

enum PressEvent {
  idle,
  onTapUp,
  onTapDown;
}

class PressEventMixWidgetState extends InheritedWidget {
  const PressEventMixWidgetState(this.event, {super.key, required super.child});

  static PressEventMixWidgetState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  final PressEvent event;

  @override
  bool updateShouldNotify(PressEventMixWidgetState oldWidget) {
    return event != oldWidget.event;
  }
}
