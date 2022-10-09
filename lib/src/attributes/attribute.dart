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

class InheritedAttributes {
  final Map<Object, InheritedAttribute> attributes;

  InheritedAttributes(this.attributes);

  /// Used to obtain a [InheritedAttribute] from [MixContext].
  ///
  /// Obtain with `mixContext.fromType<MyAttributeExtension>()`.
  T? fromType<T>() => attributes[T] as T?;
}
