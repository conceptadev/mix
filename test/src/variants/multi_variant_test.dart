import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/variants/multi_variant.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('MultiVariant', () {
    test('remove should remove the correct variants', () {
      const variant1 = Variant('variant1');
      const variant2 = Variant('variant2');
      const variant3 = Variant('variant3');
      final multiVariant =
          MultiVariant.and(const [variant1, variant2, variant3]);

      final result = multiVariant.remove([variant1, variant2]);

      expect(result, isA<Variant>());
      expect((result).name, variant3.name);
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
      final variant1 = ContextVariant('variant1', when: (context) => true);
      final variant2 = ContextVariant('variant2', when: (context) => false);
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
  });
}
