import 'package:flutter/foundation.dart';

/// Base attribute

// Some classes have defaults
// Facade allows us ot set all properties as optional
// For improved merge and override of properties
abstract class Attribute {
  const Attribute();
}

/// An interface that add support to custom attributes for [MixContext].
abstract class InheritedAttribute extends Attribute {
  const InheritedAttribute();

  InheritedAttribute merge(covariant InheritedAttribute? other);

  Object get type => InheritedAttribute;
}

typedef InheritedAttributeMap = Map<Object, InheritedAttribute>;

class MixInheritedAttributes {
  final InheritedAttributeMap attributes;

  const MixInheritedAttributes(this.attributes);

  const MixInheritedAttributes.empty()
      : attributes = const <Object, InheritedAttribute>{};

  factory MixInheritedAttributes.fromList(List<InheritedAttribute> attributes) {
    final InheritedAttributeMap attributesMap = {};

    for (final attribute in attributes) {
      var inheritedAttribute = attributesMap[attribute.runtimeType];

      if (inheritedAttribute == null) {
        inheritedAttribute = attribute;
      } else {
        inheritedAttribute = inheritedAttribute.merge(attribute);
      }

      attributesMap[attribute.runtimeType] = inheritedAttribute;
    }

    return MixInheritedAttributes(attributesMap);
  }

  MixInheritedAttributes merge(MixInheritedAttributes? other) {
    if (other == null) {
      return this;
    }

    InheritedAttributeMap mergedAttributes = {};

    final keys = [...attributes.keys, ...other.attributes.keys];

    for (final key in keys) {
      final attribute = attributes[key];
      final otherAttribute = other.attributes[key];

      if (attribute == null) {
        mergedAttributes[key] = otherAttribute!;
      } else if (otherAttribute == null) {
        mergedAttributes[key] = attribute;
      } else {
        mergedAttributes[key] = attribute.merge(otherAttribute);
      }
    }

    return MixInheritedAttributes(mergedAttributes);
  }

  /// Used to obtain a [InheritedAttribute] from [MixContext].
  ///
  /// Obtain with `mixContext.fromType<MyAttributeExtension>()`.
  T? fromType<T>() => attributes[T] as T?;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixInheritedAttributes &&
        mapEquals(
          other.attributes,
          attributes,
        );
  }

  @override
  int get hashCode => attributes.hashCode;
}
