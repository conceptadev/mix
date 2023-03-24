// ignore_for_file: non_constant_identifier_names, constant_identifier_names, long-parameter-list

import '../attributes/attribute.dart';
import '../attributes/helpers/helper.utils.dart';
import '../variants/variant.dart';
import '../variants/variant_attribute.dart';
import 'mix_values.dart';

typedef Mix = MixFactory;

/// A class representing a mix of attributes, decorators, variants, context
/// variants, and directives.
///
/// The `MixFactory` class is primarily used for constructing styling attributes and
/// variants. This class provides a set of factory
/// constructors and utility methods for working with mixes.
class MixFactory {
  final MixValues _values;

  const MixFactory._(MixValues values) : _values = values;

  /// A constant, empty mix for use with const constructor widgets.
  static const MixFactory constant = MixFactory._(MixValues.empty());

  // Factory constructors
  factory MixFactory([
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

    return MixFactory.fromAttributes(params);
  }

  /// Constructs a mix from a non-null iterable of [Attribute] instances.
  factory MixFactory.fromAttributes(Iterable<Attribute> attributes) {
    return MixFactory._(MixValues.create(attributes));
  }

  factory MixFactory.fromValues(MixValues values) {
    return MixFactory._(values);
  }

  /// Returns an iterable of [Attribute] instances from this MixFactory.
  Iterable<Attribute> toAttributes() {
    return _values.toAttributes();
  }

  /// Returns a [MixValues] instance representing the values in this MixFactory.
  MixValues toValues() {
    return _values;
  }

  /// Returns a new mix with the provided [values] merged with this mix's values.
  MixFactory copyWith({
    MixValues? values,
  }) {
    return MixFactory._(_values.merge(values));
  }

  /// Clones this mix into a new instance.
  MixFactory clone() => MixFactory._(_values.clone());

  /// Merges this mix with the provided [mix] and returns the resulting MixFactory.
  MixFactory merge(MixFactory mix) => MixFactory.combine([this, mix]);

  /// Merges this mix with the provided nullable [mix].
  ///
  /// If [mix] is null, returns this MixFactory. Otherwise, merges [mix] with this MixFactory.
  MixFactory mergeNullable(MixFactory? mix) => mix == null ? this : merge(mix);

  /// Selects a single [Variant] and returns a new mix with the selected variant.
  MixFactory selectVariant(Variant variant) {
    return selectVariants([variant]);
  }

  /// Selects multiple [Variant] instances and returns a new mix with the selected variants.
  ///
  /// If the [variants] list is empty, returns this mix without any changes.
  MixFactory selectVariants(List<Variant> variants) {
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
    final mixToApply = _fromVariantAttributes(matchedVariants);

    // Create a mix with the existing values
    final existingMix = MixFactory._(
      MixValues(
        attributes: _values.attributes,
        variants: existingVariants,
        contextVariants: _values.contextVariants,
      ),
    );

    // Merge the existing mix with the mix to apply
    return existingMix.merge(mixToApply);
  }

  /// Selects variants based on a condition and returns a new mix with the selected variants.
  MixFactory selectVariantCondition<T extends Attribute>(
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

  static MixFactory _fromVariantAttributes(List<VariantAttribute> variants) {
    return MixFactory.combine(variants.map((e) => e.value).toList());
  }

  /// Chooses a mix based on a [condition].
  ///
  /// Returns [ifTrue] if the [condition] is true, otherwise returns [ifFalse].
  static MixFactory chooser<T extends Attribute>({
    required bool condition,
    required MixFactory ifTrue,
    required MixFactory ifFalse,
  }) {
    if (condition) {
      return ifTrue;
    } else {
      return ifFalse;
    }
  }

  /// Combines a list of [mixes] into a single MixFactory.
  ///
  /// Iterates through the list of mixes, merging each mix with the previous mix
  /// and returning the final combined MixFactory.
  static MixFactory combine<T extends Attribute>(List<MixFactory> mixes) {
    MixFactory combinedMix = MixFactory.constant;
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

    return other is MixFactory && other._values == _values;
  }

  @override
  int get hashCode => _values.hashCode;
}

extension DeprecatedMixExtension<T extends Attribute> on MixFactory {
  /// Adds an Attribute to a Mix
  @Deprecated('Simplifying the mix API to avoid confusion. Use apply instead')
  SpreadFunctionParams<T, MixFactory> get mix {
    return SpreadFunctionParams(addAttributes);
  }

  @Deprecated('Use selectVariants now')
  MixFactory withVariants(List<Variant> variants) {
    return withManyVariants(variants);
  }

  @Deprecated(
    'Use MixFactory.merge() now. You might have to turn into a Mix first. firstMixFactory.merge(secondMix)',
  )
  MixFactory addAttributes(List<Attribute> attributes) {
    final newValues = MixValues.create(attributes);

    return MixFactory._(_values.merge(newValues));
  }

  @Deprecated('Use selectVariants now')
  MixFactory withManyVariants(List<Variant> variants) {
    return selectVariants(variants);
  }

  @Deprecated('Use selectVariant now')
  MixFactory withVariant(Variant variant) {
    return selectVariant(variant);
  }

  @Deprecated('Use combine now')
  MixFactory combineAll(List<MixFactory> mixes) {
    return MixFactory.combine(mixes);
  }

  @Deprecated('Use merge now')
  MixFactory apply(MixFactory mix) => merge(mix);

  @Deprecated('Use selectVariant now')
  MixFactory withMaybeVariant(Variant? variant) {
    if (variant == null) return this;

    return withVariant(variant);
  }

  @Deprecated('Use mergeNullable instead')
  MixFactory maybeApply(MixFactory? mix) {
    if (mix == null) return this;

    return apply(mix);
  }

  @Deprecated('Use applyNullable instead')
  MixFactory applyMaybe(MixFactory? mix) {
    return maybeApply(mix);
  }
}
