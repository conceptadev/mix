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

typedef InheritedAttributeMap = Map<Type, InheritedAttribute>;

class MixInheritedAttributes {
  final InheritedAttributeMap values;

  const MixInheritedAttributes(this.values);

  const MixInheritedAttributes.empty()
      : values = const <Type, InheritedAttribute>{};

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

  bool get isEmpty => values.isEmpty;

  bool get isNotEmpty => values.isNotEmpty;

  MixInheritedAttributes clone() {
    return MixInheritedAttributes(Map.from(values));
  }

  List<InheritedAttribute> toList() => values.values.toList();

  MixInheritedAttributes merge(MixInheritedAttributes? other) {
    if (other == null) {
      return this;
    }

    InheritedAttributeMap mergedAttributes = {};

    final keys = [...values.keys, ...other.values.keys];

    for (final key in keys) {
      final attribute = values[key];
      final otherAttribute = other.values[key];

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

  operator [](Object key) {
    return values[key];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixInheritedAttributes &&
        mapEquals(
          other.values,
          values,
        );
  }

  @override
  int get hashCode => values.hashCode;
}
