import 'package:remix/remix.dart';
import 'package:remix/themes/fortaleza.dart';
import 'package:widgetbook/widgetbook.dart';

typedef ThemeMultiBrightness = ({
  RemixComponentTheme light,
  RemixComponentTheme dark
});

class RemixComponentThemeAddon extends ThemeAddon<ThemeMultiBrightness> {
  @override
  String get name => 'Component Theme';

  RemixComponentThemeAddon({
    required super.themes,
    super.initialTheme,
  }) : super(
          themeBuilder: (context, themes, child) {
            return RemixApp(
              debugShowCheckedModeBanner: false,
              darkTheme: RemixThemeData(
                tokens: FortalezaTokens.dark().toThemeData(),
                components: themes.dark,
              ),
              theme: RemixThemeData(
                components: themes.light,
                tokens: FortalezaTokens.light().toThemeData(),
              ),
              home: child,
            );
          },
        );
}
