import 'package:flutter/material.dart';

import '../../../../mix.dart';

class SwitchXThemeData {
  final ThumbThemeData thumb;
  final TrackThemeData track;

  const SwitchXThemeData.raw({
    required this.track,
    required this.thumb,
  });

  /// The default mix of the switch track.
  ///
  /// The default mix is a [Box] widget with a default size of 40x20,
  /// and a background color of [MaterialTokens.colorScheme.primary],
  /// and a grey background color when disabled.
  ///
  /// The default mix of the switch thumb.
  ///
  /// The default mix is a [Box] widget with a default size of 20x20,
  /// and a background color of [MaterialTokens.colorScheme.onPrimary],
  /// and a grey background color when disabled.
  ///
  SwitchXThemeData({
    ThumbThemeData? thumb,
    TrackThemeData? track,
  }) : this.raw(
          thumb: thumb ?? ThumbThemeData(),
          track: track ?? TrackThemeData(),
        );
}

class SwitchXThemeProp {
  /// The size of the track
  final Size size;

  /// The color of the track
  final Color color;

  /// The color of the track when disabled
  final Color disabledColor;

  const SwitchXThemeProp({
    required this.size,
    required this.color,
    required this.disabledColor,
  });

  const SwitchXThemeProp.raw({
    required this.size,
    required this.color,
    required this.disabledColor,
  });

  const SwitchXThemeProp.constTheme({
    Size? size,
    Color? color,
    Color? disabledColor,
  }) : this.raw(
          size: size ?? const Size(40, 20),
          color: color ?? Colors.black,
          disabledColor: disabledColor ?? Colors.grey,
        );
}
