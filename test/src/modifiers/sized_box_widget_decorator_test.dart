import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/scalars/scalar_util.dart';
import 'package:mix/src/modifiers/sized_box_widget_decorator.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group(
    'SizedBoxDecoratorSpec',
    () {
      test(
        'Constructor assigns width and height correctly',
        () {
          const width = 100.0;
          const height = 100.0;
          const decorator = SizedBoxDecoratorSpec(
            width: width,
            height: height,
          );

          expect(decorator.width, width);
          expect(decorator.height, height);
        },
      );

      test(
        'Lerp method interpolates correctly',
        () {
          const start = SizedBoxDecoratorSpec(
            width: 100.0,
            height: 100.0,
          );
          const end = SizedBoxDecoratorSpec(
            width: 200.0,
            height: 200.0,
          );
          final result = start.lerp(
            end,
            0.5,
          );

          expect(result.width, 150.0);
          expect(result.height, 150.0);
        },
      );

      test(
        'Equality and hashcode test',
        () {
          const decorator1 = SizedBoxDecoratorSpec(
            width: 100.0,
            height: 100.0,
          );
          const decorator2 = SizedBoxDecoratorSpec(
            width: 100.0,
            height: 100.0,
          );
          const decorator3 = SizedBoxDecoratorSpec(
            width: 100.0,
            height: 200.0,
          );

          expect(decorator1, decorator2);
          expect(decorator1.hashCode, decorator2.hashCode);
          expect(decorator1 == decorator3, false);
          expect(decorator1.hashCode == decorator3.hashCode, false);
        },
      );

      testWidgets(
        'Build method creates SizedBox widget with correct width and height',
        (WidgetTester tester) async {
          const width = 100.0;
          const height = 100.0;
          const decorator = SizedBoxDecoratorSpec(
            width: width,
            height: height,
          );

          await tester.pumpMaterialApp(
            decorator.build(
              Container(),
            ),
          );

          final SizedBox sizedBoxWidget = tester.widget(
            find.byType(
              SizedBox,
            ),
          );

          expect(
            find.byType(
              SizedBox,
            ),
            findsOneWidget,
          );
          expect(
            sizedBoxWidget.width,
            width,
          );
          expect(
            sizedBoxWidget.height,
            height,
          );
          expect(
            sizedBoxWidget.child,
            isA<Container>(),
          );
        },
      );
    },
  );

  group('SizedBoxDecoratorAttribute', () {
    test('Constructor assigns width and height correctly', () {
      const width = 100.0;
      const height = 100.0;
      const attribute =
          SizedBoxDecoratorAttribute(width: width, height: height);

      expect(attribute.width, width);
      expect(attribute.height, height);
    });

    test('Merge method merges correctly', () {
      const attribute1 =
          SizedBoxDecoratorAttribute(width: 100.0, height: 100.0);
      const attribute2 =
          SizedBoxDecoratorAttribute(width: 200.0, height: 200.0);
      final result = attribute1.merge(attribute2);

      expect(result.width, 200.0);
      expect(result.height, 200.0);
    });

    test('Resolve method resolves correctly', () {
      const attribute = SizedBoxDecoratorAttribute(width: 100.0, height: 100.0);

      final result = attribute.resolve(EmptyMixData);

      expect(result.width, 100.0);
      expect(result.height, 100.0);
    });

    test('Equality and hashcode test', () {
      const attribute1 =
          SizedBoxDecoratorAttribute(width: 100.0, height: 100.0);
      const attribute2 =
          SizedBoxDecoratorAttribute(width: 100.0, height: 100.0);
      const attribute3 =
          SizedBoxDecoratorAttribute(width: 100.0, height: 200.0);

      expect(attribute1, attribute2);
      expect(attribute1.hashCode, attribute2.hashCode);
      expect(attribute1 == attribute3, false);
      expect(attribute1.hashCode == attribute3.hashCode, false);
    });
  });

  group('SizedBoxDecoratorUtility', () {
    test('Call method returns correct SizedBoxDecoratorAttribute', () {
      const width = 100.0;
      const height = 100.0;
      const utility = SizedBoxDecoratorUtility(MixUtility.selfBuilder);
      final result = utility(width: width, height: height);

      expect(result.width, width);
      expect(result.height, height);
    });
  });
}
