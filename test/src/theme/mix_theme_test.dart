import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  const primaryColor = ColorToken('primary');
  group('MixTheme', () {
    testWidgets('MixTheme.of', (tester) async {
      final theme = MixThemeData(
        colors: {
          primaryColor: Colors.blue,
        },
      );

      await tester.pumpWithMixTheme(Container(), theme: theme);

      final context = tester.element(find.byType(Container));

      expect(MixTheme.of(context), theme);
      expect(MixTheme.maybeOf(context), theme);
    });

    // maybeOf
    testWidgets('MixTheme.maybeOf', (tester) async {
      await tester.pumpMaterialApp(Container());

      final context = tester.element(find.byType(Container));

      expect(MixTheme.maybeOf(context), null);
      expect(() => MixTheme.of(context), throwsAssertionError);
    });
  });
}
