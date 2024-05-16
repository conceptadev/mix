import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('FlexibleDecoratorSpec', () {
    test('Constructor assigns flex and fit correctly', () {
      const flex = 2;
      const fit = FlexFit.tight;
      const modifier = FlexibleDecoratorSpec(flex: flex, fit: fit);

      expect(modifier.flex, flex);
      expect(modifier.fit, fit);
    });

    test('Lerp method interpolates correctly', () {
      const start = FlexibleDecoratorSpec(flex: 1, fit: FlexFit.loose);
      const end = FlexibleDecoratorSpec(flex: 3, fit: FlexFit.tight);
      final result = start.lerp(end, 0.5);

      expect(result.flex, 2);
      expect(result.fit, FlexFit.tight);
    });

    test('Equality and hashcode test', () {
      const modifier1 = FlexibleDecoratorSpec(flex: 1, fit: FlexFit.tight);
      const modifier2 = FlexibleDecoratorSpec(flex: 1, fit: FlexFit.tight);
      const modifier3 = FlexibleDecoratorSpec(flex: 2, fit: FlexFit.loose);

      expect(modifier1, modifier2);
      expect(modifier1.hashCode, modifier2.hashCode);
      expect(modifier1 == modifier3, false);
      expect(modifier1.hashCode == modifier3.hashCode, false);
    });

    testWidgets(
      'Build method creates Flexible widget with correct flex and fit',
      (WidgetTester tester) async {
        const flex = 2;
        const fit = FlexFit.tight;
        const modifier = FlexibleDecoratorSpec(flex: flex, fit: fit);

        await tester.pumpMaterialApp(
          Row(children: [modifier.build(Container())]),
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
      const modifier = FlexibleDecoratorAttribute(flex: 1, fit: FlexFit.tight);
      const other = FlexibleDecoratorAttribute(flex: 1, fit: FlexFit.tight);
      final result = modifier.merge(other);
      expect(result, modifier);
    });

    test('resolve', () {
      const modifier = FlexibleDecoratorAttribute(flex: 1, fit: FlexFit.tight);
      final result = modifier.resolve(EmptyMixData);
      expect(result, isA<FlexibleDecoratorSpec>());
    });

    // equality
    test('equality', () {
      const modifier = FlexibleDecoratorAttribute(flex: 1, fit: FlexFit.tight);
      const other = FlexibleDecoratorAttribute(flex: 1, fit: FlexFit.tight);
      expect(modifier, other);
    });

    test('inequality', () {
      const modifier = FlexibleDecoratorAttribute(flex: 1, fit: FlexFit.tight);
      const other = FlexibleDecoratorAttribute(flex: 2, fit: FlexFit.loose);
      expect(modifier, isNot(other));
    });
  });
}
