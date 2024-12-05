import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import 'component.dart';

class RemixThemeData {
  final RemixComponentTheme components;
  final MixThemeData tokens;

  const RemixThemeData({required this.components, required this.tokens});

  factory RemixThemeData.baseLight() => RemixThemeData(
        components: RemixComponentTheme.light(),
        tokens: const MixThemeData.empty(),
      );

  factory RemixThemeData.baseDark() => RemixThemeData(
        components: RemixComponentTheme.dark(),
        tokens: const MixThemeData.empty(),
      );

  RemixThemeData copyWith({
    RemixComponentTheme? components,
    MixThemeData? tokens,
  }) {
    return RemixThemeData(
      components: components ?? this.components,
      tokens: tokens ?? this.tokens,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RemixThemeData &&
        other.components == components &&
        other.tokens == tokens;
  }

  @override
  int get hashCode => components.hashCode ^ tokens.hashCode;
}

enum ThemeMode {
  light,
  dark,
}

class RemixTheme extends StatelessWidget {
  const RemixTheme({
    super.key,
    required this.theme,
    required this.child,
    this.themeMode,
    this.darkTheme,
  });

  static RemixThemeData of(BuildContext context) {
    final RemixThemeInherited? provider =
        context.dependOnInheritedWidgetOfExactType<RemixThemeInherited>();

    if (provider == null) {
      throw FlutterError(
        'RemixTheme.of() called with a context that does not contain a RemixTheme.\n'
        'No RemixTheme ancestor could be found starting from the context that was passed to RemixTheme.of(). '
        'This can happen because the context you used comes from a widget above the RemixTheme.\n'
        'The context used was:\n'
        '  $context',
      );
    }

    return provider.data;
  }

  static RemixThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<RemixThemeInherited>()
        ?.data;
  }

  final ThemeMode? themeMode;

  final RemixThemeData? theme;

  final RemixThemeData? darkTheme;
  final Widget child;

  RemixThemeData get _defaultThemeLight => RemixThemeData.baseLight();
  RemixThemeData get _defaultThemeDark => RemixThemeData.baseDark();

  RemixThemeData _defineRemixThemeData(BuildContext context) {
    if (themeMode != null) {
      return themeMode == ThemeMode.dark
          ? (darkTheme ?? _defaultThemeDark)
          : (theme ?? _defaultThemeLight);
    }

    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDark = brightness == Brightness.dark;

    return isDark
        ? (darkTheme ?? _defaultThemeDark)
        : (theme ?? _defaultThemeLight);
  }

  @override
  Widget build(BuildContext context) {
    final theme = _defineRemixThemeData(context);
    final tokens = theme.tokens;

    return MixTheme(
      data: tokens,
      child: RemixThemeInherited(data: theme, child: child),
    );
  }
}

@visibleForTesting
class RemixThemeInherited extends InheritedWidget {
  const RemixThemeInherited({
    super.key,
    required this.data,
    required super.child,
  });

  final RemixThemeData data;

  @override
  bool updateShouldNotify(RemixThemeInherited oldWidget) {
    return data != oldWidget.data;
  }
}

extension BuildContextRemixThemeX on BuildContext {
  RemixThemeData get remix => RemixTheme.of(this);
}
