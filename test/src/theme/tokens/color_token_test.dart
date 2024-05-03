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

      final mixData = MixData.create(context, const Style.empty());

      expect(mixData.tokens.colorToken(redcolorToken), Colors.redAccent);
      expect(mixData.tokens.colorToken(greencolorToken), Colors.green);
      expect(mixData.tokens.colorToken(bluecolorToken), Colors.blueAccent);
    });
  });

  group('ColorResolver Tests', () {
    testWidgets('ColorResolver resolves color dynamically', (tester) async {
      const colorToken = ColorToken('dynamicColor');
      final theme = MixThemeData(
        colors: {
          colorToken: ColorResolver((context) {
            final brightness = MediaQuery.of(context).platformBrightness;
            return brightness == Brightness.dark ? Colors.white : Colors.black;
          }),
        },
      );
      // set brightness to dark on the next pump widget
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(platformBrightness: Brightness.dark),
          child: MixTheme(
            data: theme,
            child: Container(),
          ),
        ),
      );

      final context = tester.element(find.byType(Container));
      final mixData = MixData.create(context, const Style.empty());

      expect(mixData.tokens.colorToken(colorToken), Colors.white);

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(platformBrightness: Brightness.light),
          child: MixTheme(
            data: theme,
            child: Container(),
          ),
        ),
      );
      expect(mixData.tokens.colorToken(colorToken), Colors.black);
    });

    testWidgets('ColorResolver returns transparent color when null',
        (tester) async {
      const colorToken = ColorToken('nullColor');
      final theme = MixThemeData(
        colors: {
          colorToken: ColorResolver((_) => Colors.transparent),
        },
      );

      await tester.pumpWidget(createWithMixTheme(theme));

      final context = tester.element(find.byType(Container));
      final mixData = MixData.create(context, const Style.empty());

      expect(mixData.tokens.colorToken(colorToken), Colors.transparent);
    });
  });

  group('ColorRef Tests', () {
    test('ColorRef equality works correctly', () {
      const colorToken = ColorToken('testColor');
      const colorRef1 = ColorRef(colorToken);
      const colorRef2 = ColorRef(colorToken);

      expect(colorRef1 == colorRef2, isTrue);
      expect(colorRef1 == Object(), isFalse);
    });

    test('ColorRef hashCode is consistent with token', () {
      const colorToken = ColorToken('testColor');
      const colorRef1 = ColorRef(colorToken);
      const colorRef2 = ColorRef(colorToken);

      expect(colorRef1.hashCode, colorRef2.hashCode);
    });
  });
}
