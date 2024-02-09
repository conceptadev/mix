// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  // Create a test that checks if all the values of these tokens match the ThemeData from the MaterialApp
  group('Material tokens', () {
    Value refResolver<T extends MixToken<Value>, R extends TokenRef<T, Value>,
        Value>(R ref, BuildContext context) {
      return ref.token.resolve(context);
    }

    testWidgets('colors', (tester) async {
      final theme = ThemeData.light();
      await tester.pumpWithMixTheme(
        Container(),
        theme: MixThemeData.withMaterial().copyWith(),
      );
      final context = tester.element(find.byType(Container));
      final colors = const MaterialTokens().colorScheme;

      expect(refResolver(colors.primary(), context), theme.colorScheme.primary);
      expect(
        refResolver(colors.secondary(), context),
        theme.colorScheme.secondary,
      );
      expect(
        refResolver(colors.tertiary(), context),
        theme.colorScheme.tertiary,
      );
      expect(refResolver(colors.surface(), context), theme.colorScheme.surface);
      expect(
        refResolver(colors.background(), context),
        theme.colorScheme.background,
      );
      expect(refResolver(colors.error(), context), theme.colorScheme.error);
      expect(
        refResolver(colors.onPrimary(), context),
        theme.colorScheme.onPrimary,
      );
      expect(
        refResolver(colors.onSecondary(), context),
        theme.colorScheme.onSecondary,
      );
      expect(
        refResolver(colors.onTertiary(), context),
        theme.colorScheme.onTertiary,
      );
      expect(
        refResolver(colors.onSurface(), context),
        theme.colorScheme.onSurface,
      );
      expect(
        refResolver(colors.onBackground(), context),
        theme.colorScheme.onBackground,
      );
      expect(refResolver(colors.onError(), context), theme.colorScheme.onError);
    });

    testWidgets('Material 3 textStyles', (tester) async {
      await tester.pumpWithMixTheme(
        Container(),
        theme: MixThemeData.withMaterial(),
      );
      final context = tester.element(find.byType(Container));

      final theme = Theme.of(context);

      final textStyles = const MaterialTokens().textTheme;
      expect(
        refResolver(textStyles.displayLarge(), context),
        theme.textTheme.displayLarge,
      );
      expect(
        refResolver(textStyles.displayMedium(), context),
        theme.textTheme.displayMedium,
      );
      expect(
        refResolver(textStyles.displaySmall(), context),
        theme.textTheme.displaySmall,
      );
      expect(
        refResolver(textStyles.headlineLarge(), context),
        theme.textTheme.headlineLarge,
      );
      expect(
        refResolver(textStyles.headlineMedium(), context),
        theme.textTheme.headlineMedium,
      );
      expect(
        refResolver(textStyles.headlineSmall(), context),
        theme.textTheme.headlineSmall,
      );
      expect(
        refResolver(textStyles.titleLarge(), context),
        theme.textTheme.titleLarge,
      );
      expect(
        refResolver(textStyles.titleMedium(), context),
        theme.textTheme.titleMedium,
      );
      expect(
        refResolver(textStyles.titleSmall(), context),
        theme.textTheme.titleSmall,
      );
      expect(
        refResolver(textStyles.bodyLarge(), context),
        theme.textTheme.bodyLarge,
      );
      expect(
        refResolver(textStyles.bodyMedium(), context),
        theme.textTheme.bodyMedium,
      );
      expect(
        refResolver(textStyles.bodySmall(), context),
        theme.textTheme.bodySmall,
      );
      expect(
        refResolver(textStyles.labelLarge(), context),
        theme.textTheme.labelLarge,
      );
      expect(
        refResolver(textStyles.labelMedium(), context),
        theme.textTheme.labelMedium,
      );
      expect(
        refResolver(textStyles.labelSmall(), context),
        theme.textTheme.labelSmall,
      );
    });

    testWidgets('Material 2 text styles', (tester) async {
      await tester.pumpWithMixTheme(
        Container(),
        theme: MixThemeData.withMaterial(),
      );
      final context = tester.element(find.byType(Container));

      final theme = Theme.of(context);

      final textStyles = const MaterialTokens().textTheme;
      expect(
        refResolver(textStyles.headline1(), context),
        theme.textTheme.headline1,
      );
      expect(
        refResolver(textStyles.headline2(), context),
        theme.textTheme.headline2,
      );
      expect(
        refResolver(textStyles.headline3(), context),
        theme.textTheme.headline3,
      );
      expect(
        refResolver(textStyles.headline4(), context),
        theme.textTheme.headline4,
      );
      expect(
        refResolver(textStyles.headline5(), context),
        theme.textTheme.headline5,
      );
      expect(
        refResolver(textStyles.headline6(), context),
        theme.textTheme.headline6,
      );
      expect(
        refResolver(textStyles.subtitle1(), context),
        theme.textTheme.subtitle1,
      );
      expect(
        refResolver(textStyles.subtitle2(), context),
        theme.textTheme.subtitle2,
      );
      expect(
        refResolver(textStyles.bodyText1(), context),
        theme.textTheme.bodyText1,
      );
      expect(
        refResolver(textStyles.bodyText2(), context),
        theme.textTheme.bodyText2,
      );
      expect(
        refResolver(textStyles.caption(), context),
        theme.textTheme.caption,
      );
      expect(refResolver(textStyles.button(), context), theme.textTheme.button);
      expect(
        refResolver(textStyles.overline(), context),
        theme.textTheme.overline,
      );
    });
  });
}
