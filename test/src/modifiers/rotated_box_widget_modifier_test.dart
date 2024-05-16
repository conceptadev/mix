import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/modifiers/rotated_box_widget_modifier.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('RotateDecoratorSpec', () {
    test('Constructor assigns quarterTurns correctly', () {
      const quarterTurns = 1;
      const modifier = RotatedBoxDecoratorSpec(quarterTurns);

      expect(modifier.quarterTurns, quarterTurns);
    });

    test('Lerp method interpolates correctly', () {
      const start = RotatedBoxDecoratorSpec(0);
      const end = RotatedBoxDecoratorSpec(4);
      final result = start.lerp(end, 0.5);

      expect(result.quarterTurns, 2);
    });

    test('Equality and hashcode test', () {
      const modifier1 = RotatedBoxDecoratorSpec(1);
      const modifier2 = RotatedBoxDecoratorSpec(1);
      const modifier3 = RotatedBoxDecoratorSpec(2);

      expect(modifier1, modifier2);
      expect(modifier1.hashCode, modifier2.hashCode);
      expect(modifier1 == modifier3, false);
      expect(modifier1.hashCode == modifier3.hashCode, false);
    });

    testWidgets(
      'Build method creates RotatedBox widget with correct quarterTurns',
      (WidgetTester tester) async {
        const quarterTurns = 1;
        const modifier = RotatedBoxDecoratorSpec(quarterTurns);

        await tester.pumpMaterialApp(modifier.build(Container()));

        final RotatedBox rotatedBoxWidget =
            tester.widget(find.byType(RotatedBox));

        expect(find.byType(RotatedBox), findsOneWidget);
        expect(rotatedBoxWidget.quarterTurns, quarterTurns);
        expect(rotatedBoxWidget.child, isA<Container>());
      },
    );
  });

  group('RotateDecoratorAttribute', () {
    test('merge', () {
      const modifier = RotatedBoxDecoratorAttribute(1);
      const other = RotatedBoxDecoratorAttribute(1);
      final result = modifier.merge(other);
      expect(result, modifier);
    });

    test('resolve', () {
      const modifier = RotatedBoxDecoratorAttribute(1);
      final result = modifier.resolve(EmptyMixData);
      expect(result, isA<RotatedBoxDecoratorSpec>());
    });

    test('equality', () {
      const modifier = RotatedBoxDecoratorAttribute(1);
      const other = RotatedBoxDecoratorAttribute(1);
      expect(modifier, other);
    });

    // inequality
    test('inequality', () {
      const modifier = RotatedBoxDecoratorAttribute(1);
      const other = RotatedBoxDecoratorAttribute(2);
      expect(modifier, isNot(other));
    });
  });
}
