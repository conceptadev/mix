import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';

class RemixComponentThemeAddon extends ThemeAddon<RemixComponentTheme> {
  @override
  String get name => 'Component Theme';

  RemixComponentThemeAddon({
    required super.themes,
    super.initialTheme,
  }) : super(
          themeBuilder: (context, theme, child) {
            return RemixTheme(
              tokens: light,
              components: theme,
              child: child,
            );
          },
        );
}
