// Necessary packages are imported at the start of the file.
import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../attributes/resolvable_attribute.dart';
import '../decorators/decorator.dart';
import '../helpers/attributes_map.dart';
import '../helpers/compare_mixin/compare_mixin.dart';
import '../theme/mix_theme.dart';
import '../variants/variant_attribute.dart';
import 'style_mix.dart';
import 'style_mix_data.dart';

/// This class is used for encapsulating all [MixData] related operations.
/// It contains a mixture of properties and methods useful for handling different attributes,
/// decorators and token resolvers.
class MixData with Comparable {
  final bool animated;

  // Instance variables for widget attributes, widget decorators and token resolver.
  final AttributesMap<ResolvableAttribute> _attributes;
  final AttributesMap<Decorator> _decorators;
  final MixTokenResolver _tokenResolver;

  /// A Private constructor for the [MixData] class that initializes its main variables.
  ///
  /// It takes in [attributes], [decorators] and [tokenResolver] as required parameters.
  MixData._({
    required MixTokenResolver tokenResolver,
    required AttributesMap<ResolvableAttribute> attributes,
    required AttributesMap<Decorator> decorators,
    required this.animated,
  })  : _attributes = attributes,
        _decorators = decorators,
        _tokenResolver = tokenResolver;

  /// Factory constructor that uses the provided [context] and [style]
  /// to create an instance of [MixData].
  factory MixData.create({
    required BuildContext context,
    required StyleMix style,
    bool animated = false,
  }) {
    // Tracks the values selected and does not allow for
    // attributes already expended to be expended again.
    final currentValues = StyleMixData(
      attributes: style.values.attributes,
      variants: style.values.variants,
      decorators: style.values.decorators,
      contextVariants: style.values.contextVariants,
    );

    final attributes = _applyContextVariants(
      style.values.contextVariants.toList(),
      context,
    );

    final combinedValues = currentValues.merge(StyleMixData.create(attributes));

    return MixData._(
      tokenResolver: MixTokenResolver(context),
      attributes: combinedValues.attributes,
      decorators: combinedValues.decorators,
      animated: animated,
    );
  }

  /// Internal method to handle application of context variants to [attributes].
  ///
  /// It accepts the [context] and the list of [attributes] as parameters.
  static List<Attribute> _applyContextVariants(
    Iterable<Attribute> attributes,
    BuildContext context,
  ) {
    // Use the fold method to reduce the input attributes list
    // into a single list of expanded attributes.
    return attributes.fold<List<Attribute>>(
      [], // Initial empty list to accumulate the result.
      (expanded, attribute) {
        // Check if the current attribute is a ContextVariantAttribute.
        if (attribute is ContextVariantAttribute) {
          // Determine if the attribute should be applied based on the context.
          final shouldApply = attribute.shouldApply(context);

          // If willApply is true, recursively apply context variants to
          // the attribute's value and add the result to the expanded list.
          // Otherwise, add the attribute itself to the list.
          return expanded
            ..addAll(shouldApply
                // ignore: avoid-recursive-calls
                ? _applyContextVariants(attribute.value.toAttributes(), context)
                : [attribute]);
        }

        // If the current attribute is not a ContextVariantAttribute,
        // simply add it to the expanded list.
        return expanded..add(attribute);
      },
    );
  }

  /// Getter method for [MixTokenResolver].
  ///
  /// Returns current [_tokenResolver].
  MixTokenResolver get resolveToken => _tokenResolver;

  /// A getter method for [_decorators].
  ///
  /// Returns a list of all [Decorator].
  List<Decorator> get decorators {
    return _decorators.toList();
  }

  /// Retrieves an instance of the specified [ResolvableAttribute] type from the [MixData].
  ///
  /// Accepts a type parameter [A] which extends [ResolvableAttribute].
  /// Returns the instance of type [A] if found, else returns null.
  A? get<A extends ResolvableAttribute>() {
    return _attributes.ofType<A>() as A?;
  }

  R? resolveAttributeOfType<Attr extends ResolvableAttribute<R>, R>() {
    final attribute = get<Attr>();

    return attribute?.resolve(this);
  }

  R dependOnResolveAttributeOfType<Attr extends ResolvableAttribute<R>, R>(
      R defaultValue) {
    final attribute = get<Attr>();

    return attribute?.resolve(this) ?? defaultValue;
  }

  /// Retrieves an instance of attributes based on the type provided.
  ///
  /// The type [T] here refers to the type extending [ResolvableAttribute].
  /// An exception is thrown if no attribute of the required type is found.
  T dependOnAttributesOfType<T extends ResolvableAttribute>() {
    final attribute = get<T>();

    if (attribute is! T) {
      throw Exception(
        'No $T could be found starting from MixContext '
        'when call mixContext.attributesOfType<$T>(). This can happen because you '
        'have not create a Mix with $T.',
      );
    }

    return attribute;
  }

  /// This is similar to a merge behavior however it prioritizes the current properties
  /// over the other properties, essentially using [MixData] `other` as the base for this instance.
  ///
  /// [other] is the other [MixData] instance that is to be merged with current instance.
  /// Returns a new instance of [MixData] which is actually a merge of current and other instance.
  MixData inheritFrom(MixData other) {
    return MixData._(
      tokenResolver: _tokenResolver,
      attributes: other._attributes.merge(_attributes),
      decorators: other._decorators.merge(_decorators),
      animated: animated,
    );
  }

  /// Overrides the getter function of [props] from [Comparable] to specify properties necessary for distinguishing instances.
  ///
  /// Returns a list of properties [_attributes] & [_decorators].
  @override
  get props => [_attributes, _decorators, animated];
}
