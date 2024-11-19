import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';

typedef ThemeMultiBrightness = ({RemixThemeData light, RemixThemeData dark});

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
              darkTheme: themes.dark,
              theme: themes.light,
              home: child,
            );
          },
        );
}
