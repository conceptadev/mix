import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('TransformWidgetSpec', () {
    test('lerp', () {
      final spec = TransformWidgetSpec(transform: Matrix4.rotationX(0.5));
      final other = TransformWidgetSpec(transform: Matrix4.rotationX(1.0));
      final result = spec.lerp(other, 0.5);
      expect(
          result.transform,
          Matrix4Tween(
            begin: Matrix4.rotationX(0.5),
            end: Matrix4.rotationX(1.0),
          ).lerp(0.5));
    });

    test('copyWith', () {
      final spec = TransformWidgetSpec(transform: Matrix4.rotationX(0.5));
      final result = spec.copyWith(
        transform: Matrix4.rotationX(0.1),
      );
      expect(result, isA<TransformWidgetSpec>());
      expect(result.transform, Matrix4.rotationX(0.1));
    });

    testWidgets('build', (tester) async {
      const decorator = TransformWidgetSpec();

      await tester.pumpMaterialApp(decorator.build(Container()));

      final Transform transform = tester.widget(find.byType(Transform));

      expect(find.byType(Transform), findsOneWidget);

      expect(transform.child, isA<Container>());
    });

    // equality
    test('equality', () {
      final spec = TransformWidgetSpec(transform: Matrix4.rotationX(0.5));
      final other = TransformWidgetSpec(transform: Matrix4.rotationX(0.5));
      expect(spec, other);
    });

    test('inequality', () {
      final spec = TransformWidgetSpec(transform: Matrix4.rotationX(0.5));
      final other = TransformWidgetSpec(transform: Matrix4.rotationX(1.0));
      expect(spec, isNot(other));
    });
  });

  group(
    'TransformWidgetDecorator',
    () {
      test('merge', () {
        const decorator = TransformWidgetDecorator();
        const other = TransformWidgetDecorator();
        final result = decorator.merge(other);
        expect(result, decorator);
      });

      test('resolve', () {
        final decorator =
            TransformWidgetDecorator(transform: Matrix4.rotationX(0.5));
        final result = decorator.resolve(EmptyMixData);
        expect(result, isA<TransformWidgetSpec>());
        expect(result.transform, Matrix4.rotationX(0.5));
      });

      // equality
      test('equality', () {
        final decorator =
            TransformWidgetDecorator(transform: Matrix4.rotationX(0.5));
        final other =
            TransformWidgetDecorator(transform: Matrix4.rotationX(0.5));
        expect(decorator, other);
      });

      test('inequality', () {
        final decorator =
            TransformWidgetDecorator(transform: Matrix4.rotationX(0.5));
        final other =
            TransformWidgetDecorator(transform: Matrix4.rotationX(1.0));
        expect(decorator, isNot(equals(other)));
      });
    },
  );
}
