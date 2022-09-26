import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

/// Base attribute

// Some classes have defaults
// Facade allows us ot set all properties as optional
// For improved merge and override of properties
abstract class Attribute {
  
  //final bool isExtension = false;
  
  const Attribute();
}

/// An interface that add support to custom attributes for [MixContext].
abstract class AttributeExtension<T extends AttributeExtension<T>>
    extends Attribute {
  const AttributeExtension();

  T merge(T other);

  Object get type => T;
}

class AttributeExtensions {
  final Map<Object, AttributeExtension<dynamic>> extensions;

  AttributeExtensions(this.extensions);

  /// Used to obtain a [AttributeExtension] from [extensions].
  ///
  /// Obtain with `mixContext.extension<MyAttributeExtension>()`.
  T? extension<T>() => extensions[T] as T?;

  // TODO(): Add merge method to support inherited extensions
}


/// Allows to pass down Mixes as attributes for use with helpers
class NestedAttribute<T extends Attribute> extends Attribute {
  const NestedAttribute(this.attributes);

  final List<T> attributes;
}

class VariantAttribute<T extends Attribute> extends Attribute {
  const VariantAttribute(
    this.variant,
    this.attributes, {
    bool Function(BuildContext)? shouldApply,
  }) : _shouldApply = shouldApply;

  final Variant<T> variant;
  final List<T> attributes;
  final bool Function(BuildContext)? _shouldApply;

  bool shouldApply(BuildContext context) {
    return _shouldApply?.call(context) ?? false;
  }

  @override
  String toString() =>
      'VariantAttribute(variant: $variant, attributes: $attributes)';
}

enum DecoratorType {
  parent,
  child,
  separator,
}

abstract class Decorator<T> extends Attribute {
  const Decorator(this.key);
  final Key key;
  Decorator<T> merge(T other);

  DecoratorType get type;
  Widget render(MixContext mixContext, Widget child);
}

abstract class ParentDecorator<T> extends Decorator<T> {
  const ParentDecorator(Key key) : super(key);
  @override
  DecoratorType get type => DecoratorType.parent;
}

abstract class ChildDecorator<T> extends Decorator<T> {
  const ChildDecorator(Key key) : super(key);
  @override
  DecoratorType get type => DecoratorType.child;
}

abstract class DirectiveAttribute<T> extends Attribute {
  const DirectiveAttribute();
  T modify(T value);
}
