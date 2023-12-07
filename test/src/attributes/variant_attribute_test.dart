// @immutable
// class VariantAttribute<T extends Variant> extends Attribute
//     with Mergeable<VariantAttribute<T>> {
//   final T variant;
//   final StyleMix _style;

//   const VariantAttribute(this.variant, StyleMix style) : _style = style;

//   Key get mergeKey => ObjectKey(variant);

//   StyleMix get value => _style;

//   @override
//   VariantAttribute<T> merge(covariant VariantAttribute<T> other) {
//     if (other.variant != variant) throw throwArgumentError(other);

//     return VariantAttribute(variant, _style.merge(other._style));
//   }

//   @override
//   get props => [variant, value];
// }

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  // VariantAttribute
  group('VariantAttribute', () {
    const variant = Variant('custom_variant');
    final style = StyleMix(const MockIntScalarAttribute(8));
    test('Constructor assigns correct properties', () {
      final variantAttribute = VariantAttribute(variant, style);

      expect(variantAttribute.variant, variant);
      expect(variantAttribute.value, style);
    });

    // mergeKey
    test('mergeKey returns correct instance', () {
      final variantAttribute = VariantAttribute(variant, style);

      expect(variantAttribute.type, const ObjectKey(variant));
    });

    // merge()
    test('merge() returns correct instance', () {
      final variantAttribute = VariantAttribute(variant, style);

      final otherStyle = StyleMix(const MockDoubleDecoratorAttribute(10));
      final otherAttribute = VariantAttribute(variant, otherStyle);

      final result = variantAttribute.merge(otherAttribute);

      expect(result, isA<VariantAttribute>());
      expect(result.variant, variant);
      expect(result.value, style.merge(otherStyle));
    });
  });

  // ContextVariantAttribute
  group('ContextVariantAttribute', () {
    final variant = ContextVariant('custom_variant', when: (_) => true);

    final style = StyleMix(const MockIntScalarAttribute(8));
    test('Constructor assigns correct properties', () {
      final variantAttribute = ContextVariantAttribute(variant, style);

      expect(variantAttribute.variant, variant);
      expect(variantAttribute.value, style);
    });

    // mergeKey
    test('mergeKey returns correct instance', () {
      final variantAttribute = ContextVariantAttribute(variant, style);

      expect(variantAttribute.type, ObjectKey(variant));
    });

    // merge()
    test('merge() returns correct instance', () {
      final variantAttribute = ContextVariantAttribute(variant, style);

      final otherStyle = StyleMix(const MockDoubleDecoratorAttribute(10));
      final otherAttribute = ContextVariantAttribute(variant, otherStyle);

      final result = variantAttribute.merge(otherAttribute);

      expect(result, isA<ContextVariantAttribute>());
      expect(result.variant, variant);
      expect(result.value, style.merge(otherStyle));
    });

    // when()
    test('when() returns correct instance', () {
      final variantAttribute = ContextVariantAttribute(variant, style);

      final result = variantAttribute.when(MockBuildContext());

      expect(result, isTrue);
    });
  });
}
