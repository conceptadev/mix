import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/core/attributes_map.dart';
import 'package:mix/src/factory/mix_provider_data.dart';
import 'package:mix/src/factory/style_mix.dart';
import 'package:mix/src/theme/mix_theme.dart';
import 'package:mix/src/variants/context_variant.dart';

import '../../helpers/testing_utils.dart';

void main() {
  final mockVariant = ContextVariant('mock', when: (context) => true);
  test('MixData create', () {
    final mixData = MixData.create(
        MockBuildContext(),
        StyleMix(
          const MockIntScalarAttribute(1),
          const MockStringScalarAttribute('test'),
          const MockDoubleScalarAttribute(3.0),
          const MockDoubleDecoratorAttribute(0.5),
          mockVariant(
            const MockDoubleScalarAttribute(2.0),
          ),
        ));

    // Test that the `MixData` object is created with the correct properties.
    expect(mixData, isInstanceOf<MixData>());

    // Add any other additional assertions that are specific to your use case.
    // If you become able to access properties _attributes and _resolver you would assert:
    expect(mixData.attributes, isInstanceOf<VisualAttributeMap>());
    expect(mixData.resolver, isInstanceOf<MixThemeResolver>());
    expect(mixData.attributes.length, 4);
    expect(mixData.attributeOfType<MockIntScalarAttribute>(),
        isInstanceOf<MockIntScalarAttribute>());
    expect(mixData.attributeOfType<MockStringScalarAttribute>(),
        const MockStringScalarAttribute('test'));
    expect(mixData.attributeOfType<MockStringScalarAttribute>(),
        isInstanceOf<MockStringScalarAttribute>());
    expect(mixData.attributeOfType<MockDoubleScalarAttribute>(),
        const MockDoubleScalarAttribute(2.0));

    expect(mixData.decoratorOfType<MockDoubleDecoratorAttribute>(),
        isInstanceOf<List<MockDoubleDecoratorAttribute>>());
    expect(mixData.attributeOfType<MockDoubleDecoratorAttribute>(),
        const MockDoubleDecoratorAttribute(0.5));
  });

  test('MixData merge', () {
    final mixData = MixData.create(
        MockBuildContext(),
        StyleMix(
          const MockIntScalarAttribute(1),
          const MockStringScalarAttribute('test'),
          const MockDoubleScalarAttribute(3.0),
          const MockDoubleDecoratorAttribute(0.5),
          mockVariant(
            const MockDoubleScalarAttribute(2.0),
          ),
        ));

    final mixData2 = MixData.create(
        MockBuildContext(),
        StyleMix(
          const MockDoubleScalarAttribute(5.0),
          const MockDoubleDecoratorAttribute(0.6),
          mockVariant(
            const MockDoubleScalarAttribute(4.0),
          ),
        ));

    final mergedMixData = mixData.merge(mixData2);

    expect(mergedMixData, isInstanceOf<MixData>());
    expect(mergedMixData.attributes.length, 4);
    expect(mergedMixData.attributeOfType<MockIntScalarAttribute>(),
        isInstanceOf<MockIntScalarAttribute>());
    expect(mergedMixData.attributeOfType<MockStringScalarAttribute>(),
        isInstanceOf<MockStringScalarAttribute>());
    expect(mergedMixData.attributeOfType<MockDoubleScalarAttribute>(),
        isInstanceOf<MockDoubleScalarAttribute>());
    expect(mergedMixData.decoratorOfType<MockDoubleDecoratorAttribute>(),
        isInstanceOf<List<MockDoubleDecoratorAttribute>>());

    expect(mergedMixData.attributeOfType<MockIntScalarAttribute>(),
        const MockIntScalarAttribute(1));
    expect(mergedMixData.attributeOfType<MockStringScalarAttribute>(),
        const MockStringScalarAttribute('test'));
    expect(mergedMixData.attributeOfType<MockDoubleScalarAttribute>(),
        const MockDoubleScalarAttribute(4.0));
    expect(mergedMixData.decoratorOfType<MockDoubleDecoratorAttribute>().first,
        const MockDoubleDecoratorAttribute(0.6));
  });
}
