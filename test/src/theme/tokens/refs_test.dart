import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';
// Import your file where ColorRef is defined

void main() {
  group('ColorRef Tests', () {
    // Constructor Test
    test('Constructor assigns name correctly', () {
      const colorRef = ColorRef('testName');
      expect(colorRef.name, 'testName');
    });

    // Equality Operator Test
    test('Equality operator works correctly', () {
      const colorRef1 = ColorRef('testName');
      const colorRef2 = ColorRef('testName');
      const colorRef3 = ColorRef('differentName');

      expect(colorRef1 == colorRef2, isTrue);
      expect(colorRef1 == colorRef3, isFalse);
      expect(colorRef1 == Object(), isFalse);
    });

    // HashCode Test
    test('hashCode is consistent with name', () {
      const colorRef1 = ColorRef('testName');
      const colorRef2 = ColorRef('testName');
      const colorRef3 = ColorRef('differentName');

      expect(colorRef1.hashCode, colorRef2.hashCode);
      expect(colorRef1.hashCode, isNot(colorRef3.hashCode));
    });

    testWidgets('Test it resolves correctly', (tester) async {
      const redColorRef = ColorRef('red');
      const greenColorRef = ColorRef('green');
      const blueColorRef = ColorRef('blue');
      final theme = MixThemeData(colors: {
        redColorRef: (_) => Colors.red,
        greenColorRef: (_) => Colors.green,
        blueColorRef: (_) => Colors.blue,
      });

      await tester.pumpWidget(createWithMixTheme(theme));

      final context = tester.element(find.byType(Container));

      final mixData = MixData.create(context, StyleMix.empty);

      expect(redColorRef.resolve(mixData), Colors.red);
      expect(greenColorRef.resolve(mixData), Colors.green);
      expect(blueColorRef.resolve(mixData), Colors.blue);
    });
  });

  group('TextStyleRef', () {
    test('Constructor assigns name correctly', () {
      const textStyleRef = TextStyleRef('testName');
      expect(textStyleRef.name, 'testName');
    });

    test('Equality operator works correctly', () {
      const textStyleRef1 = TextStyleRef('testName');
      const textStyleRef2 = TextStyleRef('testName');
      const textStyleRef3 = TextStyleRef('differentName');

      expect(textStyleRef1 == textStyleRef2, isTrue);
      expect(textStyleRef1 == textStyleRef3, isFalse);
      expect(textStyleRef1 == Object(), isFalse);
    });

    test('hashCode is consistent with name', () {
      const textStyleRef1 = TextStyleRef('testName');
      const textStyleRef2 = TextStyleRef('testName');
      const textStyleRef3 = TextStyleRef('differentName');

      expect(textStyleRef1.hashCode, textStyleRef2.hashCode);
      expect(textStyleRef1.hashCode, isNot(textStyleRef3.hashCode));
    });

    testWidgets('Test it resolves correctly', (tester) async {
      const redTextStyleRef = TextStyleRef('red');
      const greenTextStyleRef = TextStyleRef('green');
      const blueTextStyleRef = TextStyleRef('blue');
      final theme = MixThemeData(textStyles: {
        redTextStyleRef: (_) => const TextStyle(color: Colors.red),
        greenTextStyleRef: (_) => const TextStyle(color: Colors.green),
        blueTextStyleRef: (_) => const TextStyle(color: Colors.blue),
      });

      await tester.pumpWidget(createWithMixTheme(theme));

      final context = tester.element(find.byType(Container));

      final mixData = MixData.create(context, StyleMix.empty);

      expect(redTextStyleRef.resolve(mixData).color, Colors.red);
      expect(greenTextStyleRef.resolve(mixData).color, Colors.green);
      expect(blueTextStyleRef.resolve(mixData).color, Colors.blue);
    });
  });
}
