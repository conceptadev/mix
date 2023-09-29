// Necessary packages are imported at the start of the file.
import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../decorators/decorator.dart';
import '../helpers/equality_mixin/equality_mixin.dart';
import '../helpers/mergeable_map.dart';
import '../theme/mix_theme.dart';
import '../variants/variant_attribute.dart';
import 'style_mix.dart';
import 'style_mix_data.dart';

/// This refers to the deprecated class MixData and it's here for the purpose of maintaining compatibility.
@Deprecated('Use MixData instead.')
typedef MixContext = MixData;

/// This class is used for encapsulating all [MixData] related operations.
/// It contains a mixture of properties and methods useful for handling different attributes,
/// decorators and token resolvers.
class MixData with EqualityMixin {
  // instance variables for widget attributes, widget decorators and token resolver.
  final MergeableMap<StyledWidgetAttributes> _widgetAttributes;
  final MergeableMap<WidgetDecorator> _widgetDecorators;
  final MixTokenResolver _tokenResolver;

  /// A Private constructor for the [MixData] class that initializes its main variables.
  ///
  /// It takes in [widgetAttributes], [widgetDecorators] and [tokenResolver] as required parameters.
  MixData._({
    required MergeableMap<StyledWidgetAttributes> widgetAttributes,
    required MergeableMap<WidgetDecorator> widgetDecorators,
    required MixTokenResolver tokenResolver,
  })  : _widgetAttributes = widgetAttributes,
        _widgetDecorators = widgetDecorators,
        _tokenResolver = tokenResolver;

  /// Factory constructor that uses the provided [context] and [style]
  /// to create an instance of [MixData].
  factory MixData.create({
    required BuildContext context,
    required StyleMix style,
  }) {
    // Tracks the values selected and does not allow for
    // attributes already expended to be expended again.
    final currentValues = StyleMixData(
      attributes: style.values.attributes,
      decorators: style.values.decorators,
      variants: [],
      contextVariants: [],
    );

    final attributes = _applyContextVariants(
      context,
      style.values.contextVariants,
    );

    final combinedValues = currentValues.merge(StyleMixData.create(attributes));

    return MixData._(
      widgetAttributes: combinedValues.attributes ?? const MergeableMap.empty(),
      widgetDecorators: combinedValues.decorators ?? const MergeableMap.empty(),
      tokenResolver: MixTokenResolver(context),
    );
  }

  /// Getter method for [MixTokenResolver].
  ///
  /// Returns current [_tokenResolver].
  MixTokenResolver get resolveToken => _tokenResolver;

  /// Internal method to handle application of context variants to [attributes].
  ///
  /// It accepts the [context] and the list of [attributes] as parameters.
  static List<StyleAttribute> _applyContextVariants(
    BuildContext context,
    Iterable<StyleAttribute> attributes,
  ) {
    // Use the fold method to reduce the input attributes list
    // into a single list of expanded attributes.
    return attributes.fold<List<StyleAttribute>>(
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
                ? _applyContextVariants(context, attribute.value.toAttributes())
                : [attribute]);
        } else {
          // If the current attribute is not a ContextVariantAttribute,
          // simply add it to the expanded list.
          return expanded..add(attribute);
        }
      },
    );
  }

  /// Retrieves an instance of the specified [StyledWidgetAttributes] type from the [MixData].
  ///
  /// Accepts a type parameter [A] which extends [StyledWidgetAttributes].
  /// Returns the instance of type [A] if found, else returns null.
  A? attributesOfType<A extends StyledWidgetAttributes>() {
    return _widgetAttributes.get(A) as A?;
  }

  /// Retrieves an instance of attributes based on the type provided.
  ///
  /// The type [T] here refers to the type extending [StyledWidgetAttributes].
  /// An exception is thrown if no attribute of the required type is found.
  T dependOnAttributesOfType<T extends StyledWidgetAttributes>() {
    final attribute = attributesOfType<T>();

    if (attribute is! T) {
      throw Exception(
        'No $T could be found starting from MixContext '
        'when call mixContext.attributesOfType<$T>(). This can happen because you '
        'have not create a Mix with $T.',
      );
    }

    return attribute;
  }

  /// A getter method for [_widgetDecorators].
  ///
  /// Returns a list of all [WidgetDecorator].
  List<WidgetDecorator>? get decorators {
    return _widgetDecorators.values.toList();
  }

  /// This is similar to a merge behavior however it prioritizes the current properties
  /// over the other properties, essentially using [MixData] `other` as the base for this instance.
  ///
  /// [other] is the other [MixData] instance that is to be merged with current instance.
  /// Returns a new instance of [MixData] which is actually a merge of current and other instance.
  MixData inheritFrom(MixData other) {
    return MixData._(
      widgetAttributes: other._widgetAttributes.merge(_widgetAttributes),
      widgetDecorators: other._widgetDecorators.merge(_widgetDecorators),
      tokenResolver: _tokenResolver,
    );
  }

  /// Overrides the getter function of [props] from [EqualityMixin] to specify properties necessary for distinguishing instances.
  ///
  /// Returns a list of properties [_widgetAttributes] & [_widgetDecorators].
  @override
  get props => [_widgetAttributes, _widgetDecorators];
}
