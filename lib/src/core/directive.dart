import 'package:flutter/material.dart';

import '../helpers/compare_mixin.dart';
import 'attribute.dart';

typedef Modifier<T> = T Function(T value);

/// The `Directive` abstract class provides the ability to modify or apply
/// different behaviors to widgets and attributes.
abstract class Directive with Comparable {
  const Directive();
}

@immutable
class TextDirective extends Directive with Mergeable<TextDirective> {
  final List<Modifier<String>> _modifiers;
  const TextDirective(this._modifiers);

  @visibleForTesting
  int get length => _modifiers.length;

  String apply(String value) {
    return _modifiers.fold(
      value,
      (previousValue, modifier) => modifier(previousValue),
    );
  }

  @override
  TextDirective merge(TextDirective? other) {
    return TextDirective([..._modifiers, ...?other?._modifiers]);
  }

  @override
  get props => [_modifiers];
}
