import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/modifiers/visibility_widget_modifier.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('VisibilityDecoratorSpec Tests', () {
    test('Constructor assigns visible correctly', () {
      const visible = true;
      const modifier = VisibilityDecoratorAttribute(visible);

      expect(modifier.visible, visible);
    });

    test('Lerp method interpolates correctly', () {
      const start = VisibilityDecoratorSpec(true);
      const end = VisibilityDecoratorSpec(false);
      final afterResult = start.lerp(end, 0.5);
      final beforeResult = start.lerp(end, 0.49);

      expect(beforeResult.visible, true);
      expect(afterResult.visible, false);
    });

    test('Equality and hashcode test', () {
      const modifier1 = VisibilityDecoratorSpec(true);
      const modifier2 = VisibilityDecoratorSpec(true);
      const modifier3 = VisibilityDecoratorSpec(false);

      expect(modifier1, modifier2);
      expect(modifier1.hashCode, modifier2.hashCode);
      expect(modifier1 == modifier3, false);
      expect(modifier1.hashCode == modifier3.hashCode, false);
    });

    testWidgets(
      'Build method creates Visibility widget with correct visible property',
      (WidgetTester tester) async {
        const visible = true;
        const modifier = VisibilityDecoratorSpec(visible);

        await tester.pumpMaterialApp(modifier.build(Container()));

        final Visibility visibilityWidget =
            tester.widget(find.byType(Visibility));

        expect(find.byType(Visibility), findsOneWidget);
        expect(visibilityWidget.visible, visible);
        expect(visibilityWidget.child, isA<Container>());
      },
    );
  });

  group('VisibilityDecoratorAttribute', () {
    test('merge', () {
      const modifier = VisibilityDecoratorAttribute(true);
      const other = VisibilityDecoratorAttribute(true);
      final result = modifier.merge(other);
      expect(result, modifier);
    });

    test('resolve', () {
      const modifier = VisibilityDecoratorAttribute(true);
      final result = modifier.resolve(EmptyMixData);
      expect(result, isA<VisibilityDecoratorSpec>());
    });

    // equality
    test('equality', () {
      const modifier = VisibilityDecoratorAttribute(true);
      const other = VisibilityDecoratorAttribute(true);
      expect(modifier, other);
    });

    test('inequality', () {
      const modifier = VisibilityDecoratorAttribute(true);
      const other = VisibilityDecoratorAttribute(false);
      expect(modifier, isNot(equals(other)));
    });
  });
}
