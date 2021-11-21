import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class MixContextNotifier extends InheritedWidget {
  const MixContextNotifier(
    this.mixContext, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final MixContext? mixContext;

  static MixContext? of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<MixContextNotifier>();
    return widget?.mixContext;
  }

  @override
  bool updateShouldNotify(MixContextNotifier oldWidget) {
    return mixContext != oldWidget.mixContext;
  }
}
