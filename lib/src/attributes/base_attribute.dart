import 'package:flutter/material.dart';

/// Base attribute
abstract class Attribute<T> {
  /// Constructor
  const Attribute();

  /// Builds attribute into widget propety
  T get value;
}

abstract class DynamicAttribute<T> extends Attribute<Attribute> {
  const DynamicAttribute(Attribute attribute) : _attribute = attribute;
  final Attribute _attribute;

  Attribute get value => _attribute;

  bool shouldApply(BuildContext context);
}

abstract class BoxTypeAttribute<T> extends Attribute<T> {
  const BoxTypeAttribute();
}

abstract class FlexTypeAttribute<T> extends BoxTypeAttribute<T> {
  const FlexTypeAttribute();
}

abstract class TextTypeAttribute<T> extends Attribute<T> {
  const TextTypeAttribute();
}
