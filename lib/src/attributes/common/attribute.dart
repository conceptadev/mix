import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

/// Base attribute

// Some classes have defaults
// Facade allows us ot set all properties as optional
// For improved merge and override of properties
abstract class Attribute {
  const Attribute();
}

/// Allows to pass down Mixes as attributes for use with helpers
class NestedAttribute<T extends Attribute> extends Attribute {
  const NestedAttribute(this.attributes);

  final List<T> attributes;
}

class VariantAttribute<T extends Attribute> extends Attribute {
  const VariantAttribute(this.variant, this.attributes, {this.checkFn});

  final Variant variant;
  final List<T> attributes;
  final bool Function(BuildContext)? checkFn;

  bool shouldApply(BuildContext context) {
    return checkFn?.call(context) ?? false;
  }

  @override
  String toString() =>
      'VariantAttribute(variant: $variant, attributes: $attributes)';
}

enum WidgetDecoratorType {
  parent,
  child,
  separator,
}

abstract class WidgetDecorator<T extends WidgetDecorator<T>> extends Attribute {
  const WidgetDecorator();
  WidgetDecorator<T> merge(T other);
  WidgetDecoratorType get type;
  Widget render(MixContext mixContext, Widget child);
}

abstract class ParentWidgetDecorator<T extends WidgetDecorator<T>>
    extends WidgetDecorator<T> {
  const ParentWidgetDecorator();
  @override
  WidgetDecoratorType get type => WidgetDecoratorType.parent;
}

abstract class DirectiveAttribute<T> extends Attribute {
  const DirectiveAttribute();
  T modify(T value);
}
