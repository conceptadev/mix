import 'package:flutter/foundation.dart';
import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/decorators/decorator_attributes.dart';
import 'package:mix/src/directives/directive.dart';
import 'package:mix/src/variants/variant_attribute.dart';

class MixAttributes {
  final MixInheritedAttributes attributes;
  final MixDecoratorAttributes decorators;
  final List<VariantAttribute> variants;
  final List<DirectiveAttribute> directives;
  final List<Attribute> source;

  const MixAttributes._({
    required this.attributes,
    required this.decorators,
    required this.variants,
    required this.directives,
    required this.source,
  });

  const MixAttributes.empty()
      : attributes = const MixInheritedAttributes.empty(),
        decorators = const MixDecoratorAttributes.empty(),
        variants = const [],
        source = const [],
        directives = const [];

  factory MixAttributes.fromList(List<Attribute> attributes) {
    final directiveList = <DirectiveAttribute>[];
    final variantList = <VariantAttribute>[];
    final decoratorList = <DecoratorAttribute>[];
    final attributeList = <InheritedAttribute>[];

    for (final attribute in attributes) {
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
    }

    return MixAttributes._(
      attributes: MixInheritedAttributes.fromList(attributeList),
      directives: directiveList,
      variants: variantList,
      decorators: MixDecoratorAttributes.fromList(decoratorList),
      source: [...attributes],
    );
  }

  @Deprecated('Use MixAttributes.fromList instead')
  MixAttributes clone() {
    return MixAttributes._(
      attributes: attributes,
      decorators: decorators,
      variants: variants,
      directives: directives,
      source: source,
    );
  }

  MixAttributes merge(MixAttributes? other) {
    if (other == null) {
      return this;
    }

    return MixAttributes._(
      attributes: attributes.merge(other.attributes),
      decorators: decorators.merge(other.decorators),
      variants: [...variants, ...other.variants],
      directives: [...directives, ...other.directives],
      source: [...source, ...other.source],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixAttributes &&
        listEquals(other.variants, variants) &&
        listEquals(other.directives, directives) &&
        other.decorators == decorators &&
        listEquals(other.source, source) &&
        other.attributes == attributes;
  }

  @override
  int get hashCode {
    return variants.hashCode ^
        directives.hashCode ^
        decorators.hashCode ^
        source.hashCode ^
        attributes.hashCode;
  }
}
