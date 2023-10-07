// ignore_for_file: non_constant_identifier_names, constant_identifier_names, long-parameter-list

import '../attributes/attribute.dart';
import '../helpers/attributes_map.dart';
import '../variants/variant.dart';
import '../variants/variant_attribute.dart';
import 'style_mix_data.dart';

@Deprecated(
  'Use StyleMix instead. '
  'This class will be removed in a future release.',
)
typedef Mix = StyleMix;

/// A class representing a mix of attributes, decorators, variants, context
/// variants, and directives.
///
/// The `MixFactory` class is primarily used for constructing styling attributes and
/// variants. This class provides a set of factory
/// constructors and utility methods for working with mixes.
class StyleMix {
  /// A constant, empty mix for use with const constructor widgets.
  static const constant = StyleMix._(StyleMixData.empty());

  final StyleMixData _values;

  const StyleMix._(StyleMixData values) : _values = values;

  // Factory constructors.
  // ignore: parameters-ordering
  factory StyleMix([
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
    final params = <Attribute>[];

    for (final param in [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12]) {
      if (param != null) params.add(param);
    }

    return StyleMix.fromAttributes(params);
  }

  /// Constructs a mix from a non-null iterable of [Attribute] instances.
  factory StyleMix.fromAttributes(Iterable<Attribute> attributes) {
    return StyleMix._(StyleMixData.create(attributes));
  }

  factory StyleMix.fromValues(StyleMixData values) {
    return StyleMix._(values);
  }

  factory StyleMix.fromVariantAttributes(List<VariantAttribute> variants) {
    return StyleMix.combine(variants.map((e) => e.value).toList());
  }

  /// Chooses a mix based on a [condition].
  ///
  /// Returns [ifTrue] if the [condition] is true, otherwise returns [ifFalse].
  factory StyleMix.chooser({
    required bool condition,
    required StyleMix ifFalse,
    required StyleMix ifTrue,
  }) {
    return condition ? ifTrue : ifFalse;
  }

  /// Combines a list of [mixes] into a single MixFactory.
  ///
  /// Iterates through the list of mixes, merging each mix with the previous mix
  /// and returning the final combined MixFactory.
  factory StyleMix.combine(List<StyleMix> mixes) {
    StyleMixData combinedValues = const StyleMixData.empty();

    for (final mix in mixes) {
      combinedValues = combinedValues.merge(mix._values);
    }

    return StyleMix.fromValues(combinedValues);
  }

  /// Returns a [StyleMixData] instance representing the values in this MixFactory.
  StyleMixData get values => _values;

  /// Returns an iterable of [Attribute] instances from this MixFactory.
  Iterable<Attribute> toAttributes() {
    return _values.toAttributes();
  }

  /// Returns a new mix with the provided [values] merged with this mix's values.
  StyleMix copyWith({StyleMixData? values}) {
    return StyleMix._(_values.merge(values));
  }

  /// Clones this mix into a new instance.
  StyleMix clone() => StyleMix._(_values.clone());

  /// Merges this mix with the provided [mix] and returns the resulting MixFactory.
  StyleMix merge(StyleMix mix) => StyleMix.combine([this, mix]);

  StyleMix mergeMany(List<StyleMix> mixes) {
    return StyleMix.combine([this, ...mixes]);
  }

  /// Merges this mix with the provided nullable [style].
  ///
  /// If [style] is null, returns this MixFactory. Otherwise, merges [style] with this MixFactory.
  StyleMix mergeNullable(StyleMix? style) =>
      style == null ? this : merge(style);

  /// Selects a single [Variant] and returns a new mix with the selected variant.
  StyleMix selectVariant(Variant variant) {
    return selectVariants([variant]);
  }

  /// Selects multiple [Variant] instances and returns a new mix with the selected variants.
  ///
  /// If the [variants] list is empty, returns this mix without any changes.
  StyleMix selectVariants(List<Variant> variants) {
    if (variants.isEmpty) {
      return this;
    }
    final existingVariants = _values.variants.toList();
    final matchedVariants = <VariantAttribute>[];

    for (final v in variants) {
      existingVariants.removeWhere((e) {
        if (e.variant == v) {
          matchedVariants.add(e);

          return true;
        }

        return false;
      });
    }

    // Create a mix from the matched variants.
    final mixToApply = StyleMix.fromVariantAttributes(matchedVariants);

    // Create a mix with the existing values.
    final existingMix = StyleMix._(
      StyleMixData(
        attributes: _values.attributes,
        variants: AttributesMap.fromIterable(existingVariants),
        decorators: _values.decorators,
        contextVariants: _values.contextVariants,
      ),
    );

    // Merge the existing mix with the mix to apply.
    return existingMix.merge(mixToApply);
  }

  StyleMix pickVariants(List<Variant> variants) {
    final matchedVariants = <VariantAttribute>[];

    final currentVariants = _values.variants.toList();

    for (final variantAttr in currentVariants) {
      if (variants.contains(variantAttr.variant)) {
        matchedVariants.add(variantAttr);
      }
    }

    // Create a mix from the matched variants.
    return StyleMix.fromVariantAttributes(matchedVariants);
  }

  /// Selects variants based on a condition and returns a new mix with the selected variants.
  StyleMix selectVariantCondition(Map<bool, Variant> cases) {
    final keys = cases.keys.toList();
    final values = cases.values.toList();

    List<Variant> variants = [];

    for (int i = 0; i < keys.length; i++) {
      if (keys[i]) {
        variants.add(values[i]);
      }
    }

    return selectVariants(variants);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StyleMix && other._values == _values;
  }

  @override
  int get hashCode => _values.hashCode;
}
