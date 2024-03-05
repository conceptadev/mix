import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('ScaleDecoratorSpec', () {
    test('Constructor assigns scale correctly', () {
      const scale = 1.5;
      const decorator = ScaleDecoratorSpec(scale);

      expect(decorator.scale, scale);
    });

    test('Lerp method interpolates correctly', () {
      const start = ScaleDecoratorSpec(1.0);
      const end = ScaleDecoratorSpec(2.0);
      final result = start.lerp(end, 0.5);

      expect(result.scale, 1.5);
    });

    test('Equality and hashcode test', () {
      const decorator1 = ScaleDecoratorSpec(1.0);
      const decorator2 = ScaleDecoratorSpec(1.0);
      const decorator3 = ScaleDecoratorSpec(1.5);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates Transform.scale widget with correct scale',
      (WidgetTester tester) async {
        const scale = 1.5;
        const decorator = ScaleDecoratorSpec(scale);

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

  group('ScaleDecoratorAttribute', () {
    test('merge', () {
      const decorator = ScaleDecoratorAttribute(1.5);
      const other = ScaleDecoratorAttribute(1.6);
      final result = decorator.merge(other);
      expect(result, other);
    });

    test('resolve', () {
      const decorator = ScaleDecoratorAttribute(1.5);
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<ScaleDecoratorSpec>());
    });

    test('equality', () {
      const decorator = ScaleDecoratorAttribute(1.5);
      const other = ScaleDecoratorAttribute(1.5);
      expect(decorator, other);
    });

    test('inequality', () {
      const decorator = ScaleDecoratorAttribute(1.5);
      const other = ScaleDecoratorAttribute(2.0);
      expect(decorator, isNot(equals(other)));
    });
  });
}
