import '../decorators/decorator_attribute.dart';

/// Base attribute

// Some classes have defaults
// Facade allows us ot set all properties as optional
// For improved merge and override of properties
abstract class Attribute {
  const Attribute();
}

/// An interface that add support to custom attributes for [MixContext].
abstract class WidgetAttributes extends Attribute
    with MergeableAttributeMixin<WidgetAttributes> {
  const WidgetAttributes();

  @override
  WidgetAttributes merge(covariant WidgetAttributes? other);

  Object get type => WidgetAttributes;
}
