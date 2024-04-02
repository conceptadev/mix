import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('Variant', () {
    testWidgets(
      'should set attributes when variant matches, otherwise null',
      (WidgetTester tester) async {
        final style = Style(
          icon.color.black(),
          _foo(box.height(10), box.width(10)),
        );

        await tester.pumpMaterialApp(
          Row(
            children: [
              _buildDefaultTestCase(style, [_foo]),
              _buildTestCaseToVerifyIfNull(style, [_bar]),
            ],
          ),
        );
      },
    );
  });

  group('MultiVariant', () {
    test('remove should remove the correct variants', () {
      const variant1 = Variant('variant1');
      const variant2 = Variant('variant2');
      const variant3 = Variant('variant3');
      final multiVariant =
          MultiVariant.and(const [variant1, variant2, variant3]);

      final result = multiVariant.remove([variant1, variant2]);

      expect(result, isA<Variant>());
      expect((result as Variant).name, variant3.name);
    });

    test('matches should correctly match variants', () {
      const variant1 = Variant('variant1');
      const variant2 = Variant('variant2');
      const variant3 = Variant('variant3');
      final multiAndVariant = MultiVariant.and(const [variant1, variant2]);

      final multiOrVariant = MultiVariant.or(const [variant1, variant2]);

      expect(multiAndVariant.matches([variant1, variant2, variant3]), isTrue);
      expect(multiAndVariant.matches([variant1]), isFalse);
      expect(multiOrVariant.matches([variant1, variant2, variant3]), isTrue);
      expect(multiOrVariant.matches([variant1]), isTrue);
    });

    test('when should correctly match context variants', () {
      final variant1 = ContextVariant((context) => true);
      final variant2 = ContextVariant((context) => false);
      final multiAndVariant = MultiVariant.and([variant1, variant2]);
      final multiOrVariant = MultiVariant.or([variant1, variant2]);

      expect(multiAndVariant.when(MockBuildContext()), isFalse);
      expect(multiOrVariant.when(MockBuildContext()), isTrue);
    });

    test('MultiVariant.and should correctly create a MultiVariant', () {
      const variant1 = Variant('variant1');
      const variant2 = Variant('variant2');
      final multiVariant = MultiVariant.and(const [variant1, variant2]);

      expect(multiVariant.variants, containsAll([variant1, variant2]));
      expect(multiVariant.operatorType, MultiVariantOperator.and);
    });

    test('MultiVariant.or should correctly create a MultiVariant', () {
      const variant1 = Variant('variant1');
      const variant2 = Variant('variant2');
      final multiVariant = MultiVariant.or(const [variant1, variant2]);

      expect(multiVariant.variants, containsAll([variant1, variant2]));
      expect(multiVariant.operatorType, MultiVariantOperator.or);
    });

    group('when', () {
      test(
          'MultiVariant.or with 2 PressableStateVariant (false & false) should return true',
          () {
        final variant1 = ContextVariant((context) => false);
        final variant2 = ContextVariant((context) => false);
        final multiVariant = MultiVariant.or([variant1, variant2]);

        final expectValue = multiVariant.when(MockBuildContext());

        expect(expectValue, isFalse);
        expect(multiVariant.operatorType, MultiVariantOperator.or);
      });

      test(
          'MultiVariant.or with 2 PressableStateVariant (false & true) should return true',
          () {
        final variant1 = ContextVariant((context) => false);
        final variant2 = ContextVariant((context) => true);
        final multiVariant = MultiVariant.or([variant1, variant2]);

        final expectValue = multiVariant.when(MockBuildContext());

        expect(expectValue, isTrue);
        expect(multiVariant.operatorType, MultiVariantOperator.or);
      });

      test(
          'MultiVariant.or with 2 PressableStateVariant (true & true) should return true',
          () {
        final variant1 = ContextVariant((context) => true);
        final variant2 = ContextVariant((context) => true);
        final multiVariant = MultiVariant.or([variant1, variant2]);

        final expectValue = multiVariant.when(MockBuildContext());

        expect(expectValue, isTrue);
        expect(multiVariant.operatorType, MultiVariantOperator.or);
      });

      test(
          'MultiVariant.and with 2 ContextVariant (false & false) should return false',
          () {
        final variant1 = ContextVariant((context) => false);
        final variant2 = ContextVariant((context) => false);
        final multiVariant = MultiVariant.and([variant1, variant2]);

        final expectValue = multiVariant.when(MockBuildContext());

        expect(expectValue, isFalse);
        expect(multiVariant.operatorType, MultiVariantOperator.and);
      });

      test(
          'MultiVariant.and with 2 ContextVariant (false & true) should return false',
          () {
        final variant1 = ContextVariant((context) => false);
        final variant2 = ContextVariant((context) => true);
        final multiVariant = MultiVariant.and([variant1, variant2]);

        final expectValue = multiVariant.when(MockBuildContext());

        expect(expectValue, isFalse);
        expect(multiVariant.operatorType, MultiVariantOperator.and);
      });

      test(
          'MultiVariant.and with 2 ContextVariant (true & true) should return true',
          () {
        final variant1 = ContextVariant((context) => true);
        final variant2 = ContextVariant((context) => true);
        final multiVariant = MultiVariant.and([variant1, variant2]);

        final expectValue = multiVariant.when(MockBuildContext());

        expect(expectValue, isTrue);
        expect(multiVariant.operatorType, MultiVariantOperator.and);
      });

      test('Mv.or(v1, Mv.or(v2,v3)) with 3 ContextVariant', () {
        void testCase({
          required bool v1,
          required bool v2,
          required bool v3,
          required Matcher expected,
        }) {
          _testWhenWithThreeVariants(
            v1: v1,
            v2: v2,
            v3: v3,
            condition: (v1, v2, v3) {
              return MultiVariant.or([
                v1,
                MultiVariant.or([v2, v3]),
              ]);
            },
            expectedValue: expected,
          );
        }

        testCase(v1: true, v2: true, v3: true, expected: isTrue);
        testCase(v1: true, v2: true, v3: false, expected: isTrue);
        testCase(v1: true, v2: false, v3: true, expected: isTrue);
        testCase(v1: true, v2: false, v3: false, expected: isTrue);
        testCase(v1: false, v2: true, v3: true, expected: isTrue);
        testCase(v1: false, v2: true, v3: false, expected: isTrue);
        testCase(v1: false, v2: false, v3: true, expected: isTrue);
        testCase(v1: false, v2: false, v3: false, expected: isFalse);
      });

      test('Mv.and(v1, Mv.and(v2,v3)) with 3 ContextVariant', () {
        void testCase({
          required bool v1,
          required bool v2,
          required bool v3,
          required Matcher expected,
        }) {
          _testWhenWithThreeVariants(
            v1: v1,
            v2: v2,
            v3: v3,
            condition: (v1, v2, v3) {
              return MultiVariant.and([
                v1,
                MultiVariant.and([v2, v3]),
              ]);
            },
            expectedValue: expected,
          );
        }

        testCase(v1: true, v2: true, v3: true, expected: isTrue);
        testCase(v1: true, v2: true, v3: false, expected: isFalse);
        testCase(v1: true, v2: false, v3: true, expected: isFalse);
        testCase(v1: true, v2: false, v3: false, expected: isFalse);
        testCase(v1: false, v2: true, v3: true, expected: isFalse);
        testCase(v1: false, v2: true, v3: false, expected: isFalse);
        testCase(v1: false, v2: false, v3: true, expected: isFalse);
        testCase(v1: false, v2: false, v3: false, expected: isFalse);
      });

      test('Mv.or(v1, Mv.and(v2,v3)) with 3 ContextVariant', () {
        void testCase({
          required bool v1,
          required bool v2,
          required bool v3,
          required Matcher expected,
        }) {
          _testWhenWithThreeVariants(
            v1: v1,
            v2: v2,
            v3: v3,
            condition: (v1, v2, v3) {
              return MultiVariant.or([
                v1,
                MultiVariant.and([v2, v3]),
              ]);
            },
            expectedValue: expected,
          );
        }

        testCase(v1: true, v2: true, v3: true, expected: isTrue);
        testCase(v1: true, v2: true, v3: false, expected: isTrue);
        testCase(v1: true, v2: false, v3: true, expected: isTrue);
        testCase(v1: true, v2: false, v3: false, expected: isTrue);
        testCase(v1: false, v2: true, v3: true, expected: isTrue);
        testCase(v1: false, v2: true, v3: false, expected: isFalse);
        testCase(v1: false, v2: false, v3: true, expected: isFalse);
        testCase(v1: false, v2: false, v3: false, expected: isFalse);
      });

      test('Mv.and(v1, Mv.or(v2,v3)) with 3 ContextVariant', () {
        void testCase({
          required bool v1,
          required bool v2,
          required bool v3,
          required Matcher expected,
        }) {
          _testWhenWithThreeVariants(
            v1: v1,
            v2: v2,
            v3: v3,
            condition: (v1, v2, v3) {
              return MultiVariant.and([
                v1,
                MultiVariant.or([v2, v3]),
              ]);
            },
            expectedValue: expected,
          );
        }

        testCase(v1: true, v2: true, v3: true, expected: isTrue);
        testCase(v1: true, v2: true, v3: false, expected: isTrue);
        testCase(v1: true, v2: false, v3: true, expected: isTrue);
        testCase(v1: true, v2: false, v3: false, expected: isFalse);
        testCase(v1: false, v2: true, v3: true, expected: isFalse);
        testCase(v1: false, v2: true, v3: false, expected: isFalse);
        testCase(v1: false, v2: false, v3: true, expected: isFalse);
        testCase(v1: false, v2: false, v3: false, expected: isFalse);
      });
    });
  });
}

