import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:themed_button/styles/schadcn.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// This file does not exist yet,
// it will be generated in the next step
import 'main.directories.g.dart';
import 'styles/orbit.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      initialRoute: '?path=button/themedbutton/default',
      addons: [
        // GridAddon(10),
        ZoomAddon(initialZoom: 1.0),
        ThemeAddon<MixThemeData>(
          themes: [
            WidgetbookTheme(
              name: 'Orbit',
              data: orbitTheme,
            ),
            WidgetbookTheme(
              name: 'Shadcn',
              data: shadcnTheme,
            ),
          ],
          themeBuilder: (context, theme, child) {
            return MixTheme(
              data: theme,
              child: child,
            );
          },
        ),
      ],
      directories: directories,
    );
  }
}
