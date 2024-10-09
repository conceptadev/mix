import 'package:demo/helpers/theme_addon.dart';
import 'package:flutter/material.dart' hide Scaffold, ThemeMode;
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

@widgetbook.App()
void main() {
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      addons: [
        ThemeAddon<Brightness>(
          themes: [
            const WidgetbookTheme(
              name: 'Light',
              data: Brightness.light,
            ),
            const WidgetbookTheme(
              name: 'Dark',
              data: Brightness.dark,
            ),
          ],
          initialTheme: const WidgetbookTheme(
            name: 'Light',
            data: Brightness.light,
          ),
          themeBuilder: (context, Brightness theme, child) {
            return MediaQuery(
              data: MediaQueryData(
                platformBrightness: theme,
              ),
              child: child,
            );
          },
        ),
        RemixComponentThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Fortaleza',
              data: (
                dark: RemixComponentTheme.fortalezaDark(),
                light: RemixComponentTheme.fortalezaLight()
              ),
            ),
            WidgetbookTheme(
              name: 'Base',
              data: (
                dark: RemixComponentTheme.base(),
                light: RemixComponentTheme.base(),
              ),
            ),
          ],
        ),
        InspectorAddon(),
      ],
      appBuilder: (context, child) => RemixApp(
        theme: RemixThemeData(
          components: RemixComponentTheme.fortalezaLight(),
          tokens: light,
        ),
        darkTheme: RemixThemeData(
          components: RemixComponentTheme.fortalezaDark(),
          tokens: dark,
        ),
        debugShowCheckedModeBanner: false,
        home: child,
      ),
      directories: directories,
    );
  }
}
