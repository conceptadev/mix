import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/core/variants/variant.dart';
import 'package:mix/src/factory/style_mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('StyleMix()', () {
    test('Initialization with All Null Attributes', () {
      final mix = StyleMix(null, null, null, null);
      expect(mix.styles.isEmpty, true);
      expect(mix.variants.isEmpty, true);
    });

    test('Initialization with Mixed Null and Non-Null Attributes', () {
      const attribute1 = MockDoubleScalarAttribute(1.0);
      final mix = StyleMix(null, attribute1, null);
      expect(mix.styles.length, 1);
      expect(mix.variants.isEmpty, true);
      expect(mix.styles[0], attribute1);
    });

    test('Initialization with All Non-Null ScalarAttributes', () {
      const attribute1 = MockIntScalarAttribute(1);
      const attribute2 = MockBooleanScalarAttribute(true);
      final mix = StyleMix(attribute1, attribute2);
      expect(mix.styles.length, 2);
      expect(mix.variants.isEmpty, true);
    });

    test('Initialization with All Non-Null VariantAttributes', () {
      const variantAttr1 = Variant('mock1');
      const variantAttr2 = Variant('mock2');
      final mix = StyleMix(variantAttr1(), variantAttr2());
      expect(mix.variants.length, 2);
      expect(mix.styles.isEmpty, true);
    });

    test('Initialization with Mixed Scalar and Variant Attributes', () {
      const attribute1 = MockDoubleScalarAttribute(2.0);
      const variantAttr = Variant('mock');
      final mix = StyleMix(attribute1, variantAttr());
      expect(mix.styles.length, 1);
      expect(mix.variants.length, 1);
    });

    test('Initialization with many typse of attributes', () {
      const attribute1 = MockDoubleScalarAttribute(1.0);
      const attribute2 = MockBooleanScalarAttribute(true);
      const variantAttr1 = Variant('mock1');
      const variantAttr2 = Variant('mock2');

      final mix = StyleMix(
        attribute1,
        attribute2,
        variantAttr1(),
        variantAttr2(),
      );
      expect(mix.styles.length, 2);
      expect(mix.styles.isEmpty, false);
      expect(mix.variants.length, 2);
      expect(mix.variants.isEmpty, false);
    });
  });

  group('StyleMix.create([]) ', () {
    test('Initialization with Empty Array', () {
      final mix = StyleMix.create([]);
      expect(mix.styles.isEmpty, true);
      expect(mix.variants.isEmpty, true);
    });

    test('Initialization with attributes', () {
      final attributes = [
        const MockDoubleScalarAttribute(1.0),
        const MockBooleanScalarAttribute(true),
        const Variant('mock')(),
      ];
      final mix = StyleMix.create(attributes);
      expect(mix.styles.isEmpty, false);
      expect(mix.variants.isEmpty, false);
      expect(mix.styles.length, 2);
      expect(mix.variants.length, 1);
      expect(mix.length, 3);
    });
  });

  group('StyleMix.chooser() ', () {
    test('Condition is True', () {
      const trueAttribute = MockIntScalarAttribute(1);
      const falseAttribute = MockDoubleScalarAttribute(2.0);

      final trueStyle = StyleMix(trueAttribute);
      final falseStyle = StyleMix(falseAttribute);

      final mix = StyleMix.chooser(
        condition: true,
        ifTrue: trueStyle,
        ifFalse: falseStyle,
      );

      expect(mix.styles.length, 1);
      expect(mix.styles[0], trueAttribute);
    });

    test('Condition is False', () {
      const trueAttribute = MockIntScalarAttribute(1);
      const falseAttribute = MockDoubleScalarAttribute(2.0);

      final trueStyle = StyleMix(trueAttribute);
      final falseStyle = StyleMix(falseAttribute);

      final mix = StyleMix.chooser(
        condition: false,
        ifTrue: trueStyle,
        ifFalse: falseStyle,
      );

      expect(mix.styles.length, 1);
      expect(mix.styles[0], falseAttribute);
    });

    test('Both ifTrue and ifFalse Are Same', () {
      const sameAttribute = MockBooleanScalarAttribute(true);

      final sameStyle = StyleMix(sameAttribute);
      final otherStyle = StyleMix(const MockBooleanScalarAttribute(false));

      final style = StyleMix.chooser(
        condition: true,
        ifTrue: sameStyle,
        ifFalse: otherStyle,
      );

      expect(style.styles.length, 1);
      expect(style.styles[0], sameAttribute);
      expect(sameStyle, style);
    });
  });

  group('StyleMix.selectVariant', () {
    const attr1 = MockDoubleScalarAttribute(1.0);
    const attr2 = MockIntScalarAttribute(2);
    const attr3 = MockBooleanScalarAttribute(true);

    const variantAttr1 = Variant('variant1');

    test('with a Matched Variant', () {
      final style = StyleMix(attr1, attr2, variantAttr1(attr3));
      final updatedStyle = style.selectVariant(variantAttr1);

      expect(updatedStyle.styles.length, 3);
      expect(style.styles.length, 2);
      expect(updatedStyle.variants.length, 0);
      expect(style.variants.length, 1);
    });

    test('with an Unmatched Variant', () {
      final style = StyleMix(attr1, attr2);
      final updatedStyle = style.selectVariant(variantAttr1);

      expect(updatedStyle, style);
    });
  });

  group('StyleMix.selectVariantList', () {
    const attr1 = MockDoubleScalarAttribute(1.0);
    const attr2 = MockIntScalarAttribute(2);
    const attr3 = MockBooleanScalarAttribute(true);

    const variantAttr1 = Variant('variant1');
    const variantAttr2 = Variant('variant2');

    test('with Matched Variants', () {
      final style = StyleMix(attr1, variantAttr1(attr2), variantAttr2(attr3));
      final updatedStyle =
          style.selectVariantList([variantAttr1, variantAttr2]);

      expect(style.styles.length, 1);
      expect(style.variants.length, 2);
      expect(updatedStyle.styles.length, 3);
      expect(updatedStyle.variants.length, 0);
    });

    test('with Unmatched Variants', () {
      final mix = StyleMix(attr1);
      final updatedMix = mix.selectVariantList([variantAttr1, variantAttr2]);

      expect(updatedMix, mix);
    });

    test('with Empty List', () {
      final mix = StyleMix(attr1, attr2);
      final updatedMix = mix.selectVariantList([]);

      expect(updatedMix, mix);
    });
  });

  group('StyleMix.pickVariants', () {
    const attr1 = MockDoubleScalarAttribute(1.0);
    const attr2 = MockIntScalarAttribute(2);

    const stringAttr1 = MockStringScalarAttribute('string1');
    const stringAttr2 = MockStringScalarAttribute('string2');
    const stringAttr3 = MockStringScalarAttribute('string3');

    const outlinedVariant = Variant('outlined');
    const smallVariant = Variant('small');

    test('Picks specified Variants and ignores others', () {
      final style = StyleMix(
        attr1,
        attr2,
        outlinedVariant(
          stringAttr1,
          stringAttr2,
        ),
        smallVariant(
          stringAttr3,
        ),
      );
      final pickedMix = style.pickVariants([outlinedVariant, smallVariant]);

      expect(pickedMix.styles.contains(stringAttr1), isTrue);
      expect(pickedMix.styles.contains(stringAttr2), isTrue);
      expect(pickedMix.styles.contains(stringAttr3), isTrue);
      expect(pickedMix.styles.contains(attr1), isFalse);
      expect(pickedMix.styles.contains(attr2), isFalse);
      expect(pickedMix.variants.isEmpty, isTrue);
    });

    test('Returns empty StyleMix when no Variants are picked', () {
      final style = StyleMix(attr1, attr2);
      final pickedMix = style.pickVariants([]);

      expect(pickedMix.styles.isEmpty, isTrue);
      expect(pickedMix.variants.isEmpty, isTrue);
    });

    test('Returns empty StyleMix when picked Variants are not present', () {
      final style = StyleMix(attr1, attr2); // no variants added here
      final pickedMix = style.pickVariants([outlinedVariant, smallVariant]);

      expect(pickedMix.styles.isEmpty, isTrue);
      expect(pickedMix.variants.isEmpty, isTrue);
    });
  });
}
