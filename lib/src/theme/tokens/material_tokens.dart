// ignore_for_file: deprecated_member_use, avoid-non-null-assertion

import 'package:flutter/material.dart';

import 'color_token.dart';
import 'text_style_token.dart';

@immutable
class _MaterialColorTokens {
  final primary = ColorToken.resolvable(
    'md.color.primary',
    (context) => context.color.primary,
  );

  final secondary = ColorToken.resolvable(
    'md.color.secondary',
    (context) => context.color.secondary,
  );

  final tertiary = ColorToken.resolvable(
    'md.color.tertiary',
    (context) => context.color.tertiary,
  );

  final surface = ColorToken.resolvable(
    'md.color.surface',
    (context) => context.color.surface,
  );

  final background = ColorToken.resolvable(
    'md.color.background',
    (context) => context.color.background,
  );

  final error = ColorToken.resolvable(
    'md.color.error',
    (context) => context.color.error,
  );

  final onPrimary = ColorToken.resolvable(
    'md.color.on.primary',
    (context) => context.color.onPrimary,
  );

  final onSecondary = ColorToken.resolvable(
    'md.color.on.secondary',
    (context) => context.color.onSecondary,
  );

  final onTertiary = ColorToken.resolvable(
    'md.color.on.tertiary',
    (context) => context.color.onTertiary,
  );

  final onSurface = ColorToken.resolvable(
    'md.color.on.surface',
    (context) => context.color.onSurface,
  );

  final onBackground = ColorToken.resolvable(
    'md.color.on.background',
    (context) => context.color.onBackground,
  );

  final onError = ColorToken.resolvable(
    'md.color.on.error',
    (context) => context.color.onError,
  );

  _MaterialColorTokens();
}

@immutable
// Material 3 TextTheme Tokens.
class _MaterialTextStyles {
  //  Material 3 text styles
  final displayLarge = TextStyleToken.resolvable(
    'md3.text.theme.display.large',
    (context) => context.text.displayLarge!,
  );
  final displayMedium = TextStyleToken.resolvable(
    'md3.text.theme.display.medium',
    (context) => context.text.displayMedium!,
  );
  final displaySmall = TextStyleToken.resolvable(
    'md3.text.theme.display.small',
    (context) => context.text.displaySmall!,
  );
  final headlineLarge = TextStyleToken.resolvable(
    'md3.text.theme.headline.large',
    (context) => context.text.headlineLarge!,
  );
  final headlineMedium = TextStyleToken.resolvable(
    'md3.text.theme.headline.medium',
    (context) => context.text.headlineMedium!,
  );
  final headlineSmall = TextStyleToken.resolvable(
    'md3.text.theme.headline.small',
    (context) => context.text.headlineSmall!,
  );
  final titleLarge = TextStyleToken.resolvable(
    'md3.text.theme.title.large',
    (context) => context.text.titleLarge!,
  );
  final titleMedium = TextStyleToken.resolvable(
    'md3.text.theme.title.medium',
    (context) => context.text.titleMedium!,
  );
  final titleSmall = TextStyleToken.resolvable(
    'md3.text.theme.title.small',
    (context) => context.text.titleSmall!,
  );
  final bodyLarge = TextStyleToken.resolvable(
    'md3.text.theme.body.large',
    (context) => context.text.bodyLarge!,
  );
  final bodyMedium = TextStyleToken.resolvable(
    'md3.text.theme.body.medium',
    (context) => context.text.bodyMedium!,
  );
  final bodySmall = TextStyleToken.resolvable(
    'md3.text.theme.body.small',
    (context) => context.text.bodySmall!,
  );
  final labelLarge = TextStyleToken.resolvable(
    'md3.text.theme.label.large',
    (context) => context.text.labelLarge!,
  );
  final labelMedium = TextStyleToken.resolvable(
    'md3.text.theme.label.medium',
    (context) => context.text.labelMedium!,
  );
  final labelSmall = TextStyleToken.resolvable(
    'md3.text.theme.label.small',
    (context) => context.text.labelSmall!,
  );
  // Material 2 text styles
  final headline1 = TextStyleToken.resolvable(
    'md2.text.theme.headline1',
    (context) => context.text.headline1!,
  );
  final headline2 = TextStyleToken.resolvable(
    'md2.text.theme.headline2',
    (context) => context.text.headline2!,
  );
  final headline3 = TextStyleToken.resolvable(
    'md2.text.theme.headline3',
    (context) => context.text.headline3!,
  );
  final headline4 = TextStyleToken.resolvable(
    'md2.text.theme.headline4',
    (context) => context.text.headline4!,
  );
  final headline5 = TextStyleToken.resolvable(
    'md2.text.theme.headline5',
    (context) => context.text.headline5!,
  );
  final headline6 = TextStyleToken.resolvable(
    'md2.text.theme.headline6',
    (context) => context.text.headline6!,
  );
  final subtitle1 = TextStyleToken.resolvable(
    'md2.text.theme.subtitle1',
    (context) => context.text.subtitle1!,
  );
  final subtitle2 = TextStyleToken.resolvable(
    'md2.text.theme.subtitle2',
    (context) => context.text.subtitle2!,
  );
  final bodyText1 = TextStyleToken.resolvable(
    'md2.text.theme.bodyText1',
    (context) => context.text.bodyText1!,
  );
  final bodyText2 = TextStyleToken.resolvable(
    'md2.text.theme.bodyText2',
    (context) => context.text.bodyText2!,
  );
  final caption = TextStyleToken.resolvable(
    'md2.text.theme.caption',
    (context) => context.text.caption!,
  );
  final button = TextStyleToken.resolvable(
    'md2.text.theme.button',
    (context) => context.text.button!,
  );
  final overline = TextStyleToken.resolvable(
    'md2.text.theme.overline',
    (context) => context.text.overline!,
  );

