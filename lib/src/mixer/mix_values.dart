import 'package:flutter/foundation.dart';

import '../attributes/attribute.dart';
import '../attributes/nested_attribute.dart';
import '../decorators/decorator_attribute.dart';
import '../directives/directive_attribute.dart';
import '../variants/variant.dart';
import '../variants/variant_attribute.dart';

class MixValues {
  final MixInheritedAttributes attributes;
  final MixDecoratorAttributes decorators;
  final List<VariantAttribute> variants;
  final List<ContextVariantAttribute> contextVariants;
  final List<DirectiveAttribute> directives;

  const MixValues({
    required this.attributes,
    required this.decorators,
    required this.variants,
    required this.contextVariants,
    required this.directives,
  });

  factory MixValues.create(List<Attribute> attributes) {
    final expanded = _expandNestedAttributes(attributes);

    final directiveList = <DirectiveAttribute>[];
    final variantList = <VariantAttribute>[];
    final contextVariantList = <ContextVariantAttribute>[];
    final decoratorList = <DecoratorAttribute>[];
    final attributeList = <InheritedAttribute>[];

    for (final attribute in expanded) {
      if (attribute is InheritedAttribute) {
        attributeList.add(attribute);
      }

      if (attribute is VariantAttribute) {
        variantList.add(attribute);
      }

      if (attribute is ContextVariantAttribute) {
        contextVariantList.add(attribute);
      }

      if (attribute is DirectiveAttribute) {
        directiveList.add(attribute);
      }

      if (attribute is DecoratorAttribute) {
        decoratorList.add(attribute);
      }

      if (attribute is NestedMixAttribute) {
        throw Exception('Should not have nested attributes at this point');
      }
    }

    return MixValues(
      attributes: MixInheritedAttributes.fromList(attributeList),
      decorators: MixDecoratorAttributes.fromList(decoratorList),
      directives: directiveList,
      variants: variantList,
      contextVariants: contextVariantList,
    );
  }

  bool get hasDirectives => directives.isNotEmpty;

  bool get hasVariants => variants.isNotEmpty;

  bool get hasContextVariants => contextVariants.isNotEmpty;

  bool get hasDecorators => decorators.isNotEmpty;

  bool get hasAttributes => attributes.isNotEmpty;

  MixValues applyManyVariants(List<Variant> variants) {
    // Return values if list is empty
    if (variants.isEmpty) {
      return this;
    }
    final existingVariants = <VariantAttribute>[];
    final matchedVariants = <VariantAttribute>[];

    for (final variantAttribute in this.variants) {
      // Check if a variant attrribute matches the list
      if (variants.contains(variantAttribute.variant)) {
        matchedVariants.add(variantAttribute);
      } else {
        existingVariants.add(variantAttribute);
      }
    }

    // Get mixes of variants that match
    final mixes = matchedVariants.map((e) => e.value);

    // Flatten mixes to attributes
    final attributesToApply = mixes.expand((e) => e.toList());

// Merge into existing attributes
    return MixValues(
      attributes: attributes,
      decorators: decorators,
      variants: existingVariants,
      contextVariants: contextVariants,
      directives: directives,
    ).merge(MixValues.create(attributesToApply.toList()));
  }

  MixValues applyVariant(Variant variant) {
    return applyManyVariants([variant]);
  }

  /// Used to obtain a [InheritedAttribute] from [MixContext].
  ///
  /// Obtain with `mixContext.fromType<MyAttributeExtension>()`.
  A? attributesOfType<A extends InheritedAttribute>() {
    return attributes[A] as A?;
  }

  Iterable<T> directivesOfType<T extends DirectiveAttribute>() {
    return directives.whereType<T>();
  }

  List<DecoratorAttribute> decoratorsOfLocation(DecoratorLocation location) {
    return decorators.values[location] ?? [];
  }

  List<Attribute> toList() {
    return [
      ...attributes.values.values,
      ...decorators.values.values.expand((element) => element),
      ...variants,
      ...directives,
    ];
  }

  MixValues copyWith({
    MixInheritedAttributes? attributes,
    MixDecoratorAttributes? decorators,
    List<VariantAttribute>? variants,
    List<ContextVariantAttribute>? contextVariants,
    List<DirectiveAttribute>? directives,
  }) {
    return MixValues(
      attributes: attributes ?? this.attributes,
      decorators: decorators ?? this.decorators,
      variants: variants ?? this.variants,
      directives: directives ?? this.directives,
      contextVariants: contextVariants ?? this.contextVariants,
    );
  }

  MixValues clone() {
    return MixValues(
      attributes: attributes.clone(),
      decorators: decorators.clone(),
      variants: [...variants],
      contextVariants: [...contextVariants],
      directives: [...directives],
    );
  }

  MixValues merge(MixValues? other) {
    if (other == null) {
      return this;
    }

    return MixValues(
      attributes: attributes.merge(other.attributes),
      decorators: decorators.merge(other.decorators),
      variants: [...variants, ...other.variants],
      contextVariants: [...contextVariants, ...other.contextVariants],
      directives: [...directives, ...other.directives],
    );
  }

  static List<Attribute> _expandNestedAttributes(List<Attribute> attributes) {
    List<Attribute> expanded = [];

    for (final attribute in attributes) {
      if (attribute is NestedMixAttribute) {
        expanded.addAll(
          _expandNestedAttributes(attribute.value.toList()),
        );
      } else {
        expanded.add(attribute);
      }
    }

    return expanded;
  }

  const MixValues.empty()
      : attributes = const MixInheritedAttributes.empty(),
        decorators = const MixDecoratorAttributes.empty(),
        variants = const [],
        contextVariants = const [],
        directives = const [];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixValues &&
        listEquals(other.variants, variants) &&
        listEquals(other.directives, directives) &&
        other.decorators == decorators &&
        other.attributes == attributes;
  }

  @override
  int get hashCode {
    return variants.hashCode ^
        directives.hashCode ^
        decorators.hashCode ^
        attributes.hashCode;
  }
}
