import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/modifiers/intrinsic_widget_modifier.dart';

import '../../helpers/testing_utils.dart';

void main() {
  // IntrinsicHeightModifierSpec
  group('IntrinsicHeightModifierSpec', () {
    test('lerp', () {
      const spec = IntrinsicHeightModifierSpec();
      const other = IntrinsicHeightModifierSpec();
      final result = spec.lerp(other, 0.5);
      expect(result, spec);
    });

    test('copyWith', () {
      const spec = IntrinsicHeightModifierSpec();
      final result = spec.copyWith();
      expect(result, spec);
    });

    testWidgets('build', (tester) async {
      const modifier = IntrinsicHeightModifierSpec();

      await tester.pumpMaterialApp(modifier.build(Container()));

      final IntrinsicHeight intrinsicHeight =
          tester.widget(find.byType(IntrinsicHeight));

      expect(find.byType(IntrinsicHeight), findsOneWidget);

      expect(intrinsicHeight.child, isA<Container>());
    });

    // equality
    test('equality', () {
      const spec = IntrinsicHeightModifierSpec();
      const other = IntrinsicHeightModifierSpec();
      expect(spec, other);
    });
  });

  // IntrinsicHeightModifierAttribute
  group('IntrinsicHeightModifierAttribute', () {
    test('merge', () {
      const modifier = IntrinsicHeightModifierAttribute();
      const other = IntrinsicHeightModifierAttribute();
      final result = modifier.merge(other);
      expect(result, modifier);
    });

    test('resolve', () {
      const modifier = IntrinsicHeightModifierAttribute();
      final result = modifier.resolve(EmptyMixData);
      expect(result, isA<IntrinsicHeightModifierSpec>());
    });

    // equality
    test('equality', () {
      const modifier = IntrinsicHeightModifierAttribute();
      const other = IntrinsicHeightModifierAttribute();
      expect(modifier, other);
    });
  });

  // IntrinsicWidthModifierSpec
  group('IntrinsicWidthModifierSpec', () {
    test('lerp', () {
      const spec = IntrinsicWidthModifierSpec();
      const other = IntrinsicWidthModifierSpec();
      final result = spec.lerp(other, 0.5);
      expect(result, spec);
    });

    test('copyWith', () {
      const spec = IntrinsicWidthModifierSpec();
      final result = spec.copyWith();
      expect(result, spec);
    });

    // equality
    test('equality', () {
      const spec = IntrinsicWidthModifierSpec();
      const other = IntrinsicWidthModifierSpec();
      expect(spec, other);
    });

    testWidgets('build', (tester) async {
      const modifier = IntrinsicWidthModifierSpec();

      await tester.pumpMaterialApp(modifier.build(Container()));

      final IntrinsicWidth intrinsicWidth =
          tester.widget(find.byType(IntrinsicWidth));

      expect(find.byType(IntrinsicWidth), findsOneWidget);

      expect(intrinsicWidth.child, isA<Container>());
    });
  });

  // IntrinsicWidthModifierAttribute
  group('IntrinsicWidthModifierAttribute', () {
    test('merge', () {
      const modifier = IntrinsicWidthModifierAttribute();
      const other = IntrinsicWidthModifierAttribute();
      final result = modifier.merge(other);
      expect(result, modifier);
    });

    test('resolve', () {
      const modifier = IntrinsicWidthModifierAttribute();
      final result = modifier.resolve(EmptyMixData);
      expect(result, isA<IntrinsicWidthModifierSpec>());
    });

    // equality
    test('equality', () {
      const modifier = IntrinsicWidthModifierAttribute();
      const other = IntrinsicWidthModifierAttribute();
      expect(modifier, other);
    });
  });
}
