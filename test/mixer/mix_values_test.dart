import 'package:flutter_test/flutter_test.dart'; // importing flutter_test package
import 'package:mix/mix.dart';
import 'package:mix/src/variants/variant_attribute.dart';

import '../testing_utils.dart';

void main() {
  group('MixValues', () {
    test('Creates empty values', () {
      const mixValues = MixValues.empty();
      expect(mixValues.attributes, isNull);

      expect(mixValues.variants, isEmpty);
      expect(mixValues.contextVariants, isEmpty);

      expect(mixValues.length, equals(0));
      expect(mixValues.hasAttributes, isFalse);
      expect(mixValues.hasVariants, isFalse);
      expect(mixValues.hasContextVariants, isFalse);
    });

    final attributeList = <WidgetAttributes>[
      randomBoxAttributes(),
      randomBoxAttributes(),
      randomTextAttributes(),
    ];
    final variantList = <VariantAttribute>[
      VariantAttribute(const Variant('testVariant'), randomMix()),
      VariantAttribute(const Variant('anotherTestVariant'), randomMix()),
    ];
    final contextVariantList = <ContextVariantAttribute>[
      DynamicVariantUtilities.onDark()(
        randomTextAttributes(),
        randomBoxAttributes(),
      ),
      DynamicVariantUtilities.onLarge()(
        randomTextAttributes(),
        randomBoxAttributes(),
      ),
    ];

    test('Valid Length Counts', () {
      final mixValues = MixValues.create(
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
      final mixValues = MixValues.create([
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
