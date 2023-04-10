import '../../extensions/build_context_ext.dart';
import '../tokens/mix_token.dart';
import '../tokens/text_style_token.dart';

// Material 3 TextTheme Tokens

class $M3Text {
  const $M3Text._();
  static const displayLarge = TextStyleToken('displayLarge');
  static const displayMedium = TextStyleToken('displayMedium');
  static const displaySmall = TextStyleToken('displaySmall');
  static const headlineLarge = TextStyleToken('headlineLarge');
  static const headlineMedium = TextStyleToken('headlineMedium');
  static const headlineSmall = TextStyleToken('headlineSmall');
  static const titleLarge = TextStyleToken('titleLarge');
  static const titleMedium = TextStyleToken('titleMedium');
  static const titleSmall = TextStyleToken('titleSmall');
  static const bodyLarge = TextStyleToken('bodyLarge');
  static const bodyMedium = TextStyleToken('bodyMedium');
  static const bodySmall = TextStyleToken('bodySmall');
  static const labelLarge = TextStyleToken('labelLarge');
  static const labelMedium = TextStyleToken('labelMedium');
  static const labelSmall = TextStyleToken('labelSmall');

  static MixTextStyleTokens get tokens {
    return {
      displayLarge: (context) => context.textTheme.displayLarge,
      displayMedium: (context) => context.textTheme.displayMedium,
      displaySmall: (context) => context.textTheme.displaySmall,
      headlineLarge: (context) => context.textTheme.headlineLarge,
      headlineMedium: (context) => context.textTheme.headlineMedium,
      headlineSmall: (context) => context.textTheme.headlineSmall,
      titleLarge: (context) => context.textTheme.titleLarge,
      titleMedium: (context) => context.textTheme.titleMedium,
      titleSmall: (context) => context.textTheme.titleSmall,
      bodyLarge: (context) => context.textTheme.bodyLarge,
      bodyMedium: (context) => context.textTheme.bodyMedium,
      bodySmall: (context) => context.textTheme.bodySmall,
      labelLarge: (context) => context.textTheme.labelLarge,
      labelMedium: (context) => context.textTheme.labelMedium,
      labelSmall: (context) => context.textTheme.labelSmall,
    };
  }
}

// Material 2 TextTheme Tokens
class $M2Text {
  const $M2Text._();

  static const headline1 = TextStyleToken('headline1');
  static const headline2 = TextStyleToken('headline2');
  static const headline3 = TextStyleToken('headline3');
  static const headline4 = TextStyleToken('headline4');
  static const headline5 = TextStyleToken('headline5');
  static const headline6 = TextStyleToken('headline6');
  static const subtitle1 = TextStyleToken('subtitle1');
  static const subtitle2 = TextStyleToken('subtitle2');
  static const bodyText1 = TextStyleToken('bodyText1');
  static const bodyText2 = TextStyleToken('bodyText2');
  static const caption = TextStyleToken('caption');
  static const button = TextStyleToken('button');
  static const overline = TextStyleToken('overline');

  static MixTextStyleTokens get tokens {
    return {
      headline1: (context) => context.textTheme.headline1,
      headline2: (context) => context.textTheme.headline2,
      headline3: (context) => context.textTheme.headline3,
      headline4: (context) => context.textTheme.headline4,
      headline5: (context) => context.textTheme.headline5,
      headline6: (context) => context.textTheme.headline6,
      subtitle1: (context) => context.textTheme.subtitle1,
      subtitle2: (context) => context.textTheme.subtitle2,
      bodyText1: (context) => context.textTheme.bodyText1,
      bodyText2: (context) => context.textTheme.bodyText2,
      caption: (context) => context.textTheme.caption,
      button: (context) => context.textTheme.button,
      overline: (context) => context.textTheme.overline,
    };
  }
}
