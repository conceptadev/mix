import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExt on WidgetTester {
  BuildContext findWidgetContext<T extends Widget>() {
    final widgetFinder = find.byType(T);

    // Get BuildContext for boxWidget
    return element(widgetFinder);
  }

  T findWidgetOfType<T extends Widget>() {
    final widgetFinder = find.byType(T);
    final widget = this.widget<T>(widgetFinder);

    return widget;
  }
}
