// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  // Create a test that checks if all the values of these tokens match the ThemeData from the MaterialApp
  group('Material tokens', () {
    testWidgets('colors', (tester) async {
      final theme = ThemeData.light();
      await tester.pumpWidget(
        MaterialApp(theme: theme, home: Container()),
      );
      final context = tester.element(find.byType(Container));
      final colors = MaterialTokens().colors;
      expect((colors.primary() as ColorRef).resolve(context),
          theme.colorScheme.primary);
      expect((colors.secondary() as ColorRef).resolve(context),
          theme.colorScheme.secondary);
      expect((colors.tertiary() as ColorRef).resolve(context),
          theme.colorScheme.tertiary);
      expect((colors.surface() as ColorRef).resolve(context),
          theme.colorScheme.surface);
      expect((colors.background() as ColorRef).resolve(context),
          theme.colorScheme.background);
      expect((colors.error() as ColorRef).resolve(context),
          theme.colorScheme.error);
      expect((colors.onPrimary() as ColorRef).resolve(context),
          theme.colorScheme.onPrimary);
      expect((colors.onSecondary() as ColorRef).resolve(context),
          theme.colorScheme.onSecondary);
      expect((colors.onTertiary() as ColorRef).resolve(context),
          theme.colorScheme.onTertiary);
      expect((colors.onSurface() as ColorRef).resolve(context),
          theme.colorScheme.onSurface);
      expect(
        (colors.onBackground() as ColorRef).resolve(context),
        theme.colorScheme.onBackground,
      );
      expect((colors.onError() as ColorRef).resolve(context),
          theme.colorScheme.onError);
    });

    testWidgets('Material 3 textStyles', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
            theme: ThemeData.light(useMaterial3: true), home: Container()),
      );
      final context = tester.element(find.byType(Container));

      final theme = Theme.of(context);

      final textStyles = MaterialTokens().textStyles;
      expect((textStyles.displayLarge() as TextStyleRef).resolve(context),
          theme.textTheme.displayLarge);
      expect((textStyles.displayMedium() as TextStyleRef).resolve(context),
          theme.textTheme.displayMedium);
      expect((textStyles.displaySmall() as TextStyleRef).resolve(context),
          theme.textTheme.displaySmall);
      expect((textStyles.headlineLarge() as TextStyleRef).resolve(context),
          theme.textTheme.headlineLarge);
      expect((textStyles.headlineMedium() as TextStyleRef).resolve(context),
          theme.textTheme.headlineMedium);
      expect((textStyles.headlineSmall() as TextStyleRef).resolve(context),
          theme.textTheme.headlineSmall);
      expect((textStyles.titleLarge() as TextStyleRef).resolve(context),
          theme.textTheme.titleLarge);
      expect((textStyles.titleMedium() as TextStyleRef).resolve(context),
          theme.textTheme.titleMedium);
      expect((textStyles.titleSmall() as TextStyleRef).resolve(context),
          theme.textTheme.titleSmall);
      expect((textStyles.bodyLarge() as TextStyleRef).resolve(context),
          theme.textTheme.bodyLarge);
      expect((textStyles.bodyMedium() as TextStyleRef).resolve(context),
          theme.textTheme.bodyMedium);
      expect((textStyles.bodySmall() as TextStyleRef).resolve(context),
          theme.textTheme.bodySmall);
      expect((textStyles.labelLarge() as TextStyleRef).resolve(context),
          theme.textTheme.labelLarge);
      expect((textStyles.labelMedium() as TextStyleRef).resolve(context),
          theme.textTheme.labelMedium);
      expect((textStyles.labelSmall() as TextStyleRef).resolve(context),
          theme.textTheme.labelSmall);
    });

    testWidgets('Material 2 text styles', (tester) async {
      await tester.pumpWidget(
        MaterialApp(theme: ThemeData.light(), home: Container()),
      );
      final context = tester.element(find.byType(Container));

      final theme = Theme.of(context);

      final textStyles = MaterialTokens().textStyles;
      expect((textStyles.headline1() as TextStyleRef).resolve(context),
          theme.textTheme.headline1);
      expect((textStyles.headline2() as TextStyleRef).resolve(context),
          theme.textTheme.headline2);
      expect((textStyles.headline3() as TextStyleRef).resolve(context),
          theme.textTheme.headline3);
      expect((textStyles.headline4() as TextStyleRef).resolve(context),
          theme.textTheme.headline4);
      expect((textStyles.headline5() as TextStyleRef).resolve(context),
          theme.textTheme.headline5);
      expect((textStyles.headline6() as TextStyleRef).resolve(context),
          theme.textTheme.headline6);
      expect((textStyles.subtitle1() as TextStyleRef).resolve(context),
          theme.textTheme.subtitle1);
      expect((textStyles.subtitle2() as TextStyleRef).resolve(context),
          theme.textTheme.subtitle2);
      expect((textStyles.bodyText1() as TextStyleRef).resolve(context),
          theme.textTheme.bodyText1);
      expect((textStyles.bodyText2() as TextStyleRef).resolve(context),
          theme.textTheme.bodyText2);
      expect((textStyles.caption() as TextStyleRef).resolve(context),
          theme.textTheme.caption);
      expect((textStyles.button() as TextStyleRef).resolve(context),
          theme.textTheme.button);
      expect((textStyles.overline() as TextStyleRef).resolve(context),
          theme.textTheme.overline);
    });
  });
}
