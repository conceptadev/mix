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
  const VariantAttribute(
    this.name,
    this.attributes,
  );

  final String name;
  final List<T> attributes;

  bool shouldApply(BuildContext context) => false;
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
