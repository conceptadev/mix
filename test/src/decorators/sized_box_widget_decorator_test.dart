import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/decorators/sized_box_widget_decorator.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group(
    'SizedBoxWidgetSpec',
    () {
      test(
        'Constructor assigns width and height correctly',
        () {
          const width = 100.0;
          const height = 100.0;
          const decorator = SizedBoxWidgetSpec(
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
          const start = SizedBoxWidgetSpec(
            width: 100.0,
            height: 100.0,
          );
          const end = SizedBoxWidgetSpec(
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
          const decorator1 = SizedBoxWidgetSpec(
            width: 100.0,
            height: 100.0,
          );
          const decorator2 = SizedBoxWidgetSpec(
            width: 100.0,
            height: 100.0,
          );
          const decorator3 = SizedBoxWidgetSpec(
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
          const decorator = SizedBoxWidgetSpec(
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
}
