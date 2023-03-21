import 'package:flutter/material.dart';

import 'mix_context_data.dart';

class MixContext extends InheritedWidget {
  const MixContext(
    this.mixContext, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final MixContextData? mixContext;

  static MixContextData? of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<MixContext>();

    return widget?.mixContext;
  }

  @override
  bool updateShouldNotify(MixContext oldWidget) {
    return mixContext != oldWidget.mixContext;
  }
}
