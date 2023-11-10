// ignore_for_file: deprecated_member_use, avoid-non-null-assertion

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

// import '../../helpers/extensions/build_context_ext.dart';
// import 'mix_token.dart';
// import 'refs.dart';

// class MaterialColorToken extends MixToken<Color> {
//   const MaterialColorToken(super.name);
// }

// class _MaterialDesignColors {
//   final primary = ResolvableColorToken(
//     '--md-color-primary',
//     (context) => context.colorScheme.primary,
//   );

//   final secondary = ResolvableColorToken(
//     '--md-color-secondary',
//     (context) => context.colorScheme.secondary,
//   );

//   final tertiary = ResolvableColorToken(
//     '--md-color-tertiary',
//     (context) => context.colorScheme.tertiary,
//   );

//   final surface = ResolvableColorToken(
//     '--md-color-surface',
//     (context) => context.colorScheme.surface,
//   );

//   final background = ResolvableColorToken(
//     '--md-color-background',
//     (context) => context.colorScheme.background,
//   );

//   final error = ResolvableColorToken(
//     '--md-color-error',
//     (context) => context.colorScheme.error,
//   );

//   final onPrimary = ResolvableColorToken(
//     '--md-color-on-primary',
//     (context) => context.colorScheme.onPrimary,
//   );

//   final onSecondary = ResolvableColorToken(
//     '--md-color-on-secondary',
//     (context) => context.colorScheme.onSecondary,
//   );

//   final onTertiary = ResolvableColorToken(
//     '--md-color-on-tertiary',
//     (context) => context.colorScheme.onTertiary,
//   );

//   final onSurface = ResolvableColorToken(
//     '--md-color-on-surface',
//     (context) => context.colorScheme.onSurface,
//   );

//   final onBackground = ResolvableColorToken(
//     '--md-color-on-background',
//     (context) => context.colorScheme.onBackground,
//   );

//   final onError = ResolvableColorToken(
//     '--md-color-on-error',
//     (context) => context.colorScheme.onError,
//   );

//   _MaterialDesignColors();
// }

// // Material 3 TextTheme Tokens.
// class MaterialTextStyles {
//   //  Material 3 text styles
//   final displayLarge = ResolvableTextStyleToken(
//     '--md3-displa-large',
//     (context) => context.textTheme.displayLarge!,
//   );
//   final displayMedium = ResolvableTextStyleToken(
//     '--md3-displaymedium',
//     (context) => context.textTheme.displayMedium!,
//   );
//   final displaySmall = ResolvableTextStyleToken(
//     '--md3-display-small',
//     (context) => context.textTheme.displaySmall!,
//   );
//   final headlineLarge = ResolvableTextStyleToken(
//     '--md3-headline-large',
//     (context) => context.textTheme.headlineLarge!,
//   );
//   final headlineMedium = ResolvableTextStyleToken(
//     '--md3-headline-medium',
//     (context) => context.textTheme.headlineMedium!,
//   );
//   final headlineSmall = ResolvableTextStyleToken(
//     '--md3-headline-small',
//     (context) => context.textTheme.headlineSmall!,
//   );
//   final titleLarge = ResolvableTextStyleToken(
//     '--md3-title-large',
//     (context) => context.textTheme.titleLarge!,
//   );
//   final titleMedium = ResolvableTextStyleToken(
//     '--md3-title-medium',
//     (context) => context.textTheme.titleMedium!,
//   );
//   final titleSmall = ResolvableTextStyleToken(
//     '--md3-title-small',
//     (context) => context.textTheme.titleSmall!,
//   );
//   final bodyLarge = ResolvableTextStyleToken(
//     '--md3-body-large',
//     (context) => context.textTheme.bodyLarge!,
//   );
//   final bodyMedium = ResolvableTextStyleToken(
//     '--md3-body-medium',
//     (context) => context.textTheme.bodyMedium!,
//   );
//   final bodySmall = ResolvableTextStyleToken(
//     '--md3-body-small',
//     (context) => context.textTheme.bodySmall!,
//   );
//   final labelLarge = ResolvableTextStyleToken(
//     '--md3-label-large',
//     (context) => context.textTheme.labelLarge!,
//   );
//   final labelMedium = ResolvableTextStyleToken(
//     '--md3-label-medium',
//     (context) => context.textTheme.labelMedium!,
//   );
//   final labelSmall = ResolvableTextStyleToken(
//     '--md3-label-small',
//     (context) => context.textTheme.labelSmall!,
//   );
//   // Material 2 text styles
//   final headline1 = ResolvableTextStyleToken(
//     '--md2-text-style-headline1',
//     (context) => context.textTheme.headline1!,
//   );
//   final headline2 = ResolvableTextStyleToken(
//     '--md2-text-style-headline2',
//     (context) => context.textTheme.headline2!,
//   );
//   final headline3 = ResolvableTextStyleToken(
//     '--md2-text-style-headline3',
//     (context) => context.textTheme.headline3!,
//   );
//   final headline4 = ResolvableTextStyleToken(
//     '--md2-text-style-headline4',
//     (context) => context.textTheme.headline4!,
//   );
//   final headline5 = ResolvableTextStyleToken(
//     '--md2-text-style-headline5',
//     (context) => context.textTheme.headline5!,
//   );
//   final headline6 = ResolvableTextStyleToken(
//     '--md2-text-style-headline6',
//     (context) => context.textTheme.headline6!,
//   );
//   final subtitle1 = ResolvableTextStyleToken(
//     '--md2-text-style-subtitle1',
//     (context) => context.textTheme.subtitle1!,
//   );
//   final subtitle2 = ResolvableTextStyleToken(
//     '--md2-text-style-subtitle2',
//     (context) => context.textTheme.subtitle2!,
//   );
//   final bodyText1 = ResolvableTextStyleToken(
//     '--md2-text-style-bodyText1',
//     (context) => context.textTheme.bodyText1!,
//   );
//   final bodyText2 = ResolvableTextStyleToken(
//     '--md2-text-style-bodyText2',
//     (context) => context.textTheme.bodyText2!,
//   );
//   final caption = ResolvableTextStyleToken(
//     '--md2-text-style-caption',
//     (context) => context.textTheme.caption!,
//   );
//   final button = ResolvableTextStyleToken(
//     '--md2-text-style-button',
//     (context) => context.textTheme.button!,
//   );
//   final overline = ResolvableTextStyleToken(
//     '--md2-text-style-overline',
//     (context) => context.textTheme.overline!,
//   );

