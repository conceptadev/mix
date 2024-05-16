import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/modifiers/opacity_widget_decorator.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('OpacityDecoratorSpec Tests', () {
    test('Constructor assigns opacity correctly', () {
      const opacity = 0.5;
      const decorator = OpacityDecoratorSpec(opacity);

      expect(decorator.opacity, opacity);
    });

    test('Lerp method interpolates correctly', () {
      const start = OpacityDecoratorSpec(0.0);
      const end = OpacityDecoratorSpec(1.0);
      final result = start.lerp(end, 0.5);

      expect(result.opacity, 0.5);
    });

    test('Equality and hashcode test', () {
      const decorator1 = OpacityDecoratorSpec(0.5);
      const decorator2 = OpacityDecoratorSpec(0.5);
      const decorator3 = OpacityDecoratorSpec(0.8);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates Opacity widget with correct opacity',
      (WidgetTester tester) async {
        const opacity = 0.5;
        const decorator = OpacityDecoratorSpec(opacity);

        await tester.pumpMaterialApp(decorator.build(Container()));

        final Opacity opacityWidget = tester.widget(find.byType(Opacity));

        expect(find.byType(Opacity), findsOneWidget);
        expect(opacityWidget.opacity, opacity);
        expect(opacityWidget.child, isA<Container>());
      },
    );
  });

  group('OpacityDecoratorAttribute', () {
    test('merge', () {
      const decorator = OpacityDecoratorAttribute(0.5);
      const other = OpacityDecoratorAttribute(0.5);
      final result = decorator.merge(other);
      expect(result, decorator);
    });

    test('resolve', () {
      const decorator = OpacityDecoratorAttribute(0.5);
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<OpacityDecoratorSpec>());
    });

    test('equality', () {
      const decorator = OpacityDecoratorAttribute(0.5);
      const other = OpacityDecoratorAttribute(0.5);
      expect(decorator, other);
    });

    test('inequality', () {
      const decorator = OpacityDecoratorAttribute(0.5);
      const other = OpacityDecoratorAttribute(0.8);
      expect(decorator == other, false);
    });
  });
}
