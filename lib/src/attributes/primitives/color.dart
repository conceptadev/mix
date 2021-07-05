import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../base_attribute.dart';

part 'color.freezed.dart';

class ColorUtility<T extends ColorAttribute> {
  const ColorUtility();
  T call(Color color) => ColorAttribute.create<T>(color);
}

/// Color attribute
@freezed
class ColorAttribute extends Attribute<Color> with _$ColorAttribute {
  const ColorAttribute._();

  /// Constructor
  factory ColorAttribute(Color color) = _ColorAttribute;

  /// Background color
  factory ColorAttribute.backgroundColor(Color color) =
      BackgroundColorAttribute;

  /// Text color
  @Implements.fromString('TextTypeAttribute<Color>')
  factory ColorAttribute.textColor(Color color) = TextColorAttribute;

  /// Border color
  factory ColorAttribute.borderColor(Color color) = BorderColorAttribute;

  /// Icon color
  factory ColorAttribute.iconColor(Color color) = IconColorAttribute;
  @override
  Color get value {
    return color;
  }

  /// Create instance a class of ColorAttribute
  static T create<T extends ColorAttribute>(Color color) {
    assert(T != ColorAttribute);
    switch (T) {
      case BackgroundColorAttribute:
        return BackgroundColorAttribute(color) as T;
      case TextColorAttribute:
        return TextColorAttribute(color) as T;
      case BorderColorAttribute:
        return BorderColorAttribute(color) as T;
      case IconColorAttribute:
        return IconColorAttribute(color) as T;

      default:
        throw Exception('Cannot create ColorAttribute of $T');
    }
  }
}
