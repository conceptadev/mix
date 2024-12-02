import 'package:flutter/widgets.dart';

enum OnTapEvent {
  up,
  down;
}

class OnTapEventInherited extends InheritedWidget {
  const OnTapEventInherited(this.event, {super.key, required super.child});

  static OnTapEventInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  final OnTapEvent? event;

  @override
  bool updateShouldNotify(OnTapEventInherited oldWidget) {
    return event != oldWidget.event;
  }
}
