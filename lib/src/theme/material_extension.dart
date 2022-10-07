import 'package:flutter/material.dart';

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

/// A mix property lets you fetch your params based on the current context.
///
/// ```dart
/// Mix(
///   bgColor(MixProperty((context) {
///     return Theme.of(context).canvasColor;
///   })),
/// ),
/// ```
///
/// See also:
///
///  * [MixableProperty]
///  * [theme], a helper function that provides a custom theme extension from
///    the closest [Theme] widget.
class MixProperty<T> {
  final T Function(BuildContext context) resolve;

  /// Creates a mix property.
  const MixProperty(this.resolve);

  /// Creates a mix property with a defined value
  factory MixProperty.value(T value) => MixProperty<T>((_) => value);

  /// Ensure a [MixableProperty] is either [MixProperty] or [T]
  // @internal
  static MixProperty<T> ensureProperty<T>(MixableProperty property) {
    if (property is MixProperty<T>) return property;

    if (property is T) return MixProperty.value(property);

    throw TypeError();
  }
}

/// A property that can be dynamically defined
typedef MixableProperty = dynamic;
