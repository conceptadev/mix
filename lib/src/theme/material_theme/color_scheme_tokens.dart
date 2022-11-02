import 'package:flutter/material.dart';

import '../refs/color_token.dart';

class MaterialColorSchemeTokens {
  MaterialColorSchemeTokens();

  final ColorToken primary = ColorToken(
    (context) => Theme.of(context).colorScheme.primary,
  );

  final ColorToken secondary = ColorToken(
    (context) => Theme.of(context).colorScheme.secondary,
  );

  final ColorToken tertiary = ColorToken(
    (context) => Theme.of(context).colorScheme.tertiary,
  );

  final ColorToken surface = ColorToken(
    (context) => Theme.of(context).colorScheme.surface,
  );

  final ColorToken background = ColorToken(
    (context) => Theme.of(context).colorScheme.background,
  );

  final ColorToken error = ColorToken(
    (context) => Theme.of(context).colorScheme.error,
  );

  final ColorToken onPrimary = ColorToken(
    (context) => Theme.of(context).colorScheme.onPrimary,
  );

  final ColorToken onSecondary = ColorToken(
    (context) => Theme.of(context).colorScheme.onSecondary,
  );

  final ColorToken onTertiary = ColorToken(
    (context) => Theme.of(context).colorScheme.onTertiary,
  );

  final ColorToken onSurface = ColorToken(
    (context) => Theme.of(context).colorScheme.onSurface,
  );

  final ColorToken onBackground = ColorToken(
    (context) => Theme.of(context).colorScheme.onBackground,
  );

  final ColorToken onError = ColorToken(
    (context) => Theme.of(context).colorScheme.onError,
  );
}
