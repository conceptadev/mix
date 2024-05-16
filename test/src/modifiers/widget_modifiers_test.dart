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
      const modifier = FractionallySizedBoxDecoratorSpec(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      );

      expect(modifier.widthFactor, widthFactor);
      expect(modifier.heightFactor, heightFactor);
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
      const modifier1 = FractionallySizedBoxDecoratorSpec(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      );
      const modifier2 = FractionallySizedBoxDecoratorSpec(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      );
      const modifier3 = FractionallySizedBoxDecoratorSpec(
        widthFactor: widthFactor2,
        heightFactor: heightFactor2,
      );

      expect(modifier1, modifier2);
      expect(modifier1.hashCode, modifier2.hashCode);
      expect(modifier1 == modifier3, false);
      expect(modifier1.hashCode == modifier3.hashCode, false);
    });

    testWidgets(
      'Build method creates FractionallySizedBox widget with correct factors',
      (WidgetTester tester) async {
        const modifier = FractionallySizedBoxDecoratorSpec(
          widthFactor: widthFactor,
          heightFactor: heightFactor,
        );

        await tester.pumpMaterialApp(modifier.build(Container()));

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
      const modifier = SizedBoxDecoratorSpec(width: width, height: height);

      expect(modifier.width, width);
      expect(modifier.height, height);
    });

    test('Lerp method interpolates correctly', () {
      const start = SizedBoxDecoratorSpec(width: width, height: height);
      const end = SizedBoxDecoratorSpec(width: width2, height: height2);
      final result = start.lerp(end, 0.5);

      expect(result.width, 150.0);
      expect(result.height, 150.0);
    });

    test('Equality and hashcode test', () {
      const modifier1 = SizedBoxDecoratorSpec(width: width, height: height);
      const modifier2 = SizedBoxDecoratorSpec(width: width, height: height);
      const modifier3 = SizedBoxDecoratorSpec(width: width2, height: height2);

      expect(modifier1, modifier2);
      expect(modifier1.hashCode, modifier2.hashCode);
      expect(modifier1 == modifier3, false);
      expect(modifier1.hashCode == modifier3.hashCode, false);
    });

    testWidgets(
      'Build method creates SizedBox widget with correct width and height',
      (WidgetTester tester) async {
        const modifier = SizedBoxDecoratorSpec(width: width, height: height);

        await tester.pumpMaterialApp(modifier.build(Container()));

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
      final modifier = TransformDecoratorSpec(transform: transform);

      expect(modifier.transform, transform);
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
      final modifier1 = TransformDecoratorSpec(transform: transform);
      final modifier2 = TransformDecoratorSpec(transform: transform);
      final modifier3 = TransformDecoratorSpec(transform: transform2);

      expect(modifier1, modifier2);
      expect(modifier1.hashCode, modifier2.hashCode);
      expect(modifier1 == modifier3, false);
      expect(modifier1.hashCode == modifier3.hashCode, false);
    });

    testWidgets(
      'Build method creates Transform widget with correct transform',
      (WidgetTester tester) async {
        final modifier = TransformDecoratorSpec(transform: transform);

        await tester.pumpMaterialApp(modifier.build(Container()));

        final Transform transformWidget = tester.widget(find.byType(Transform));

        expect(find.byType(Transform), findsOneWidget);
        expect(transformWidget.transform, transform);
        expect(transformWidget.child, isA<Container>());
      },
    );
  });
}
