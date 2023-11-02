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

  group('StyleMix.create([]) Constructor', () {
    test('Initialization with Empty Array', () {
      final mix = StyleMix.create([]);
      expect(mix.styles.isEmpty, true);
      expect(mix.variants.isEmpty, true);
    });

    test('Initialization with All Null Attributes', () {
      final mix = StyleMix.create([null, null, null]);
      expect(mix.styles.isEmpty, true);
      expect(mix.variants.isEmpty, true);
    });
  });
}
