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

  // ResolvableColorToken
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

    group('TextStyleToken', () {
      test('Constructor assigns name correctly', () {
        const textStyleToken = TextStyleToken('testName');
        expect(textStyleToken.name, 'testName');
      });

      test('Equality operator works correctly', () {
        const textStyleToken1 = TextStyleToken('testName');
        const textStyleToken2 = TextStyleToken('testName');
        const textStyleToken3 = TextStyleToken('differentName');

        expect(textStyleToken1 == textStyleToken2, isTrue);
        expect(textStyleToken1 == textStyleToken3, isFalse);
        expect(textStyleToken1 == Object(), isFalse);
      });

      test('hashCode is consistent with name', () {
        const textStyleToken1 = TextStyleToken('testName');
        const textStyleToken2 = TextStyleToken('testName');
        const textStyleToken3 = TextStyleToken('differentName');

        expect(textStyleToken1.hashCode, textStyleToken2.hashCode);
        expect(textStyleToken1.hashCode, isNot(textStyleToken3.hashCode));
      });

      testWidgets('Test it resolves correctly', (tester) async {
        const redtextStyleToken = TextStyleToken('red');
        const greentextStyleToken = TextStyleToken('green');
        const bluetextStyleToken = TextStyleToken('blue');
        final theme = MixThemeData(
          textStyles: {
            redtextStyleToken: (_) => const TextStyle(color: Colors.red),
            greentextStyleToken: (_) => const TextStyle(color: Colors.green),
            bluetextStyleToken: (_) => const TextStyle(color: Colors.blue),
          },
        );

        await tester.pumpWidget(createWithMixTheme(theme));

        final context = tester.element(find.byType(Container));

        final mixData = MixData.create(context, StyleMix.empty);

        expect(mixData.resolver.textStyleToken(redtextStyleToken),
            const TextStyle(color: Colors.red));
        expect(mixData.resolver.textStyleToken(greentextStyleToken),
            const TextStyle(color: Colors.green));
        expect(mixData.resolver.textStyleToken(bluetextStyleToken),
            const TextStyle(color: Colors.blue));
      });
    });

    // Resolvable TextStyle Token
    group('TextStyleResolvableToken', () {
      test('Constructor assigns name correctly', () {
        final textStyleToken =
            TextStyleTokenResolver('testName', (_) => const TextStyle());
        expect(textStyleToken.name, 'testName');
      });

      test('Equality operator works correctly', () {
        final textStyleToken1 =
            TextStyleTokenResolver('testName', (_) => const TextStyle());
        final textStyleToken2 =
            TextStyleTokenResolver('testName', (_) => const TextStyle());
        final textStyleToken3 =
            TextStyleTokenResolver('differentName', (_) => const TextStyle());

        expect(textStyleToken1 == textStyleToken2, isTrue);
        expect(textStyleToken1 == textStyleToken3, isFalse);
        expect(textStyleToken1 == Object(), isFalse);
      });

      test('hashCode is consistent with name', () {
        final textStyleToken1 =
            TextStyleTokenResolver('testName', (_) => const TextStyle());
        final textStyleToken2 =
            TextStyleTokenResolver('testName', (_) => const TextStyle());
        final textStyleToken3 =
            TextStyleTokenResolver('differentName', (_) => const TextStyle());

        expect(textStyleToken1.hashCode, textStyleToken2.hashCode);
        expect(textStyleToken1.hashCode, isNot(textStyleToken3.hashCode));
      });

      testWidgets('Test it resolves correctly', (tester) async {
        final redtextStyleToken = TextStyleTokenResolver(
            'red', (_) => const TextStyle(color: Colors.red));
        final greentextStyleToken = TextStyleTokenResolver(
            'green', (_) => const TextStyle(color: Colors.green));
        final bluetextStyleToken = TextStyleTokenResolver(
            'blue', (_) => const TextStyle(color: Colors.blue));

        await tester.pumpMaterialApp(Container());

        final context = tester.element(find.byType(Container));

        final mixData = MixData.create(context, StyleMix.empty);

        expect(mixData.resolver.textStyleToken(redtextStyleToken),
            const TextStyle(color: Colors.red));
        expect(mixData.resolver.textStyleToken(greentextStyleToken),
            const TextStyle(color: Colors.green));
        expect(mixData.resolver.textStyleToken(bluetextStyleToken),
            const TextStyle(color: Colors.blue));
      });
    });

    group('RadiiToken', () {
      test('Constructor assigns name correctly', () {
        const radiusRef = RadiusToken('testName');
        expect(radiusRef.name, 'testName');
      });

      test('Equality operator works correctly', () {
        const radiusRef1 = RadiusToken('testName');
        const radiusRef2 = RadiusToken('testName');
        const radiusRef3 = RadiusToken('differentName');

        expect(radiusRef1 == radiusRef2, isTrue);
        expect(radiusRef1 == radiusRef3, isFalse);
        expect(radiusRef1 == Object(), isFalse);
      });

      test('hashCode is consistent with name', () {
        const radiusRef1 = RadiusToken('testName');
        const radiusRef2 = RadiusToken('testName');
        const radiusRef3 = RadiusToken('differentName');

        expect(radiusRef1.hashCode, radiusRef2.hashCode);
        expect(radiusRef1.hashCode, isNot(radiusRef3.hashCode));
      });

      testWidgets('Test it resolves correctly', (tester) async {
        const redRadiusRef = RadiusToken('red');
        const greenRadiusRef = RadiusToken('green');
        const blueRadiusRef = RadiusToken('blue');
        final theme = MixThemeData(radii: {
          redRadiusRef: (_) => const Radius.circular(1),
          greenRadiusRef: (_) => const Radius.circular(2),
          blueRadiusRef: (_) => const Radius.circular(3),
        });

        await tester.pumpWidget(createWithMixTheme(theme));

        final context = tester.element(find.byType(Container));

        final mixData = MixData.create(context, StyleMix.empty);

        expect(mixData.resolver.radiiToken(redRadiusRef),
            const Radius.circular(1));
        expect(mixData.resolver.radiiToken(greenRadiusRef),
            const Radius.circular(2));
        expect(mixData.resolver.radiiToken(blueRadiusRef),
            const Radius.circular(3));
      });
    });
  });

  group('RadiusResolvableToken', () {
    test('Constructor assigns name correctly', () {
      final radiusRef = RadiusTokenResolver('testName', (_) => Radius.zero);
      expect(radiusRef.name, 'testName');
    });

    test('Equality operator works correctly', () {
      final radiusRef1 =
          RadiusTokenResolver('testName', (_) => const Radius.circular(1));
      final radiusRef2 =
          RadiusTokenResolver('testName', (_) => const Radius.circular(1));
      final radiusRef3 =
          RadiusTokenResolver('differentName', (_) => const Radius.circular(1));

      expect(radiusRef1 == radiusRef2, isTrue);
      expect(radiusRef1 == radiusRef3, isFalse);
      expect(radiusRef1 == Object(), isFalse);
    });

    test('hashCode is consistent with name', () {
      final radiusRef1 =
          RadiusTokenResolver('testName', (_) => const Radius.circular(1));
      final radiusRef2 =
          RadiusTokenResolver('testName', (_) => const Radius.circular(1));
      final radiusRef3 =
          RadiusTokenResolver('differentName', (_) => const Radius.circular(1));

      expect(radiusRef1.hashCode, radiusRef2.hashCode);
      expect(radiusRef1.hashCode, isNot(radiusRef3.hashCode));
    });

    testWidgets('Test it resolves correctly', (tester) async {
      final redRadiusRef =
          RadiusTokenResolver('red', (_) => const Radius.circular(1));
      final greenRadiusRef =
          RadiusTokenResolver('green', (_) => const Radius.circular(2));
      final blueRadiusRef =
          RadiusTokenResolver('blue', (_) => const Radius.circular(3));

      await tester.pumpMaterialApp(Container());

      final context = tester.element(find.byType(Container));

      final mixData = MixData.create(context, StyleMix.empty);

      expect(
          mixData.resolver.radiiToken(redRadiusRef), const Radius.circular(1));
      expect(mixData.resolver.radiiToken(greenRadiusRef),
          const Radius.circular(2));
      expect(
          mixData.resolver.radiiToken(blueRadiusRef), const Radius.circular(3));
    });
  });
}
