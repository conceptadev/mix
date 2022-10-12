import '../../helpers/extensions.dart';

import '../refs/text_style_token.dart';

class MaterialTextThemeTokens {
  MaterialTextThemeTokens();
  // Material 2
  final TextStyleToken headline1 = TextStyleToken('headline1', (context) {
    return context.theme.textTheme.headline1!;
  });
  final TextStyleToken headline2 = TextStyleToken('headline2', (context) {
    return context.theme.textTheme.headline2!;
  });
  final TextStyleToken headline3 = TextStyleToken('headline3', (context) {
    return context.theme.textTheme.headline3!;
  });
  final TextStyleToken headline4 = TextStyleToken('headline4', (context) {
    return context.theme.textTheme.headline4!;
  });
  final TextStyleToken headline5 = TextStyleToken('headline5', (context) {
    return context.theme.textTheme.headline5!;
  });
  final TextStyleToken headline6 = TextStyleToken('headline6', (context) {
    return context.theme.textTheme.headline6!;
  });
  final TextStyleToken subtitle1 = TextStyleToken('subtitle1', (context) {
    return context.theme.textTheme.subtitle1!;
  });
  final TextStyleToken subtitle2 = TextStyleToken('subtitle2', (context) {
    return context.theme.textTheme.subtitle2!;
  });
  final TextStyleToken bodyText1 = TextStyleToken('body1', (context) {
    return context.theme.textTheme.bodyText1!;
  });
  final TextStyleToken bodyText2 = TextStyleToken('body2', (context) {
    return context.theme.textTheme.bodyText2!;
  });
  final TextStyleToken caption = TextStyleToken('caption', (context) {
    return context.theme.textTheme.caption!;
  });
  final TextStyleToken button = TextStyleToken('button', (context) {
    return context.theme.textTheme.button!;
  });
  final TextStyleToken overline = TextStyleToken('overline', (context) {
    return context.theme.textTheme.overline!;
  });

  // Material 3

  final TextStyleToken displayLarge = TextStyleToken('displayLarge', (context) {
    return context.theme.textTheme.displayLarge!;
  });

  final TextStyleToken displayMedium =
      TextStyleToken('displayMedium', (context) {
    return context.theme.textTheme.displayMedium!;
  });

  final TextStyleToken displaySmall = TextStyleToken('displaySmall', (context) {
    return context.theme.textTheme.displaySmall!;
  });

  final TextStyleToken headlineLarge =
      TextStyleToken('headlineLarge', (context) {
    return context.theme.textTheme.headlineLarge!;
  });

  final TextStyleToken headlineMedium =
      TextStyleToken('headlineMedium', (context) {
    return context.theme.textTheme.headlineMedium!;
  });

  final TextStyleToken headlineSmall =
      TextStyleToken('headlineSmall', (context) {
    return context.theme.textTheme.headlineSmall!;
  });

  final TextStyleToken titleLarge = TextStyleToken('titleLarge', (context) {
    return context.theme.textTheme.titleLarge!;
  });

  final TextStyleToken titleMedium = TextStyleToken('titleMedium', (context) {
    return context.theme.textTheme.titleMedium!;
  });

  final TextStyleToken titleSmall = TextStyleToken('titleSmall', (context) {
    return context.theme.textTheme.titleSmall!;
  });

  final TextStyleToken bodyLarge = TextStyleToken('bodyLarge', (context) {
    return context.theme.textTheme.bodyLarge!;
  });

  final TextStyleToken bodyMedium = TextStyleToken('bodyMedium', (context) {
    return context.theme.textTheme.bodyMedium!;
  });

  final TextStyleToken bodySmall = TextStyleToken('bodySmall', (context) {
    return context.textTheme.bodySmall!;
  });

  final TextStyleToken labelLarge = TextStyleToken('labelLarge', (context) {
    return context.textTheme.labelLarge!;
  });

  final TextStyleToken labelMedium = TextStyleToken('labelMedium', (context) {
    return context.textTheme.labelMedium!;
  });

  final TextStyleToken labelSmall = TextStyleToken('labelSmall', (context) {
    return context.textTheme.labelSmall!;
  });
}
