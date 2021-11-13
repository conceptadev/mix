import 'package:flutter/material.dart';
import 'package:mix/src/attributes/dynamic/dark_mode.attributes.dart';
import 'package:mix/src/attributes/dynamic/dynamic.utils.dart';
import 'package:mix/src/attributes/dynamic/media_query.attributes.dart';

/// Base attribute

// Some classes have defaults
// Facade allows us ot set all properties as optional
// For improved merge and override of properties
abstract class Attribute {
  const Attribute();
}

extension AttributeExtensions on Attribute {
  DarkModeAttribute get onDark => DarkModeAttribute([this]);
  // MediaQueryAttribute get onMediaQuery => MediaQueryAttribute(this);
  ScreenSizeAttribute get onXSmall => DynamicUtils.xsmall([this]);
  ScreenSizeAttribute get onSmall => DynamicUtils.small([this]);
  ScreenSizeAttribute get onMedium => DynamicUtils.medium([this]);
  ScreenSizeAttribute get onLarge => DynamicUtils.large([this]);
  OrientationAttribute get onPortrait => DynamicUtils.portrait([this]);
  OrientationAttribute get onLandscape => DynamicUtils.landscape([this]);
}

/// Allows to pass down Mixes as attributes for use with helpers
class NestedAttribute<T extends Attribute> extends Attribute {
  NestedAttribute(this.attributes);

  final List<T> attributes;
}

abstract class DynamicAttribute extends Attribute {
  const DynamicAttribute(this.attributes);

  final List<Attribute> attributes;

  bool shouldApply(BuildContext context);
}

abstract class DirectiveAttribute<T> extends Attribute {
  const DirectiveAttribute();
  T modify(T value);
}
