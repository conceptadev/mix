import 'package:flutter/material.dart';

import '../../helpers/dto/color.dto.dart';
import '../../helpers/dto/double.dto.dart';
import 'icon.attributes.dart';

/// ## Widget
/// - [IconMix](IconMix-class.html)
///
/// Utility functions and short utils are listed in [Static Methods](#static-methods)
///
/// {@category Utilities}
class IconUtility {
  const IconUtility._();

  /// Short Utils: icon
  static IconAttributes icon({double? size, Color? color}) {
    return IconAttributes(
      size: size != null ? DoubleDto(size) : null,
      color: color != null ? ColorDto(color) : null,
    );
  }

  /// Short Utils: iconSize
  static IconAttributes iconSize(double size) {
    return IconAttributes(
      size: DoubleDto(size),
    );
  }

  /// Short Utils: iconColor
  static IconAttributes iconColor(Color color) {
    return IconAttributes(
      color: ColorDto(color),
    );
  }
}
