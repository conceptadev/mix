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
    if (property == null) return MixProperty.value(property);

    if (property is MixProperty<T>) return property;

    if (property is T) return MixProperty.value(property);

    // This is an edge case.
    //
    // In dart, we can do `double height = 100;` but if we do `var height = 100;`,
    // it'll be automatically inferred that `height` is an int. The same happens
    // if we declare values to parameters (for example, `BoxAttributes(height: 100)`).
    //
    // To overcome this issue, we check if the property is a number ([num]), and
    // also ensure [T] is a number. If both are true, we ensure the numbers are
    // converted correctly to the type [T].
    //
    // To do this, we use a dart hack to check if T == num using type strings
    // (Type.toString(), which results in the class name).
    if (property is num) {
      final numericTypes = [
        '$double',
        '$int',
      ];

      if (!numericTypes.contains('$T')) throw TypeError();

      if ('$T' == '$double') property = property.toDouble();
      if ('$T' == '$int') property = property.toInt();

      return MixProperty.value(property as T);
    }

    throw TypeError();
  }
}

/// A property that can be dynamically defined
typedef MixableProperty = dynamic;
