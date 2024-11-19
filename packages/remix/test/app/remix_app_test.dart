import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

final _mockedTheme = MixThemeData(
  colors: {const ColorToken('color'): const Color(0xFF000000)},
  spaces: {const SpaceToken('space'): 10},
  textStyles: {const TextStyleToken('text-style'): const TextStyle()},
  radii: {const RadiusToken('radius'): const Radius.circular(10)},
);

final _mockedTheme2 = MixThemeData(
  colors: {const ColorToken('color_2'): const Color.fromARGB(255, 215, 60, 60)},
  spaces: {const SpaceToken('space_2'): 20},
  textStyles: {const TextStyleToken('text-style_2'): const TextStyle()},
  radii: {const RadiusToken('radius_2'): const Radius.circular(20)},
);

void main() {
  testWidgets(
    'RemixApp should use the provided theme tokens when no dark theme is provided',
    (WidgetTester tester) async {
      for (final brightness in Brightness.values) {
        await tester.pumpWidget(
          MediaQuery(
            data: MediaQueryData(platformBrightness: brightness),
            child: RemixApp(
              theme: RemixThemeData(
                components: RemixComponentTheme.light(),
                tokens: _mockedTheme,
              ),
            ),
          ),
        );
        final mixTheme = tester.firstWidget<MixTheme>(find.byType(MixTheme));

        expect(mixTheme.data, _mockedTheme);
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
              theme: RemixThemeData(
                components: RemixComponentTheme.light(),
                tokens: _mockedTheme,
              ),
              darkTheme: RemixThemeData(
                components: RemixComponentTheme.dark(),
                tokens: _mockedTheme2,
              ),
            ),
          ),
        );
        final mixTheme = tester.firstWidget<MixTheme>(find.byType(MixTheme));

        final expectedTheme =
            brightness == Brightness.light ? _mockedTheme : _mockedTheme2;

        expect(mixTheme.data, expectedTheme);
      }
    },
  );
}
