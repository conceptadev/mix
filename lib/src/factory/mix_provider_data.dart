import 'package:flutter/material.dart';

import '../attributes/variant_attribute.dart';
import '../core/attribute.dart';
import '../core/attributes_map.dart';
import '../decorators/decorator.dart';
import '../helpers/compare_mixin.dart';
import '../theme/mix_theme.dart';
import 'style_mix.dart';

/// This class is used for encapsulating all [MixData] related operations.
/// It contains a mixture of properties and methods useful for handling different attributes,
/// decorators and token resolvers.
@immutable
class MixData with Comparable {
  // Instance variables for widget attributes, widget decorators and token resolver.
  final StyleAttributeMap _attributes;

  final MixTokenResolver _tokenResolver;

  /// A Private constructor for the [MixData] class that initializes its main variables.
  ///
  /// It takes in [attributes] and [resolver] as required parameters.
  MixData._({
    required MixTokenResolver resolver,
    required StyleAttributeMap attributes,
  })  : _attributes = attributes,
        _tokenResolver = resolver;

  factory MixData.create(BuildContext context, StyleMix style) {
    final styleMix = applyContextToVisualAttributes(context, style);

    final resolver = MixTokenResolver(context, MixTheme.of(context));

    return MixData._(
      resolver: resolver,
      attributes: StyleAttributeMap(styleMix),
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
  StyleAttributeMap get attributes => _attributes;

  /// Getter for [_decorators].
  ///
  /// Returns a list of attributes of type [Decorator].
  Iterable<T> decoratorOfType<T extends Decorator>() =>
      _attributes.whereType<T>();

  /// Finds and returns an [VisualAttribute] of type [A], or null if not found.
  A? attributeOf<A extends StyleAttribute>() {
    final attributes = _attributes.whereType<A>();
    if (attributes.isEmpty) return null;

    final attributeItem = _mergeAttributes(attributes) ?? attributes.last;
    //

    return attributeItem;
  }

  Iterable<A> whereType<A extends StyleAttribute>() {
    return _attributes.whereType<A>();
  }

  Value resolvableOf<Value, A extends ResolvableAttribute<A, Value>>(
    A attribute,
  ) {
    final attributes = _attributes.whereType<A>();
    if (attributes.isEmpty) return attribute.resolve(this);

    return [attribute, ...attributes]
        .reduce((value, element) => value.merge(element))
        .resolve(this);
  }

  // /// Resolves and returns the value of the [VisualAttribute] of type [A].
  // R get<A extends Resolver<R>, R>() {
  //   return attributeOfType<A>()?.resolve(this);
  // }

  // /// Merges this [MixData] with another, prioritizing this instance's properties.
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
List<StyleAttribute> applyContextToVisualAttributes(
  BuildContext context,
  StyleMix mix,
) {
  StyleMix style = StyleMix.create(mix.styles.values);

  final contextVariants = mix.variants.whereType<ContextVariantAttribute>();
  final multiVariants = mix.variants.whereType<MultiVariantAttribute>();

  // Once there are no more context variants to apply, return the mix
  if (contextVariants.isEmpty) {
    return mix.styles.values.toList();
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

M? _mergeAttributes<M extends StyleAttribute>(Iterable<M> mergeables) {
  if (mergeables.isEmpty) return null;

  return mergeables.reduce((a, b) {
    return a is Mergeable ? (a as Mergeable).merge(b) : b;
  });
}
