import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

extension on RadiusTokenUtil {
  RadiusToken get small => const RadiusToken('radius-token-small');
  RadiusToken get large => const RadiusToken('radius-token-large');
}

extension on SpaceTokenUtil {
  SpaceToken get small => const SpaceToken('space-token-small');
}

void main() {
  const primaryColor = ColorToken('primary');
  final theme = MixThemeData(
    breakpoints: {
      $breakpoints.small: const Breakpoint(minWidth: 0, maxWidth: 599),
    },
    colors: {
      primaryColor: Colors.blue,
      $md.colorScheme.error: Colors.redAccent,
    },
    spaces: {$spaces.small: 30},
    textStyles: {
      $md.textTheme.bodyLarge: const TextStyle(
        fontSize: 200,
        fontWeight: FontWeight.w300,
      ),
    },
    radii: {
      $radii.small: const Radius.circular(200),
      $radii.large: const Radius.circular(2000),
    },
  );

  group('MixTheme', () {
    testWidgets('MixTheme.of', (tester) async {
      await tester.pumpWithMixTheme(Container(), theme: theme);

      final context = tester.element(find.byType(Container));

      expect(MixTheme.of(context), theme);
      expect(MixTheme.maybeOf(context), theme);
    });

    testWidgets(
      'when applied to Box via Style, it must reproduce the same values than the theme',
      (tester) async {
        const key = Key('box');

        await tester.pumpWithMixTheme(
          Box(
            style: Style(
              box.color.of(primaryColor),
              box.borderRadius.all.of($radii.small),
              box.padding.horizontal.of($spaces.small),
              text.style.of($md.textTheme.bodyLarge),
            ),
            key: key,
            child: const StyledText('Hello'),
          ),
          theme: theme,
        );

        final container = tester.widget<Container>(
          find.descendant(
            of: find.byKey(key),
            matching: find.byType(Container),
          ),
        );

        expect(
          container.decoration,
          BoxDecoration(
            color: theme.colors[primaryColor],
            borderRadius: BorderRadius.all(theme.radii[$radii.small]!),
          ),
        );

        expect(container.padding!.horizontal / 2, theme.space[$spaces.small]);

        final textWidget = tester.widget<Text>(
          find.descendant(of: find.byKey(key), matching: find.byType(Text)),
        );

        expect(textWidget.style, theme.textStyles[$md.textTheme.bodyLarge]);
      },
    );

    // maybeOf
    testWidgets('MixTheme.maybeOf', (tester) async {
      await tester.pumpMaterialApp(Container());

      final context = tester.element(find.byType(Container));

      expect(MixTheme.maybeOf(context), null);
      expect(() => MixTheme.of(context), throwsAssertionError);
    });
  });
}
