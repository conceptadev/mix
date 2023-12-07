// widgetbook.dart

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the generated directories variable
import 'widgetbook.directories.g.dart';

final materialTheme = MaterialThemeAddon(
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
);

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MixTheme(
      data: MixThemeData.withMaterialTokens(),
      child: Widgetbook.material(
        directories: directories,
        addons: [materialTheme],
        integrations: [],
      ),
    );
  }
}
