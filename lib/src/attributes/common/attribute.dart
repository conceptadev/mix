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

abstract class DynamicAttribute<T extends Attribute> extends Attribute {
  const DynamicAttribute(this.attributes);

  final List<T> attributes;

  bool shouldApply(BuildContext context);
}

abstract class WidgetAttribute<T extends WidgetAttribute<T>> extends Attribute {
  const WidgetAttribute();
  WidgetAttribute<T> merge(T other);
  Widget render(MixContext mixContext, Widget child);
}

abstract class DirectiveAttribute<T> extends Attribute {
  const DirectiveAttribute();
  T modify(T value);
}
