import 'package:flutter/material.dart';

import '../../mix.dart';
import '../core/attributes_map.dart';
import '../core/equality/compare_mixin.dart';

/// This class is used for encapsulating all [MixData] related operations.
/// It contains a mixture of properties and methods useful for handling different attributes,
/// decorators and token resolvers.
@immutable
class MixData with Comparable {
  // Instance variables for widget attributes, widget decorators and token resolver.
  final VisualAttributeMap _attributes;

  final MixTokenResolver _tokenResolver;

  /// A Private constructor for the [MixData] class that initializes its main variables.
  ///
  /// It takes in [attributes] and [resolver] as required parameters.
  MixData._({
    required MixTokenResolver resolver,
    required VisualAttributeMap attributes,
  })  : _attributes = attributes,
        _tokenResolver = resolver;

  factory MixData.create(BuildContext context, StyleMix style) {
    final styleMix = applyContextToVisualAttributes(context, style);

    return MixData._(
      resolver: MixTokenResolver(context),
      attributes: VisualAttributeMap(styleMix),
    );
  }

  /// Getter for [MixTokenResolver].
  ///
  /// Returns [_tokenResolver].
  MixTokenResolver get tokens => _tokenResolver;

  /// Getter for [_attributes].
  ///
  /// Returns [_attributes].
  @visibleForTesting
  VisualAttributeMap get attributes => _attributes;

  /// Getter for [_decorators].
  ///
  /// Returns a list of attributes of type [Decorator].
  List<T> decoratorOfType<T extends Decorator>() =>
      _attributes.whereType<T>().toList();

  /// Finds and returns an [VisualAttribute] of type [A], or null if not found.
  A? attributeOfType<A extends VisualAttribute>() {
    return _attributes.attributeOfType<A>();
  }

  /// Resolves and returns the value of the [VisualAttribute] of type [A].
  R? get<A extends VisualAttribute<R>, R>() {
    return attributeOfType<A>()?.resolve(this);
  }

  /// Merges this [MixData] with another, prioritizing this instance's properties.
  MixData merge(MixData other) {
    return MixData._(
      resolver: _tokenResolver,
      attributes: _attributes.merge(other._attributes),
    );
  }

  /// Used for Comparable mixin.
  @override
  get props => [_attributes];
}

@visibleForTesting
List<VisualAttribute> applyContextToVisualAttributes(
  BuildContext context,
  StyleMix mix,
) {
  StyleMix style = StyleMix.create(mix.styles);

  final contextVariants = mix.variants.whereType<ContextVariantAttribute>();
  final multiVariants = mix.variants.whereType<MultiVariantAttribute>();

  // Once there are no more context variants to apply, return the mix
  if (contextVariants.isEmpty) {
    return mix.styles;
  }

  for (ContextVariantAttribute attr in contextVariants) {
    style = _applyVariants(context, style, attr);
  }

  for (MultiVariantAttribute attr in multiVariants) {
    style = _applyVariants(context, style, attr);
  }

  return applyContextToVisualAttributes(context, style);
}

StyleMix _applyVariants<T extends WhenVariant>(
  BuildContext context,
  StyleMix style,
  T variant,
) {
  return variant.when(context) ? style.merge(variant.value) : style;
}
