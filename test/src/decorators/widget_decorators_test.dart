import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  // clipPath, clipRRect, clipOval, clipRect, clipTriangle

  // FractionallySizedBoxDecoratorSpec
  group('FractionallySizedBoxDecoratorSpec Tests', () {
    const widthFactor = 0.5;
    const heightFactor = 0.5;
    const widthFactor2 = 0.8;
    const heightFactor2 = 0.8;

    test('Constructor assigns widthFactor and heightFactor correctly', () {
      const decorator = FractionallySizedBoxDecoratorSpec(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      );

      expect(decorator.widthFactor, widthFactor);
      expect(decorator.heightFactor, heightFactor);
    });

    test('Lerp method interpolates correctly', () {
      const start = FractionallySizedBoxDecoratorSpec(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      );
      const end = FractionallySizedBoxDecoratorSpec(
        widthFactor: widthFactor2,
        heightFactor: heightFactor2,
      );
      final result = start.lerp(end, 0.5);

      expect(result.widthFactor, 0.65);
      expect(result.heightFactor, 0.65);
    });

    test('Equality and hashcode test', () {
      const decorator1 = FractionallySizedBoxDecoratorSpec(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      );
      const decorator2 = FractionallySizedBoxDecoratorSpec(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      );
      const decorator3 = FractionallySizedBoxDecoratorSpec(
        widthFactor: widthFactor2,
        heightFactor: heightFactor2,
      );

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates FractionallySizedBox widget with correct factors',
      (WidgetTester tester) async {
        const decorator = FractionallySizedBoxDecoratorSpec(
          widthFactor: widthFactor,
          heightFactor: heightFactor,
        );

        await tester.pumpMaterialApp(decorator.build(Container()));

        final FractionallySizedBox fractionallySizedBoxWidget =
            tester.widget(find.byType(FractionallySizedBox));

        expect(find.byType(FractionallySizedBox), findsOneWidget);
        expect(fractionallySizedBoxWidget, fractionallySizedBoxWidget);
        expect(fractionallySizedBoxWidget.widthFactor, widthFactor);
        expect(fractionallySizedBoxWidget.heightFactor, heightFactor);
        expect(fractionallySizedBoxWidget.child, isA<Container>());
      },
    );
  });

  // SizedBoxDecoratorSpec
  group('SizedBoxDecoratorSpec Tests', () {
    const width = 100.0;
    const height = 100.0;
    const width2 = 200.0;
    const height2 = 200.0;

    test('Constructor assigns width and height correctly', () {
      const decorator = SizedBoxDecoratorSpec(width: width, height: height);

      expect(decorator.width, width);
      expect(decorator.height, height);
    });

    test('Lerp method interpolates correctly', () {
      const start = SizedBoxDecoratorSpec(width: width, height: height);
      const end = SizedBoxDecoratorSpec(width: width2, height: height2);
      final result = start.lerp(end, 0.5);

      expect(result.width, 150.0);
      expect(result.height, 150.0);
    });

    test('Equality and hashcode test', () {
      const decorator1 = SizedBoxDecoratorSpec(width: width, height: height);
      const decorator2 = SizedBoxDecoratorSpec(width: width, height: height);
      const decorator3 = SizedBoxDecoratorSpec(width: width2, height: height2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates SizedBox widget with correct width and height',
      (WidgetTester tester) async {
        const decorator = SizedBoxDecoratorSpec(width: width, height: height);

        await tester.pumpMaterialApp(decorator.build(Container()));

        final SizedBox sizedBoxWidget = tester.widget(find.byType(SizedBox));

        expect(find.byType(SizedBox), findsOneWidget);
        expect(sizedBoxWidget.width, width);
        expect(sizedBoxWidget.height, height);
        expect(sizedBoxWidget.child, isA<Container>());
      },
    );
  });

  //  TransformDecoratorSpec
  group('TransformDecoratorSpec Tests', () {
    final transform = Matrix4.identity();
    final transform2 = Matrix4.rotationZ(0.5);

    test('Constructor assigns transform correctly', () {
      final decorator = TransformDecoratorSpec(transform: transform);

      expect(decorator.transform, transform);
    });

    test('Lerp method interpolates correctly', () {
      final start = TransformDecoratorSpec(transform: transform);
      final end = TransformDecoratorSpec(transform: transform2);
      final result = start.lerp(end, 0.5);

      expect(
        result.transform,
        Matrix4Tween(begin: transform, end: transform2).transform(0.5),
      );
    });

    test('Equality and hashcode test', () {
      final decorator1 = TransformDecoratorSpec(transform: transform);
      final decorator2 = TransformDecoratorSpec(transform: transform);
      final decorator3 = TransformDecoratorSpec(transform: transform2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates Transform widget with correct transform',
      (WidgetTester tester) async {
        final decorator = TransformDecoratorSpec(transform: transform);

        await tester.pumpMaterialApp(decorator.build(Container()));

        final Transform transformWidget = tester.widget(find.byType(Transform));

        expect(find.byType(Transform), findsOneWidget);
        expect(transformWidget.transform, transform);
        expect(transformWidget.child, isA<Container>());
      },
    );
  });
}
