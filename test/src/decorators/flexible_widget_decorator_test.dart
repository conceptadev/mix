import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('FlexibleWidgetSpec', () {
    test('Constructor assigns flex and fit correctly', () {
      const flex = 2;
      const fit = FlexFit.tight;
      const decorator = FlexibleWidgetSpec(flex: flex, fit: fit);

      expect(decorator.flex, flex);
      expect(decorator.fit, fit);
    });

    test('Lerp method interpolates correctly', () {
      const start = FlexibleWidgetSpec(flex: 1, fit: FlexFit.loose);
      const end = FlexibleWidgetSpec(flex: 3, fit: FlexFit.tight);
      final result = start.lerp(end, 0.5);

      expect(result.flex, 2);
      expect(result.fit, FlexFit.tight);
    });

    test('Equality and hashcode test', () {
      const decorator1 = FlexibleWidgetSpec(flex: 1, fit: FlexFit.tight);
      const decorator2 = FlexibleWidgetSpec(flex: 1, fit: FlexFit.tight);
      const decorator3 = FlexibleWidgetSpec(flex: 2, fit: FlexFit.loose);

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
        const decorator = FlexibleWidgetSpec(flex: flex, fit: fit);

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

  group('FlexibleWidgetDecorator', () {
    test('merge', () {
      const decorator = FlexibleWidgetDecorator(flex: 1, fit: FlexFit.tight);
      const other = FlexibleWidgetDecorator(flex: 1, fit: FlexFit.tight);
      final result = decorator.merge(other);
      expect(result, decorator);
    });

    test('resolve', () {
      const decorator = FlexibleWidgetDecorator(flex: 1, fit: FlexFit.tight);
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<FlexibleWidgetSpec>());
    });

    // equality
    test('equality', () {
      const decorator = FlexibleWidgetDecorator(flex: 1, fit: FlexFit.tight);
      const other = FlexibleWidgetDecorator(flex: 1, fit: FlexFit.tight);
      expect(decorator, other);
    });

    test('inequality', () {
      const decorator = FlexibleWidgetDecorator(flex: 1, fit: FlexFit.tight);
      const other = FlexibleWidgetDecorator(flex: 2, fit: FlexFit.loose);
      expect(decorator, isNot(other));
    });
  });
}
