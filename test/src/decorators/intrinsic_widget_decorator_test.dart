import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/decorators/intrinsic_widget_decorator.dart';

import '../../helpers/testing_utils.dart';

void main() {
  // IntrinsicHeightWidgetSpec
  group('IntrinsicHeightWidgetSpec', () {
    test('lerp', () {
      const spec = IntrinsicHeightWidgetSpec();
      const other = IntrinsicHeightWidgetSpec();
      final result = spec.lerp(other, 0.5);
      expect(result, spec);
    });

    test('copyWith', () {
      const spec = IntrinsicHeightWidgetSpec();
      final result = spec.copyWith();
      expect(result, spec);
    });

    testWidgets('build', (tester) async {
      const decorator = IntrinsicHeightWidgetSpec();

      await tester.pumpMaterialApp(decorator.build(Container()));

      final IntrinsicHeight intrinsicHeight =
          tester.widget(find.byType(IntrinsicHeight));

      expect(find.byType(IntrinsicHeight), findsOneWidget);

      expect(intrinsicHeight.child, isA<Container>());
    });

    // equality
    test('equality', () {
      const spec = IntrinsicHeightWidgetSpec();
      const other = IntrinsicHeightWidgetSpec();
      expect(spec, other);
    });
  });

  // IntrinsicHeightWidgetDecorator
  group('IntrinsicHeightWidgetDecorator', () {
    test('merge', () {
      const decorator = IntrinsicHeightWidgetDecorator();
      const other = IntrinsicHeightWidgetDecorator();
      final result = decorator.merge(other);
      expect(result, decorator);
    });

    test('resolve', () {
      const decorator = IntrinsicHeightWidgetDecorator();
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<IntrinsicHeightWidgetSpec>());
    });

    // equality
    test('equality', () {
      const decorator = IntrinsicHeightWidgetDecorator();
      const other = IntrinsicHeightWidgetDecorator();
      expect(decorator, other);
    });
  });

  // IntrinsicWidthWidgetSpec
  group('IntrinsicWidthWidgetSpec', () {
    test('lerp', () {
      const spec = IntrinsicWidthWidgetSpec();
      const other = IntrinsicWidthWidgetSpec();
      final result = spec.lerp(other, 0.5);
      expect(result, spec);
    });

    test('copyWith', () {
      const spec = IntrinsicWidthWidgetSpec();
      final result = spec.copyWith();
      expect(result, spec);
    });

    // equality
    test('equality', () {
      const spec = IntrinsicWidthWidgetSpec();
      const other = IntrinsicWidthWidgetSpec();
      expect(spec, other);
    });

    testWidgets('build', (tester) async {
      const decorator = IntrinsicWidthWidgetSpec();

      await tester.pumpMaterialApp(decorator.build(Container()));

      final IntrinsicWidth intrinsicWidth =
          tester.widget(find.byType(IntrinsicWidth));

      expect(find.byType(IntrinsicWidth), findsOneWidget);

      expect(intrinsicWidth.child, isA<Container>());
    });
  });

  // IntrinsicWidthWidgetDecorator
  group('IntrinsicWidthWidgetDecorator', () {
    test('merge', () {
      const decorator = IntrinsicWidthWidgetDecorator();
      const other = IntrinsicWidthWidgetDecorator();
      final result = decorator.merge(other);
      expect(result, decorator);
    });

    test('resolve', () {
      const decorator = IntrinsicWidthWidgetDecorator();
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<IntrinsicWidthWidgetSpec>());
    });

    // equality
    test('equality', () {
      const decorator = IntrinsicWidthWidgetDecorator();
      const other = IntrinsicWidthWidgetDecorator();
      expect(decorator, other);
    });
  });
}
