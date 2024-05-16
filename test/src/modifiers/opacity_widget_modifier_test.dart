import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/modifiers/opacity_widget_modifier.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('OpacityDecoratorSpec Tests', () {
    test('Constructor assigns opacity correctly', () {
      const opacity = 0.5;
      const modifier = OpacityDecoratorSpec(opacity);

      expect(modifier.opacity, opacity);
    });

    test('Lerp method interpolates correctly', () {
      const start = OpacityDecoratorSpec(0.0);
      const end = OpacityDecoratorSpec(1.0);
      final result = start.lerp(end, 0.5);

      expect(result.opacity, 0.5);
    });

    test('Equality and hashcode test', () {
      const modifier1 = OpacityDecoratorSpec(0.5);
      const modifier2 = OpacityDecoratorSpec(0.5);
      const modifier3 = OpacityDecoratorSpec(0.8);

      expect(modifier1, modifier2);
      expect(modifier1.hashCode, modifier2.hashCode);
      expect(modifier1 == modifier3, false);
      expect(modifier1.hashCode == modifier3.hashCode, false);
    });

    testWidgets(
      'Build method creates Opacity widget with correct opacity',
      (WidgetTester tester) async {
        const opacity = 0.5;
        const modifier = OpacityDecoratorSpec(opacity);

        await tester.pumpMaterialApp(modifier.build(Container()));

        final Opacity opacityWidget = tester.widget(find.byType(Opacity));

        expect(find.byType(Opacity), findsOneWidget);
        expect(opacityWidget.opacity, opacity);
        expect(opacityWidget.child, isA<Container>());
      },
    );
  });

  group('OpacityDecoratorAttribute', () {
    test('merge', () {
      const modifier = OpacityDecoratorAttribute(0.5);
      const other = OpacityDecoratorAttribute(0.5);
      final result = modifier.merge(other);
      expect(result, modifier);
    });

    test('resolve', () {
      const modifier = OpacityDecoratorAttribute(0.5);
      final result = modifier.resolve(EmptyMixData);
      expect(result, isA<OpacityDecoratorSpec>());
    });

    test('equality', () {
      const modifier = OpacityDecoratorAttribute(0.5);
      const other = OpacityDecoratorAttribute(0.5);
      expect(modifier, other);
    });

    test('inequality', () {
      const modifier = OpacityDecoratorAttribute(0.5);
      const other = OpacityDecoratorAttribute(0.8);
      expect(modifier == other, false);
    });
  });
}
