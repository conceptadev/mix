import 'package:mix/src/helpers/extensions.dart';

import '../refs/color_token.dart';

class MaterialColorSchemeTokens {
  MaterialColorSchemeTokens();

  final ColorToken primary = ColorToken('primary', (context) {
    return context.theme.colorScheme.primary;
  });

  final ColorToken secondary = ColorToken('secondary', (context) {
    return context.theme.colorScheme.secondary;
  });

  final ColorToken tertiary = ColorToken('tertiary', (context) {
    return context.theme.colorScheme.tertiary;
  });

  final ColorToken surface = ColorToken('surface', (context) {
    return context.theme.colorScheme.surface;
  });

  final ColorToken background = ColorToken('background', (context) {
    return context.theme.colorScheme.background;
  });

  final ColorToken error = ColorToken('error', (context) {
    return context.theme.colorScheme.error;
  });

  final ColorToken onPrimary = ColorToken('onPrimary', (context) {
    return context.theme.colorScheme.onPrimary;
  });

  final ColorToken onSecondary = ColorToken('onSecondary', (context) {
    return context.theme.colorScheme.onSecondary;
  });

  final ColorToken onTertiary = ColorToken('onTertiary', (context) {
    return context.theme.colorScheme.onTertiary;
  });

  final ColorToken onSurface = ColorToken('onSurface', (context) {
    return context.theme.colorScheme.onSurface;
  });

  final ColorToken onBackground = ColorToken('onBackground', (context) {
    return context.theme.colorScheme.onBackground;
  });

  final ColorToken onError = ColorToken('onError', (context) {
    return context.theme.colorScheme.onError;
  });
}
