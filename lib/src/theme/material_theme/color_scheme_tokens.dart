import '../../helpers/extensions.dart';
import '../tokens/color_token.dart';

class $MDColorScheme {
  const $MDColorScheme._();

  static const primary = ColorToken('primary');

  static const secondary = ColorToken('secondary');

  static const tertiary = ColorToken('tertiary');

  static const surface = ColorToken('surface');

  static const background = ColorToken('background');

  static const error = ColorToken('error');

  static const onPrimary = ColorToken('onPrimary');

  static const onSecondary = ColorToken('onSecondary');

  static const onTertiary = ColorToken('onTertiary');

  static const onSurface = ColorToken('onSurface');

  static const onBackground = ColorToken('onBackground');

  static const onError = ColorToken('onError');

  static MixColorTokens get tokens {
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