//   MaterialTextStyles();
// }

// final $md = _MaterialTokens();

// class _MaterialTokens {
//   final colors = _MaterialDesignColors();
//   final textStyles = MaterialTextStyles();
//   _MaterialTokens();
// }

void main() {
  // Create a test that checks if all the values of these tokens match the ThemeData from the MaterialApp
  group('Material tokens', () {
    testWidgets('colors', (tester) async {
      final theme = ThemeData.light();
      await tester.pumpWidget(
        MaterialApp(theme: theme, home: Container()),
      );
      final context = tester.element(find.byType(Container));
      final colors = $md.colors;
      expect(colors.primary.resolve(context), theme.colorScheme.primary);
      expect(colors.secondary.resolve(context), theme.colorScheme.secondary);
      expect(colors.tertiary.resolve(context), theme.colorScheme.tertiary);
      expect(colors.surface.resolve(context), theme.colorScheme.surface);
      expect(colors.background.resolve(context), theme.colorScheme.background);
      expect(colors.error.resolve(context), theme.colorScheme.error);
      expect(colors.onPrimary.resolve(context), theme.colorScheme.onPrimary);
      expect(
          colors.onSecondary.resolve(context), theme.colorScheme.onSecondary);
      expect(colors.onTertiary.resolve(context), theme.colorScheme.onTertiary);
      expect(colors.onSurface.resolve(context), theme.colorScheme.onSurface);
      expect(
        colors.onBackground.resolve(context),
        theme.colorScheme.onBackground,
      );
      expect(colors.onError.resolve(context), theme.colorScheme.onError);
    });

    testWidgets('Material 3 textStyles', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
            theme: ThemeData.light(useMaterial3: true), home: Container()),
      );
      final context = tester.element(find.byType(Container));

      final theme = Theme.of(context);

      final textStyles = $md.textStyles;
      expect(textStyles.displayLarge.resolve(context),
          theme.textTheme.displayLarge);
      expect(textStyles.displayMedium.resolve(context),
          theme.textTheme.displayMedium);
      expect(textStyles.displaySmall.resolve(context),
          theme.textTheme.displaySmall);
      expect(textStyles.headlineLarge.resolve(context),
          theme.textTheme.headlineLarge);
      expect(textStyles.headlineMedium.resolve(context),
          theme.textTheme.headlineMedium);
      expect(textStyles.headlineSmall.resolve(context),
          theme.textTheme.headlineSmall);
      expect(
          textStyles.titleLarge.resolve(context), theme.textTheme.titleLarge);
      expect(
          textStyles.titleMedium.resolve(context), theme.textTheme.titleMedium);
      expect(
          textStyles.titleSmall.resolve(context), theme.textTheme.titleSmall);
      expect(textStyles.bodyLarge.resolve(context), theme.textTheme.bodyLarge);
      expect(
          textStyles.bodyMedium.resolve(context), theme.textTheme.bodyMedium);
      expect(textStyles.bodySmall.resolve(context), theme.textTheme.bodySmall);
      expect(
          textStyles.labelLarge.resolve(context), theme.textTheme.labelLarge);
      expect(
          textStyles.labelMedium.resolve(context), theme.textTheme.labelMedium);
      expect(
          textStyles.labelSmall.resolve(context), theme.textTheme.labelSmall);
    });

    testWidgets('Material 2 text styles', (tester) async {
      await tester.pumpWidget(
        MaterialApp(theme: ThemeData.light(), home: Container()),
      );
      final context = tester.element(find.byType(Container));

      final theme = Theme.of(context);

      final textStyles = $md.textStyles;
      expect(textStyles.headline1.resolve(context), theme.textTheme.headline1);
      expect(textStyles.headline2.resolve(context), theme.textTheme.headline2);
      expect(textStyles.headline3.resolve(context), theme.textTheme.headline3);
      expect(textStyles.headline4.resolve(context), theme.textTheme.headline4);
      expect(textStyles.headline5.resolve(context), theme.textTheme.headline5);
      expect(textStyles.headline6.resolve(context), theme.textTheme.headline6);
      expect(textStyles.subtitle1.resolve(context), theme.textTheme.subtitle1);
      expect(textStyles.subtitle2.resolve(context), theme.textTheme.subtitle2);
      expect(textStyles.bodyText1.resolve(context), theme.textTheme.bodyText1);
      expect(textStyles.bodyText2.resolve(context), theme.textTheme.bodyText2);
      expect(textStyles.caption.resolve(context), theme.textTheme.caption);
      expect(textStyles.button.resolve(context), theme.textTheme.button);
      expect(textStyles.overline.resolve(context), theme.textTheme.overline);
    });
  });
}
