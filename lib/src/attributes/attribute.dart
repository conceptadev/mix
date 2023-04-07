import '../helpers/equality_mixin/equality_mixin.dart';

/// Base attribute

// Some classes have defaults
// Facade allows us ot set all properties as optional
// For improved merge and override of properties
abstract class StyleAttribute with EqualityMixin {
  const StyleAttribute();
}

mixin Mergeable<T> {
  T merge(covariant T? other);
}

/// An interface that add support to custom attributes for [MixContext].
abstract class WidgetStyleAttributes extends StyleAttribute
    with Mergeable<WidgetStyleAttributes> {
  const WidgetStyleAttributes();

  WidgetStyleAttributes copyWith();
}
