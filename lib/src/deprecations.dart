// ignore: avoid-importing-entrypoint-exports

import 'attributes/attribute.dart';
import 'factory/mix_provider_data.dart';
import 'factory/style_mix.dart';
import 'theme/tokens/space_token.dart';
import 'utils/helper_util.dart';
import 'variants/variant.dart';

extension DeprecatedMixExtension<T extends Attribute> on StyleMix {
  /// Adds an Attribute to a Mix.
  @Deprecated('Simplifying the mix API to avoid confusion. Use apply instead')
  SpreadPositionalParams<T, StyleMix> get mix {
    return SpreadPositionalParams(addAttributes);
  }

  @Deprecated('Use selectVariants now')
  StyleMix withVariants(List<Variant> variants) {
    return withManyVariants(variants);
  }

  @Deprecated(
    'Use merge() or mergeMany() now. You might have to turn into a Mix first. firstMixFactory.merge(secondMix)',
  )
  StyleMix addAttributes(List<Attribute> attributes) {
    return merge(StyleMix.create(attributes));
  }

  @Deprecated('Use selectVariants now')
  StyleMix withManyVariants(List<Variant> variants) {
    return selectVariantList(variants);
  }

  @Deprecated('Use merge() or mergeMany() instead')
  SpreadPositionalParams<StyleMix, StyleMix> get apply =>
      SpreadPositionalParams(mergeList);

  @Deprecated('Use selectVariant now')
  StyleMix withVariant(Variant variant) {
    return selectVariant(variant);
  }

  @Deprecated('Use combine now')
  StyleMix combineAll(List<StyleMix> mixes) {
    return StyleMix.combineList(mixes);
  }

  @Deprecated('Use selectVariant now')
  StyleMix withMaybeVariant(Variant? variant) {
    if (variant == null) return this;

    return withVariant(variant);
  }

  @Deprecated('Use mergeNullable instead')
  StyleMix maybeApply(StyleMix? mix) {
    if (mix == null) return this;

    return apply(mix);
  }

  @Deprecated('Use applyNullable instead')
  StyleMix applyMaybe(StyleMix? mix) {
    return maybeApply(mix);
  }
}

/// This refers to the deprecated class MixData and it's here for the purpose of maintaining compatibility.
@Deprecated('Use MixData instead.')
typedef MixContext = MixData;

extension WithSpaceTokensExt<T> on UtilityWithSpaceTokens<T> {
  @Deprecated('Use xsmall instead')
  T get xs => xsmall;
  @Deprecated('Use small instead')
  T get sm => small;
  @Deprecated('Use medium instead')
  T get md => medium;
  @Deprecated('Use large instead')
  T get lg => large;
  @Deprecated('Use xlarge instead')
  T get xl => xlarge;
  @Deprecated('Use xxlarge instead')
  T get xxl => xxlarge;
}
