import '../helpers/equality_mixin/equality_mixin.dart';

/// Base attribute

// Some classes have defaults
// Facade allows us ot set all properties as optional
// For improved merge and override of properties
abstract class Attribute with EqualityMixin {
  const Attribute();
}

mixin Mergeable<T> {
  T merge(covariant T? other);
}

/// An interface that add support to custom attributes for [MixContext].
abstract class WidgetAttributes extends Attribute
    with Mergeable<WidgetAttributes> {
  const WidgetAttributes();

  WidgetAttributes copyWith();
}
