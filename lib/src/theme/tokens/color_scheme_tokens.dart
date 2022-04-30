import '../refs/color_ref.dart';

const $primary = ColorRef('primary');
const $secondary = ColorRef('secondary');
const $tertiary = ColorRef('tertiary');
const $surface = ColorRef('surface');
const $background = ColorRef('background');
const $error = ColorRef('error');
const $onPrimary = ColorRef('onPrimary');
const $onSecondary = ColorRef('onSecondary');
const $onTertiary = ColorRef('onTertiary');
const $onSurface = ColorRef('onSurface');
const $onBackground = ColorRef('onBackground');
const $onError = ColorRef('onError');

const $colorScheme = ColorSchemeTokens();
const $cs = $colorScheme;

class ColorSchemeTokens {
  const ColorSchemeTokens();

  final ColorRef primary = $primary;
  final ColorRef secondary = $secondary;
  final ColorRef tertiary = $tertiary;
  final ColorRef surface = $surface;
  final ColorRef background = $background;
  final ColorRef error = $error;
  final ColorRef onPrimary = $onPrimary;
  final ColorRef onSecondary = $onSecondary;
  final ColorRef onTertiary = $onTertiary;
  final ColorRef onSurface = $onSurface;
  final ColorRef onBackground = $onBackground;
  final ColorRef onError = $onError;
}
