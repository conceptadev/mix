import 'package:demo/utils/components/code_view.dart';
import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:syntax_highlight/syntax_highlight.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

late final Highlighter dartLightHighlighter;

class LiveCode extends ValueNotifier<String> {
  LiveCode() : super('');
}

final $code = LiveCode();

@widgetbook.App()
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Highlighter.initialize([
    'dart',
  ]);

  var lightTheme = await HighlighterTheme.loadDarkTheme();

  dartLightHighlighter = Highlighter(
    language: 'dart',
    theme: lightTheme,
  );
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
            name: 'Dark',
            data: ThemeData.dark(),
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
        home: RemixTokens(
          data: RemixTokens.light,
          child: Scaffold(
            body: Center(child: child),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: $code.value == ''
                ? const RxButton(
                    label: '',
                    onPressed: null,
                    disabled: true,
                    iconLeft: Icons.code_rounded,
                    size: ButtonSize.large,
                  )
                : CodeView(
                    code: $code.value,
                  ),
          ),
        ),
      ),
      directories: directories,
    );
  }
}
