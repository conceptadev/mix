import 'package:demo/addons/theme_addon.dart';
import 'package:flutter/material.dart' hide Scaffold, ThemeMode;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'addons/brightness_addon.dart';
import 'main.directories.g.dart';

@widgetbook.App(
  cloudAddonsConfigs: {
    'dark fortaleza': [
      BrightnessAddonConfig(WidgetBookBrightness.dark),
      ComponentThemeAddonConfig(ComponentTheme.fortaleza),
    ],
    'light fortaleza': [
      BrightnessAddonConfig(WidgetBookBrightness.light),
      ComponentThemeAddonConfig(ComponentTheme.fortaleza),
    ],
    'dark base': [
      BrightnessAddonConfig(WidgetBookBrightness.dark),
      ComponentThemeAddonConfig(ComponentTheme.base),
    ],
    'light base': [
      BrightnessAddonConfig(WidgetBookBrightness.light),
      ComponentThemeAddonConfig(ComponentTheme.base),
    ],
  },
)
void main() {
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      addons: [
        BrightnessAddon(),
        ComponentThemeAddon(),
        InspectorAddon(),
      ],
      appBuilder: (context, child) => child,
      directories: directories,
    );
  }
}
