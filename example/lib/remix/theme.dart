import 'package:flutter/material.dart';

class RemixThemeData {
  final ThemeData? theme;
  final RemixThemeShadows? shadows;
  final RemixThemeSpacing? spacing;
  final RemixThemeRadius? radius;

  RemixThemeData({
    this.shadows,
    this.spacing,
    this.radius,
    this.theme,
  });

  factory RemixThemeData.fallback(ThemeData theme) {
    return RemixThemeData(
      shadows: RemixThemeShadows.fromScale(),
      spacing: RemixThemeSpacing.fromScale(),
      radius: RemixThemeRadius.fromScale(),
      theme: theme,
    );
  }

  TextTheme? get typography => theme?.textTheme;
  ColorScheme? get colors => theme?.colorScheme;
}

class RemixThemeSpacing {
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;
  final double threeXl;
  final double fourXl;

  RemixThemeSpacing({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
    required this.threeXl,
    required this.fourXl,
  });

  factory RemixThemeSpacing.fromScale([List<double>? scale]) {
    final merged = _mergeScale(scale, _defaultScale);
    return RemixThemeSpacing(
      xs: merged[0],
      sm: merged[1],
      md: merged[2],
      lg: merged[3],
      xl: merged[4],
      xxl: merged[5],
      threeXl: merged[6],
      fourXl: merged[7],
    );
  }

  static const _defaultScale = <double>[0, 4, 6, 8, 12, 24, 32, 64];
}

class MxShadow {
  final Offset? offset;
  final double? blurRadius;
  final double? spreadRadius;

  const MxShadow({
    this.offset,
    this.blurRadius,
    this.spreadRadius,
  });
}

class RemixThemeShadows {
  final MxShadow xs;
  final MxShadow sm;
  final MxShadow md;
  final MxShadow lg;
  final MxShadow xl;
  final MxShadow xxl;

  const RemixThemeShadows({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });

  factory RemixThemeShadows.fromScale([List<MxShadow>? scale]) {
    final merged = _mergeScale(scale, _defaultScale);
    return RemixThemeShadows(
      xs: merged[0],
      sm: merged[1],
      md: merged[2],
      lg: merged[3],
      xl: merged[4],
      xxl: merged[5],
    );
  }

  static const _defaultScale = <MxShadow>[
    MxShadow(blurRadius: 3, offset: Offset(0, 1)),
    MxShadow(blurRadius: 4, offset: Offset(0, 2)),
    MxShadow(blurRadius: 8, offset: Offset(0, 4)),
    MxShadow(blurRadius: 16, offset: Offset(0, 8)),
    MxShadow(blurRadius: 24, offset: Offset(0, 16)),
  ];
}

class RemixThemeRadius {
  final double none;
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;
  final double circle;

  RemixThemeRadius({
    required this.none,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
    required this.circle,
  });

  factory RemixThemeRadius.fromScale([List<double>? scale]) {
    final merged = _mergeScale(scale, _defaultScale);
    return RemixThemeRadius(
      none: merged[0],
      xs: merged[1],
      sm: merged[2],
      md: merged[3],
      lg: merged[4],
      xl: merged[5],
      xxl: merged[6],
      circle: merged[7],
    );
  }

  static const _defaultScale = <double>[0, 2, 4, 6, 8, 12, 16, 1000];
}

List<T> _mergeScale<T>(List<T>? scale, List<T> defaultScale) {
  if (scale == null || scale.isEmpty) {
    return defaultScale;
  }
  final mergedScale = <T>[];
  for (var i = 0; i < defaultScale.length; i++) {
    // Check if index exists
    if (scale.asMap().containsKey(i)) {
      mergedScale[i] = scale[i];
    } else {
      mergedScale[i] = defaultScale[i];
    }
  }

  return mergedScale;
}
