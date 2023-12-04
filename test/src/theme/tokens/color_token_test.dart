import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('ColorToken Tests', () {
    // Constructor Test
    test('Constructor assigns name correctly', () {
      const colorToken = ColorToken('testName', Colors.black);
      expect(colorToken.name, 'testName');
      expect(colorToken.value, Colors.black);
    });

    // Equality Operator Test
    test('Equality operator works correctly', () {
      const colorToken1 = ColorToken('testName', Colors.black);
      const colorToken2 = ColorToken('testName', Colors.black);
      const colorToken3 = ColorToken('testName', Colors.black12);
      const colorToken4 = ColorToken('differentName', Colors.black);

      expect(colorToken1 == colorToken2, isTrue);
      expect(colorToken1 == colorToken3, isFalse);
      expect(colorToken1 == colorToken4, isFalse);
      expect(colorToken1 == Object(), isFalse);
    });

    // HashCode Test
    test('hashCode is consistent with name', () {
      const colorToken1 = ColorToken('testName', Colors.black);
      const colorToken2 = ColorToken('testName', Colors.black);
      const colorToken3 = ColorToken('differentName', Colors.black);

      expect(colorToken1.hashCode, colorToken2.hashCode);
      expect(colorToken1.hashCode, isNot(colorToken3.hashCode));
    });

    testWidgets('Test it resolves correctly', (tester) async {
      const redcolorToken = ColorToken('red', Colors.red);
      const greencolorToken = ColorToken('green', Colors.green);
      const bluecolorToken = ColorToken('blue', Colors.blue);
      final theme = MixThemeData.tokenMap(
        colors: {
          redcolorToken: (_) => Colors.redAccent,
          bluecolorToken: (_) => Colors.blueAccent,
        },
      );

      await tester.pumpWidget(createWithMixTheme(theme));

      final context = tester.element(find.byType(Container));

      final mixData = MixData.create(context, StyleMix.empty);

      expect(mixData.tokens.colorToken(redcolorToken), Colors.redAccent);
      expect(mixData.tokens.colorToken(greencolorToken), Colors.green);
      expect(mixData.tokens.colorToken(bluecolorToken), Colors.blueAccent);
    });
  });

  group('ColorToken.resolvable', () {
    test('Constructor assigns name correctly', () {
      final colorToken = ColorToken.resolvable('testName', (_) => Colors.red);
      expect(colorToken.name, 'testName');
    });

    // Equality Operator Test
    test('Equality operator works correctly', () {
      final colorToken1 = ColorToken.resolvable('testName', (_) => Colors.red);
      final colorToken2 = ColorToken.resolvable('testName', (_) => Colors.red);
      final colorToken3 =
          ColorToken.resolvable('differentName', (_) => Colors.red);

      expect(colorToken1 == colorToken2, isTrue);
      expect(colorToken1 == colorToken3, isFalse);
      expect(colorToken1 == Object(), isFalse);
    });

    // HashCode Test
    test('hashCode is consistent with name', () {
      final colorToken1 = ColorToken.resolvable('testName', (_) => Colors.red);
      final colorToken2 = ColorToken.resolvable('testName', (_) => Colors.red);
      final colorToken3 =
          ColorToken.resolvable('differentName', (_) => Colors.red);

      expect(colorToken1.hashCode, colorToken2.hashCode);
      expect(colorToken1.hashCode, isNot(colorToken3.hashCode));
    });

    testWidgets('Test it resolves correctly', (tester) async {
      final redcolorToken = ColorToken.resolvable('red', (_) => Colors.red);
      final greencolorToken =
          ColorToken.resolvable('green', (_) => Colors.green);
      final bluecolorToken = ColorToken.resolvable('blue', (_) => Colors.blue);

      await tester.pumpMaterialApp(Container());

      final context = tester.element(find.byType(Container));

      final mixData = MixData.create(context, StyleMix.empty);

      expect(mixData.tokens.colorToken(redcolorToken), Colors.red);
      expect(mixData.tokens.colorToken(greencolorToken), Colors.green);
      expect(mixData.tokens.colorToken(bluecolorToken), Colors.blue);
    });
  });
}
