import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/utils/context_variant_util/on_brightness_util.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('Brightness Utils', () {
    testWidgets('onLight context variant', (tester) async {
      await tester.pumpWidget(createBrightnessTheme(Brightness.light));
      var context = tester.element(find.byType(Container));

      expect(onLight.when(context), true, reason: 'light');
      expect(onDark.when(context), false, reason: 'dark');
    });

    testWidgets('onDark context variant', (widgetTester) async {
      await widgetTester.pumpWidget(createBrightnessTheme(Brightness.dark));
      var context = widgetTester.element(find.byType(Container));

      expect(onLight.when(context), false, reason: 'light');
      expect(onDark.when(context), true, reason: 'dark');
    });
    test('have correct variant names', () {
      expect(onLight.name, 'on-light');
      expect(onDark.name, 'on-dark');
    });
  });
}
