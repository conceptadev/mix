import 'package:flutter/material.dart';

import '../../../../mix.dart';
import 'switch.theme.dart';

/// Defines the theme of the switch track
class TrackThemeData extends SwitchXThemeProp {
  const TrackThemeData.constTheme()
      : super.raw(
          size: const Size(40, 20),
          color: Colors.black,
          disabledColor: Colors.grey,
        );

  /// The default mix of the switch track.
  ///
  /// The default mix is a [Box] widget with a default size of 40x20,
  /// and a background color of [MaterialTokens.colorScheme.primary],
  /// and a grey background color when disabled.
  TrackThemeData({
    Size? size,
    Color? color,
    Color? disabledColor,
  }) : super.raw(
          size: size ?? const Size(40, 20),
          color: color ?? MaterialTokens.colorScheme.primary,
          disabledColor: disabledColor ?? Colors.grey.shade600,
        );

  Mix toMix() => Mix(
        height(size.height),
        width(size.width),
        bgColor(color),
      );
}
