import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/decorators/fractionally_sized_box_widget_decorator.dart';

import '../../helpers/testing_utils.dart';

void main() {
  // FractionallySizedBoxWidgetSpec
  group('FractionallySizedBoxWidgetSpec', () {
    test('Constructor assigns widthFactor and heightFactor correctly', () {
      const widthFactor = 0.5;
      const heightFactor = 0.5;
      const decorator = FractionallySizedBoxWidgetSpec(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      );

      expect(decorator.widthFactor, widthFactor);
      expect(decorator.heightFactor, heightFactor);
    });

    test('Lerp method interpolates correctly', () {
      const start = FractionallySizedBoxWidgetSpec(
        widthFactor: 0.5,
        heightFactor: 0.5,
      );
      const end = FractionallySizedBoxWidgetSpec(
        widthFactor: 1.0,
        heightFactor: 1.0,
      );
      final result = start.lerp(end, 0.5);

      expect(result.widthFactor, 0.75);
      expect(result.heightFactor, 0.75);
    });

    test('Equality and hashcode test', () {
      const decorator1 = FractionallySizedBoxWidgetSpec(
        widthFactor: 0.5,
        heightFactor: 0.5,
      );
      const decorator2 = FractionallySizedBoxWidgetSpec(
        widthFactor: 0.5,
        heightFactor: 0.5,
      );
      const decorator3 = FractionallySizedBoxWidgetSpec(
        widthFactor: 0.5,
        heightFactor: 0.6,
      );

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates FractionallySizedBox widget with correct widthFactor and heightFactor',
      (WidgetTester tester) async {
        const widthFactor = 0.5;
        const heightFactor = 0.5;
        const decorator = FractionallySizedBoxWidgetSpec(
          widthFactor: widthFactor,
          heightFactor: heightFactor,
        );

        await tester.pumpMaterialApp(
          decorator.build(Container()),
        );

        final FractionallySizedBox fractionallySizedBoxWidget =
            tester.widget(find.byType(FractionallySizedBox));

        expect(find.byType(FractionallySizedBox), findsOneWidget);
        expect(fractionallySizedBoxWidget.widthFactor, widthFactor);
        expect(fractionallySizedBoxWidget.heightFactor, heightFactor);
        expect(fractionallySizedBoxWidget.child, isA<Container>());
      },
    );
  });

  // FractionallySizedBoxWidgetDecorator
  group('FractionallySizedBoxWidgetDecorator', () {
    test('merge', () {
      const decorator = FractionallySizedBoxWidgetDecorator(
        widthFactor: 0.5,
        heightFactor: 0.5,
      );
      const other = FractionallySizedBoxWidgetDecorator(
        widthFactor: 0.5,
        heightFactor: 0.5,
      );
      final result = decorator.merge(other);
      expect(result, decorator);
    });

    test('resolve', () {
      const decorator = FractionallySizedBoxWidgetDecorator(
        widthFactor: 0.5,
        heightFactor: 0.5,
      );
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<FractionallySizedBoxWidgetSpec>());
    });

    test('equality', () {
      const decorator = FractionallySizedBoxWidgetDecorator(
        widthFactor: 0.5,
        heightFactor: 0.5,
      );
      const other = FractionallySizedBoxWidgetDecorator(
        widthFactor: 0.5,
        heightFactor: 0.5,
      );
      expect(decorator, other);
    });

    test('inequality', () {
      const decorator = FractionallySizedBoxWidgetDecorator(
        widthFactor: 0.5,
        heightFactor: 0.5,
      );
      const other = FractionallySizedBoxWidgetDecorator(
        widthFactor: 0.5,
        heightFactor: 0.6,
      );
      expect(decorator, isNot(equals(other)));
    });
  });
}
