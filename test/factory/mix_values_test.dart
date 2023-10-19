import 'package:flutter_test/flutter_test.dart'; // importing flutter_test package
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/variants/variant_attribute.dart';

import '../helpers/random_dto.dart';

void main() {
  group('MixValues', () {
    test('Creates empty values', () {
      const mixValues = MixValues.empty();
      expect(mixValues.styles, isNotNull);

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
        const Variant('testVariant'),
        RandomGenerator.mix(),
      ),
      VariantAttribute(
        const Variant('anotherTestVariant'),
        RandomGenerator.mix(),
      ),
    ];
    final contextVariantList = <ContextVariantAttribute>[
      onDark(
        RandomGenerator.textAttributes(),
        RandomGenerator.boxAttributes(),
      ),
      onLarge(
        RandomGenerator.textAttributes(),
        RandomGenerator.boxAttributes(),
      ),
    ];

    test('Valid Length Counts', () {
      final mixValues = MixValues.create(
        [...attributeList, ...variantList, ...contextVariantList],
      );

      expect(mixValues.length, equals(6));
      expect(mixValues.hasStyles, isTrue);
      expect(mixValues.hasVariants, isTrue);
      expect(mixValues.hasContextVariants, isTrue);

      expect(mixValues.styles.length, equals(2));
      expect(mixValues.variants.length, equals(2));
      expect(mixValues.contextVariants.length, equals(2));
    });

    test('Create from attribute list', () {
      final mixValues = MixValues.create([
        ...attributeList,
        ...variantList,
        ...contextVariantList,
      ]);

      expect(mixValues.length, equals(6));
      expect(mixValues.hasStyles, isTrue);
      expect(mixValues.hasVariants, isTrue);
      expect(mixValues.hasContextVariants, isTrue);

      expect(mixValues.styles.length, equals(2));
      expect(mixValues.variants.length, equals(2));
      expect(mixValues.contextVariants.length, equals(2));
    });

    test('Merge Mix values', () {
      final mixValues = MixValues.create([
        ...attributeList,
        ...variantList,
        ...contextVariantList,
      ]);

      final otherMixValues = MixValues.create([
        ...attributeList,
        ...variantList,
        ...contextVariantList,
      ]);

      final mergedMixValues = mixValues.merge(otherMixValues);

      expect(mergedMixValues.length, equals(6));
      expect(mergedMixValues.hasStyles, isTrue);
      expect(mergedMixValues.hasVariants, isTrue);
      expect(mergedMixValues.hasContextVariants, isTrue);

      expect(mergedMixValues.styles.length, equals(2));
      expect(mergedMixValues.variants.length, equals(2));
      expect(mergedMixValues.contextVariants.length, equals(2));
    });
  });
}
