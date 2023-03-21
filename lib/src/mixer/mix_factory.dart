import '../attributes/attribute.dart';
import '../attributes/helpers/helper.utils.dart';
import '../variants/variant.dart';
import '../variants/variant_attribute.dart';
import 'mix_values.dart';

/// A class representing a mix of attributes, decorators, variants, context
/// variants, and directives.
///
/// The `Mix` class is primarily used for managing styling attributes and
/// variants in a Flutter application. This class provides a set of factory
/// constructors and utility methods for working with mixes.
class Mix {
  final MixValues _values;

  const Mix._(MixValues values) : _values = values;

  /// A constant, empty mix for use with const constructor widgets.
  static const Mix constant = Mix._(MixValues.empty());

  /// Constructs a mix from up to 12 optional [Attribute] instances.
  ///
  /// The constructor takes a variable number of [Attribute] instances,
  /// creates a list of non-null attributes, and delegates to the
  /// `Mix.fromAttributes` constructor.
  factory Mix([
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

    return Mix.fromAttributes(params);
  }

  /// Constructs a mix from a non-null iterable of [Attribute] instances.
  factory Mix.fromAttributes(Iterable<Attribute> attributes) {
    return Mix._(MixValues.create(attributes));
  }

  factory Mix.fromValues(MixValues values) {
    return Mix._(values);
  }

  /// Returns an iterable of [Attribute] instances from this mix.
  Iterable<Attribute> toAttributes() {
    return _values.toAttributes();
  }

  /// Returns a [MixValues] instance representing the values in this mix.
  MixValues toValues() {
    return _values;
  }

  /// Returns a new mix with the provided [values] merged with this mix's values.
  Mix copyWith({
    MixValues? values,
  }) {
    return Mix._(_values.merge(values));
  }

  /// Clones this mix into a new instance.
  Mix clone() => Mix._(_values.clone());

  /// Merges this mix with the provided [mix] and returns the resulting mix.
  Mix merge(Mix mix) => Mix.combine([this, mix]);

  /// Merges this mix with the provided nullable [mix].
  ///
  /// If [mix] is null, returns this mix. Otherwise, merges [mix] with this mix.
  Mix mergeNullable(Mix? mix) => mix == null ? this : merge(mix);

  /// Selects a single [Variant] and returns a new mix with the selected variant.
  Mix selectVariant(Variant variant) {
    return selectVariants([variant]);
  }

  /// Selects multiple [Variant] instances and returns a new mix with the selected variants.
  ///
  /// If the [variants] list is empty, returns this mix without any changes.
  Mix selectVariants(List<Variant> variants) {
    if (variants.isEmpty) {
      return this;
    }
    final existingVariants = [..._values.variants];
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

    // Create a mix from the matched variants
    final mixToApply = matchedVariants.toMix();

    // Create a mix with the existing values
    final existingMix = Mix._(
      MixValues(
        attributes: _values.attributes,
        decorators: _values.decorators,
        variants: existingVariants,
        contextVariants: _values.contextVariants,
        directives: _values.directives,
      ),
    );

    // Merge the existing mix with the mix to apply
    return existingMix.merge(mixToApply);
  }

  /// Selects variants based on a condition and returns a new mix with the selected variants.
  Mix selectVariantCondition<T extends Attribute>(
    Map<bool, Variant> cases,
  ) {
    final keys = cases.keys.toList();
    final values = cases.values.toList();

    List<Variant> variants = [];

    for (var i = 0; i < keys.length; i++) {
      if (keys[i]) {
        variants.add(values[i]);
      }
    }

    return selectVariants(variants);
  }

  /// Chooses a mix based on a [condition].
  ///
  /// Returns [ifTrue] if the [condition] is true, otherwise returns [ifFalse].
  static Mix chooser<T extends Attribute>({
    required bool condition,
    required Mix ifTrue,
    required Mix ifFalse,
  }) {
    if (condition) {
      return ifTrue;
    } else {
      return ifFalse;
    }
  }

  /// Combines a list of [mixes] into a single mix.
  ///
  /// Iterates through the list of mixes, merging each mix with the previous mix
  /// and returning the final combined mix.
  static Mix combine<T extends Attribute>(List<Mix> mixes) {
    Mix combinedMix = Mix.constant;
    for (final mix in mixes) {
      combinedMix = mix.merge(mix);
    }

    return combinedMix;
  }

  // Deprecated methods and extensions have been omitted for brevity.
  // They should be documented similarly with appropriate deprecation notices.

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Mix && other._values == _values;
  }

  @override
  int get hashCode => _values.hashCode;
}

// Additional extension methods for List<Mix>, List<VariantAttribute>,
// and DeprecatedMixExtension<T extends Attribute> have been omitted for brevity.
// They should be documented similarly following the Effective Dart: Documentation guide.
extension ListMixExtension on List<Mix> {
  Mix toMix() {
    return Mix.combine(this);
  }

  /// Flatten to MixValues
  MixValues toMixValues() {
    return toMix()._values;
  }
}

extension ListVariantAttributeExtension on List<VariantAttribute> {
  // Combines Mixes from List<Variantattribute> into a Mix
  Mix toMix() {
    // Get mixes of variants that match
    final mixes = map((e) => e.value).toList();

    return Mix.combine(mixes);
  }
}

extension DeprecatedMixExtension<T extends Attribute> on Mix {
  /// Adds an Attribute to a Mix
  @Deprecated('Simplifying the mix API to avoid confusion. Use apply instead')
  WrapFunction<T, Mix> get mix {
    return WrapFunction(addAttributes);
  }

  @Deprecated('Use selectVariants now')
  Mix withVariants(List<Variant> variants) {
    return withManyVariants(variants);
  }

  @Deprecated(
    'Use mix.merge() now. You might have to turn into a Mix first. firstMix.merge(secondMix)',
  )
  Mix addAttributes(List<Attribute> attributes) {
    final newValues = MixValues.create(attributes);

    return Mix._(_values.merge(newValues));
  }

  @Deprecated('Use selectVariants now')
  Mix withManyVariants(List<Variant> variants) {
    return selectVariants(variants);
  }

  @Deprecated('Use selectVariant now')
  Mix withVariant(Variant variant) {
    return selectVariant(variant);
  }

  @Deprecated('Use merge now')
  Mix apply(Mix mix) => merge(mix);

  @Deprecated('Use selectVariant now')
  Mix withMaybeVariant(Variant? variant) {
    if (variant == null) return this;

    return withVariant(variant);
  }

  @Deprecated('Use mergeNullable instead')
  Mix maybeApply(Mix? mix) {
    if (mix == null) return this;

    return apply(mix);
  }

  @Deprecated('Use applyNullable instead')
  Mix applyMaybe(Mix? mix) {
    return maybeApply(mix);
  }
}
