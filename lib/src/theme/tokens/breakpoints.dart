import 'package:flutter/material.dart';

enum ScreenSizeToken { xsmall, small, medium, large }

class MixThemeBreakpoints {
  final double xsmall;
  final double small;
  final double medium;
  final double large;

  const MixThemeBreakpoints.raw({
    required this.xsmall,
    required this.small,
    required this.medium,
    required this.large,
  });

  const MixThemeBreakpoints({
    double? xsmall,
    double? small,
    double? medium,
    double? large,
  }) : this.raw(
          xsmall: xsmall ?? 0,
          small: small ?? 600,
          medium: medium ?? 960,
          large: large ?? 1280,
        );

  /// Returns [ScreenSizeToken] based on Material breakpoints
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

  MixThemeBreakpoints copyWith({
    double? xsmall,
    double? small,
    double? medium,
    double? large,
  }) {
    return MixThemeBreakpoints.raw(
      xsmall: xsmall ?? this.xsmall,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixThemeBreakpoints &&
        other.xsmall == xsmall &&
        other.small == small &&
        other.medium == medium &&
        other.large == large;
  }

  @override
  int get hashCode {
    return xsmall.hashCode ^ small.hashCode ^ medium.hashCode ^ large.hashCode;
  }

  @override
  String toString() {
    return 'MixThemeBreakpoints(xsmall: $xsmall, small: $small, medium: $medium, large: $large)';
  }
}
