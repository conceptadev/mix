import 'package:flutter/material.dart';

import '../../helpers/extensions.dart';
import '../refs/text_style_token.dart';

class MaterialTextThemeTokens {
  MaterialTextThemeTokens();
  // Material 2
  final TextStyleToken headline1 = TextStyleToken(
    (context) => Theme.of(context).textTheme.headline1!,
  );
  final TextStyleToken headline2 = TextStyleToken(
    (context) => Theme.of(context).textTheme.headline2!,
  );
  final TextStyleToken headline3 = TextStyleToken(
    (context) => Theme.of(context).textTheme.headline3!,
  );
  final TextStyleToken headline4 = TextStyleToken(
    (context) => Theme.of(context).textTheme.headline4!,
  );
  final TextStyleToken headline5 = TextStyleToken(
    (context) => Theme.of(context).textTheme.headline5!,
  );
  final TextStyleToken headline6 = TextStyleToken(
    (context) => Theme.of(context).textTheme.headline6!,
  );
  final TextStyleToken subtitle1 = TextStyleToken(
    (context) => Theme.of(context).textTheme.subtitle1!,
  );
  final TextStyleToken subtitle2 = TextStyleToken(
    (context) => Theme.of(context).textTheme.subtitle2!,
  );
  final TextStyleToken bodyText1 = TextStyleToken(
    (context) => Theme.of(context).textTheme.bodyText1!,
  );
  final TextStyleToken bodyText2 = TextStyleToken(
    (context) => Theme.of(context).textTheme.bodyText2!,
  );
  final TextStyleToken caption = TextStyleToken(
    (context) => Theme.of(context).textTheme.caption!,
  );
  final TextStyleToken button = TextStyleToken(
    (context) => Theme.of(context).textTheme.button!,
  );
  final TextStyleToken overline = TextStyleToken(
    (context) => Theme.of(context).textTheme.overline!,
  );

  // Material 3

  final TextStyleToken displayLarge = TextStyleToken(
    (context) => Theme.of(context).textTheme.displayLarge!,
  );

  final TextStyleToken displayMedium = TextStyleToken(
    (context) => Theme.of(context).textTheme.displayMedium!,
  );

  final TextStyleToken displaySmall = TextStyleToken(
    (context) => Theme.of(context).textTheme.displaySmall!,
  );

  final TextStyleToken headlineLarge = TextStyleToken(
    (context) => Theme.of(context).textTheme.headlineLarge!,
  );

  final TextStyleToken headlineMedium = TextStyleToken(
    (context) => Theme.of(context).textTheme.headlineMedium!,
  );

  final TextStyleToken headlineSmall = TextStyleToken(
    (context) => Theme.of(context).textTheme.headlineSmall!,
  );

  final TextStyleToken titleLarge = TextStyleToken(
    (context) => Theme.of(context).textTheme.titleLarge!,
  );

  final TextStyleToken titleMedium = TextStyleToken(
    (context) => Theme.of(context).textTheme.titleMedium!,
  );

  final TextStyleToken titleSmall = TextStyleToken(
    (context) => Theme.of(context).textTheme.titleSmall!,
  );

  final TextStyleToken bodyLarge = TextStyleToken(
    (context) => Theme.of(context).textTheme.bodyLarge!,
  );

  final TextStyleToken bodyMedium = TextStyleToken(
    (context) => Theme.of(context).textTheme.bodyMedium!,
  );

  final TextStyleToken bodySmall = TextStyleToken(
    (context) => context.textTheme.bodySmall!,
  );

  final TextStyleToken labelLarge = TextStyleToken(
    (context) => context.textTheme.labelLarge!,
  );

  final TextStyleToken labelMedium = TextStyleToken(
    (context) => context.textTheme.labelMedium!,
  );

  final TextStyleToken labelSmall = TextStyleToken(
    (context) => context.textTheme.labelSmall!,
  );
}
