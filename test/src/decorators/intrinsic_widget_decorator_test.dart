import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/decorators/intrinsic_widget_decorator.dart';

import '../../helpers/testing_utils.dart';

void main() {
  // IntrinsicHeightDecoratorSpec
  group('IntrinsicHeightDecoratorSpec', () {
    test('lerp', () {
      const spec = IntrinsicHeightDecoratorSpec();
      const other = IntrinsicHeightDecoratorSpec();
      final result = spec.lerp(other, 0.5);
      expect(result, spec);
    });

    test('copyWith', () {
      const spec = IntrinsicHeightDecoratorSpec();
      final result = spec.copyWith();
      expect(result, spec);
    });

    testWidgets('build', (tester) async {
      const decorator = IntrinsicHeightDecoratorSpec();

      await tester.pumpMaterialApp(decorator.build(Container()));

      final IntrinsicHeight intrinsicHeight =
          tester.widget(find.byType(IntrinsicHeight));

      expect(find.byType(IntrinsicHeight), findsOneWidget);

      expect(intrinsicHeight.child, isA<Container>());
    });

    // equality
    test('equality', () {
      const spec = IntrinsicHeightDecoratorSpec();
      const other = IntrinsicHeightDecoratorSpec();
      expect(spec, other);
    });
  });

  // IntrinsicHeightDecoratorAttribute
  group('IntrinsicHeightDecoratorAttribute', () {
    test('merge', () {
      const decorator = IntrinsicHeightDecoratorAttribute();
      const other = IntrinsicHeightDecoratorAttribute();
      final result = decorator.merge(other);
      expect(result, decorator);
    });

    test('resolve', () {
      const decorator = IntrinsicHeightDecoratorAttribute();
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<IntrinsicHeightDecoratorSpec>());
    });

    // equality
    test('equality', () {
      const decorator = IntrinsicHeightDecoratorAttribute();
      const other = IntrinsicHeightDecoratorAttribute();
      expect(decorator, other);
    });
  });

  // IntrinsicWidthDecoratorSpec
  group('IntrinsicWidthDecoratorSpec', () {
    test('lerp', () {
      const spec = IntrinsicWidthDecoratorSpec();
      const other = IntrinsicWidthDecoratorSpec();
      final result = spec.lerp(other, 0.5);
      expect(result, spec);
    });

    test('copyWith', () {
      const spec = IntrinsicWidthDecoratorSpec();
      final result = spec.copyWith();
      expect(result, spec);
    });

    // equality
    test('equality', () {
      const spec = IntrinsicWidthDecoratorSpec();
      const other = IntrinsicWidthDecoratorSpec();
      expect(spec, other);
    });

    testWidgets('build', (tester) async {
      const decorator = IntrinsicWidthDecoratorSpec();

      await tester.pumpMaterialApp(decorator.build(Container()));

      final IntrinsicWidth intrinsicWidth =
          tester.widget(find.byType(IntrinsicWidth));

      expect(find.byType(IntrinsicWidth), findsOneWidget);

      expect(intrinsicWidth.child, isA<Container>());
    });
  });

  // IntrinsicWidthDecoratorAttribute
  group('IntrinsicWidthDecoratorAttribute', () {
    test('merge', () {
      const decorator = IntrinsicWidthDecoratorAttribute();
      const other = IntrinsicWidthDecoratorAttribute();
      final result = decorator.merge(other);
      expect(result, decorator);
    });

    test('resolve', () {
      const decorator = IntrinsicWidthDecoratorAttribute();
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<IntrinsicWidthDecoratorSpec>());
    });

    // equality
    test('equality', () {
      const decorator = IntrinsicWidthDecoratorAttribute();
      const other = IntrinsicWidthDecoratorAttribute();
      expect(decorator, other);
    });
  });
}
