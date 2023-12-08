import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/decorators/widget_directives.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group(
    'AspectRatioDecorator Tests',
    () {
      testWidgets(
        'AspectRatioDecorator applies correct aspect ratio',
        (WidgetTester tester) async {
          // Define the aspect ratio you want to test
          const double testAspectRatio = 2.0;

          // Create an AspectRatioDecorator
          const aspectRatioDecorator = AspectRatioDirective(testAspectRatio);

          // Build our app and trigger a frame
          await tester.pumpWidget(
            MaterialApp(
              home: aspectRatioDecorator.build(
                Container(color: Colors.blue),
                EmptyMixData,
              ),
            ),
          );

          final finder = find.byType(AspectRatio);
          final context = tester.element(finder);
          final aspectRatioWidget = context.widget as AspectRatio;

          // Verify that the AspectRatio widget is in the tree and has the correct aspect ratio
          expect(finder, findsOneWidget);
          expect(aspectRatioWidget.aspectRatio, testAspectRatio);
        },
      );
    },
  );

  group(
    'OpacityDecorator',
    () {
      testWidgets(
        'OpacityDecorator applies correct opacity',
        (WidgetTester tester) async {
          // Define the opacity you want to test
          const double testOpacity = 0.5;

          // Create an OpacityDecorator
          const opacityDecorator = OpacityDirective(testOpacity);

          // Build our app and trigger a frame
          await tester.pumpWidget(
            MaterialApp(
              home: opacityDecorator.build(
                Container(color: Colors.blue),
                EmptyMixData,
              ),
            ),
          );

          final finder = find.byType(Opacity);
          final context = tester.element(finder);
          final opacityWidget = context.widget as Opacity;

          // Verify that the Opacity widget is in the tree and has the correct opacity
          expect(finder, findsOneWidget);
          expect(opacityWidget.opacity, testOpacity);
        },
      );
    },
  );

  group(
    'RotateDecorator',
    () {
      testWidgets(
        'RotateDecorator applies correct rotation',
        (WidgetTester tester) async {
          // Define the rotation you want to test
          const int testRotation = 1;

          // Create a RotateDecorator
          const rotateDecorator = RotateDirective(testRotation);

          // Build our app and trigger a frame
          await tester.pumpWidget(
            MaterialApp(
              home: rotateDecorator.build(
                Container(color: Colors.blue),
                EmptyMixData,
              ),
            ),
          );

          final finder = find.byType(RotatedBox);
          final context = tester.element(finder);
          final rotatedBoxWidget = context.widget as RotatedBox;

          // Verify that the RotatedBox widget is in the tree and has the correct rotation
          expect(finder, findsOneWidget);
          expect(rotatedBoxWidget.quarterTurns, testRotation);
        },
      );
    },
  );

  group(
    'ScaleDecorator',
    () {
      testWidgets(
        'ScaleDecorator applies correct scale',
        (WidgetTester tester) async {
          // Define the scale you want to test
          const double testScale = 0.5;

          // Create a ScaleDecorator
          const scaleDecorator = ScaleDirective(testScale);

          // Build our app and trigger a frame
          await tester.pumpWidget(
            MaterialApp(
              home: scaleDecorator.build(
                Container(color: Colors.blue),
                EmptyMixData,
              ),
            ),
          );

          final finder = find.byType(Transform);
          final context = tester.element(finder);
          final transformWidget = context.widget as Transform;

          expect(finder, findsOneWidget);

          expect(transformWidget.transform,
              Matrix4.diagonal3Values(testScale, testScale, 1.0));
        },
      );
    },
  );

  group(
    'FlexibleDecorator',
    () {
      testWidgets(
        'FlexibleDecorator applies correct flex',
        (WidgetTester tester) async {
          // Define the flex you want to test
          const int testFlex = 1;

          // Create a FlexibleDecorator
          const flexibleDecorator = FlexibleDirective(flex: testFlex);

          // Build our app and trigger a frame
          await tester.pumpWidget(
            MaterialApp(
              home: Column(
                children: [
                  flexibleDecorator.build(
                    Container(color: Colors.blue),
                    EmptyMixData,
                  ),
                ],
              ),
            ),
          );

          final finder = find.byType(Flexible);
          final context = tester.element(finder);
          final flexibleWidget = context.widget as Flexible;

          // Verify that the Flexible widget is in the tree and has the correct flex
          expect(finder, findsOneWidget);
          expect(flexibleWidget.flex, testFlex);
        },
      );

      testWidgets(
        'FlexibleDecorator merge combines flexes correctly',
        (WidgetTester tester) async {
          // Define two different flexes
          const int firstFlex = 1;
          const int secondFlex = 2;

          // Create two FlexibleDecorators
          const flexibleDecorator1 = FlexibleDirective(flex: firstFlex);
          const flexibleDecorator2 = FlexibleDirective(flex: secondFlex);

          // Merge them
          final mergedDecorator = flexibleDecorator1.merge(flexibleDecorator2);

          // Build a widget with the merged decorator and trigger a frame
          await tester.pumpWidget(
            MaterialApp(
              home: Column(
                children: [
                  mergedDecorator.build(
                    Container(color: Colors.red),
                    EmptyMixData,
                  ),
                ],
              ),
            ),
          );

          final finder = find.byType(Flexible);
          final context = tester.element(finder);
          final flexibleWidget = context.widget as Flexible;

          // Verify that the merged flex is applied
          expect(finder, findsOneWidget);
          expect(flexibleWidget.flex, secondFlex);
        },
      );
    },
  );
}
