import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/modifiers/intrinsic_widget_modifier.dart';

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
      const modifier = IntrinsicHeightDecoratorSpec();

      await tester.pumpMaterialApp(modifier.build(Container()));

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
      const modifier = IntrinsicHeightDecoratorAttribute();
      const other = IntrinsicHeightDecoratorAttribute();
      final result = modifier.merge(other);
      expect(result, modifier);
    });

    test('resolve', () {
      const modifier = IntrinsicHeightDecoratorAttribute();
      final result = modifier.resolve(EmptyMixData);
      expect(result, isA<IntrinsicHeightDecoratorSpec>());
    });

    // equality
    test('equality', () {
      const modifier = IntrinsicHeightDecoratorAttribute();
      const other = IntrinsicHeightDecoratorAttribute();
      expect(modifier, other);
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
      const modifier = IntrinsicWidthDecoratorSpec();

      await tester.pumpMaterialApp(modifier.build(Container()));

      final IntrinsicWidth intrinsicWidth =
          tester.widget(find.byType(IntrinsicWidth));

      expect(find.byType(IntrinsicWidth), findsOneWidget);

      expect(intrinsicWidth.child, isA<Container>());
    });
  });

  // IntrinsicWidthDecoratorAttribute
  group('IntrinsicWidthDecoratorAttribute', () {
    test('merge', () {
      const modifier = IntrinsicWidthDecoratorAttribute();
      const other = IntrinsicWidthDecoratorAttribute();
      final result = modifier.merge(other);
      expect(result, modifier);
    });

    test('resolve', () {
      const modifier = IntrinsicWidthDecoratorAttribute();
      final result = modifier.resolve(EmptyMixData);
      expect(result, isA<IntrinsicWidthDecoratorSpec>());
    });

    // equality
    test('equality', () {
      const modifier = IntrinsicWidthDecoratorAttribute();
      const other = IntrinsicWidthDecoratorAttribute();
      expect(modifier, other);
    });
  });
}
