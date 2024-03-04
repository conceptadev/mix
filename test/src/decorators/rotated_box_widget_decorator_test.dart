import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/decorators/rotated_box_widget_decorator.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('RotateDecoratorSpec', () {
    test('Constructor assigns quarterTurns correctly', () {
      const quarterTurns = 1;
      const decorator = RotatedBoxDecoratorSpec(quarterTurns);

      expect(decorator.quarterTurns, quarterTurns);
    });

    test('Lerp method interpolates correctly', () {
      const start = RotatedBoxDecoratorSpec(0);
      const end = RotatedBoxDecoratorSpec(4);
      final result = start.lerp(end, 0.5);

      expect(result.quarterTurns, 2);
    });

    test('Equality and hashcode test', () {
      const decorator1 = RotatedBoxDecoratorSpec(1);
      const decorator2 = RotatedBoxDecoratorSpec(1);
      const decorator3 = RotatedBoxDecoratorSpec(2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates RotatedBox widget with correct quarterTurns',
      (WidgetTester tester) async {
        const quarterTurns = 1;
        const decorator = RotatedBoxDecoratorSpec(quarterTurns);

        await tester.pumpMaterialApp(decorator.build(Container()));

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
      const decorator = RotatedBoxDecoratorAttribute(1);
      const other = RotatedBoxDecoratorAttribute(1);
      final result = decorator.merge(other);
      expect(result, decorator);
    });

    test('resolve', () {
      const decorator = RotatedBoxDecoratorAttribute(1);
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<RotatedBoxDecoratorSpec>());
    });

    test('equality', () {
      const decorator = RotatedBoxDecoratorAttribute(1);
      const other = RotatedBoxDecoratorAttribute(1);
      expect(decorator, other);
    });

    // inequality
    test('inequality', () {
      const decorator = RotatedBoxDecoratorAttribute(1);
      const other = RotatedBoxDecoratorAttribute(2);
      expect(decorator, isNot(other));
    });
  });
}
