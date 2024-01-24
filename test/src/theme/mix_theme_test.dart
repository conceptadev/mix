import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  const primaryColor = ColorToken('primary');
  final theme = MixThemeData(
    colors: {
      primaryColor: Colors.blue,
      $md.colors.error: Colors.redAccent,
    },
    breakpoints: {
      $breakpoints.small: const Breakpoint(
        minWidth: 0,
        maxWidth: 599,
      ),
    },
    radii: {
      $radii.small: const Radius.circular(200),
      $radii.large: const Radius.circular(2000),
    },
    space: {
      $space.small: 30,
    },
    textStyles: {
      $md.text.bodyLarge: const TextStyle(
        fontSize: 200,
        fontWeight: FontWeight.w300,
      ),
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
          key: key,
          style: Style(
            box.color.of(primaryColor),
            box.borderRadius.of($radii.small),
            box.padding.horizontal.of($space.small),
            text.style.of($md.text.bodyLarge),
          ),
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

      expect(
        container.padding!.horizontal / 2,
        theme.space[$space.small],
      );

      final textWidget = tester.widget<Text>(
        find.descendant(
          of: find.byKey(key),
          matching: find.byType(Text),
        ),
      );

      expect(
        textWidget.style,
        theme.textStyles[$md.text.bodyLarge],
      );
    });

    // maybeOf
    testWidgets('MixTheme.maybeOf', (tester) async {
      await tester.pumpMaterialApp(Container());

      final context = tester.element(find.byType(Container));

      expect(MixTheme.maybeOf(context), null);
      expect(() => MixTheme.of(context), throwsAssertionError);
    });
  });
}
