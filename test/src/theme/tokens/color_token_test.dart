import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('ColorToken Tests', () {
    // Constructor Test
    test('Constructor assigns name correctly', () {
      const colorToken = ColorToken('testName');
      expect(colorToken.name, 'testName');
      expect(colorToken().token, colorToken);
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
      final theme = MixThemeData(
        colors: {
          greencolorToken: Colors.green,
          redcolorToken: Colors.redAccent,
          bluecolorToken: Colors.blueAccent,
        },
      );

      await tester.pumpWidget(createWithMixTheme(theme));

      final context = tester.element(find.byType(Container));

      final mixData = MixData.create(context, const StyleMix.empty());

      expect(mixData.tokens.colorToken(redcolorToken), Colors.redAccent);
      expect(mixData.tokens.colorToken(greencolorToken), Colors.green);
      expect(mixData.tokens.colorToken(bluecolorToken), Colors.blueAccent);
    });
  });
}
