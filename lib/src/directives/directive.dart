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

abstract class DirectiveAttribute<T> extends StyleAttribute {
  final List<Directive<T>> _directives;
  const DirectiveAttribute(this._directives);

  // An abstract method modify that takes a covariant parameter of type T
  // This method is used to modify the value of type T
  // The implementation of this method will be provided by the subclasses of Directive
  T modify(T value) =>
      _directives.fold(value, (value, directive) => directive(value));

  @override
  get props => [_directives];
}

class TextDirective extends DirectiveAttribute<String> {
  const TextDirective(super.directives);

  @override
  TextDirective merge(covariant TextDirective? other) {
    return other == null
        ? this
        : TextDirective([..._directives, ...other._directives]);
  }
}

class ColorDirective extends Directive<Color> {
  const ColorDirective(super.modifier);

  @override
  ColorDirective merge(covariant ColorDirective? other) {
    return other == null
        ? this
        : ColorDirective([..._modifier, ...other._modifier]);
  }
}
