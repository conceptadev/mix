import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/context/context.utils.dart';
import 'package:mix/src/attributes/context/dark_mode.attributes.dart';
import 'package:mix/src/attributes/context/media_query.attributes.dart';

/// Base attribute

// Some classes have defaults
// Facade allows us ot set all properties as optional
// For improved merge and override of properties
abstract class Attribute {
  const Attribute();
}

extension AttributeExtensions on Attribute {
  DarkModeAttribute get onDark => DarkModeAttribute(this);
  // MediaQueryAttribute get onMediaQuery => MediaQueryAttribute(this);
  ScreenSizeAttribute get onXSmall => ContextUtility.xsmall(this);
  ScreenSizeAttribute get onSmall => ContextUtility.small(this);
  ScreenSizeAttribute get onMedium => ContextUtility.medium(this);
  ScreenSizeAttribute get onLarge => ContextUtility.large(this);
  OrientationAttribute get onPortrait => ContextUtility.portrait(this);
  OrientationAttribute get onLandscape => ContextUtility.landscape(this);
}

/// Allows to pass down Mixes as attributes for use with helpers
class NestedMixAttributes<T extends Attribute> extends Attribute {
  NestedMixAttributes(Mix<T> mix) : _mix = mix;

  final Mix<T> _mix;

  List<T> get attributes => _mix.attributes;
}

abstract class DynamicAttribute extends Attribute {
  const DynamicAttribute(this.attribute);

  final Attribute attribute;

  bool shouldApply(BuildContext context);
}

abstract class DirectiveAttribute<T> extends Attribute {
  const DirectiveAttribute();
  T modify(T value);
}