typedef _ConditionBuilder = MultiVariant Function(
  StyleVariant v1,
  StyleVariant v2,
  StyleVariant v3,
);

void _testWhenWithThreeVariants({
  required bool v1,
  required bool v2,
  required bool v3,
  required _ConditionBuilder condition,
  required Matcher expectedValue,
}) {
  final variant1 = ContextVariant((context) => v1);
  final variant2 = ContextVariant((context) => v2);
  final variant3 = ContextVariant((context) => v3);

  final multiVariant = condition(variant1, variant2, variant3);

  final expectValue = multiVariant.when(MockBuildContext());

  expect(expectValue, expectedValue);
}

Widget _buildDefaultTestCase(Style style, List<Variant> variants) {
  return Builder(
    builder: (context) {
      final mixData = MixData.create(context, style.applyVariants(variants));

      final box = BoxSpec.of(mixData);
      final icon = IconSpec.of(mixData);

      expect(box.height, 10);
      expect(box.width, 10);
      expect(icon.color, Colors.black);

      return const SizedBox();
    },
  );
}

Widget _buildTestCaseToVerifyIfNull(Style style, List<Variant> variants) {
  return Builder(
    builder: (context) {
      final mixData = MixData.create(context, style.applyVariants(variants));

      final box = BoxSpec.of(mixData);
      final icon = IconSpec.of(mixData);

      expect(box.height, null);
      expect(box.width, null);
      expect(icon.color, Colors.black);

      return const SizedBox();
    },
  );
}

const _foo = Variant('foo');
const _bar = Variant('bar');
