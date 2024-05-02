// @immutable
// class VariantAttribute<T extends Variant> extends Attribute
//     with Mergeable<VariantAttribute<T>> {
//   final T variant;
//   final Style _style;

//   const VariantAttribute(this.variant, Style style) : _style = style;

//   Key get mergeKey => ObjectKey(variant);

//   Style get value => _style;

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
    final style = Style(const MockIntScalarAttribute(8));
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

      final otherStyle = Style(const MockIntScalarAttribute(10));
      final otherAttribute = VariantAttribute(variant, otherStyle);

      final result = variantAttribute.merge(otherAttribute);

      expect(result, isA<VariantAttribute>());
      expect(result.variant, variant);
      expect(result.value, style.merge(otherStyle));
    });
  });

  // ContextVariantAttribute
  group('ContextVariantAttribute', () {
    final variant = MockContextVariantCondition(
      true,
      priority: VariantPriority.high,
    );

    final style = Style(const MockIntScalarAttribute(8));
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

      final otherStyle = Style(const MockIntScalarAttribute(10));
      final otherAttribute = ContextVariantAttribute(variant, otherStyle);

      final result = variantAttribute.merge(otherAttribute);

      expect(result, isA<ContextVariantAttribute>());
      expect(result.variant, variant);
      expect(result.value, style.merge(otherStyle));
    });

    // when()
    test('when() returns correct instance', () {
      final variantAttribute = ContextVariantAttribute(variant, style);

      final result = variantAttribute.variant.build(MockBuildContext());

      expect(result, isTrue);
    });
  });

  group('StyleVariantAttribute', () {
    const variant = Variant('custom_variant');
    final style = Style(const MockIntScalarAttribute(8));

    test('matches() returns true when variant matches', () {
      final variantAttribute = VariantAttribute(variant, style);

      expect(variantAttribute.matches([variant]), isTrue);
    });

    test('matches() returns false when variant does not match', () {
      final variantAttribute = VariantAttribute(variant, style);
      const otherVariant = Variant('other_variant');

      expect(variantAttribute.matches([otherVariant]), isFalse);
    });
  });

// MultiVariantAttribute
  group('MultiVariantAttribute', () {
    const variant1 = Variant('variant1');
    const variant2 = Variant('variant2');
    final multiVariant = MultiVariant(
      const [variant1, variant2],
      type: MultiVariantOperator.or,
    );
    final style = Style(const MockIntScalarAttribute(8));

    test('remove() returns correct instance when removing a variant', () {
      final multiVariantAttribute = MultiVariantAttribute(multiVariant, style);

      final result = multiVariantAttribute.remove([variant1]);

      expect(result, isA<VariantAttribute>());
      expect(result.variant, variant2);
      expect(result.value, style);
    });

    test('remove() returns correct instance when removing all variants', () {
      final multiVariantAttribute = MultiVariantAttribute(multiVariant, style);

      expect(
        () => multiVariantAttribute.remove([variant1, variant2]),
        throwsArgumentError,
      );
    });

    test('merge() returns correct instance', () {
      final multiVariantAttribute = MultiVariantAttribute(multiVariant, style);

      final otherStyle = Style(const MockIntScalarAttribute(10));
      final otherAttribute = MultiVariantAttribute(multiVariant, otherStyle);

      final result = multiVariantAttribute.merge(otherAttribute);

      expect(result, isA<MultiVariantAttribute>());
      expect(result.variant, multiVariant);
      expect(result.value, style.merge(otherStyle));
    });
  });
}

// StyleVariantAttribute
