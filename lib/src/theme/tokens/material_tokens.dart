// ignore_for_file: deprecated_member_use, avoid-non-null-assertion

import 'package:flutter/material.dart';

import '../mix_theme.dart';
import 'color_token.dart';
import 'text_style_token.dart';
import 'token_util.dart';

const _cm = _MaterialColorTokens();
const _ts = _MaterialTextStyles();

@immutable
class MaterialTokens {
  final colors = _cm;
  final textStyles = _ts;
  const MaterialTokens();
}

final materialMixTheme = MixThemeData(
  colors: {
    _cm.primary: ColorResolver((c) => c.color.primary),
    _cm.secondary: ColorResolver((c) => c.color.secondary),
    _cm.tertiary: ColorResolver((c) => c.color.tertiary),
    _cm.surface: ColorResolver((c) => c.color.surface),
    _cm.background: ColorResolver((c) => c.color.background),
    _cm.error: ColorResolver((c) => c.color.error),
    _cm.onPrimary: ColorResolver((c) => c.color.onPrimary),
    _cm.onSecondary: ColorResolver((c) => c.color.onSecondary),
    _cm.onTertiary: ColorResolver((c) => c.color.onTertiary),
    _cm.onSurface: ColorResolver((c) => c.color.onSurface),
    _cm.onBackground: ColorResolver((context) => context.color.onBackground),
    _cm.onError: ColorResolver((context) => context.color.onError),
  },
  textStyles: {
    _ts.displayLarge: TextStyleResolver((c) => c.text.displayLarge!),
    _ts.displayMedium: TextStyleResolver((c) => c.text.displayMedium!),
    _ts.displaySmall: TextStyleResolver((c) => c.text.displaySmall!),
    _ts.headlineLarge: TextStyleResolver((c) => c.text.headlineLarge!),
    _ts.headlineMedium: TextStyleResolver((c) => c.text.headlineMedium!),
    _ts.headlineSmall: TextStyleResolver((c) => c.text.headlineSmall!),
    _ts.titleLarge: TextStyleResolver((c) => c.text.titleLarge!),
    _ts.titleMedium: TextStyleResolver((c) => c.text.titleMedium!),
    _ts.titleSmall: TextStyleResolver((c) => c.text.titleSmall!),
    _ts.bodyLarge: TextStyleResolver((c) => c.text.bodyLarge!),
    _ts.bodyMedium: TextStyleResolver((c) => c.text.bodyMedium!),
    _ts.bodySmall: TextStyleResolver((c) => c.text.bodySmall!),
    _ts.labelLarge: TextStyleResolver((c) => c.text.labelLarge!),
    _ts.labelMedium: TextStyleResolver((c) => c.text.labelMedium!),
    _ts.labelSmall: TextStyleResolver((c) => c.text.labelSmall!),
    _ts.headline1: TextStyleResolver((c) => c.text.headline1!),
    _ts.headline2: TextStyleResolver((c) => c.text.headline2!),
    _ts.headline3: TextStyleResolver((c) => c.text.headline3!),
    _ts.headline4: TextStyleResolver((c) => c.text.headline4!),
    _ts.headline5: TextStyleResolver((c) => c.text.headline5!),
    _ts.headline6: TextStyleResolver((c) => c.text.headline6!),
    _ts.subtitle1: TextStyleResolver((c) => c.text.subtitle1!),
    _ts.subtitle2: TextStyleResolver((c) => c.text.subtitle2!),
    _ts.bodyText1: TextStyleResolver((c) => c.text.bodyText1!),
    _ts.bodyText2: TextStyleResolver((c) => c.text.bodyText2!),
    _ts.caption: TextStyleResolver((c) => c.text.caption!),
    _ts.button: TextStyleResolver((c) => c.text.button!),
    _ts.overline: TextStyleResolver((c) => c.text.overline!),
  },
);

@immutable
class _MaterialColorTokens {
  final primary = const ColorToken('md.color.primary');

  final secondary = const ColorToken('md.color.secondary');

  final tertiary = const ColorToken('md.color.tertiary');

  final surface = const ColorToken('md.color.surface');

  final background = const ColorToken('md.color.background');

  final error = const ColorToken('md.color.error');

  final onPrimary = const ColorToken('md.color.on.primary');

  final onSecondary = const ColorToken('md.color.on.secondary');

  final onTertiary = const ColorToken('md.color.on.tertiary');

  final onSurface = const ColorToken('md.color.on.surface');

  final onBackground = const ColorToken('md.color.on.background');

  final onError = const ColorToken('md.color.on.error');

  const _MaterialColorTokens();
}

@immutable
// Material 3 TextTheme Tokens.
class _MaterialTextStyles {
  //  Material 3 text styles
  final displayLarge = const TextStyleToken('md3.text.theme.display.large');
  final displayMedium = const TextStyleToken(
    'md3.text.theme.display.medium',
  );
  final displaySmall = const TextStyleToken('md3.text.theme.display.small');
  final headlineLarge = const TextStyleToken(
    'md3.text.theme.headline.large',
  );
  final headlineMedium = const TextStyleToken(
    'md3.text.theme.headline.medium',
  );
  final headlineSmall = const TextStyleToken(
    'md3.text.theme.headline.small',
  );

