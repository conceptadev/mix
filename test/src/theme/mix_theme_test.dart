import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  const primaryColor = ColorToken('primary');
  final theme = MixThemeData(
    breakpoints: {
      $token.breakpoint.small: const Breakpoint(minWidth: 0, maxWidth: 599),
    },
    colors: {
      primaryColor: Colors.blue,
      $material.colorScheme.error: Colors.redAccent,
    },
    spaces: {$token.space.small: 30},
    textStyles: {
      $material.textTheme.bodyLarge: const TextStyle(
        fontSize: 200,
        fontWeight: FontWeight.w300,
      ),
    },
    radii: {
      $token.radius.small: const Radius.circular(200),
      $token.radius.large: const Radius.circular(2000),
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
              $box.color.ref(primaryColor),
              $box.borderRadius.all.ref($token.radius.small),
              $box.padding.horizontal.ref($token.space.small),
              $text.style.ref($material.textTheme.bodyLarge),
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
            borderRadius: BorderRadius.all(theme.radii[$token.radius.small]!),
          ),
        );

        expect(container.padding!.horizontal / 2,
            theme.spaces[$token.space.small]);

        final textWidget = tester.widget<Text>(
          find.descendant(of: find.byKey(key), matching: find.byType(Text)),
        );

        expect(
            textWidget.style, theme.textStyles[$material.textTheme.bodyLarge]);
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
