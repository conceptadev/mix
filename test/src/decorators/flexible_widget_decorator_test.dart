import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('FlexibleDecoratorSpec', () {
    test('Constructor assigns flex and fit correctly', () {
      const flex = 2;
      const fit = FlexFit.tight;
      const decorator = FlexibleDecoratorSpec(flex: flex, fit: fit);

      expect(decorator.flex, flex);
      expect(decorator.fit, fit);
    });

    test('Lerp method interpolates correctly', () {
      const start = FlexibleDecoratorSpec(flex: 1, fit: FlexFit.loose);
      const end = FlexibleDecoratorSpec(flex: 3, fit: FlexFit.tight);
      final result = start.lerp(end, 0.5);

      expect(result.flex, 2);
      expect(result.fit, FlexFit.tight);
    });

    test('Equality and hashcode test', () {
      const decorator1 = FlexibleDecoratorSpec(flex: 1, fit: FlexFit.tight);
      const decorator2 = FlexibleDecoratorSpec(flex: 1, fit: FlexFit.tight);
      const decorator3 = FlexibleDecoratorSpec(flex: 2, fit: FlexFit.loose);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates Flexible widget with correct flex and fit',
      (WidgetTester tester) async {
        const flex = 2;
        const fit = FlexFit.tight;
        const decorator = FlexibleDecoratorSpec(flex: flex, fit: fit);

        await tester.pumpMaterialApp(
          Row(children: [decorator.build(Container())]),
        );

        final Flexible flexibleWidget = tester.widget(find.byType(Flexible));

        expect(find.byType(Flexible), findsOneWidget);
        expect(flexibleWidget.flex, flex);
        expect(flexibleWidget.fit, fit);
        expect(flexibleWidget.child, isA<Container>());
      },
    );
  });

  group('FlexibleDecoratorAttribute', () {
    test('merge', () {
      const decorator = FlexibleDecoratorAttribute(flex: 1, fit: FlexFit.tight);
      const other = FlexibleDecoratorAttribute(flex: 1, fit: FlexFit.tight);
      final result = decorator.merge(other);
      expect(result, decorator);
    });

    test('resolve', () {
      const decorator = FlexibleDecoratorAttribute(flex: 1, fit: FlexFit.tight);
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<FlexibleDecoratorSpec>());
    });

    // equality
    test('equality', () {
      const decorator = FlexibleDecoratorAttribute(flex: 1, fit: FlexFit.tight);
      const other = FlexibleDecoratorAttribute(flex: 1, fit: FlexFit.tight);
      expect(decorator, other);
    });

    test('inequality', () {
      const decorator = FlexibleDecoratorAttribute(flex: 1, fit: FlexFit.tight);
      const other = FlexibleDecoratorAttribute(flex: 2, fit: FlexFit.loose);
      expect(decorator, isNot(other));
    });
  });
}
