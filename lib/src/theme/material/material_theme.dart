// ignore_for_file: deprecated_member_use, avoid-non-null-assertion
import 'package:flutter/material.dart';

import '../mix_theme.dart';
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
    _md.colors.primary: ColorResolver((c) => c.color.primary),
    _md.colors.secondary: ColorResolver((c) => c.color.secondary),
    _md.colors.tertiary: ColorResolver((c) => c.color.tertiary),
    _md.colors.surface: ColorResolver((c) => c.color.surface),
    _md.colors.background: ColorResolver((c) => c.color.background),
    _md.colors.error: ColorResolver((c) => c.color.error),
    _md.colors.onPrimary: ColorResolver((c) => c.color.onPrimary),
    _md.colors.onSecondary: ColorResolver((c) => c.color.onSecondary),
    _md.colors.onTertiary: ColorResolver((c) => c.color.onTertiary),
    _md.colors.onSurface: ColorResolver((c) => c.color.onSurface),
    _md.colors.onBackground:
        ColorResolver((context) => context.color.onBackground),
    _md.colors.onError: ColorResolver((context) => context.color.onError),
  },
  textStyles: {
    _md.text.displayLarge: TextStyleResolver((c) => c.text.displayLarge!),
    _md.text.displayMedium: TextStyleResolver((c) => c.text.displayMedium!),
    _md.text.displaySmall: TextStyleResolver((c) => c.text.displaySmall!),
    _md.text.headlineLarge: TextStyleResolver((c) => c.text.headlineLarge!),
    _md.text.headlineMedium: TextStyleResolver((c) => c.text.headlineMedium!),
    _md.text.headlineSmall: TextStyleResolver((c) => c.text.headlineSmall!),
    _md.text.titleLarge: TextStyleResolver((c) => c.text.titleLarge!),
    _md.text.titleMedium: TextStyleResolver((c) => c.text.titleMedium!),
    _md.text.titleSmall: TextStyleResolver((c) => c.text.titleSmall!),
    _md.text.bodyLarge: TextStyleResolver((c) => c.text.bodyLarge!),
    _md.text.bodyMedium: TextStyleResolver((c) => c.text.bodyMedium!),
    _md.text.bodySmall: TextStyleResolver((c) => c.text.bodySmall!),
    _md.text.labelLarge: TextStyleResolver((c) => c.text.labelLarge!),
    _md.text.labelMedium: TextStyleResolver((c) => c.text.labelMedium!),
    _md.text.labelSmall: TextStyleResolver((c) => c.text.labelSmall!),
    _md.text.headline1: TextStyleResolver((c) => c.text.displayLarge!),
    _md.text.headline2: TextStyleResolver((c) => c.text.displayMedium!),
    _md.text.headline3: TextStyleResolver((c) => c.text.displaySmall!),
    _md.text.headline4: TextStyleResolver((c) => c.text.headlineMedium!),
    _md.text.headline5: TextStyleResolver((c) => c.text.headlineSmall!),
    _md.text.headline6: TextStyleResolver((c) => c.text.titleLarge!),
    _md.text.subtitle1: TextStyleResolver((c) => c.text.titleMedium!),
    _md.text.subtitle2: TextStyleResolver((c) => c.text.titleSmall!),
    _md.text.bodyText1: TextStyleResolver((c) => c.text.bodyLarge!),
    _md.text.bodyText2: TextStyleResolver((c) => c.text.bodyMedium!),
    _md.text.caption: TextStyleResolver((c) => c.text.bodySmall!),
    _md.text.button: TextStyleResolver((c) => c.text.labelLarge!),
    _md.text.overline: TextStyleResolver((c) => c.text.labelSmall!),
  },
);
