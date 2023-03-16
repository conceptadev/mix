import '../attributes/attribute.dart';
import '../attributes/helpers/helper.utils.dart';
import '../variants/variant.dart';
import '../variants/variant_attribute.dart';
import 'mix_values.dart';

/// Defines a mix

class Mix {
  final MixValues _values;

  const Mix._(MixValues values) : _values = values;

  /// Used for const constructor widgets
  static const Mix constant = Mix._(MixValues.empty());

  /// Instantiate a mix with _Attribute_ parameters
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

  /// Instantiate a mix from a _List_ of _Attribute_ instances (cannot be null)
  factory Mix.fromAttributes(Iterable<Attribute> attributes) {
    return Mix._(MixValues.create(attributes));
  }

  factory Mix.fromValues(MixValues values) {
    return Mix._(values);
  }

  Iterable<Attribute> toAttributes() {
    return _values.toAttributes();
  }

  MixValues toValues() {
    return _values;
  }

  Mix copyWith({
    MixValues? values,
  }) {
    return Mix._(_values.merge(values));
  }

// Clone this Mix into a new instance
  Mix clone() => Mix._(_values.clone());

  /// Merge this mix with argument mix
  Mix merge(Mix mix) => Mix.combine([this, mix]);

  /// Merges argument mix with this mix. If argument mix is null, returns this mix.
  Mix mergeNullable(Mix? mix) => mix == null ? this : merge(mix);

  Mix selectVariant(Variant variant) {
    return selectVariants([variant]);
  }

  Mix selectVariants(List<Variant> variants) {
    // Return values if list is empty
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

    // Get mixes of variants that match
    final mixToApply = matchedVariants.toMix();

    final existingMix = Mix._(
      MixValues(
        attributes: _values.attributes,
        decorators: _values.decorators,
        variants: existingVariants,
        contextVariants: _values.contextVariants,
        directives: _values.directives,
      ),
    );

    // Merge into existing values
    return existingMix.merge(mixToApply);
  }

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

  /// Chooses mix based on condition
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

  /// Merges many mixes into one
  // ignore: long-parameter-list
  static Mix combine<T extends Attribute>(List<Mix> mixes) {
    Mix combinedMix = Mix.constant;
    for (final mix in mixes) {
      combinedMix = mix.merge(mix);
    }

    return combinedMix;
  }

  @Deprecated('Use selectVariantCondition now')
  static Mix variantSwitcher<T extends Attribute>(
    Mix mix,
    Map<bool, Variant> cases,
  ) {
    return mix.selectVariantCondition(cases);
  }

  @Deprecated('Use Mix.combine now')
  static Mix combineAll<T extends Attribute>(List<Mix> mixes) {
    return Mix.combine(mixes);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Mix && other._values == _values;
  }

  @override
  int get hashCode => _values.hashCode;
}

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
