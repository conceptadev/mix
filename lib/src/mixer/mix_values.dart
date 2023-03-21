import 'package:flutter/foundation.dart';

import '../../mix.dart';
import '../attributes/nested_attribute.dart';
import '../decorators/decorator_attribute.dart';
import '../directives/directive_attribute.dart';
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

  /// Creates a new [MixValues] instance from the provided [Iterable] of [Attribute]s.
  factory MixValues.create(Iterable<Attribute> attributes) {
    final expanded = _expandNestedAttributes(attributes);

    final directiveList = <DirectiveAttribute>[];
    final variantList = <VariantAttribute>[];
    final contextVariantList = <ContextVariantAttribute>[];
    final decoratorList = <DecoratorAttribute>[];
    final attributeList = <InheritedAttribute>[];

    for (final attribute in expanded) {
      if (attribute is InheritedAttribute) {
        attributeList.add(attribute);
      } else if (attribute is VariantAttribute) {
        // Breakdown different types of variant attributes
        if (attribute is ContextVariantAttribute) {
          contextVariantList.add(attribute);
        } else {
          variantList.add(attribute);
        }
      } else if (attribute is DirectiveAttribute) {
        directiveList.add(attribute);
      } else if (attribute is DecoratorAttribute) {
        decoratorList.add(attribute);
      } else if (attribute is NestedMixAttribute) {
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

  /// Returns an instance of the specified [InheritedAttribute] type from the [MixContext].
  A? attributesOfType<A extends InheritedAttribute>() {
    return attributes[A] as A?;
  }

  /// Returns an [Iterable] of [DirectiveAttribute]s of the specified type.
  Iterable<T> directivesOfType<T extends DirectiveAttribute>() {
    return directives.whereType<T>();
  }

  /// Returns a [List] of [DecoratorAttribute]s for the specified [DecoratorLocation].
  Iterable<DecoratorAttribute> _decoratorsOfLocation(
    DecoratorLocation location,
  ) {
    return decorators.values[location] ?? const [];
  }

  Iterable<T> decoratorsOfType<T extends DecoratorAttribute>() {
    if (T == BoxParentDecoratorAttribute) {
      return _decoratorsOfLocation(DecoratorLocation.boxParent) as Iterable<T>;
    }

    if (T == BoxChildDecoratorAttribute) {
      return _decoratorsOfLocation(DecoratorLocation.boxChild) as Iterable<T>;
    }

    throw Exception('Unsupported decorator type');
  }

  /// Returns an [Iterable] of [Attribute]s containing all attributes, decorators, variants, and directives.
  Iterable<Attribute> toAttributes() {
    return [
      ...attributes.toAttributes(),
      ...decorators.toAttributes(),
      ...variants,
      ...directives,
    ];
  }

  /// Creates a new [MixValues] instance by replacing the specified attributes with new values.
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

  /// Creates a new [MixValues] instance with the same attributes, decorators, variants, and directives.
  MixValues clone() {
    return MixValues(
      attributes: attributes.clone(),
      decorators: decorators.clone(),
      variants: [...variants],
      contextVariants: [...contextVariants],
      directives: [...directives],
    );
  }

  /// Merges the current [MixValues] instance with another [MixValues] instance.
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

  /// Expands nested attributes from the provided [Iterable] of [Attribute]s.
  static Iterable<Attribute> _expandNestedAttributes(
    Iterable<Attribute> attributes,
  ) {
    return attributes.expand((attribute) {
      if (attribute is NestedMixAttribute) {
        final nestedMix = attribute.value;

        return _expandNestedAttributes(nestedMix.toAttributes());
      } else {
        return [attribute];
      }
    });
  }

  /// An empty [MixValues] instance with no attributes, decorators, variants, or directives.
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
