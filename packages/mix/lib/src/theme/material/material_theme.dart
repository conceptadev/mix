import 'package:flutter/material.dart';

import '../mix/mix_theme.dart';
import '../tokens/color_token.dart';
import '../tokens/text_style_token.dart';
import 'material_tokens.dart';

const _md = MaterialTokens();

extension on BuildContext {
  TextTheme get text => Theme.of(this).textTheme;
  ColorScheme get color => Theme.of(this).colorScheme;
}

final materialMixTheme = MixThemeData(
  colors: {
    _md.colorScheme.primary: ColorResolver((c) => c.color.primary),
    _md.colorScheme.secondary: ColorResolver((c) => c.color.secondary),
    _md.colorScheme.tertiary: ColorResolver((c) => c.color.tertiary),
    _md.colorScheme.surface: ColorResolver((c) => c.color.surface),
    _md.colorScheme.background: ColorResolver((c) => c.color.background),
    _md.colorScheme.error: ColorResolver((c) => c.color.error),
    _md.colorScheme.onPrimary: ColorResolver((c) => c.color.onPrimary),
    _md.colorScheme.onSecondary: ColorResolver((c) => c.color.onSecondary),
    _md.colorScheme.onTertiary: ColorResolver((c) => c.color.onTertiary),
    _md.colorScheme.onSurface: ColorResolver((c) => c.color.onSurface),
    _md.colorScheme.onBackground:
        ColorResolver((context) => context.color.onBackground),
    _md.colorScheme.onError: ColorResolver((context) => context.color.onError),
  },
  textStyles: {
    _md.textTheme.displayLarge: TextStyleResolver((c) => c.text.displayLarge!),
    _md.textTheme.displayMedium:
        TextStyleResolver((c) => c.text.displayMedium!),
    _md.textTheme.displaySmall: TextStyleResolver((c) => c.text.displaySmall!),
    _md.textTheme.headlineLarge:
        TextStyleResolver((c) => c.text.headlineLarge!),
    _md.textTheme.headlineMedium:
        TextStyleResolver((c) => c.text.headlineMedium!),
    _md.textTheme.headlineSmall:
        TextStyleResolver((c) => c.text.headlineSmall!),
    _md.textTheme.titleLarge: TextStyleResolver((c) => c.text.titleLarge!),
    _md.textTheme.titleMedium: TextStyleResolver((c) => c.text.titleMedium!),
    _md.textTheme.titleSmall: TextStyleResolver((c) => c.text.titleSmall!),
    _md.textTheme.bodyLarge: TextStyleResolver((c) => c.text.bodyLarge!),
    _md.textTheme.bodyMedium: TextStyleResolver((c) => c.text.bodyMedium!),
    _md.textTheme.bodySmall: TextStyleResolver((c) => c.text.bodySmall!),
    _md.textTheme.labelLarge: TextStyleResolver((c) => c.text.labelLarge!),
    _md.textTheme.labelMedium: TextStyleResolver((c) => c.text.labelMedium!),
    _md.textTheme.labelSmall: TextStyleResolver((c) => c.text.labelSmall!),
    _md.textTheme.headline1: TextStyleResolver((c) => c.text.displayLarge!),
    _md.textTheme.headline2: TextStyleResolver((c) => c.text.displayMedium!),
    _md.textTheme.headline3: TextStyleResolver((c) => c.text.displaySmall!),
    _md.textTheme.headline4: TextStyleResolver((c) => c.text.headlineMedium!),
    _md.textTheme.headline5: TextStyleResolver((c) => c.text.headlineSmall!),
    _md.textTheme.headline6: TextStyleResolver((c) => c.text.titleLarge!),
    _md.textTheme.subtitle1: TextStyleResolver((c) => c.text.titleMedium!),
    _md.textTheme.subtitle2: TextStyleResolver((c) => c.text.titleSmall!),
    _md.textTheme.bodyText1: TextStyleResolver((c) => c.text.bodyLarge!),
    _md.textTheme.bodyText2: TextStyleResolver((c) => c.text.bodyMedium!),
    _md.textTheme.caption: TextStyleResolver((c) => c.text.bodySmall!),
    _md.textTheme.button: TextStyleResolver((c) => c.text.labelLarge!),
    _md.textTheme.overline: TextStyleResolver((c) => c.text.labelSmall!),
  },
);
