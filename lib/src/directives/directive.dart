import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../core/equality/compare_mixin.dart';

typedef Modifier<T> = T Function(T value);

/// The `Directive` abstract class provides a mechanism to modify a value of type `T`.
/// It is typically used in the context of an `Attribute`.
abstract class Directive<T> with Comparable {
  final Modifier<T> _modifier;
  const Directive(this._modifier);

  // An abstract method modify that takes a covariant parameter of type T
  // This method is used to modify the value of type T
  // The implementation of this method will be provided by the subclasses of Directive
  T call(T value) => _modifier(value);

  @override
  get props => [_modifier];
}

abstract class DirectiveAttribute<T extends Directive> extends StyleAttribute {
  final List<T> _directives;
  const DirectiveAttribute(this._directives);

  List<T> get value => _directives;

  @override
  get props => [_directives];
}

class TextDirective extends Directive<String> {
  const TextDirective(super.modifier);
}

class ColorDirective extends Directive<Color> {
  const ColorDirective(super.modifier);
}

class TextDirectiveAttribute extends DirectiveAttribute<TextDirective> {
  const TextDirectiveAttribute.raw(super.directives);

  factory TextDirectiveAttribute(TextDirective directive) {
    return TextDirectiveAttribute.raw([directive]);
  }

  String modify(String text) =>
      value.fold(text, (value, directive) => directive(value));

  @override
  TextDirectiveAttribute merge(covariant TextDirectiveAttribute? other) {
    return other == null
        ? this
        : TextDirectiveAttribute.raw([..._directives, ...other._directives]);
  }
}
