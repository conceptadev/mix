import 'package:remix/remix.dart';
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
                tokens: dark,
                components: themes.dark,
              ),
              theme: RemixThemeData(
                components: themes.light,
                tokens: light,
              ),
              home: child,
            );
          },
        );
}
