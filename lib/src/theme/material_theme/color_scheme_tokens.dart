import '../refs/color_token.dart';

const $primary = ColorToken('primary');
const $secondary = ColorToken('secondary');
const $tertiary = ColorToken('tertiary');
const $surface = ColorToken('surface');
const $background = ColorToken('background');
const $error = ColorToken('error');
const $onPrimary = ColorToken('onPrimary');
const $onSecondary = ColorToken('onSecondary');
const $onTertiary = ColorToken('onTertiary');
const $onSurface = ColorToken('onSurface');
const $onBackground = ColorToken('onBackground');
const $onError = ColorToken('onError');

const $colorScheme = _ColorSchemeTokens();
const $cs = $colorScheme;

class _ColorSchemeTokens {
  const _ColorSchemeTokens();

  final ColorToken primary = $primary;
  final ColorToken secondary = $secondary;
  final ColorToken tertiary = $tertiary;
  final ColorToken surface = $surface;
  final ColorToken background = $background;
  final ColorToken error = $error;
  final ColorToken onPrimary = $onPrimary;
  final ColorToken onSecondary = $onSecondary;
  final ColorToken onTertiary = $onTertiary;
  final ColorToken onSurface = $onSurface;
  final ColorToken onBackground = $onBackground;
  final ColorToken onError = $onError;
}
