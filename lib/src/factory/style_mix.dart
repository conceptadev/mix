// ignore_for_file: non_constant_identifier_names, constant_identifier_names, long-parameter-list

import '../attributes/attribute.dart';
import '../attributes/variants/variant.dart';
import '../attributes/variants/variant_attribute.dart';
import '../helpers/attributes_map.dart';
import 'mix_values.dart';

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
  static const empty = StyleMix._(MixValues.empty);

  final MixValues _values;

  const StyleMix._(MixValues values) : _values = values;

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
    return StyleMix._(MixValues.create(attributes));
  }

  factory StyleMix.fromValues(MixValues values) {
    return StyleMix._(values);
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
    MixValues combinedValues = MixValues.empty;

    for (final mix in mixes) {
      combinedValues = combinedValues.merge(mix._values);
    }

    return StyleMix.fromValues(combinedValues);
  }

  /// Returns a [MixValues] instance representing the values in this MixFactory.
  MixValues get values => _values;

  /// Returns an iterable of [Attribute] instances from this MixFactory.
  Iterable<Attribute> toAttributes() {
    return _values.toValues();
  }

  /// Returns a new mix with the provided [values] merged with this mix's values.
  StyleMix copyWith({MixValues? values}) {
    return StyleMix._(_values.merge(values));
  }

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
    final existingVariants = _values.variants.values.toList();
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
    final valuesToApply = MixValues.create(matchedVariants);

    // Create a mix with the existing values.
    final existingValues = MixValues(
      styles: _values.styles,
      variants: VariantAttributeMap.from(existingVariants),
    );

    // Merge the existing mix with the mix to apply.
    return StyleMix._(existingValues.merge(valuesToApply));
  }

  StyleMix pickVariants(List<Variant> variants) {
    final matchedVariants = <VariantAttribute>[];

    final currentVariants = _values.variants.values;

    for (final variantAttr in currentVariants) {
      if (variants.contains(variantAttr.variant)) {
        matchedVariants.add(variantAttr);
      }
    }

    // Create a mix from the matched variants.
    return StyleMix.fromAttributes(matchedVariants);
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
