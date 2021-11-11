import 'package:flutter/material.dart';
import 'package:mix/src/attributes/context/dark_mode.dart';
import 'package:mix/src/attributes/context/media_query.dart';
import 'package:mix/src/attributes/text/text.props.dart';
import 'package:mix/src/attributes/utilities.dart';

/// Base attribute

// Some classes have defaults
// Facade allows us ot set all properties as optional
// For improved merge and override of properties
abstract class Attribute {
  const Attribute();
}

abstract class AttributeWithBuilder<T> extends Attribute {
  const AttributeWithBuilder();
  T build();
}

abstract class TextAttributeWithBuilder
    extends AttributeWithBuilder<TextProps> {
  const TextAttributeWithBuilder();
  @override
  TextProps build();
}

extension AttributeExtensions on Attribute {
  DarkModeAttribute get onDark => DarkModeAttribute(this);
  ScreenSizeAttribute get onXSmall => mq.xsmall(this);
  ScreenSizeAttribute get onSmall => mq.small(this);
  ScreenSizeAttribute get onMedium => mq.medium(this);
  ScreenSizeAttribute get onLarge => mq.large(this);
  OrientationAttribute get onPortrait => mq.portrait(this);
  OrientationAttribute get onLandscape => mq.landscape(this);
}

abstract class NestedAttributes<T extends Attribute> extends Attribute {
  const NestedAttributes();

  List<T> get attributes;
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
