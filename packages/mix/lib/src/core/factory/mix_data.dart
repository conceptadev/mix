import 'package:flutter/material.dart';

import '../../attributes/animated/animated_data.dart';
import '../../internal/iterable_ext.dart';
import '../../theme/token_resolver.dart';
import '../../variants/context_variant.dart';
import '../../variants/variant_attribute.dart';
import '../attribute.dart';
import '../attributes_map.dart';
import '../modifier.dart';
import '../spec.dart';
import 'style_mix.dart';

/// This class is used for encapsulating all [MixData] related operations.
/// It contains a mixture of properties and methods useful for handling different attributes,
/// modifiers and token resolvers.
@immutable
class MixData {
  final AnimatedData? animation;

  // Instance variables for widget attributes, widget modifiers and token resolver.
  final AttributeMap _attributes;

  final MixTokenResolver _tokenResolver;

  /// A Private constructor for the [MixData] class that initializes its main variables.
  ///
  /// It takes in [attributes] and [resolver] as required parameters.
  const MixData._({
    required MixTokenResolver resolver,
    required AttributeMap attributes,
    required this.animation,
  })  : _attributes = attributes,
        _tokenResolver = resolver;

  factory MixData.create(BuildContext context, Style style) {
    final attributeList = applyContextToVisualAttributes(context, style);

    final resolver = MixTokenResolver(context);

    return MixData._(
      resolver: resolver,
      attributes: AttributeMap(attributeList),
      animation: style is AnimatedStyle ? style.animated : null,
    );
  }

  /// Alias for animation.isAnimated
  bool get isAnimated => animation != null;

  /// Getter for [MixTokenResolver].
  ///
  /// Returns [_tokenResolver].
  MixTokenResolver get tokens => _tokenResolver;

  /// Getter for [_attributes].
  ///
  /// Returns [_attributes].
  @visibleForTesting
  AttributeMap get attributes => _attributes;

  MixData toInheritable() {
    final inheritableAttributes = _attributes.values.where(
      (attr) => attr is! WidgetModifierAttribute,
    );

    return copyWith(attributes: AttributeMap(inheritableAttributes));
  }

  /// Finds and returns an [VisualAttribute] of type [A], or null if not found.
  A? attributeOf<A extends SpecAttribute>() {
    final attributes = _attributes.whereType<A>();
    if (attributes.isEmpty) return null;

    return _mergeAttributes(attributes) ?? attributes.last;
  }

  Iterable<A> whereType<A extends StyledAttribute>() {
    return _attributes.whereType();
  }

  bool contains<T>() {
    return _attributes.values.any((attr) => attr is T);
  }

  Value? resolvableOf<Value, A extends SpecAttribute<Value>>() {
    final attribute = _attributes.attributeOfType<A>();

    return attribute?.resolve(this);
  }

  // /// Merges this [MixData] with another, prioritizing this instance's properties.
  MixData merge(MixData other) {
    return MixData._(
      resolver: _tokenResolver,
      attributes: _attributes.merge(other._attributes),
      animation: other.animation ?? animation,
    );
  }

  MixData copyWith({
    AttributeMap? attributes,
    AnimatedData? animation,
    MixTokenResolver? resolver,
  }) {
    return MixData._(
      resolver: resolver ?? _tokenResolver,
      attributes: attributes ?? _attributes,
      animation: animation ?? this.animation,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixData &&
        other._attributes == _attributes &&
        other.animation == animation;
  }

  @override
  int get hashCode => _attributes.hashCode ^ animation.hashCode;
}

@visibleForTesting
List<StyledAttribute> applyContextToVisualAttributes(
  BuildContext context,
  Style mix,
) {
  if (mix.variants.isEmpty) {
    return mix.styles.values;
  }

  final prioritizedVariants = mix.variants.values.sorted(
    (a, b) => a.priority.value.compareTo(b.priority.value),
  );

  Style style = Style.create(mix.styles.values);

  for (final variant in prioritizedVariants) {
    style = _applyVariants(context, style, variant);
  }

  return applyContextToVisualAttributes(context, style);
}

Style _applyVariants(
  BuildContext context,
  Style style,
  VariantAttribute variantAttribute,
) {
  if (variantAttribute is ContextVariantBuilder) {
    return style.merge(variantAttribute.build(context));
  }

  return variantAttribute.variant.when(context)
      ? style.merge(variantAttribute.value)
      : style;
}

M? _mergeAttributes<M extends SpecAttribute>(Iterable<M> mergeables) {
  if (mergeables.isEmpty) return null;

  return mergeables.reduce((a, b) {
    return a.merge(b) as M;
  });
}