  _MaterialTextStyles();
}

final _colors = _MaterialColorTokens();
final _textStyles = _MaterialTextStyles();

@immutable
class MaterialTokens {
  final colors = _colors;
  final textStyles = _textStyles;
  MaterialTokens();
}

extension on BuildContext {
  TextTheme get text => Theme.of(this).textTheme;
  ColorScheme get color => Theme.of(this).colorScheme;
}

mixin MaterialColorTokensMixin {
  ColorToken get primary => _colors.primary;
  ColorToken get secondary => _colors.secondary;
  ColorToken get tertiary => _colors.tertiary;
  ColorToken get surface => _colors.surface;
  ColorToken get background => _colors.background;
  ColorToken get error => _colors.error;
  ColorToken get onPrimary => _colors.onPrimary;
  ColorToken get onSecondary => _colors.onSecondary;
  ColorToken get onTertiary => _colors.onTertiary;
  ColorToken get onSurface => _colors.onSurface;
  ColorToken get onBackground => _colors.onBackground;
  ColorToken get onError => _colors.onError;
}

mixin MaterialTextStyleTokensMixin {
  TextStyleToken get displayLarge => _textStyles.displayLarge;
  TextStyleToken get displayMedium => _textStyles.displayMedium;
  TextStyleToken get displaySmall => _textStyles.displaySmall;
  TextStyleToken get headlineLarge => _textStyles.headlineLarge;
  TextStyleToken get headlineMedium => _textStyles.headlineMedium;
  TextStyleToken get headlineSmall => _textStyles.headlineSmall;
  TextStyleToken get titleLarge => _textStyles.titleLarge;
  TextStyleToken get titleMedium => _textStyles.titleMedium;
  TextStyleToken get titleSmall => _textStyles.titleSmall;
  TextStyleToken get bodyLarge => _textStyles.bodyLarge;
  TextStyleToken get bodyMedium => _textStyles.bodyMedium;
  TextStyleToken get bodySmall => _textStyles.bodySmall;
  TextStyleToken get labelLarge => _textStyles.labelLarge;
  TextStyleToken get labelMedium => _textStyles.labelMedium;
  TextStyleToken get labelSmall => _textStyles.labelSmall;
  TextStyleToken get headline1 => _textStyles.headline1;
  TextStyleToken get headline2 => _textStyles.headline2;
  TextStyleToken get headline3 => _textStyles.headline3;
  TextStyleToken get headline4 => _textStyles.headline4;
  TextStyleToken get headline5 => _textStyles.headline5;
  TextStyleToken get headline6 => _textStyles.headline6;
  TextStyleToken get subtitle1 => _textStyles.subtitle1;
  TextStyleToken get subtitle2 => _textStyles.subtitle2;
  TextStyleToken get bodyText1 => _textStyles.bodyText1;
  TextStyleToken get bodyText2 => _textStyles.bodyText2;
  TextStyleToken get caption => _textStyles.caption;
  TextStyleToken get button => _textStyles.button;
  TextStyleToken get overline => _textStyles.overline;
}
