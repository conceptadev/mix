import 'package:flutter/material.dart';

import 'attribute.dart';

typedef Modifier<T> = T Function(T value);

/// The `Directive` abstract class provides the ability to modify or apply
/// different behaviors to widgets and attributes.
abstract class Directive extends StyleAttribute {
  const Directive();
}

@immutable
abstract class ColorDirective {
  const ColorDirective();

  get props => [];

  Color modify(Color color);
}

class TextDataDirective extends Directive with Mergeable<TextDataDirective> {
  final List<Modifier<String>> _modifiers;
  const TextDataDirective(this._modifiers);

  @visibleForTesting
  int get length => _modifiers.length;

  String apply(String value) {
    return _modifiers.fold(
      value,
      (previousValue, modifier) => modifier(previousValue),
    );
  }

  @override
  TextDataDirective merge(TextDataDirective other) {
    return TextDataDirective([..._modifiers, ...other._modifiers]);
  }

  @override
  Object get type => TextDataDirective;

  @override
  get props => [_modifiers];
}
