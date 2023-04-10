import 'package:flutter_test/flutter_test.dart'; // importing flutter_test package
import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/factory/style_mix_data.dart';
import 'package:mix/src/variants/utilities/context_variant_utilities.dart';
import 'package:mix/src/variants/variant.dart';
import 'package:mix/src/variants/variant_attribute.dart';

import '../helpers/random_dto.dart';

void main() {
  group('MixValues', () {
    test('Creates empty values', () {
      const mixValues = StyleMixData.empty();
      expect(mixValues.attributes, isNull);

      expect(mixValues.variants, isEmpty);
      expect(mixValues.contextVariants, isEmpty);

      expect(mixValues.length, equals(0));
      expect(mixValues.hasAttributes, isFalse);
      expect(mixValues.hasVariants, isFalse);
      expect(mixValues.hasContextVariants, isFalse);
    });

    final attributeList = <StyledWidgetAttributes>[
      RandomGenerator.boxAttributes(),
      RandomGenerator.boxAttributes(),
      RandomGenerator.textAttributes(),
    ];
    final variantList = <VariantAttribute>[
      VariantAttribute(
        const StyleVariant('testVariant'),
        RandomGenerator.mix(),
      ),
      VariantAttribute(
        const StyleVariant('anotherTestVariant'),
        RandomGenerator.mix(),
      ),
    ];
    final contextVariantList = <ContextVariantAttribute>[
      ContextVariantUtilities.onDark()(
        RandomGenerator.textAttributes(),
        RandomGenerator.boxAttributes(),
      ),
      ContextVariantUtilities.onLarge()(
        RandomGenerator.textAttributes(),
        RandomGenerator.boxAttributes(),
      ),
    ];

    test('Valid Length Counts', () {
      final mixValues = StyleMixData.create(
        [...attributeList, ...variantList, ...contextVariantList],
      );

      expect(mixValues.length, equals(6));
      expect(mixValues.hasAttributes, isTrue);
      expect(mixValues.hasVariants, isTrue);
      expect(mixValues.hasContextVariants, isTrue);

      expect(mixValues.attributes?.length, equals(2));
      expect(mixValues.variants.length, equals(2));
      expect(mixValues.contextVariants.length, equals(2));
    });

    test('Create from attribute list', () {
      final mixValues = StyleMixData.create([
        ...attributeList,
        ...variantList,
        ...contextVariantList,
      ]);

      expect(mixValues.length, equals(6));
      expect(mixValues.hasAttributes, isTrue);
      expect(mixValues.hasVariants, isTrue);
      expect(mixValues.hasContextVariants, isTrue);

      expect(mixValues.attributes?.length, equals(2));
      expect(mixValues.variants.length, equals(2));
      expect(mixValues.contextVariants.length, equals(2));
    });

    test('Merge Mix values', () {});
  });
}
