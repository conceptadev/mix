import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/decorators/aspect_ratio_widget_decorator.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('AspectRatioWidgetSpec', () {
    test('Constructor assigns aspectRatio correctly', () {
      const aspectRatio = 2.0;
      const decorator = AspectRatioWidgetSpec(aspectRatio);

      expect(decorator.aspectRatio, aspectRatio);
    });

    test('Lerp method interpolates correctly', () {
      const start = AspectRatioWidgetSpec(1.0);
      const end = AspectRatioWidgetSpec(3.0);
      final result = start.lerp(end, 0.5);

      expect(result.aspectRatio, 2.0);
    });

    test('Equality and hashcode test', () {
      const decorator1 = AspectRatioWidgetSpec(1.0);
      const decorator2 = AspectRatioWidgetSpec(1.0);
      const decorator3 = AspectRatioWidgetSpec(2.0);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates AspectRatio widget with correct aspectRatio',
      (WidgetTester tester) async {
        const aspectRatio = 2.0;
        const decorator = AspectRatioWidgetSpec(aspectRatio);

        await tester.pumpMaterialApp(decorator.build(Container()));

        final AspectRatio aspectRatioWidget =
            tester.widget(find.byType(AspectRatio));

        expect(find.byType(AspectRatio), findsOneWidget);
        expect(aspectRatioWidget.aspectRatio, aspectRatio);

        expect(aspectRatioWidget.child, isA<Container>());
        expect(aspectRatioWidget.aspectRatio, aspectRatio);
      },
    );
  });

  group('AspectRatioWidgetDecorator', () {
    test('merge', () {
      const decorator = AspectRatioWidgetDecorator(1.0);
      const other = AspectRatioWidgetDecorator(1.0);
      final result = decorator.merge(other);
      expect(result, decorator);
    });

    test('resolve', () {
      const decorator = AspectRatioWidgetDecorator(1.0);
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<AspectRatioWidgetSpec>());
    });

    test('equality', () {
      const decorator = AspectRatioWidgetDecorator(1.0);
      const other = AspectRatioWidgetDecorator(1.0);
      expect(decorator, other);
    });

    test('inequality', () {
      const decorator = AspectRatioWidgetDecorator(1.0);
      const other = AspectRatioWidgetDecorator(2.0);
      expect(decorator, isNot(equals(other)));
    });
  });
}
