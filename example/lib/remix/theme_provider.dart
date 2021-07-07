import 'package:example/remix/theme.dart';
import 'package:flutter/material.dart';

class RemixTheme extends StatelessWidget {
  const RemixTheme({
    required this.data,
    required this.child,
    Key? key,
  }) : super(key: key);

  final RemixThemeData data;
  final Widget child;

  static RemixThemeData of(BuildContext context) {
    final _InheritedRemixTheme? inheritedRemixTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedRemixTheme>();
    return (inheritedRemixTheme?.theme.data ??
        RemixThemeData.fallback(Theme.of(context)));
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedRemixTheme(
      theme: this,
      child: child,
    );
  }
}

class _InheritedRemixTheme extends InheritedWidget {
  _InheritedRemixTheme({Key? key, required Widget child, required this.theme})
      : super(key: key, child: child);
  final RemixTheme theme;
  @override
  // Always rebuild children if state changes
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
