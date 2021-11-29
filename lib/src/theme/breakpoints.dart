import 'package:flutter/material.dart';

enum ScreenSizeToken { xsmall, small, medium, large }

class MixThemeBreakpointsData {
  const MixThemeBreakpointsData._({
    required this.xsmall,
    required this.small,
    required this.medium,
    required this.large,
  });

  static get defaults {
    return const MixThemeBreakpointsData._(
      xsmall: 0,
      small: 600,
      medium: 1240,
      large: 1440,
    );
  }

  final double xsmall;
  final double small;
  final double medium;
  final double large;

  MixThemeBreakpointsData merge(MixThemeBreakpointsData? other) {
    return MixThemeBreakpointsData._(
      xsmall: other?.xsmall ?? xsmall,
      small: other?.small ?? small,
      medium: other?.medium ?? medium,
      large: other?.large ?? large,
    );
  }

  /// Returns [ScreenSize] based on Material breakpoints
  ScreenSizeToken getScreenSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= large
        ? ScreenSizeToken.large
        : screenWidth >= medium
            ? ScreenSizeToken.medium
            : screenWidth >= small
                ? ScreenSizeToken.small
                : ScreenSizeToken.xsmall;
  }
}
