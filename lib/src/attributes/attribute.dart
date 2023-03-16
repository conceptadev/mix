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

class MixInheritedAttributes {
  final Map<Type, InheritedAttribute> _mapOfvalues;

  const MixInheritedAttributes(Map<Type, InheritedAttribute> values)
      : _mapOfvalues = values;

  const MixInheritedAttributes.empty()
      : _mapOfvalues = const <Type, InheritedAttribute>{};

  factory MixInheritedAttributes.fromList(List<InheritedAttribute> attributes) {
    final Map<Type, InheritedAttribute> attributesMap = {};

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

  bool get isEmpty => _mapOfvalues.isEmpty;

  bool get isNotEmpty => _mapOfvalues.isNotEmpty;

  MixInheritedAttributes clone() {
    return MixInheritedAttributes(Map.from(_mapOfvalues));
  }

  Iterable<InheritedAttribute> toAttributes() => _mapOfvalues.values;

  MixInheritedAttributes merge(MixInheritedAttributes? other) {
    if (other == null) {
      return this;
    }

    Map<Type, InheritedAttribute> mergedAttributes = {};

    final keys = [..._mapOfvalues.keys, ...other._mapOfvalues.keys];

    for (final key in keys) {
      final attribute = _mapOfvalues[key];
      final otherAttribute = other._mapOfvalues[key];

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
    return _mapOfvalues[key];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixInheritedAttributes &&
        mapEquals(
          other._mapOfvalues,
          _mapOfvalues,
        );
  }

  @override
  int get hashCode => _mapOfvalues.hashCode;
}
