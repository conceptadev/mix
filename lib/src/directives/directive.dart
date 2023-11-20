import 'package:flutter/material.dart';

import '../attributes/attribute.dart';

typedef Modifier<T> = T Function(T value);

/// The `Directive` abstract class provides a mechanism to modify a value of type `T`.
/// It is typically used in the context of an `Attribute`.
abstract class Directive<T> extends Attribute {
  final List<Modifier<T>> directives;
  const Directive(this.directives);

  // An abstract method modify that takes a covariant parameter of type T
  // This method is used to modify the value of type T
  // The implementation of this method will be provided by the subclasses of Directive
  T modify(T value) =>
      directives.fold(value, (value, directive) => directive(value));

  @override
  get props => [directives];
}

class TextDirective extends Directive<String> {
  const TextDirective(super.modifier);
}

class ColorDirective extends Directive<Color> {
  const ColorDirective(super.modifier);
}
