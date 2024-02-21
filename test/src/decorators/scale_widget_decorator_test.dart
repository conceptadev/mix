import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('ScaleWidgetSpec', () {
    test('Constructor assigns scale correctly', () {
      const scale = 1.5;
      const decorator = ScaleWidgetSpec(scale);

      expect(decorator.scale, scale);
    });

    test('Lerp method interpolates correctly', () {
      const start = ScaleWidgetSpec(1.0);
      const end = ScaleWidgetSpec(2.0);
      final result = start.lerp(end, 0.5);

      expect(result.scale, 1.5);
    });

    test('Equality and hashcode test', () {
      const decorator1 = ScaleWidgetSpec(1.0);
      const decorator2 = ScaleWidgetSpec(1.0);
      const decorator3 = ScaleWidgetSpec(1.5);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates Transform.scale widget with correct scale',
      (WidgetTester tester) async {
        const scale = 1.5;
        const decorator = ScaleWidgetSpec(scale);

        await tester.pumpMaterialApp(decorator.build(Container()));

        final Transform transformWidget = tester.widget(find.byType(Transform));

        expect(find.byType(Transform), findsOneWidget);
        expect(
          transformWidget.transform,
          Matrix4.diagonal3Values(scale, scale, 1.0),
        );
        expect(transformWidget.child, isA<Container>());
      },
    );
  });

  group('ScaleWidgetDecorator', () {
    test('merge', () {
      const decorator = ScaleWidgetDecorator(1.5);
      const other = ScaleWidgetDecorator(1.6);
      final result = decorator.merge(other);
      expect(result, other);
    });

    test('resolve', () {
      const decorator = ScaleWidgetDecorator(1.5);
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<ScaleWidgetSpec>());
    });

    test('equality', () {
      const decorator = ScaleWidgetDecorator(1.5);
      const other = ScaleWidgetDecorator(1.5);
      expect(decorator, other);
    });

    test('inequality', () {
      const decorator = ScaleWidgetDecorator(1.5);
      const other = ScaleWidgetDecorator(2.0);
      expect(decorator, isNot(equals(other)));
    });
  });
}
