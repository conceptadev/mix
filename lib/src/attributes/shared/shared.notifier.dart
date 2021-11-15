import 'package:flutter/material.dart';
import 'package:mix/src/attributes/shared/shared.attributes.dart';

class SharedAttributeNotifier extends InheritedWidget {
  const SharedAttributeNotifier({
    Key? key,
    required Widget child,
    this.attributes,
  }) : super(key: key, child: child);

  final SharedAttributes? attributes;

  static SharedAttributes? of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<SharedAttributeNotifier>();
    return widget?.attributes;
  }

  @override
  bool updateShouldNotify(SharedAttributeNotifier oldWidget) {
    return attributes != oldWidget.attributes;
  }
}
