import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remix/remix.dart';
import 'package:remix/themes/fortaleza.dart';

void main() {
  testWidgets(
    'RemixApp should use the provided theme tokens when no dark theme is provided',
    (WidgetTester tester) async {
      final theme = FortalezaThemeData.light();

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
              theme: FortalezaThemeData.light(),
              darkTheme: FortalezaThemeData.dark(),
            ),
          ),
        );
        final remixThemeInherited = tester
            .widget<RemixThemeInherited>(find.byType(RemixThemeInherited));

        final remixTheme = tester.widget<RemixTheme>(find.byType(RemixTheme));

        final expectedTheme = brightness == Brightness.light
            ? remixTheme.theme
            : remixTheme.darkTheme;

        expect(remixThemeInherited.data, expectedTheme);
      }
    },
  );
}
