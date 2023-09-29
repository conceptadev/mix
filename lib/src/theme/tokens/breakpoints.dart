import 'package:flutter/material.dart';

enum ScreenSizeToken { xsmall, small, medium, large }

class MixBreakpointsTokens {
  final double xsmall;
  final double small;
  final double medium;
  final double large;

  const MixBreakpointsTokens.raw({
    required this.large,
    required this.medium,
    required this.small,
    required this.xsmall,
  });

  const MixBreakpointsTokens({
    this.large = 1440,
    this.medium = 1240,
    this.small = 600,
    this.xsmall = 0,
  });

  /// Returns [ScreenSizeToken] based on Material breakpoints.
  ScreenSizeToken getScreenSize(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return screenWidth >= large
        ? ScreenSizeToken.large
        : screenWidth >= medium
            ? ScreenSizeToken.medium
            : screenWidth >= small
                ? ScreenSizeToken.small
                : ScreenSizeToken.xsmall;
  }

  MixBreakpointsTokens copyWith({
    double? large,
    double? medium,
    double? small,
    double? xsmall,
  }) {
    return MixBreakpointsTokens.raw(
      large: large ?? this.large,
      medium: medium ?? this.medium,
      small: small ?? this.small,
      xsmall: xsmall ?? this.xsmall,
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
  String toString() {
    return 'MixThemeBreakpoints(xsmall: $xsmall, small: $small, medium: $medium, large: $large)';
  }

  @override
  int get hashCode {
    return xsmall.hashCode ^ small.hashCode ^ medium.hashCode ^ large.hashCode;
  }
}
