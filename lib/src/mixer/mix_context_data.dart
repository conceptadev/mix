import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../decorators/decorator_attribute.dart';
import '../directives/directive_attribute.dart';
import '../variants/variant_attribute.dart';
import 'mix_factory.dart';
import 'mix_values.dart';

class MixContextData {
  final MixValues _mixValues;

  MixContextData._({
    required MixValues mixValues,
  }) : _mixValues = mixValues;

  factory MixContextData.create({
    required BuildContext context,
    required MixFactory mix,
  }) {
    return _build(
      context: context,
      mix: mix,
    );
  }

  static MixContextData _build<T extends Attribute>({
    required BuildContext context,
    required MixFactory mix,
  }) {
    // Tracks the values selected and does not allow for
    // attributes already expended to be expended again.
    MixValues values = MixValues(
      attributes: mix.toValues().attributes,
      decorators: mix.toValues().decorators,
      directives: mix.toValues().directives,
      variants: mix.toValues().variants,
      contextVariants: [],
    );

    final contextVariants = values.contextVariants;

    final attributes = _applyContextVariants(
      context,
      contextVariants,
    );

    final appliedValues = values.merge(MixValues.create(attributes));

    return MixContextData._(
      mixValues: appliedValues,
    );
  }

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
          // Check if the attribute is inverse (from `not(variant)`). If it is,
          // only apply if shouldApply is false. Otherwise, apply only when shouldApply.
          final willApply =
              attribute.variant.inverse ? !shouldApply : shouldApply;

          // If willApply is true, recursively apply context variants to
          // the attribute's value and add the result to the expanded list.
          // Otherwise, add the attribute itself to the list.
          return expanded
            ..addAll(willApply
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

  /// Used to obtain a [InheritedAttributes] from [MixInheritedAttributes].
  ///
  /// Obtain with `mixContext.attributesOfType<MyInheritedAttribute>()`.
  T? attributesOfType<T extends InheritedAttributes>() {
    return _mixValues.attributesOfType<T>();
  }

  T dependOnAttributesOfType<T extends InheritedAttributes>() {
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

  List<T> directivesOfType<T extends DirectiveAttribute>() {
    return _mixValues.directivesOfType<T>().toList();
  }

  List<T> decoratorsOfType<T extends DecoratorAttribute>() {
    return _mixValues.decoratorsOfType<T>().toList();
  }

  MixValues toValues() => _mixValues;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixContextData && other._mixValues == _mixValues;
  }

  @override
  int get hashCode {
    return _mixValues.hashCode;
  }
}
