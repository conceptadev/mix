import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('TransformModifierSpec', () {
    test('lerp', () {
      final spec = TransformModifierSpec(transform: Matrix4.rotationX(0.5));
      final other = TransformModifierSpec(transform: Matrix4.rotationX(1.0));
      final result = spec.lerp(other, 0.5);
      expect(
          result.transform,
          Matrix4Tween(
            begin: Matrix4.rotationX(0.5),
            end: Matrix4.rotationX(1.0),
          ).lerp(0.5));
    });

    test('copyWith', () {
      final spec = TransformModifierSpec(transform: Matrix4.rotationX(0.5));
      final result = spec.copyWith(
        transform: Matrix4.rotationX(0.1),
      );
      expect(result, isA<TransformModifierSpec>());
      expect(result.transform, Matrix4.rotationX(0.1));
    });

    testWidgets('build', (tester) async {
      const modifier = TransformModifierSpec();

      await tester.pumpMaterialApp(modifier.build(Container()));

      final Transform transform = tester.widget(find.byType(Transform));

      expect(find.byType(Transform), findsOneWidget);

      expect(transform.child, isA<Container>());
    });

    // equality
    test('equality', () {
      final spec = TransformModifierSpec(transform: Matrix4.rotationX(0.5));
      final other = TransformModifierSpec(transform: Matrix4.rotationX(0.5));
      expect(spec, other);
    });

    test('inequality', () {
      final spec = TransformModifierSpec(transform: Matrix4.rotationX(0.5));
      final other = TransformModifierSpec(transform: Matrix4.rotationX(1.0));
      expect(spec, isNot(other));
    });
  });

  group(
    'TransformModifierAttribute',
    () {
      test('merge', () {
        const modifier = TransformModifierAttribute();
        const other = TransformModifierAttribute();
        final result = modifier.merge(other);
        expect(result, modifier);
      });

      test('resolve', () {
        final modifier =
            TransformModifierAttribute(transform: Matrix4.rotationX(0.5));
        final result = modifier.resolve(EmptyMixData);
        expect(result, isA<TransformModifierSpec>());
        expect(result.transform, Matrix4.rotationX(0.5));
      });

      // equality
      test('equality', () {
        final modifier =
            TransformModifierAttribute(transform: Matrix4.rotationX(0.5));
        final other =
            TransformModifierAttribute(transform: Matrix4.rotationX(0.5));
        expect(modifier, other);
      });

      test('merge with null', () {
        final modifier =
            TransformModifierAttribute(transform: Matrix4.rotationX(0.5));
        final result = modifier.merge(null);
        expect(result, modifier);
      });

      test('equality', () {
        final modifier1 =
            TransformModifierAttribute(transform: Matrix4.rotationX(0.5));
        final modifier2 =
            TransformModifierAttribute(transform: Matrix4.rotationX(0.5));
        expect(modifier1, modifier2);
      });

      test('inequality', () {
        final modifier1 =
            TransformModifierAttribute(transform: Matrix4.rotationX(0.5));
        final modifier2 =
            TransformModifierAttribute(transform: Matrix4.rotationX(1.0));
        expect(modifier1, isNot(modifier2));
      });

      test('inequality', () {
        final modifier =
            TransformModifierAttribute(transform: Matrix4.rotationX(0.5));
        final other =
            TransformModifierAttribute(transform: Matrix4.rotationX(1.0));
        expect(modifier, isNot(equals(other)));
      });
    },
  );

  group('TransformUtility', () {
    test('call', () {
      final utility =
          TransformUtility<TransformModifierAttribute>((attr) => attr);
      final matrix = Matrix4.rotationX(0.5);
      final result = utility(matrix);
      expect(result.transform, matrix);
    });

    test('scale', () {
      final utility =
          TransformUtility<TransformModifierAttribute>((attr) => attr);
      final result = utility.scale(2.0);
      expect(result.transform, Matrix4.diagonal3Values(2.0, 2.0, 1.0));
      expect(result.alignment, Alignment.center);
    });

    test('rotate', () {
      final utility =
          TransformUtility<TransformModifierAttribute>((attr) => attr);
      final result = utility.rotate(0.5);
      expect(result.transform, Matrix4.rotationZ(0.5));
      expect(result.alignment, Alignment.center);
    });
  });
}
