import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  const onNot = OnNotVariant.new;
  group('ContextVariant', () {
    test('Equality holds when all properties are the same', () {
      final variant1 = MockContextVariantCondition(true);
      final variant2 = MockContextVariantCondition(true);
      expect(variant1, variant2);
    });
    test('Equality fails when properties are different', () {
      final variant1 = MockContextVariantCondition(true);
      final variant2 = MockContextVariantCondition(false);
      expect(variant1, isNot(variant2));
    });
  });

  group('Not Utils', () {
    final onLight = OnBrightnessVariant(Brightness.light);
    final onDark = OnBrightnessVariant(Brightness.dark);
    testWidgets('reverts when of context variant', (tester) async {
      await tester.pumpWidget(createBrightnessTheme(Brightness.light));
      var context = tester.element(find.byType(Container));

      expect(onLight.when(context), true, reason: 'light');
      expect(onDark.when(context), false, reason: 'dark');

      final notLight = onNot(onLight);
      final notDark = onNot(onDark);

      expect(notLight.when(context), false, reason: 'not light');
      expect(notDark.when(context), true, reason: 'not dark');
    });
  });

  group('Style different kinds of variants', () {
    final variantLow = MockContextVariantCondition(
      true,
      priority: VariantPriority.low,
    );

    const variant = Variant('variant');

    test('only ContextVariant', () {
      // It's working
      final style = applyContextToVisualAttributes(
        MockBuildContext(),
        Style(
          const MockIntScalarAttribute(2),
          variantLow(
            const MockIntScalarAttribute(1),
          ),
        ),
      );

      final expectedStyle = Style(
        const MockIntScalarAttribute(1),
      ).styles.values;

      expect(style, expectedStyle);
    });

    test('with MultiVariant(ContextVariant & Variant)', () {
      final variantLow = MockContextVariantCondition(
        true,
        priority: VariantPriority.low,
      );

      final context = MockBuildContext();

      final style = Style(
        const MockIntScalarAttribute(2),
        (variantLow & variant)(
          const MockIntScalarAttribute(1),
        ),
      ).applyVariant(variant);

      final expectedStyle = Style(
        const MockIntScalarAttribute(1),
      );

      expect(style.of(context), expectedStyle.of(context));
    });

    test('only ContextVariant inside a Variant', () {
      // It's working
      final variantLow = MockContextVariantCondition(
        true,
        priority: VariantPriority.low,
      );

      final style = applyContextToVisualAttributes(
        MockBuildContext(),
        Style(
          const MockIntScalarAttribute(2),
          variant(
            variantLow(
              const MockIntScalarAttribute(1),
            ),
          ),
        ).applyVariant(variant),
      );

      final expectedStyle = Style(
        const MockIntScalarAttribute(1),
      ).styles.values;

      expect(style, expectedStyle);
    });

    test('only Variant inside a ContextVariant', () {
      final variantLow = MockContextVariantCondition(
        true,
        priority: VariantPriority.low,
      );

      final style = Style(
        const MockIntScalarAttribute(2),
        variantLow(
          variant(
            const MockIntScalarAttribute(1),
          ),
        ),
      ).applyVariant(variant);

      final expectedStyle = Style(
        const MockIntScalarAttribute(1),
      );

      expect(style, isNot(expectedStyle), reason: 'style');
      expect(style.of(MockBuildContext()),
          isNot(expectedStyle.of(MockBuildContext())),
          reason: 'mix data');
    });
  });
}
