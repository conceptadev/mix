import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  const attribute1 = MockDoubleScalarAttribute(1.0);
  const attribute2 = MockIntScalarAttribute(2);
  const attribute3 = MockBooleanScalarAttribute(true);
  const attribute4 = MockStringScalarAttribute('string1');
  const variantAttr1 = Variant('mock1');
  const variantAttr2 = Variant('mock2');
  group('StyleMix()', () {
    test('Initialization with All Null Attributes', () {
      final mix = StyleMix(null, null, null, null);
      expect(mix.styles.isEmpty, true);
      expect(mix.variants.isEmpty, true);
    });

    test('Initialization with Mixed Null and Non-Null Attributes', () {
      final mix = StyleMix(null, attribute1, null);
      expect(mix.styles.length, 1);
      expect(mix.variants.isEmpty, true);
      expect(mix.styles[0], attribute1);
    });

    test('Initialization with All Non-Null ScalarAttributes', () {
      final mix = StyleMix(attribute1, attribute2);
      expect(mix.styles.length, 2);
      expect(mix.variants.isEmpty, true);
    });

    test('Initialization with All Non-Null VariantAttributes', () {
      final mix = StyleMix(variantAttr1(), variantAttr2());
      expect(mix.variants.length, 2);
      expect(mix.styles.isEmpty, true);
    });

    test('Initialization with Mixed Scalar and Variant Attributes', () {
      final mix = StyleMix(attribute1, variantAttr1());
      expect(mix.styles.length, 1);
      expect(mix.variants.length, 1);
    });

    test('Initialization with many typse of attributes', () {
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
        attribute1,
        attribute2,
        attribute3,
        attribute4,
        variantAttr1(),
      ];
      final mix = StyleMix.create(attributes);
      expect(mix.styles.isEmpty, false);
      expect(mix.variants.isEmpty, false);
      expect(mix.styles.length, 4);
      expect(mix.variants.length, 1);
      expect(mix.length, 5);
    });

    test('Initialization with invalid attribute triggers assertion', () {
      final attributes = [
        attribute1,
        attribute2,
        attribute3,
        attribute4,
        const MockInvalidAttribute(),
      ];
      expect(() => StyleMix.create(attributes), throwsUnsupportedError);
    });
  });

  group('StyleMix.combine', () {
    test(
        'should return a StyleMix with all non-null StyleMix instances combined',
        () {
      final style1 = StyleMix(attribute1); // Add attributes as needed
      final style2 = StyleMix(attribute2);
      final style3 = StyleMix(null, attribute3,
          variantAttr1(attribute4)); // Partially null attributes

      final combinedStyle =
          StyleMix.combine(style1, style2, style3, null, null, null);

      // Expect that combinedStyle contains all attributes of style1, style2, and style3
      expect(combinedStyle.styles.length, 3);
      expect(combinedStyle.variants.length, 1);
      expect(combinedStyle.length, 4);

      expect(combinedStyle.values.contains(attribute1), true);
      expect(combinedStyle.values.contains(attribute2), true);
      expect(combinedStyle.values.contains(attribute3), true);
      expect(combinedStyle.values.contains(variantAttr1(attribute4)), true);
    });

    test('should return an empty StyleMix when all instances are null', () {
      final combinedStyle =
          StyleMix.combine(null, null, null, null, null, null);

      // Expect that combinedStyle is an empty StyleMix instance
      expect(combinedStyle.styles.isEmpty, true);
      expect(combinedStyle.variants.isEmpty, true);
    });
  });

  group('StyleMix.combineList', () {
    test('should return a StyleMix with all instances combined', () {
      final styleList = [
        StyleMix(attribute1),
        StyleMix(attribute2),
        StyleMix(attribute3),
        StyleMix(variantAttr1(attribute4)),
      ];

      final combinedStyle = StyleMix.combineList(styleList);

      // Expect that combinedStyle contains all attributes of style1, style2, and style3
      expect(combinedStyle.styles.length, 3);
      expect(combinedStyle.variants.length, 1);
      expect(combinedStyle.length, 4);

      expect(combinedStyle.values.contains(attribute1), true);
      expect(combinedStyle.values.contains(attribute2), true);
      expect(combinedStyle.values.contains(attribute3), true);
      expect(combinedStyle.values.contains(variantAttr1(attribute4)), true);
    });

    test('should return an empty StyleMix when the list is empty', () {
      final combinedStyle = StyleMix.combineList([]);

      // Expect that combinedStyle is an empty StyleMix instance
      expect(combinedStyle.isEmpty, true);
      expect(combinedStyle.isNotEmpty, false);
      expect(combinedStyle.styles.isEmpty, true);
      expect(combinedStyle.variants.isEmpty, true);

      expect(combinedStyle.length, 0);
    });
  });

  group('StyleMix.chooser() ', () {
    test('Condition is True', () {
      const trueAttribute = MockIntScalarAttribute(1);
      const falseAttribute = MockDoubleScalarAttribute(2.0);

      final trueStyle = StyleMix(trueAttribute);
      final falseStyle = StyleMix(falseAttribute);

      final mix = StyleMix.chooser(true, trueStyle, falseStyle);

      expect(mix.styles.length, 1);
      expect(mix.styles[0], trueAttribute);
    });

    test('Condition is False', () {
      const trueAttribute = MockIntScalarAttribute(1);
      const falseAttribute = MockDoubleScalarAttribute(2.0);

      final trueStyle = StyleMix(trueAttribute);
      final falseStyle = StyleMix(falseAttribute);

      final mix = StyleMix.chooser(false, trueStyle, falseStyle);

      expect(mix.styles.length, 1);
      expect(mix.styles[0], falseAttribute);
    });

    test('Both ifTrue and ifFalse Are Same', () {
      const sameAttribute = MockBooleanScalarAttribute(true);

      final sameStyle = StyleMix(sameAttribute);
      final otherStyle = StyleMix(const MockBooleanScalarAttribute(false));

      final style = StyleMix.chooser(true, sameStyle, otherStyle);

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

    test('with matching multi variant', () {
      final multiVariant = MultiVariant.and(const [variantAttr1, variantAttr2]);
      final style = StyleMix(attr1, attr2, multiVariant(attr3));
      final firstStyle = style.selectVariant(variantAttr1);
      final secondStyle = firstStyle.selectVariant(variantAttr2);
      final thirdStyle = style.selectVariant(variantAttr1, variantAttr2);

      expect(firstStyle.styles.length, 2);
      expect(firstStyle.variants.length, 1);

      expect(secondStyle.styles.length, 3);
      expect(secondStyle.variants.length, 0);

      expect(thirdStyle.styles.length, 3);
      expect(thirdStyle.variants.length, 0);

      expect(secondStyle, thirdStyle);
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

    test('with matching multi variant', () {
      final multiVariant = MultiVariant.and(const [variantAttr1, variantAttr2]);
      final style = StyleMix(attr1, attr2, multiVariant(attr3));
      final thirdStyle = style.selectVariantList([variantAttr1, variantAttr2]);

      expect(thirdStyle.styles.length, 3);
      expect(thirdStyle.variants.length, 0);
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

  group('StyleMix hashcode', () {
    test('should return different hashcode for same attributes', () {
      final style1 = StyleMix(attribute1, attribute2);
      final style2 = StyleMix(attribute1, attribute2);

      expect(style1.hashCode, isNot(style2.hashCode));
    });

    test('should return different hashcode for different attributes', () {
      final style1 = StyleMix(attribute1, attribute2);
      final style2 = StyleMix(attribute1, attribute3);

      expect(style1.hashCode, isNot(style2.hashCode));
    });
  });

  group('StyleMix equality', () {
    test('should return true for same attributes', () {
      final style1 = StyleMix(attribute1, attribute2);
      final style2 = StyleMix(attribute1, attribute2);

      expect(style1, style2);
    });

    test('should return false for different attributes', () {
      final style1 = StyleMix(attribute1, attribute2);
      final style2 = StyleMix(attribute1, attribute3);

      expect(style1, isNot(style2));
    });
  });

  group('StyleMix variantChooser', () {
    const variant1 = Variant('Variant1');
    const variant2 = Variant('Variant2');
    final style = StyleMix(
      attribute1,
      attribute2,
      variant1(attribute3),
      variant2(attribute4),
    );
    test('variantChooser selects the correct variants based on conditions', () {
      const useVariant1 = true;
      const useVariant2 = false;

      final updatedStyle = style.variantSwitcher([
        const SwitchCondition(useVariant1, variant1),
        const SwitchCondition(useVariant2, variant2)
      ]);

      expect(style.styles.length, 2);
      expect(style.variants.length, 2);

      expect(updatedStyle.variants.length, 1);
      expect(updatedStyle.length, 4);
      expect(updatedStyle.values.contains(attribute4), isFalse);
      expect(updatedStyle.values.contains(variant2(attribute4)), isTrue);
    });

    test('variantChooser returns the same style when no conditions are met',
        () {
      const useVariant1 = false;
      const useVariant2 = false;

      final updatedStyle = style.variantSwitcher([
        const SwitchCondition(useVariant1, variant1),
        const SwitchCondition(useVariant2, variant2)
      ]);

      expect(updatedStyle, equals(style));
    });

    test('Returns both styles when both conditions are true', () {
      const useVariant1 = true;
      const useVariant2 = true;

      final updatedStyle = style.variantSwitcher([
        const SwitchCondition(useVariant1, variant1),
        const SwitchCondition(useVariant2, variant2)
      ]);

      expect(updatedStyle.values.contains(attribute4), isTrue, reason: '1');
      expect(updatedStyle.values.contains(attribute3), isTrue, reason: '2');
      expect(updatedStyle.values.contains(variant1(attribute3)), isFalse,
          reason: '3');
      expect(updatedStyle.values.contains(variant2(attribute4)), isFalse,
          reason: '4');
    });
  });
}
