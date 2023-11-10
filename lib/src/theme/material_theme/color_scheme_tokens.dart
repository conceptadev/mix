import 'package:flutter/material.dart';

import '../../helpers/extensions/build_context_ext.dart';
import '../tokens/mix_token.dart';
import '../tokens/refs.dart';

class $MDColorScheme {
  static const primary = ColorRef('primary');

  static const secondary = ColorRef('secondary');

  static const tertiary = ColorRef('tertiary');

  static const surface = ColorRef('surface');

  static const background = ColorRef('background');

  static const error = ColorRef('error');

  static const onPrimary = ColorRef('onPrimary');

  static const onSecondary = ColorRef('onSecondary');

  static const onTertiary = ColorRef('onTertiary');

  static const onSurface = ColorRef('onSurface');

  static const onBackground = ColorRef('onBackground');

  static const onError = ColorRef('onError');

  const $MDColorScheme._();

  static DesignTokenMap<ColorRef, Color> get tokens {
    return {
      primary: (context) => context.colorScheme.primary,
      secondary: (context) => context.colorScheme.secondary,
      tertiary: (context) => context.colorScheme.tertiary,
      surface: (context) => context.colorScheme.surface,
      background: (context) => context.colorScheme.background,
      error: (context) => context.colorScheme.error,
      onPrimary: (context) => context.colorScheme.onPrimary,
      onSecondary: (context) => context.colorScheme.onSecondary,
      onTertiary: (context) => context.colorScheme.onTertiary,
      onSurface: (context) => context.colorScheme.onSurface,
      onBackground: (context) => context.colorScheme.onBackground,
      onError: (context) => context.colorScheme.onError,
    };
  }
}

// The same color scheme is compabile with Material 2.
// Added typedef just for consistency
typedef $M2Color = $MDColorScheme;
typedef $M3Color = $MDColorScheme;
