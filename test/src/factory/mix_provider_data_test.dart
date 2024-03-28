// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('MixData', () {
    final autoApplyVariant = ContextVariant((context) => true);
    test('MixData create', () {
      final mixData = MixData.create(
        MockBuildContext(),
        Style(
          const MockIntScalarAttribute(1),
          const MockStringScalarAttribute('test'),
          const MockDoubleScalarAttribute(3.0),
          const MockBooleanScalarAttribute(false),
          autoApplyVariant(const MockDoubleScalarAttribute(2.0)),
        ),
      );

      // Test that the `MixData` object is created with the correct properties.
      expect(mixData, isInstanceOf<MixData>());

      // Add any other additional assertions that are specific to your use case.
      // If you become able to access properties _attributes and _resolver you would assert:
      expect(mixData.attributes, isInstanceOf<AttributeMap>());
      expect(mixData.tokens, isInstanceOf<MixTokenResolver>());
      expect(mixData.attributes.length, 4);
      expect(
        mixData.attributeOf<MockIntScalarAttribute>(),
        isInstanceOf<MockIntScalarAttribute>(),
      );
      expect(
        mixData.attributeOf<MockStringScalarAttribute>(),
        const MockStringScalarAttribute('test'),
      );
      expect(
        mixData.attributeOf<MockStringScalarAttribute>(),
        isInstanceOf<MockStringScalarAttribute>(),
      );
      expect(
        mixData.attributeOf<MockDoubleScalarAttribute>(),
        const MockDoubleScalarAttribute(2.0),
      );

      expect(
        mixData.attributeOf<MockBooleanScalarAttribute>(),
        const MockBooleanScalarAttribute(false),
      );
    });

    test('MixData merge', () {
      final mixData = MixData.create(
        MockBuildContext(),
        Style(
          const MockIntScalarAttribute(1),
          const MockStringScalarAttribute('test'),
          const MockDoubleScalarAttribute(3.0),
          const MockBooleanScalarAttribute(true),
          autoApplyVariant(const MockDoubleScalarAttribute(2.0)),
        ),
      );

      final mixData2 = MixData.create(
        MockBuildContext(),
        Style(
          const MockDoubleScalarAttribute(5.0),
          autoApplyVariant(const MockDoubleScalarAttribute(4.0)),
        ),
      );

      final mergedMixData = mixData.merge(mixData2);

      expect(mergedMixData, isInstanceOf<MixData>());
      expect(mergedMixData.attributes.length, 4);
      expect(
        mergedMixData.attributeOf<MockIntScalarAttribute>(),
        isInstanceOf<MockIntScalarAttribute>(),
      );
      expect(
        mergedMixData.attributeOf<MockStringScalarAttribute>(),
        isInstanceOf<MockStringScalarAttribute>(),
      );
      expect(
        mergedMixData.attributeOf<MockDoubleScalarAttribute>(),
        isInstanceOf<MockDoubleScalarAttribute>(),
      );

      expect(
        mergedMixData.attributeOf<MockBooleanScalarAttribute>(),
        const MockBooleanScalarAttribute(true),
      );

      expect(
        mergedMixData.attributeOf<MockIntScalarAttribute>(),
        const MockIntScalarAttribute(1),
      );
      expect(
        mergedMixData.attributeOf<MockStringScalarAttribute>(),
        const MockStringScalarAttribute('test'),
      );
      expect(
        mergedMixData.attributeOf<MockDoubleScalarAttribute>(),
        const MockDoubleScalarAttribute(4.0),
      );
    });

    testWidgets(
      'MixData.inherited shouldnt have attributes non inheritable',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MixProvider(
            data: MixData.create(
              MockBuildContext(),
              Style(const _NonInheritableAttribute(), icon.color.black()),
            ),
            child: Builder(builder: (context) {
              final inheritedMix = MixProvider.maybeOfInherited(context);
              final iconSpec = IconSpec.of(inheritedMix!);

              expect(inheritedMix.attributes.length, 1);
              expect(iconSpec.color, Colors.black);

              return const SizedBox();
            }),
          ),
        );
      },
    );

    group('applyContextToVisualAttributes', () {
      test(
          'must return the same Style that was inputted when there is not ContextVariant in the Style (simple variant)',
          () {
        final style = Style(
          icon.color.black(),
        );

        final attributeList =
            applyContextToVisualAttributes(MockBuildContext(), style);

        expect(attributeList, style.styles.values);
      });

      test(
          'must return the same Style that was inputted when is only Variants in the Style',
          () {
        _testApplyContextToVisualAttributes(
          condition: MultiVariant.or(const [Variant('1'), Variant('2')]),
          isExpectedToApply: false,
        );

        _testApplyContextToVisualAttributes(
          condition: MultiVariant.and(const [Variant('1'), Variant('2')]),
          isExpectedToApply: false,
        );

        _testApplyContextToVisualAttributes(
          condition: MultiVariant.or([
            const Variant('1'),
            MultiVariant.or(const [Variant('2'), Variant('3')])
          ]),
          isExpectedToApply: false,
        );

        _testApplyContextToVisualAttributes(
          condition: MultiVariant.or([
            const Variant('1'),
            MultiVariant.and(const [Variant('2'), Variant('3')])
          ]),
          isExpectedToApply: false,
        );

        _testApplyContextToVisualAttributes(
          condition: MultiVariant.and([
            const Variant('1'),
            MultiVariant.or(const [Variant('2'), Variant('3')])
          ]),
          isExpectedToApply: false,
        );

        _testApplyContextToVisualAttributes(
          condition: MultiVariant.and([
            const Variant('1'),
            MultiVariant.and(const [Variant('2'), Variant('3')])
          ]),
          isExpectedToApply: false,
        );
      });

      group('must respect the condition', () {
        test('with single ContextVariant', () {
          _testApplyContextToVisualAttributes(
            condition: ContextVariant((context) => false),
            isExpectedToApply: false,
          );

          _testApplyContextToVisualAttributes(
            condition: ContextVariant((context) => true),
            isExpectedToApply: true,
          );
        });

        test('with MultiVariant.or(ContextVariant, ContextVariant)', () {
          void testCase(
            bool v1,
            bool v2, {
            required bool equalsTo,
          }) {
            _testApplyContextToVisualAttributes(
              condition: MultiVariant.or([
                ContextVariant((context) => v1),
                ContextVariant((context) => v2)
              ]),
              isExpectedToApply: equalsTo,
            );
          }

          testCase(true, true, equalsTo: true);
          testCase(true, false, equalsTo: true);
          testCase(false, true, equalsTo: true);
          testCase(false, false, equalsTo: false);
        });

        test('with MultiVariant.and(ContextVariant, ContextVariant)', () {
          void testCase(
            bool v1,
            bool v2, {
            required bool equalsTo,
          }) {
            _testApplyContextToVisualAttributes(
              condition: MultiVariant.and([
                ContextVariant((context) => v1),
                ContextVariant((context) => v2)
              ]),
              isExpectedToApply: equalsTo,
            );
          }

          testCase(true, true, equalsTo: true);
          testCase(true, false, equalsTo: false);
          testCase(false, true, equalsTo: false);
          testCase(false, false, equalsTo: false);
        });

        test(
            'with MultiVariant.and(MultiVariant.and(ContextVariant, ContextVariant), ContextVariant)',
            () {
          void testCase(
            bool v1,
            bool v2,
            bool v3, {
            required bool equalsTo,
          }) {
            _testApplyContextToVisualAttributes(
              condition: MultiVariant.and([
                ContextVariant((context) => v1),
                MultiVariant.and([
                  ContextVariant((context) => v2),
                  ContextVariant((context) => v3)
                ]),
              ]),
              isExpectedToApply: equalsTo,
            );
          }

          testCase(true, true, true, equalsTo: true);
          testCase(true, true, false, equalsTo: false);
          testCase(true, false, true, equalsTo: false);
          testCase(true, false, false, equalsTo: false);
          testCase(false, true, true, equalsTo: false);
          testCase(false, true, false, equalsTo: false);
          testCase(false, false, true, equalsTo: false);
          testCase(false, false, false, equalsTo: false);
        });

        test(
            'with MultiVariant.or(MultiVariant.or(ContextVariant, ContextVariant), ContextVariant)',
            () {
          void testCase(
            bool v1,
            bool v2,
            bool v3, {
            required bool equalsTo,
          }) {
            _testApplyContextToVisualAttributes(
              condition: MultiVariant.or([
                ContextVariant((context) => v1),
                MultiVariant.or([
                  ContextVariant((context) => v2),
                  ContextVariant((context) => v3)
                ]),
              ]),
              isExpectedToApply: equalsTo,
            );
          }

          testCase(true, true, true, equalsTo: true);
          testCase(true, true, false, equalsTo: true);
          testCase(true, false, true, equalsTo: true);
          testCase(true, false, false, equalsTo: true);
          testCase(false, true, true, equalsTo: true);
          testCase(false, true, false, equalsTo: true);
          testCase(false, false, true, equalsTo: true);
          testCase(false, false, false, equalsTo: false);
        });

        test(
            'with MultiVariant.and(MultiVariant.or(ContextVariant, ContextVariant), ContextVariant)',
            () {
          void testCase(
            bool v1,
            bool v2,
            bool v3, {
            required bool equalsTo,
          }) {
            _testApplyContextToVisualAttributes(
              condition: MultiVariant.and([
                ContextVariant((context) => v1),
                MultiVariant.or([
                  ContextVariant((context) => v2),
                  ContextVariant((context) => v3)
                ]),
              ]),
              isExpectedToApply: equalsTo,
            );
          }

          testCase(true, true, true, equalsTo: true);
          testCase(true, true, false, equalsTo: true);
          testCase(true, false, true, equalsTo: true);
          testCase(true, false, false, equalsTo: false);
          testCase(false, true, true, equalsTo: false);
          testCase(false, true, false, equalsTo: false);
          testCase(false, false, true, equalsTo: false);
          testCase(false, false, false, equalsTo: false);
        });

        test(
            'with MultiVariant.or(MultiVariant.and(ContextVariant, ContextVariant), ContextVariant)',
            () {
          void testCase(
            bool v1,
            bool v2,
            bool v3, {
            required bool equalsTo,
          }) {
            _testApplyContextToVisualAttributes(
              condition: MultiVariant.or([
                ContextVariant((context) => v1),
                MultiVariant.and([
                  ContextVariant((context) => v2),
                  ContextVariant((context) => v3)
                ]),
              ]),
              isExpectedToApply: equalsTo,
            );
          }

          testCase(true, true, true, equalsTo: true);
          testCase(true, true, false, equalsTo: true);
          testCase(true, false, true, equalsTo: true);
          testCase(true, false, false, equalsTo: true);
          testCase(false, true, true, equalsTo: true);
          testCase(false, true, false, equalsTo: false);
          testCase(false, false, true, equalsTo: false);
          testCase(false, false, false, equalsTo: false);
        });

        test('with MultiVariant.or(Variant, ContextVariant)', () {
          void testCase(
            bool v1, {
            required bool equalsTo,
          }) {
            _testApplyContextToVisualAttributes(
              condition: MultiVariant.or([
                const Variant('1'),
                ContextVariant((context) => v1),
              ]),
              isExpectedToApply: equalsTo,
            );
          }

          testCase(true, equalsTo: true);
          testCase(false, equalsTo: false);
        });

        test('with MultiVariant.or(Variant, ContextVariant)', () {
          void testCase(
            bool v1, {
            required bool equalsTo,
          }) {
            _testApplyContextToVisualAttributes(
              condition: MultiVariant.or([
                const Variant('1'),
                ContextVariant((context) => v1),
              ]),
              isExpectedToApply: equalsTo,
            );
          }

          testCase(true, equalsTo: true);
          testCase(false, equalsTo: false);
        });

        test('with MultiVariant.and(Variant, ContextVariant)', () {
          void testCase(
            bool v1, {
            required bool equalsTo,
          }) {
            _testApplyContextToVisualAttributes(
              condition: MultiVariant.and([
                const Variant('1'),
                ContextVariant((context) => v1),
              ]),
              isExpectedToApply: equalsTo,
            );
          }

          testCase(true, equalsTo: false);
          testCase(false, equalsTo: false);
        });

        test(
            'with MultiVariant.and(Variant, MultiVariant.and(Variant, ContextVariant))',
            () {
          void testCase(
            bool v1, {
            required bool equalsTo,
          }) {
            _testApplyContextToVisualAttributes(
              condition: MultiVariant.and([
                const Variant('1'),
                MultiVariant.and([
                  const Variant('2'),
                  ContextVariant((context) => v1),
                ]),
              ]),
              isExpectedToApply: equalsTo,
            );
          }

          testCase(true, equalsTo: false);
          testCase(false, equalsTo: false);
        });

        test(
            'with MultiVariant.and(ContextVariant, MultiVariant.and(Variant, ContextVariant))',
            () {
          void testCase(
            bool v1,
            bool v2, {
            required bool equalsTo,
          }) {
            _testApplyContextToVisualAttributes(
              condition: MultiVariant.and([
                ContextVariant((context) => v1),
                MultiVariant.and([
                  const Variant('1'),
                  ContextVariant((context) => v2),
                ]),
              ]),
              isExpectedToApply: equalsTo,
            );
          }

          testCase(true, true, equalsTo: false);
          testCase(true, false, equalsTo: false);
          testCase(false, true, equalsTo: false);
          testCase(false, false, equalsTo: false);
        });

        test(
            'with MultiVariant.and(ContextVariant, MultiVariant.or(Variant, ContextVariant))',
            () {
          void testCase(
            bool v1,
            bool v2, {
            required bool equalsTo,
          }) {
            _testApplyContextToVisualAttributes(
              condition: MultiVariant.and([
                ContextVariant((context) => v1),
                MultiVariant.or([
                  const Variant('1'),
                  ContextVariant((context) => v2),
                ]),
              ]),
              isExpectedToApply: equalsTo,
            );
          }

          testCase(true, true, equalsTo: true);
          testCase(true, false, equalsTo: false);
          testCase(false, true, equalsTo: false);
          testCase(false, false, equalsTo: false);
        });

        test(
            'with MultiVariant.or(ContextVariant, MultiVariant.or(Variant, ContextVariant))',
            () {
          void testCase(
            bool v1,
            bool v2, {
            required bool equalsTo,
          }) {
            _testApplyContextToVisualAttributes(
              condition: MultiVariant.or([
                ContextVariant((context) => v1),
                MultiVariant.or([
                  const Variant('1'),
                  ContextVariant((context) => v2),
                ]),
              ]),
              isExpectedToApply: equalsTo,
            );
          }

          testCase(true, true, equalsTo: true);
          testCase(true, false, equalsTo: true);
          testCase(false, true, equalsTo: true);
          testCase(false, false, equalsTo: false);
        });
      });
    });
  });
}

void _testApplyContextToVisualAttributes({
  required dynamic condition,
  required bool isExpectedToApply,
}) {
  final style = Style(
    box.color.black(),
    condition(
      icon.color.black(),
    ),
  );

  final attributeList = applyContextToVisualAttributes(
    MockBuildContext(),
    style,
  );

  final expectedStyle = Style.create([
    box.color.black(),
    if (isExpectedToApply) icon.color.black(),
  ]);

  expect(attributeList, expectedStyle.styles.values);
}

class _NonInheritableAttribute
    extends ScalarAttribute<MockIntScalarAttribute, int?> {
  const _NonInheritableAttribute() : super(null);

  @override
  bool get isInheritable => false;
}
