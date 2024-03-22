import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('ScaleDecoratorSpec', () {
    test('Constructor assigns scale correctly', () {
      const scale = 1.5;
      final decorator = transform.scale(scale);

      final spec = decorator.resolve(
        MockMixData(
          Style(decorator),
        ),
      );

      expect(spec.transform, Matrix4.diagonal3Values(scale, scale, 1));
    });

    testWidgets(
      'Build method creates Transform.scale widget with correct scale',
      (WidgetTester tester) async {
        const scale = 1.5;

        final decorator = transform.scale(scale);

        final spec = decorator.resolve(
          MockMixData(
            Style(decorator),
          ),
        );

        await tester.pumpMaterialApp(spec.build(Container()));

        final Transform transformWidget = tester.widget(find.byType(Transform));

        expect(find.byType(Transform), findsOneWidget);
        expect(
          transformWidget.transform,
          Matrix4.diagonal3Values(scale, scale, 1.0),
        );
        expect(transformWidget.child, isA<Container>());
      },
    );
  });

  // group('ScaleDecoratorAttribute', () {
  //   test('merge', () {
  //     const decorator = ScaleDecoratorAttribute(1.5);
  //     const other = ScaleDecoratorAttribute(1.6);
  //     final result = decorator.merge(other);
  //     expect(result, other);
  //   });

  //   test('resolve', () {
  //     const decorator = ScaleDecoratorAttribute(1.5);
  //     final result = decorator.resolve(EmptyMixData);
  //     expect(result, isA<ScaleDecoratorSpec>());
  //   });

  //   test('equality', () {
  //     const decorator = ScaleDecoratorAttribute(1.5);
  //     const other = ScaleDecoratorAttribute(1.5);
  //     expect(decorator, other);
  //   });

  //   test('inequality', () {
  //     const decorator = ScaleDecoratorAttribute(1.5);
  //     const other = ScaleDecoratorAttribute(2.0);
  //     expect(decorator, isNot(equals(other)));
  //   });
}
