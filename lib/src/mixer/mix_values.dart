import 'package:flutter/foundation.dart';
import '../attributes/attribute.dart';
import '../attributes/nested_attribute.dart';
import '../decorators/decorator_attribute.dart';
import '../directives/directive_attribute.dart';
import '../variants/variant_attribute.dart';

class MixValues {
  final MixInheritedAttributes attributes;
  final MixDecoratorAttributes decorators;
  final List<VariantAttribute> variants;
  final List<DirectiveAttribute> directives;

  const MixValues({
    required this.attributes,
    required this.decorators,
    required this.variants,
    required this.directives,
  });

  const MixValues.empty()
      : attributes = const MixInheritedAttributes.empty(),
        decorators = const MixDecoratorAttributes.empty(),
        variants = const [],
        directives = const [];

  factory MixValues.fromList(List<Attribute> attributes) {
    final expanded = _expandNestedAttributes(attributes);

    final directiveList = <DirectiveAttribute>[];
    final variantList = <VariantAttribute>[];
    final decoratorList = <DecoratorAttribute>[];
    final attributeList = <InheritedAttribute>[];

    for (final attribute in expanded) {
      if (attribute is InheritedAttribute) {
        attributeList.add(attribute);
      }

      if (attribute is VariantAttribute) {
        variantList.add(attribute);
      }

      if (attribute is DirectiveAttribute) {
        directiveList.add(attribute);
      }

      if (attribute is DecoratorAttribute) {
        decoratorList.add(attribute);
      }

      if (attribute is NestedAttribute) {
        throw Exception('Should not have nested attributes at this point');
      }
    }

    return MixValues(
      attributes: MixInheritedAttributes.fromList(attributeList),
      decorators: MixDecoratorAttributes.fromList(decoratorList),
      directives: directiveList,
      variants: variantList,
    );
  }

  bool get hasDirectives => directives.isNotEmpty;

  bool get hasVariants => variants.isNotEmpty;

  List<Attribute> get source {
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
    List<DirectiveAttribute>? directives,
  }) {
    return MixValues(
      attributes: attributes ?? this.attributes,
      decorators: decorators ?? this.decorators,
      variants: variants ?? this.variants,
      directives: directives ?? this.directives,
    );
  }

  MixValues clone() {
    return MixValues(
      attributes: attributes.clone(),
      decorators: decorators.clone(),
      variants: [...variants],
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
      directives: [...directives, ...other.directives],
    );
  }

  static List<Attribute> _expandNestedAttributes(List<Attribute> attributes) {
    List<Attribute> expanded = [];

    for (final attribute in attributes) {
      if (attribute is NestedAttribute) {
        expanded.addAll(
          _expandNestedAttributes(attribute.values),
        );
      } else if (attribute is VariantAttribute) {
        expanded.add(
          VariantAttribute(
            attribute.variant,
            _expandNestedAttributes(attribute.values),
          ),
        );
      } else {
        expanded.add(attribute);
      }
    }

    return expanded;
  }

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
