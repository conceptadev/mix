import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/utils/context_variant_util/on_brightness_util.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('Brightness Utils', () {
    testWidgets('onLight context variant', (tester) async {
      await tester.pumpWidget(createBrightnessTheme(Brightness.light));
      var context = tester.element(find.byType(Container));

      expect(onLight.build(context), true, reason: 'light');
      expect(onDark.build(context), false, reason: 'dark');
    });

    testWidgets('onDark context variant', (widgetTester) async {
      await widgetTester.pumpWidget(createBrightnessTheme(Brightness.dark));
      var context = widgetTester.element(find.byType(Container));

      expect(onLight.build(context), false, reason: 'light');
      expect(onDark.build(context), true, reason: 'dark');
    });
  });
}
