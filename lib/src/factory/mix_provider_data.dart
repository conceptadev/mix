import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../decorators/decorator.dart';
import '../helpers/equality_mixin/equality_mixin.dart';
import '../helpers/mergeable_map.dart';
import '../theme/mix_theme.dart';
import '../variants/variant_attribute.dart';
import 'style_mix.dart';
import 'style_mix_data.dart';

@Deprecated('Use MixData instead.')
typedef MixContext = MixData;

class MixData with EqualityMixin {
  final MergeableMap<StyledWidgetAttributes> _widgetAttributes;
  final MergeableMap<WidgetDecorator> _widgetDecorators;
  final MixTokenResolver _tokenResolver;

  MixData._({
    required MergeableMap<StyledWidgetAttributes> widgetAttributes,
    required MergeableMap<WidgetDecorator> widgetDecorators,
    required MixTokenResolver tokenResolver,
  })  : _widgetAttributes = widgetAttributes,
        _widgetDecorators = widgetDecorators,
        _tokenResolver = tokenResolver;

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
      widgetAttributes: combinedValues.attributes ?? MergeableMap([]),
      widgetDecorators: combinedValues.decorators ?? MergeableMap([]),
      tokenResolver: MixTokenResolver(context),
    );
  }

  MixTokenResolver get resolveToken => _tokenResolver;

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

  /// Returns an instance of the specified [StyledWidgetAttributes] type from the [MixData].
  A? attributesOfType<A extends StyledWidgetAttributes>() {
    return _widgetAttributes[A] as A?;
  }

  T dependOnAttributesOfType<T extends StyledWidgetAttributes>() {
    final attribute = attributesOfType<T>();

    if (attribute is! T) {
      throw '''
      No $T could be found starting from MixContext 
      when call mixContext.attributesOfType<$T>(). This can happen because you 
      have not create a Mix with $T.
      ''';
    }

    return attribute;
  }

  List<WidgetDecorator>? get decorators {
    return _widgetDecorators.values.toList();
  }

  /// This is similar to a merge behavior however it prioritizes the current properties
  /// over the other properties, essentially using [MixData] `other` as the base for this instance.
  MixData inheritFrom(MixData other) {
    return MixData._(
      widgetAttributes: other._widgetAttributes.merge(_widgetAttributes),
      widgetDecorators: other._widgetDecorators.merge(_widgetDecorators),
      tokenResolver: _tokenResolver,
    );
  }

  @override
  get props => [_widgetAttributes, _widgetDecorators];
}
