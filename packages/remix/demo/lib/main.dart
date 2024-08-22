import 'package:flutter/material.dart';
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
    return Widgetbook.material(
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData.light(),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData.dark(),
            ),
          ],
          initialTheme: WidgetbookTheme(
            name: 'Light',
            data: ThemeData.light(),
          ),
        ),
        BuilderAddon(
          name: 'Remix Tokens',
          builder: (context, child) {
            final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
            return RemixTokens(
              data: isDarkTheme ? RemixTokens.dark : RemixTokens.light,
              child: Container(
                color: isDarkTheme ? Colors.black87 : Colors.white,
                child: Center(child: child),
              ),
            );
          },
        ),
        InspectorAddon(),
      ],
      appBuilder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Center(child: child)),
      ),
      directories: directories,
    );
  }
}
