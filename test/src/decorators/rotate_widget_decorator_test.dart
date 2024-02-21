import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/decorators/rotate_widget_decorator.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('RotateWidgetSpec', () {
    test('Constructor assigns quarterTurns correctly', () {
      const quarterTurns = 1;
      const decorator = RotateWidgetSpec(quarterTurns);

      expect(decorator.quarterTurns, quarterTurns);
    });

    test('Lerp method interpolates correctly', () {
      const start = RotateWidgetSpec(0);
      const end = RotateWidgetSpec(4);
      final result = start.lerp(end, 0.5);

      expect(result.quarterTurns, 2);
    });

    test('Equality and hashcode test', () {
      const decorator1 = RotateWidgetSpec(1);
      const decorator2 = RotateWidgetSpec(1);
      const decorator3 = RotateWidgetSpec(2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates RotatedBox widget with correct quarterTurns',
      (WidgetTester tester) async {
        const quarterTurns = 1;
        const decorator = RotateWidgetSpec(quarterTurns);

        await tester.pumpMaterialApp(decorator.build(Container()));

        final RotatedBox rotatedBoxWidget =
            tester.widget(find.byType(RotatedBox));

        expect(find.byType(RotatedBox), findsOneWidget);
        expect(rotatedBoxWidget.quarterTurns, quarterTurns);
        expect(rotatedBoxWidget.child, isA<Container>());
      },
    );
  });

  group('RotateWidgetDecorator', () {
    test('merge', () {
      const decorator = RotateWidgetDecorator(1);
      const other = RotateWidgetDecorator(1);
      final result = decorator.merge(other);
      expect(result, decorator);
    });

    test('resolve', () {
      const decorator = RotateWidgetDecorator(1);
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<RotateWidgetSpec>());
    });

    test('equality', () {
      const decorator = RotateWidgetDecorator(1);
      const other = RotateWidgetDecorator(1);
      expect(decorator, other);
    });

    // inequality
    test('inequality', () {
      const decorator = RotateWidgetDecorator(1);
      const other = RotateWidgetDecorator(2);
      expect(decorator, isNot(other));
    });
  });
}
