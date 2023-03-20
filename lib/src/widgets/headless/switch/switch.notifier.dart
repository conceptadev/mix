part of 'switch.widget.dart';

class SwitchXNotifier extends InheritedWidget {
  const SwitchXNotifier({
    Key? key,
    required Widget child,
    this.active = true,
  }) : super(key: key, child: child);

  final bool active;

  static SwitchXNotifier? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SwitchXNotifier>();
  }

  @override
  bool updateShouldNotify(SwitchXNotifier oldWidget) {
    return active != oldWidget.active;
  }
}
