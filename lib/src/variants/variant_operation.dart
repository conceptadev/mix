import '../attributes/attribute.dart';
import '../attributes/style_mix_attribute.dart';
import '../attributes/variant_attribute.dart';
import '../core/equality/compare_mixin.dart';
import '../factory/style_mix.dart';
import 'context_variant.dart';
import 'variant.dart';

abstract class VariantOperation with Comparable {
  final List<Variant> variants;

  const VariantOperation(this.variants);

  StyleMixAttribute buildAttributes(Iterable<Attribute> attributes);

  VariantAndOperation operator &(Variant variant) {
    return VariantAndOperation([...variants, variant]);
  }

  VariantOrOperation operator |(Variant variant) {
    return VariantOrOperation([...variants, variant]);
  }

  StyleMixAttribute call([
    Attribute? p1,
    Attribute? p2,
    Attribute? p3,
    Attribute? p4,
    Attribute? p5,
    Attribute? p6,
    Attribute? p7,
    Attribute? p8,
    Attribute? p9,
    Attribute? p10,
    Attribute? p11,
    Attribute? p12,
  ]) {
    final params = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12];

    final nonNullableParams = params.whereType<Attribute>();

    return buildAttributes(nonNullableParams);
  }

  VariantAttribute createVariantAttribute(Variant variant, StyleMix style) {
    if (variant is ContextVariant) {
      return ContextVariantAttribute(variant, style);
    }

    if (variant is MultiVariant) {
      return MultiVariantAttribute(variant, style);
    }

    // ignore: prefer-returning-conditional-expressions
    return VariantAttribute(variant, style);
  }

  @override
  get props => [variants];
}

class VariantAndOperation extends VariantOperation {
  const VariantAndOperation(super.variants);
  @override
  StyleMixAttribute buildAttributes(Iterable<Attribute> attributes) {
    //  Create an Attribute that both variants have to be true to apply

    return StyleMixAttribute(
      StyleMix(
        createVariantAttribute(
          MultiVariant(variants),
          StyleMix.create(attributes),
        ),
      ),
    );
  }
}

class VariantOrOperation extends VariantOperation {
  const VariantOrOperation(super.variants);

  @override
  StyleMixAttribute buildAttributes(Iterable<Attribute> attributes) {
    final variantAttributes = variants.map((variant) =>
        createVariantAttribute(variant, StyleMix.create(attributes)));

    return StyleMixAttribute(StyleMix.create(variantAttributes));
  }
}
