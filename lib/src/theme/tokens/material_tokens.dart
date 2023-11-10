// ignore_for_file: deprecated_member_use, avoid-non-null-assertion

import 'package:flutter/material.dart';

import 'refs.dart';

class _MaterialDesignColors {
  final primary = ColorTokenResolver(
    '--md-color-primary',
    (context) => Theme.of(context).colorScheme.primary,
  );

  final secondary = ColorTokenResolver(
    '--md-color-secondary',
    (context) => Theme.of(context).colorScheme.secondary,
  );

  final tertiary = ColorTokenResolver(
    '--md-color-tertiary',
    (context) => Theme.of(context).colorScheme.tertiary,
  );

  final surface = ColorTokenResolver(
    '--md-color-surface',
    (context) => Theme.of(context).colorScheme.surface,
  );

  final background = ColorTokenResolver(
    '--md-color-background',
    (context) => Theme.of(context).colorScheme.background,
  );

  final error = ColorTokenResolver(
    '--md-color-error',
    (context) => Theme.of(context).colorScheme.error,
  );

  final onPrimary = ColorTokenResolver(
    '--md-color-on-primary',
    (context) => Theme.of(context).colorScheme.onPrimary,
  );

  final onSecondary = ColorTokenResolver(
    '--md-color-on-secondary',
    (context) => Theme.of(context).colorScheme.onSecondary,
  );

  final onTertiary = ColorTokenResolver(
    '--md-color-on-tertiary',
    (context) => Theme.of(context).colorScheme.onTertiary,
  );

  final onSurface = ColorTokenResolver(
    '--md-color-on-surface',
    (context) => Theme.of(context).colorScheme.onSurface,
  );

  final onBackground = ColorTokenResolver(
    '--md-color-on-background',
    (context) => Theme.of(context).colorScheme.onBackground,
  );

  final onError = ColorTokenResolver(
    '--md-color-on-error',
    (context) => Theme.of(context).colorScheme.onError,
  );

  _MaterialDesignColors();
}

// Material 3 TextTheme Tokens.
class MaterialTextStyles {
  //  Material 3 text styles
  final displayLarge = TextStyleTokenResolver(
    '--md3-display-large',
    (context) => Theme.of(context).textTheme.displayLarge!,
  );
  final displayMedium = TextStyleTokenResolver(
    '--md3-display-medium',
    (context) => Theme.of(context).textTheme.displayMedium!,
  );
  final displaySmall = TextStyleTokenResolver(
    '--md3-display-small',
    (context) => Theme.of(context).textTheme.displaySmall!,
  );
  final headlineLarge = TextStyleTokenResolver(
    '--md3-headline-large',
    (context) => Theme.of(context).textTheme.headlineLarge!,
  );
  final headlineMedium = TextStyleTokenResolver(
    '--md3-headline-medium',
    (context) => Theme.of(context).textTheme.headlineMedium!,
  );
  final headlineSmall = TextStyleTokenResolver(
    '--md3-headline-small',
    (context) => Theme.of(context).textTheme.headlineSmall!,
  );
  final titleLarge = TextStyleTokenResolver(
    '--md3-title-large',
    (context) => Theme.of(context).textTheme.titleLarge!,
  );
  final titleMedium = TextStyleTokenResolver(
    '--md3-title-medium',
    (context) => Theme.of(context).textTheme.titleMedium!,
  );
  final titleSmall = TextStyleTokenResolver(
    '--md3-title-small',
    (context) => Theme.of(context).textTheme.titleSmall!,
  );
  final bodyLarge = TextStyleTokenResolver(
    '--md3-body-large',
    (context) => Theme.of(context).textTheme.bodyLarge!,
  );
  final bodyMedium = TextStyleTokenResolver(
    '--md3-body-medium',
    (context) => Theme.of(context).textTheme.bodyMedium!,
  );
  final bodySmall = TextStyleTokenResolver(
    '--md3-body-small',
    (context) => Theme.of(context).textTheme.bodySmall!,
  );
  final labelLarge = TextStyleTokenResolver(
    '--md3-label-large',
    (context) => Theme.of(context).textTheme.labelLarge!,
  );
  final labelMedium = TextStyleTokenResolver(
    '--md3-label-medium',
    (context) => Theme.of(context).textTheme.labelMedium!,
  );
  final labelSmall = TextStyleTokenResolver(
    '--md3-label-small',
    (context) => Theme.of(context).textTheme.labelSmall!,
  );
  // Material 2 text styles
  final headline1 = TextStyleTokenResolver(
    '--md2-text-style-headline1',
    (context) => Theme.of(context).textTheme.headline1!,
  );
  final headline2 = TextStyleTokenResolver(
    '--md2-text-style-headline2',
    (context) => Theme.of(context).textTheme.headline2!,
  );
  final headline3 = TextStyleTokenResolver(
    '--md2-text-style-headline3',
    (context) => Theme.of(context).textTheme.headline3!,
  );
  final headline4 = TextStyleTokenResolver(
    '--md2-text-style-headline4',
    (context) => Theme.of(context).textTheme.headline4!,
  );
  final headline5 = TextStyleTokenResolver(
    '--md2-text-style-headline5',
    (context) => Theme.of(context).textTheme.headline5!,
  );
  final headline6 = TextStyleTokenResolver(
    '--md2-text-style-headline6',
    (context) => Theme.of(context).textTheme.headline6!,
  );
  final subtitle1 = TextStyleTokenResolver(
    '--md2-text-style-subtitle1',
    (context) => Theme.of(context).textTheme.subtitle1!,
  );
  final subtitle2 = TextStyleTokenResolver(
    '--md2-text-style-subtitle2',
    (context) => Theme.of(context).textTheme.subtitle2!,
  );
  final bodyText1 = TextStyleTokenResolver(
    '--md2-text-style-bodyText1',
    (context) => Theme.of(context).textTheme.bodyText1!,
  );
  final bodyText2 = TextStyleTokenResolver(
    '--md2-text-style-bodyText2',
    (context) => Theme.of(context).textTheme.bodyText2!,
  );
  final caption = TextStyleTokenResolver(
    '--md2-text-style-caption',
    (context) => Theme.of(context).textTheme.caption!,
  );
  final button = TextStyleTokenResolver(
    '--md2-text-style-button',
    (context) => Theme.of(context).textTheme.button!,
  );
  final overline = TextStyleTokenResolver(
    '--md2-text-style-overline',
    (context) => Theme.of(context).textTheme.overline!,
  );

  MaterialTextStyles();
}

final $md = _MaterialTokens();

class _MaterialTokens {
  final colors = _MaterialDesignColors();
  final textStyles = MaterialTextStyles();
  _MaterialTokens();
}
