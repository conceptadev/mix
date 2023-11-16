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
  Color get primary => _colors.primary();
  Color get secondary => _colors.secondary();
  Color get tertiary => _colors.tertiary();
  Color get surface => _colors.surface();
  Color get background => _colors.background();
  Color get error => _colors.error();
  Color get onPrimary => _colors.onPrimary();
  Color get onSecondary => _colors.onSecondary();
  Color get onTertiary => _colors.onTertiary();
  Color get onSurface => _colors.onSurface();
  Color get onBackground => _colors.onBackground();
  Color get onError => _colors.onError();
}

mixin MaterialTextStyleTokensMixin {
  TextStyle get displayLarge => _textStyles.displayLarge();
  TextStyle get displayMedium => _textStyles.displayMedium();
  TextStyle get displaySmall => _textStyles.displaySmall();
  TextStyle get headlineLarge => _textStyles.headlineLarge();
  TextStyle get headlineMedium => _textStyles.headlineMedium();
  TextStyle get headlineSmall => _textStyles.headlineSmall();
  TextStyle get titleLarge => _textStyles.titleLarge();
  TextStyle get titleMedium => _textStyles.titleMedium();
  TextStyle get titleSmall => _textStyles.titleSmall();
  TextStyle get bodyLarge => _textStyles.bodyLarge();
  TextStyle get bodyMedium => _textStyles.bodyMedium();
  TextStyle get bodySmall => _textStyles.bodySmall();
  TextStyle get labelLarge => _textStyles.labelLarge();
  TextStyle get labelMedium => _textStyles.labelMedium();
  TextStyle get labelSmall => _textStyles.labelSmall();
  TextStyle get headline1 => _textStyles.headline1();
  TextStyle get headline2 => _textStyles.headline2();
  TextStyle get headline3 => _textStyles.headline3();
  TextStyle get headline4 => _textStyles.headline4();
  TextStyle get headline5 => _textStyles.headline5();
  TextStyle get headline6 => _textStyles.headline6();
  TextStyle get subtitle1 => _textStyles.subtitle1();
  TextStyle get subtitle2 => _textStyles.subtitle2();
  TextStyle get bodyText1 => _textStyles.bodyText1();
  TextStyle get bodyText2 => _textStyles.bodyText2();
  TextStyle get caption => _textStyles.caption();
  TextStyle get button => _textStyles.button();
  TextStyle get overline => _textStyles.overline();
}
