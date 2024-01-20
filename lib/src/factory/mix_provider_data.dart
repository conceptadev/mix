import 'package:flutter/material.dart';

import '../attributes/variant_attribute.dart';
import '../core/attribute.dart';
import '../core/attributes_map.dart';
import '../helpers/compare_mixin.dart';
import '../theme/mix_theme.dart';
import '../widgets/pressable/widget_state_util.dart';
import 'mix_provider.dart';
import 'style_mix.dart';

/// This class is used for encapsulating all [MixData] related operations.
/// It contains a mixture of properties and methods useful for handling different attributes,
/// decorators and token resolvers.
@immutable
class MixData with Comparable {
  // Instance variables for widget attributes, widget decorators and token resolver.
  final AttributeMap _attributes;

  final MixTokenResolver _tokenResolver;

  /// A Private constructor for the [MixData] class that initializes its main variables.
  ///
  /// It takes in [attributes] and [resolver] as required parameters.
  MixData._({
    required MixTokenResolver resolver,
    required AttributeMap attributes,
  })  : _attributes = attributes,
        _tokenResolver = resolver;

  factory MixData.create(BuildContext context, Style style) {
    final attributeList = applyContextToVisualAttributes(context, style);

    final resolver = MixTokenResolver(context);

    return MixData._(
      resolver: resolver,
      attributes: AttributeMap(attributeList),
    );
  }

  factory MixData.inherited(BuildContext context) {
    final inheritedMix = MixProvider.maybeOf(context);

    if (inheritedMix == null) {
      return MixData.create(context, const Style.empty());
    }

    // Remove non-inheritable attributes
    final inheritableAttributes = inheritedMix.attributes.values.where(
      (attr) => attr.isInheritable,
    );

    return MixData._(
      resolver: MixTokenResolver(context),
      attributes: AttributeMap(inheritableAttributes),
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
  AttributeMap get attributes => _attributes;

  /// Finds and returns an [VisualAttribute] of type [A], or null if not found.
  A? attributeOf<A extends StyleAttribute>() {
    final attributes = _attributes.whereType<A>();
    if (attributes.isEmpty) return null;

    return _mergeAttributes(attributes) ?? attributes.last;
  }

  Iterable<A> whereType<A extends StyleAttribute>() {
    return _attributes.whereType<A>();
  }

  bool contains<T>() {
    return _attributes.values.any((attr) => attr is T);
  }

  Value resolvableOf<Value, A extends SpecAttribute<A, Value>>(A attribute) {
    final attributes = _attributes.whereType<A>();
    if (attributes.isEmpty) return attribute.resolve(this);

    return [attribute, ...attributes]
        .reduce((value, element) => value.merge(element))
        .resolve(this);
  }

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
  Style mix,
) {
  Style style = Style.create(mix.styles.values);

  final contextVariants = mix.variants.whereType<ContextVariantAttribute>();
  final multiVariants = mix.variants.whereType<MultiVariantAttribute>();

  // Once there are no more context variants to apply, return the mix
  if (contextVariants.isEmpty) {
    return mix.styles.values.toList();
  }

  List<WhenVariant> contextVariantTypes = [];
  List<WhenVariant> gestureVariantTypes = [];

  for (ContextVariantAttribute attr in contextVariants) {
    if (attr.variant is WidgetStateVariant) {
      gestureVariantTypes.add(attr);
    } else {
      contextVariantTypes.add(attr);
    }
  }

  for (MultiVariantAttribute attr in multiVariants) {
    if (attr.variant.variants.any((variant) => variant is WidgetStateVariant)) {
      gestureVariantTypes.add(attr);
    } else {
      contextVariantTypes.add(attr);
    }
  }

  for (WhenVariant variant in contextVariantTypes) {
    style = _applyVariants(context, style, variant);
  }

  // Gesture Variants are applied after Context Variants
  // As they take precedence over Context Variants from a styling perspective
  for (WhenVariant variant in gestureVariantTypes) {
    style = _applyVariants(context, style, variant);
  }

  return applyContextToVisualAttributes(context, style);
}

Style _applyVariants<T extends WhenVariant>(
  BuildContext context,
  Style style,
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
