import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../helpers/equatable_mixin.dart';
import '../theme/mix_theme.dart';
import '../variants/variant_attribute.dart';
import '../widgets/box/box.decorator.dart';
import 'mix_factory.dart';
import 'mix_values.dart';

@Deprecated('Use MixData instead.')
typedef MixContext = MixData;

class MixData with EquatableMixin {
  final MixValues _mixValues;
  final MixTokenResolver _tokenResolver;
  final MixThemeData? _theme;

  MixData._({
    required MixValues mixValues,
    required MixTokenResolver tokenResolver,
    MixThemeData? theme,
  })  : _mixValues = mixValues,
        _tokenResolver = tokenResolver,
        _theme = theme;

  factory MixData.create({
    required BuildContext context,
    @Deprecated('Use the style parameter instead') Mix? mix,
    StyleMix? style,
  }) {
    assert((style != null && mix == null) || (style == null && mix != null),
        'This method require mix OR style parameters, not both');

    MixFactory styleMix = style ?? mix ?? Mix.constant;

    // Tracks the values selected and does not allow for
    // attributes already expended to be expended again.
    MixValues values = MixValues(
      attributes: styleMix.values.attributes,
      decorators: styleMix.values.decorators,
      variants: styleMix.values.variants,
      contextVariants: [],
    );

    final contextVariants = styleMix.values.contextVariants;

    final attributes = _applyContextVariants(
      context,
      contextVariants,
    );

    final appliedValues = values.merge(MixValues.create(attributes));

    return MixData._(
      mixValues: appliedValues,
      tokenResolver: MixTokenResolver(context),
      theme: MixTheme.maybeOf(context),
    );
  }

  MixTokenResolver get resolveToken => _tokenResolver;

  static List<Attribute> _applyContextVariants(
    BuildContext context,
    Iterable<Attribute> attributes,
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

  /// Used to obtain a [WidgetAttributes] from [MergeableMap<WidgetAttributes>].
  ///
  /// Obtain with `mixContext.attributesOfType<MyInheritedAttribute>()`.
  T? attributesOfType<T extends WidgetAttributes>() {
    return _mixValues.attributesOfType<T>();
  }

  List<WidgetDecorator>? get decorators {
    return _mixValues.decorators?.values.toList();
  }

  T dependOnAttributesOfType<T extends WidgetAttributes>() {
    final attribute = _mixValues.attributesOfType<T>();

    if (attribute is! T) {
      throw '''
      No $T could be found starting from MixContext 
      when call mixContext.attributesOfType<$T>(). This can happen because you 
      have not create a Mix with $T.
      ''';
    }

    return attribute;
  }

  MixValues get values => _mixValues;

  @override
  get props => [_mixValues, _theme];
}
