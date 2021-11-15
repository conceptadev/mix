import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../exports.dart';

class TextAttributeNotifier extends InheritedWidget {
  const TextAttributeNotifier({
    Key? key,
    required Widget child,
    this.attributes,
  }) : super(key: key, child: child);

  final TextAttributes? attributes;

  static TextAttributes? of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<TextAttributeNotifier>();
    return widget?.attributes;
  }

  @override
  bool updateShouldNotify(TextAttributeNotifier oldWidget) {
    return attributes != oldWidget.attributes;
  }
}
