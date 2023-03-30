import 'package:flutter/material.dart';

enum ScreenSizeToken { xsmall, small, medium, large }

class MixBreakpointsTokens {
  final double xsmall;
  final double small;
  final double medium;
  final double large;

  const MixBreakpointsTokens.raw({
    required this.xsmall,
    required this.small,
    required this.medium,
    required this.large,
  });

  const MixBreakpointsTokens({
    this.xsmall = 0,
    this.small = 600,
    this.medium = 1240,
    this.large = 1440,
  });

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

  MixBreakpointsTokens copyWith({
    double? xsmall,
    double? small,
    double? medium,
    double? large,
  }) {
    return MixBreakpointsTokens.raw(
      xsmall: xsmall ?? this.xsmall,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixBreakpointsTokens &&
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
