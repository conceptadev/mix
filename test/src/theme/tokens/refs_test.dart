import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';
// Import your file where ColorRef is defined

void main() {
  group('ColorRef Tests', () {
    // Constructor Test
    test('Constructor assigns name correctly', () {
      const colorRef = ColorToken('testName');
      expect(colorRef.name, 'testName');
    });

    // Equality Operator Test
    test('Equality operator works correctly', () {
      const colorRef1 = ColorToken('testName');
      const colorRef2 = ColorToken('testName');
      const colorRef3 = ColorToken('differentName');

      expect(colorRef1 == colorRef2, isTrue);
      expect(colorRef1 == colorRef3, isFalse);
      expect(colorRef1 == Object(), isFalse);
    });

    // HashCode Test
    test('hashCode is consistent with name', () {
      const colorRef1 = ColorToken('testName');
      const colorRef2 = ColorToken('testName');
      const colorRef3 = ColorToken('differentName');

      expect(colorRef1.hashCode, colorRef2.hashCode);
      expect(colorRef1.hashCode, isNot(colorRef3.hashCode));
    });

    testWidgets('Test it resolves correctly', (tester) async {
      const redColorRef = ColorToken('red');
      const greenColorRef = ColorToken('green');
      const blueColorRef = ColorToken('blue');
      final theme = MixThemeData(colors: {
        redColorRef: (_) => Colors.red,
        greenColorRef: (_) => Colors.green,
        blueColorRef: (_) => Colors.blue,
      });

      await tester.pumpWidget(createWithMixTheme(theme));

      final context = tester.element(find.byType(Container));

      final mixData = MixData.create(context, StyleMix.empty);

      expect(mixData.resolver.colorToken(redColorRef), Colors.red);
      expect(mixData.resolver.colorToken(greenColorRef), Colors.green);
      expect(mixData.resolver.colorToken(blueColorRef), Colors.blue);
    });
  });

  group('TextStyleRef', () {
    test('Constructor assigns name correctly', () {
      const textStyleRef = TextStyleToken('testName');
      expect(textStyleRef.name, 'testName');
    });

    test('Equality operator works correctly', () {
      const textStyleRef1 = TextStyleToken('testName');
      const textStyleRef2 = TextStyleToken('testName');
      const textStyleRef3 = TextStyleToken('differentName');

      expect(textStyleRef1 == textStyleRef2, isTrue);
      expect(textStyleRef1 == textStyleRef3, isFalse);
      expect(textStyleRef1 == Object(), isFalse);
    });

    test('hashCode is consistent with name', () {
      const textStyleRef1 = TextStyleToken('testName');
      const textStyleRef2 = TextStyleToken('testName');
      const textStyleRef3 = TextStyleToken('differentName');

      expect(textStyleRef1.hashCode, textStyleRef2.hashCode);
      expect(textStyleRef1.hashCode, isNot(textStyleRef3.hashCode));
    });

    testWidgets('Test it resolves correctly', (tester) async {
      const redTextStyleRef = TextStyleToken('red');
      const greenTextStyleRef = TextStyleToken('green');
      const blueTextStyleRef = TextStyleToken('blue');
      final theme = MixThemeData(textStyles: {
        redTextStyleRef: (_) => const TextStyle(color: Colors.red),
        greenTextStyleRef: (_) => const TextStyle(color: Colors.green),
        blueTextStyleRef: (_) => const TextStyle(color: Colors.blue),
      });

      await tester.pumpWidget(createWithMixTheme(theme));

      final context = tester.element(find.byType(Container));

      final mixData = MixData.create(context, StyleMix.empty);

      expect(mixData.resolver.textStyleToken(redTextStyleRef),
          const TextStyle(color: Colors.red));
      expect(mixData.resolver.textStyleToken(greenTextStyleRef),
          const TextStyle(color: Colors.green));
      expect(mixData.resolver.textStyleToken(blueTextStyleRef),
          const TextStyle(color: Colors.blue));
    });
  });
}
