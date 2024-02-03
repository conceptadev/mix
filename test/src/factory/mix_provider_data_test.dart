import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  final autoApplyVariant = ContextVariant('mock', (context) => true);
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
    expect(mixData.attributeOf<MockIntScalarAttribute>(), isInstanceOf<MockIntScalarAttribute>());
    expect(
      mixData.attributeOf<MockStringScalarAttribute>(),
      const MockStringScalarAttribute('test'),
    );
    expect(
      mixData.attributeOf<MockStringScalarAttribute>(),
      isInstanceOf<MockStringScalarAttribute>(),
    );
    expect(mixData.attributeOf<MockDoubleScalarAttribute>(), const MockDoubleScalarAttribute(2.0));

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

    expect(mergedMixData.attributeOf<MockIntScalarAttribute>(), const MockIntScalarAttribute(1));
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
            final inheritedMix = MixData.inherited(context);
            final iconSpec = IconSpec.of(inheritedMix!);

            expect(inheritedMix.attributes.length, 1);
            expect(iconSpec.color, Colors.black);

            return const SizedBox();
          }),
        ),
      );
    },
  );
}

class _NonInheritableAttribute extends ScalarAttribute<MockIntScalarAttribute, int?> {
  const _NonInheritableAttribute() : super(null);

  @override
  bool get isInheritable => false;
}
