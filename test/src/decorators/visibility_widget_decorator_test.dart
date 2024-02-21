import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/decorators/visibility_widget_decorator.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('VisibilityWidgetSpec Tests', () {
    test('Constructor assigns visible correctly', () {
      const visible = true;
      const decorator = VisibilityWidgetDecorator(visible);

      expect(decorator.visible, visible);
    });

    test('Lerp method interpolates correctly', () {
      const start = VisibilityWidgetSpec(true);
      const end = VisibilityWidgetSpec(false);
      final afterResult = start.lerp(end, 0.5);
      final beforeResult = start.lerp(end, 0.49);

      expect(beforeResult.visible, true);
      expect(afterResult.visible, false);
    });

    test('Equality and hashcode test', () {
      const decorator1 = VisibilityWidgetSpec(true);
      const decorator2 = VisibilityWidgetSpec(true);
      const decorator3 = VisibilityWidgetSpec(false);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates Visibility widget with correct visible property',
      (WidgetTester tester) async {
        const visible = true;
        const decorator = VisibilityWidgetSpec(visible);

        await tester.pumpMaterialApp(decorator.build(Container()));

        final Visibility visibilityWidget =
            tester.widget(find.byType(Visibility));

        expect(find.byType(Visibility), findsOneWidget);
        expect(visibilityWidget.visible, visible);
        expect(visibilityWidget.child, isA<Container>());
      },
    );
  });

  group('VisibilityWidgetDecorator', () {
    test('merge', () {
      const decorator = VisibilityWidgetDecorator(true);
      const other = VisibilityWidgetDecorator(true);
      final result = decorator.merge(other);
      expect(result, decorator);
    });

    test('resolve', () {
      const decorator = VisibilityWidgetDecorator(true);
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<VisibilityWidgetSpec>());
    });

    // equality
    test('equality', () {
      const decorator = VisibilityWidgetDecorator(true);
      const other = VisibilityWidgetDecorator(true);
      expect(decorator, other);
    });

    test('inequality', () {
      const decorator = VisibilityWidgetDecorator(true);
      const other = VisibilityWidgetDecorator(false);
      expect(decorator, isNot(equals(other)));
    });
  });
}
