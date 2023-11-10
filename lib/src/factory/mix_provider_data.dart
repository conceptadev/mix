// Necessary packages are imported at the start of the file.
import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../attributes/variant_attribute.dart';
import '../core/attributes_map.dart';
import '../core/equality/compare_mixin.dart';
import '../decorators/decorator.dart';
import '../theme/mix_theme.dart';
import 'style_mix.dart';

/// This class is used for encapsulating all [MixData] related operations.
/// It contains a mixture of properties and methods useful for handling different attributes,
/// decorators and token resolvers.
@immutable
class MixData with Comparable {
  // Instance variables for widget attributes, widget decorators and token resolver.
  final VisualAttributeMap _attributes;

  final MixTokenResolver _resolver;

  /// A Private constructor for the [MixData] class t hat initializes its main variables.
  ///
  /// It takes in [attributes], [decorators] and [resolver] as required parameters.
  MixData._({
    required MixTokenResolver resolver,
    required VisualAttributeMap attributes,
  })  : _attributes = attributes,
        _resolver = resolver;

  factory MixData.create(BuildContext context, StyleMix style) {
    final styleMix = applyContextToVisualAttributes(context, style);

    return MixData._(
      resolver: MixTokenResolver(context),
      attributes: VisualAttributeMap(styleMix),
    );
  }

  /// Getter method for [MixTokenResolver].
  ///
  /// Returns current [_resolver].
  MixTokenResolver get resolver => _resolver;

  /// A getter method for [_attributes].
  ///
  /// Returns a list of all [VisualAttribute].
  @visibleForTesting
  VisualAttributeMap get attributes => _attributes;

  /// A getter method for [_decorators].
  ///
  /// Returns a list of all [Decorator].
  List<T> decoratorOfType<T extends Decorator>() =>
      _attributes.whereType<T>().toList();

  /// Retrieves an instance of the specified [VisualAttribute] type from the [MixData].
  /// d
  /// Accepts a type parameter [Attr] which extends [VisualAttribute].
  /// Returns the instance of type [Attr] if found, else returns null.
  T? attributeOfType<T extends VisualAttribute>() {
    return _attributes.attributeOfType<T>();
  }

  R? get<Attr extends VisualAttribute<R>, R>() {
    return attributeOfType<Attr>()?.resolve(this);
  }

  /// This is similar to a merge behavior however it prioritizes the current properties
  /// over the other properties, essentially using [MixData] `other` as the base for this instance.
  ///
  /// [other] is the other [MixData] instance that is to be merged with current instance.
  /// Returns a new instance of [MixData] which is actually a merge of current and other instance.
  MixData merge(MixData other) {
    return MixData._(
      resolver: _resolver,
      attributes: _attributes.merge(other._attributes),
    );
  }

  /// Overrides the getter function of [props] from [Comparable] to specify properties necessary for distinguishing instances.
  ///
  /// Returns a list of properties [_attributes] & [_decorators].
  @override
  get props => [_attributes];
}

@visibleForTesting
List<VisualAttribute> applyContextToVisualAttributes(
  BuildContext context,
  StyleMix mix,
) {
  StyleMix mergedMix = StyleMix.create(mix.styles);

  final contextVariants = mix.variants.whereType<ContextVariantAttribute>();

  // Once there are no more context variants to apply, return the mix
  if (contextVariants.isEmpty) {
    return mix.styles;
  }

  for (ContextVariantAttribute variant in contextVariants) {
    if (variant.when(context)) {
      mergedMix = mergedMix.merge(variant.value);
    }
  }

  return applyContextToVisualAttributes(context, mergedMix);
}
