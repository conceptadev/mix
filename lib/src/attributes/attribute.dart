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

  MixInheritedAttributes(this.attributes);

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
    final InheritedAttributeMap mergedAttributes = attributes;

    if (other == null) {
      return this;
    }
    final otherAttributes = other.attributes;

    for (final attributeType in otherAttributes.keys) {
      var inheritedAttribute = attributes[attributeType];
      final otherAttribute = otherAttributes[attributeType];

      if (inheritedAttribute == null) {
        inheritedAttribute = otherAttributes[attributeType];
      } else {
        inheritedAttribute = inheritedAttribute.merge(otherAttribute);
      }

      mergedAttributes[attributeType] = inheritedAttribute!;
    }

    return MixInheritedAttributes(attributes);
  }

  /// Used to obtain a [InheritedAttribute] from [MixContext].
  ///
  /// Obtain with `mixContext.fromType<MyAttributeExtension>()`.
  T? fromType<T>() => attributes[T] as T?;
}
