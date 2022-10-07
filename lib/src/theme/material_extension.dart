import 'package:flutter/material.dart';

typedef S = Object;

/// Gets a property based off a theme extension
MixProperty<S> theme<T extends ThemeExtension<dynamic>, S>(
  S Function(T ext) callback,
) {
  return MixProperty<S>((context) {
    final T? ext = Theme.of(context).extension<T>();

    assert(
      ext != null,
      '$T is not a theme extension. Please provide a valid type',
    );

    return callback(ext!);
  });
}

class MixProperty<T> {
  final T Function(BuildContext context) resolve;

  const MixProperty(this.resolve);

  static MixProperty<T> value<T>(T value) => MixProperty<T>((_) => value);

  static MixProperty<T> ensureProperty<T>(dynamic param) {
    if (param is MixProperty<T>) return param;

    if (param is T) return MixProperty.value(param);

    throw TypeError();
  }
}

typedef MixableProperty = dynamic;
