import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/theme/tokens/color_token.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('ColorToken Tests', () {
    // Constructor Test
    test('Constructor assigns name correctly', () {
      const colorToken = ColorToken('testName');
      expect(colorToken.name, 'testName');
    });

    // Equality Operator Test
    test('Equality operator works correctly', () {
      const colorToken1 = ColorToken('testName');
      const colorToken2 = ColorToken('testName');
      const colorToken3 = ColorToken('differentName');

      expect(colorToken1 == colorToken2, isTrue);
      expect(colorToken1 == colorToken3, isFalse);
      expect(colorToken1 == Object(), isFalse);
    });

    // HashCode Test
    test('hashCode is consistent with name', () {
      const colorToken1 = ColorToken('testName');
      const colorToken2 = ColorToken('testName');
      const colorToken3 = ColorToken('differentName');

      expect(colorToken1.hashCode, colorToken2.hashCode);
      expect(colorToken1.hashCode, isNot(colorToken3.hashCode));
    });

    testWidgets('Test it resolves correctly', (tester) async {
      const redcolorToken = ColorToken('red');
      const greencolorToken = ColorToken('green');
      const bluecolorToken = ColorToken('blue');
      final theme = MixThemeData(colors: {
        redcolorToken: (_) => Colors.red,
        greencolorToken: (_) => Colors.green,
        bluecolorToken: (_) => Colors.blue,
      });

      await tester.pumpWidget(createWithMixTheme(theme));

      final context = tester.element(find.byType(Container));

      final mixData = MixData.create(context, StyleMix.empty);

      expect(mixData.resolver.colorToken(redcolorToken), Colors.red);
      expect(mixData.resolver.colorToken(greencolorToken), Colors.green);
      expect(mixData.resolver.colorToken(bluecolorToken), Colors.blue);
    });
  });

  group('ColorResolvableToken', () {
    test('Constructor assigns name correctly', () {
      final colorToken = ColorTokenResolver('testName', (_) => Colors.red);
      expect(colorToken.name, 'testName');
    });

    // Equality Operator Test
    test('Equality operator works correctly', () {
      final colorToken1 = ColorTokenResolver('testName', (_) => Colors.red);
      final colorToken2 = ColorTokenResolver('testName', (_) => Colors.red);
      final colorToken3 =
          ColorTokenResolver('differentName', (_) => Colors.red);

      expect(colorToken1 == colorToken2, isTrue);
      expect(colorToken1 == colorToken3, isFalse);
      expect(colorToken1 == Object(), isFalse);
    });

    // HashCode Test
    test('hashCode is consistent with name', () {
      final colorToken1 = ColorTokenResolver('testName', (_) => Colors.red);
      final colorToken2 = ColorTokenResolver('testName', (_) => Colors.red);
      final colorToken3 =
          ColorTokenResolver('differentName', (_) => Colors.red);

      expect(colorToken1.hashCode, colorToken2.hashCode);
      expect(colorToken1.hashCode, isNot(colorToken3.hashCode));
    });

    testWidgets('Test it resolves correctly', (tester) async {
      final redcolorToken = ColorTokenResolver('red', (_) => Colors.red);
      final greencolorToken = ColorTokenResolver('green', (_) => Colors.green);
      final bluecolorToken = ColorTokenResolver('blue', (_) => Colors.blue);

      await tester.pumpMaterialApp(Container());

      final context = tester.element(find.byType(Container));

      final mixData = MixData.create(context, StyleMix.empty);

      expect(mixData.resolver.colorToken(redcolorToken), Colors.red);
      expect(mixData.resolver.colorToken(greencolorToken), Colors.green);
      expect(mixData.resolver.colorToken(bluecolorToken), Colors.blue);
    });
  });
}
