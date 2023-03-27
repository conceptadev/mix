/// Base attribute

// Some classes have defaults
// Facade allows us ot set all properties as optional
// For improved merge and override of properties
abstract class Attribute {
  const Attribute();
}

mixin MergeableMixin<T> {
  T merge(covariant T? other);
}

/// An interface that add support to custom attributes for [MixContext].
abstract class WidgetAttributes extends Attribute
    with MergeableMixin<WidgetAttributes> {
  const WidgetAttributes();

  @override
  WidgetAttributes merge(covariant WidgetAttributes? other);

  Object get type => WidgetAttributes;
}
