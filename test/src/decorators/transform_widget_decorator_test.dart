import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('TransformDecoratorSpec', () {
    test('lerp', () {
      final spec = TransformDecoratorSpec(transform: Matrix4.rotationX(0.5));
      final other = TransformDecoratorSpec(transform: Matrix4.rotationX(1.0));
      final result = spec.lerp(other, 0.5);
      expect(
          result.transform,
          Matrix4Tween(
            begin: Matrix4.rotationX(0.5),
            end: Matrix4.rotationX(1.0),
          ).lerp(0.5));
    });

    test('copyWith', () {
      final spec = TransformDecoratorSpec(transform: Matrix4.rotationX(0.5));
      final result = spec.copyWith(
        transform: Matrix4.rotationX(0.1),
      );
      expect(result, isA<TransformDecoratorSpec>());
      expect(result.transform, Matrix4.rotationX(0.1));
    });

    testWidgets('build', (tester) async {
      const decorator = TransformDecoratorSpec();

      await tester.pumpMaterialApp(decorator.build(Container()));

      final Transform transform = tester.widget(find.byType(Transform));

      expect(find.byType(Transform), findsOneWidget);

      expect(transform.child, isA<Container>());
    });

    // equality
    test('equality', () {
      final spec = TransformDecoratorSpec(transform: Matrix4.rotationX(0.5));
      final other = TransformDecoratorSpec(transform: Matrix4.rotationX(0.5));
      expect(spec, other);
    });

    test('inequality', () {
      final spec = TransformDecoratorSpec(transform: Matrix4.rotationX(0.5));
      final other = TransformDecoratorSpec(transform: Matrix4.rotationX(1.0));
      expect(spec, isNot(other));
    });
  });

  group(
    'TransformDecoratorAttribute',
    () {
      test('merge', () {
        const decorator = TransformDecoratorAttribute();
        const other = TransformDecoratorAttribute();
        final result = decorator.merge(other);
        expect(result, decorator);
      });

      test('resolve', () {
        final decorator =
            TransformDecoratorAttribute(transform: Matrix4.rotationX(0.5));
        final result = decorator.resolve(EmptyMixData);
        expect(result, isA<TransformDecoratorSpec>());
        expect(result.transform, Matrix4.rotationX(0.5));
      });

      // equality
      test('equality', () {
        final decorator =
            TransformDecoratorAttribute(transform: Matrix4.rotationX(0.5));
        final other =
            TransformDecoratorAttribute(transform: Matrix4.rotationX(0.5));
        expect(decorator, other);
      });

      test('merge with null', () {
        final decorator =
            TransformDecoratorAttribute(transform: Matrix4.rotationX(0.5));
        final result = decorator.merge(null);
        expect(result, decorator);
      });

      test('equality', () {
        final decorator1 =
            TransformDecoratorAttribute(transform: Matrix4.rotationX(0.5));
        final decorator2 =
            TransformDecoratorAttribute(transform: Matrix4.rotationX(0.5));
        expect(decorator1, decorator2);
      });

      test('inequality', () {
        final decorator1 =
            TransformDecoratorAttribute(transform: Matrix4.rotationX(0.5));
        final decorator2 =
            TransformDecoratorAttribute(transform: Matrix4.rotationX(1.0));
        expect(decorator1, isNot(decorator2));
      });

      test('inequality', () {
        final decorator =
            TransformDecoratorAttribute(transform: Matrix4.rotationX(0.5));
        final other =
            TransformDecoratorAttribute(transform: Matrix4.rotationX(1.0));
        expect(decorator, isNot(equals(other)));
      });
    },
  );

  group('TransformUtility', () {
    test('call', () {
      final utility =
          TransformUtility<TransformDecoratorAttribute>((attr) => attr);
      final matrix = Matrix4.rotationX(0.5);
      final result = utility(matrix);
      expect(result.transform, matrix);
    });

    test('scale', () {
      final utility =
          TransformUtility<TransformDecoratorAttribute>((attr) => attr);
      final result = utility.scale(2.0);
      expect(result.transform, Matrix4.diagonal3Values(2.0, 2.0, 1.0));
      expect(result.alignment, Alignment.center);
    });

    test('rotate', () {
      final utility =
          TransformUtility<TransformDecoratorAttribute>((attr) => attr);
      final result = utility.rotate(0.5);
      expect(result.transform, Matrix4.rotationZ(0.5));
      expect(result.alignment, Alignment.center);
    });
  });
}
