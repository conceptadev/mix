import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remix/remix.dart';
import 'package:remix/themes/fortaleza.dart';

void main() {
  testWidgets(
    'RemixApp should use the provided theme tokens when no dark theme is provided',
    (WidgetTester tester) async {
      final theme = FortalezaThemeData.light().toThemeData();

      for (final brightness in Brightness.values) {
        await tester.pumpWidget(
          MediaQuery(
            data: MediaQueryData(platformBrightness: brightness),
            child: RemixApp(theme: theme),
          ),
        );
        final remixTheme = tester
            .firstWidget<RemixThemeInherited>(find.byType(RemixThemeInherited));

        expect(remixTheme.data, theme);
      }
    },
  );

  testWidgets(
    'RemixApp should use the specified theme when both themes are provided',
    (WidgetTester tester) async {
      for (final brightness in Brightness.values) {
        await tester.pumpWidget(
          MediaQuery(
            data: MediaQueryData(platformBrightness: brightness),
            child: RemixApp(
              theme: FortalezaThemeData.light().toThemeData(),
              darkTheme: FortalezaThemeData.dark().toThemeData(),
            ),
          ),
        );
        final remixTheme = tester
            .firstWidget<RemixThemeInherited>(find.byType(RemixThemeInherited));

        final expectedTheme = (brightness == Brightness.light
                ? FortalezaThemeData.light()
                : FortalezaThemeData.dark())
            .toThemeData();

        expect(remixTheme.data, expectedTheme);
      }
    },
  );
}
