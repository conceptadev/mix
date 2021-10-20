import 'package:flutter/material.dart';
import 'package:mix/src/attributes/dynamic/dark_mode.dart';
import 'package:mix/src/attributes/dynamic/media_query.dart';
import 'package:mix/src/attributes/utilities.dart';

/// Base attribute
abstract class Attribute<T> {
  /// Constructor
  const Attribute();

  /// Builds attribute into widget propety
  T get value;
}

extension AttributeExtensions on Attribute {
  DarkModeAttribute get onDark => dark(this);
  XSmallScreenSizeAttribute get onXSmall => mq.xs(this);
  SmallScreenSizeAttribute get onSmall => mq.sm(this);
  MediumScreenSizeAttribute get onMedium => mq.md(this);
  LargeScreenSizeAttribute get onLarge => mq.lg(this);
  PortraitAttribute get onPortrait => mq.portrait(this);
  LandscapeAttribute get onLandscape => mq.landscape(this);
}

abstract class DynamicAttribute extends Attribute<Attribute> {
  const DynamicAttribute(Attribute attribute) : _attribute = attribute;
  final Attribute _attribute;
  @override
  Attribute get value => _attribute;

  bool shouldApply(BuildContext context);
}

abstract class AttributeDirective<T> {
  const AttributeDirective();
  T modify(T value);
}

abstract class BoxMixAttribute<T> extends Attribute<T> {
  const BoxMixAttribute();
}

abstract class FlexMixAttribute<T> extends BoxMixAttribute<T> {
  const FlexMixAttribute();
}

abstract class TextMixAttribute<T> extends Attribute<T> {
  const TextMixAttribute();
}
