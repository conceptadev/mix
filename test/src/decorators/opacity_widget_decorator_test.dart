import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/decorators/opacity_widget_decorator.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('OpacityWidgetSpec Tests', () {
    test('Constructor assigns opacity correctly', () {
      const opacity = 0.5;
      const decorator = OpacityWidgetSpec(opacity);

      expect(decorator.opacity, opacity);
    });

    test('Lerp method interpolates correctly', () {
      const start = OpacityWidgetSpec(0.0);
      const end = OpacityWidgetSpec(1.0);
      final result = start.lerp(end, 0.5);

      expect(result.opacity, 0.5);
    });

    test('Equality and hashcode test', () {
      const decorator1 = OpacityWidgetSpec(0.5);
      const decorator2 = OpacityWidgetSpec(0.5);
      const decorator3 = OpacityWidgetSpec(0.8);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates Opacity widget with correct opacity',
      (WidgetTester tester) async {
        const opacity = 0.5;
        const decorator = OpacityWidgetSpec(opacity);

        await tester.pumpMaterialApp(decorator.build(Container()));

        final Opacity opacityWidget = tester.widget(find.byType(Opacity));

        expect(find.byType(Opacity), findsOneWidget);
        expect(opacityWidget.opacity, opacity);
        expect(opacityWidget.child, isA<Container>());
      },
    );
  });

  group('OpacityWidgetDecorator', () {
    test('merge', () {
      const decorator = OpacityWidgetDecorator(0.5);
      const other = OpacityWidgetDecorator(0.5);
      final result = decorator.merge(other);
      expect(result, decorator);
    });

    test('resolve', () {
      const decorator = OpacityWidgetDecorator(0.5);
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<OpacityWidgetSpec>());
    });

    test('equality', () {
      const decorator = OpacityWidgetDecorator(0.5);
      const other = OpacityWidgetDecorator(0.5);
      expect(decorator, other);
    });

    test('inequality', () {
      const decorator = OpacityWidgetDecorator(0.5);
      const other = OpacityWidgetDecorator(0.8);
      expect(decorator == other, false);
    });
  });
}
