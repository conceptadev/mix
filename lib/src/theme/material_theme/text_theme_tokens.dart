// ignore_for_file: deprecated_member_use, avoid-non-null-assertion

import 'package:flutter/material.dart';

import '../../helpers/extensions/build_context_ext.dart';
import '../tokens/mix_token.dart';
import '../tokens/refs.dart';

// Material 3 TextTheme Tokens.
class $M3Text {
  static const displayLarge = TextStyleRef('displayLarge');
  static const displayMedium = TextStyleRef('displayMedium');
  static const displaySmall = TextStyleRef('displaySmall');
  static const headlineLarge = TextStyleRef('headlineLarge');
  static const headlineMedium = TextStyleRef('headlineMedium');
  static const headlineSmall = TextStyleRef('headlineSmall');
  static const titleLarge = TextStyleRef('titleLarge');
  static const titleMedium = TextStyleRef('titleMedium');
  static const titleSmall = TextStyleRef('titleSmall');
  static const bodyLarge = TextStyleRef('bodyLarge');
  static const bodyMedium = TextStyleRef('bodyMedium');
  static const bodySmall = TextStyleRef('bodySmall');
  static const labelLarge = TextStyleRef('labelLarge');
  static const labelMedium = TextStyleRef('labelMedium');
  static const labelSmall = TextStyleRef('labelSmall');

  const $M3Text._();
  static DesignTokenMap<TextStyleRef, TextStyle> get tokens {
    return {
      displayLarge: (context) => context.textTheme.displayLarge!,
      displayMedium: (context) => context.textTheme.displayMedium!,
      displaySmall: (context) => context.textTheme.displaySmall!,
      headlineLarge: (context) => context.textTheme.headlineLarge!,
      headlineMedium: (context) => context.textTheme.headlineMedium!,
      headlineSmall: (context) => context.textTheme.headlineSmall!,
      titleLarge: (context) => context.textTheme.titleLarge!,
      titleMedium: (context) => context.textTheme.titleMedium!,
      titleSmall: (context) => context.textTheme.titleSmall!,
      bodyLarge: (context) => context.textTheme.bodyLarge!,
      bodyMedium: (context) => context.textTheme.bodyMedium!,
      bodySmall: (context) => context.textTheme.bodySmall!,
      labelLarge: (context) => context.textTheme.labelLarge!,
      labelMedium: (context) => context.textTheme.labelMedium!,
      labelSmall: (context) => context.textTheme.labelSmall!,
    };
  }
}

// Material 2 TextTheme Tokens.
class $M2Text {
  static const headline1 = TextStyleRef('headline1');
  static const headline2 = TextStyleRef('headline2');
  static const headline3 = TextStyleRef('headline3');
  static const headline4 = TextStyleRef('headline4');
  static const headline5 = TextStyleRef('headline5');
  static const headline6 = TextStyleRef('headline6');
  static const subtitle1 = TextStyleRef('subtitle1');
  static const subtitle2 = TextStyleRef('subtitle2');
  static const bodyText1 = TextStyleRef('bodyText1');
  static const bodyText2 = TextStyleRef('bodyText2');
  static const caption = TextStyleRef('caption');
  static const button = TextStyleRef('button');
  static const overline = TextStyleRef('overline');

  const $M2Text._();

  static DesignTokenMap<TextStyleRef, TextStyle> get tokens {
    return {
      headline1: (context) => context.textTheme.headline1!,
      headline2: (context) => context.textTheme.headline2!,
      headline3: (context) => context.textTheme.headline3!,
      headline4: (context) => context.textTheme.headline4!,
      headline5: (context) => context.textTheme.headline5!,
      headline6: (context) => context.textTheme.headline6!,
      subtitle1: (context) => context.textTheme.subtitle1!,
      subtitle2: (context) => context.textTheme.subtitle2!,
      bodyText1: (context) => context.textTheme.bodyText1!,
      bodyText2: (context) => context.textTheme.bodyText2!,
      caption: (context) => context.textTheme.caption!,
      button: (context) => context.textTheme.button!,
      overline: (context) => context.textTheme.overline!,
    };
  }
}