  final titleLarge = const TextStyleToken('md3.text.theme.title.large');
  final titleMedium = const TextStyleToken('md3.text.theme.title.medium');
  final titleSmall = const TextStyleToken('md3.text.theme.title.small');
  final bodyLarge = const TextStyleToken('md3.text.theme.body.large');
  final bodyMedium = const TextStyleToken('md3.text.theme.body.medium');
  final bodySmall = const TextStyleToken('md3.text.theme.body.small');
  final labelLarge = const TextStyleToken('md3.text.theme.label.large');
  final labelMedium = const TextStyleToken('md3.text.theme.label.medium');
  final labelSmall = const TextStyleToken('md3.text.theme.label.small');
  // Material 2 text styles
  final headline1 = const TextStyleToken('md2.text.theme.headline1');
  final headline2 = const TextStyleToken('md2.text.theme.headline2');
  final headline3 = const TextStyleToken('md2.text.theme.headline3');
  final headline4 = const TextStyleToken('md2.text.theme.headline4');
  final headline5 = const TextStyleToken('md2.text.theme.headline5');
  final headline6 = const TextStyleToken('md2.text.theme.headline6');
  final subtitle1 = const TextStyleToken('md2.text.theme.subtitle1');
  final subtitle2 = const TextStyleToken('md2.text.theme.subtitle2');
  final bodyText1 = const TextStyleToken('md2.text.theme.bodyText1');
  final bodyText2 = const TextStyleToken('md2.text.theme.bodyText2');
  final caption = const TextStyleToken('md2.text.theme.caption');
  final button = const TextStyleToken('md2.text.theme.button');
  final overline = const TextStyleToken('md2.text.theme.overline');

  const _MaterialTextStyles();
}

extension on BuildContext {
  TextTheme get text => Theme.of(this).textTheme;
  ColorScheme get color => Theme.of(this).colorScheme;
}

mixin MaterialColorTokensMixin {
  ColorToken get primary => _cm.primary;
  ColorToken get secondary => _cm.secondary;
  ColorToken get tertiary => _cm.tertiary;
  ColorToken get surface => _cm.surface;
  ColorToken get background => _cm.background;
  ColorToken get error => _cm.error;
  ColorToken get onPrimary => _cm.onPrimary;
  ColorToken get onSecondary => _cm.onSecondary;
  ColorToken get onTertiary => _cm.onTertiary;
  ColorToken get onSurface => _cm.onSurface;
  ColorToken get onBackground => _cm.onBackground;
  ColorToken get onError => _cm.onError;
}

class ColorTokenUtilWithMaterialTokens extends ColorTokenUtil
    with MaterialColorTokensMixin {
  const ColorTokenUtilWithMaterialTokens();
}

class TextStyleTokenUtilWithMaterialTokens extends TextStyleTokenUtil
    with MaterialTextStyleTokensMixin {
  const TextStyleTokenUtilWithMaterialTokens();
}

mixin MaterialTextStyleTokensMixin {
  TextStyleToken get displayLarge => _ts.displayLarge;
  TextStyleToken get displayMedium => _ts.displayMedium;
  TextStyleToken get displaySmall => _ts.displaySmall;
  TextStyleToken get headlineLarge => _ts.headlineLarge;
  TextStyleToken get headlineMedium => _ts.headlineMedium;
  TextStyleToken get headlineSmall => _ts.headlineSmall;
  TextStyleToken get titleLarge => _ts.titleLarge;
  TextStyleToken get titleMedium => _ts.titleMedium;
  TextStyleToken get titleSmall => _ts.titleSmall;
  TextStyleToken get bodyLarge => _ts.bodyLarge;
  TextStyleToken get bodyMedium => _ts.bodyMedium;
  TextStyleToken get bodySmall => _ts.bodySmall;
  TextStyleToken get labelLarge => _ts.labelLarge;
  TextStyleToken get labelMedium => _ts.labelMedium;
  TextStyleToken get labelSmall => _ts.labelSmall;
  TextStyleToken get headline1 => _ts.headline1;
  TextStyleToken get headline2 => _ts.headline2;
  TextStyleToken get headline3 => _ts.headline3;
  TextStyleToken get headline4 => _ts.headline4;
  TextStyleToken get headline5 => _ts.headline5;
  TextStyleToken get headline6 => _ts.headline6;
  TextStyleToken get subtitle1 => _ts.subtitle1;
  TextStyleToken get subtitle2 => _ts.subtitle2;
  TextStyleToken get bodyText1 => _ts.bodyText1;
  TextStyleToken get bodyText2 => _ts.bodyText2;
  TextStyleToken get caption => _ts.caption;
  TextStyleToken get button => _ts.button;
  TextStyleToken get overline => _ts.overline;
}
