import 'package:flutter/material.dart';

import '../../../../mix.dart';

/// Defines the theme of the switch track
class ThumbThemeData extends SwitchXThemeProp {
  /// The shadow of the thumb
  final BoxShadow boxShadow;

  const ThumbThemeData.raw({
    required Size size,
    required Color color,
    required Color disabledColor,
    required this.boxShadow,
  }) : super.raw(
          size: size,
          color: color,
          disabledColor: disabledColor,
        );

  const ThumbThemeData.constTheme()
      : this.raw(
          size: const Size(20, 20),
          color: Colors.white,
          disabledColor: Colors.grey,
          boxShadow: const BoxShadow(
            color: Colors.black,
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        );

  /// The default mix of the switch thumb.
  ///
  /// The default mix is a [Box] widget with a default size of 20x20,
  /// and a background color of [MaterialTokens.colorScheme.onPrimary],
  /// and a grey background color when disabled.
  ThumbThemeData({
    Size? size,
    Color? color,
    Color? disabledColor,
    BoxShadow? boxShadow,
  }) : this.raw(
          size: size ?? const Size(20, 20),
          color: color ?? MaterialTokens.colorScheme.onPrimary,
          disabledColor: disabledColor ?? Colors.grey.shade100,
          boxShadow: boxShadow ??
              const BoxShadow(
                color: Colors.black,
                offset: Offset(0, 0),
                blurRadius: 2,
                spreadRadius: 0,
              ),
        );

  Mix toMix() => Mix(
        height(size.height),
        width(size.width),
        bgColor(color),
        shadowFromBox(boxShadow),
      );
}
