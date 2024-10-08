import 'package:flutter/material.dart' as m;
import 'package:flutter/widgets.dart';

import '../theme/remix_theme.dart';
import '../theme/remix_tokens.dart';

class RemixApp extends StatelessWidget {
  const RemixApp({
    super.key,
    this.navigatorKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.pageRouteBuilder,
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        backButtonDispatcher = null,
        routerConfig = null;

  const RemixApp.router({
    super.key,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.routerConfig,
    this.backButtonDispatcher,
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
  })  : navigatorKey = null,
        home = null,
        routes = const <String, WidgetBuilder>{},
        initialRoute = null,
        onGenerateRoute = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        navigatorObservers = const <NavigatorObserver>[],
        pageRouteBuilder = null;

  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget? home;
  final Map<String, WidgetBuilder> routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver> navigatorObservers;
  final TransitionBuilder? builder;
  final String title;
  final GenerateAppTitle? onGenerateTitle;
  final RemixThemeData? theme;
  final RemixThemeData? darkTheme;
  final Color? color;
  final Locale? locale;
  // ignore: avoid-dynamic
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final String? restorationScopeId;
  final ScrollBehavior? scrollBehavior;
  final PageRouteFactory? pageRouteBuilder;

  // Router specific fields
  final RouteInformationProvider? routeInformationProvider;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final BackButtonDispatcher? backButtonDispatcher;
  final RouterConfig<Object>? routerConfig;

  @override
  Widget build(BuildContext context) {
    return RemixTheme(
      theme: theme,
      darkTheme: darkTheme,
      child: Builder(
        builder: (context) {
          const textStyle = TextStyle(color: Color(0xff000000));

          const accentColor = Color(0xFF0000FF);

          return routerConfig != null
              ? WidgetsApp.router(
                  key: key,
                  routeInformationProvider: routeInformationProvider,
                  routeInformationParser: routeInformationParser,
                  routerDelegate: routerDelegate,
                  routerConfig: routerConfig,
                  backButtonDispatcher: backButtonDispatcher,
                  builder: builder,
                  title: title,
                  onGenerateTitle: onGenerateTitle,
                  textStyle: textStyle,
                  color: color ?? accentColor,
                  locale: locale,
                  localizationsDelegates: localizationsDelegates,
                  localeListResolutionCallback: localeListResolutionCallback,
                  localeResolutionCallback: localeResolutionCallback,
                  supportedLocales: supportedLocales,
                  showPerformanceOverlay: showPerformanceOverlay,
                  showSemanticsDebugger: showSemanticsDebugger,
                  debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                  shortcuts: shortcuts,
                  actions: actions,
                  restorationScopeId: restorationScopeId,
                )
              : WidgetsApp(
                  key: GlobalObjectKey(this),
                  navigatorKey: navigatorKey,
                  onGenerateRoute: onGenerateRoute,
                  onGenerateInitialRoutes: onGenerateInitialRoutes,
                  onUnknownRoute: onUnknownRoute,
                  navigatorObservers: navigatorObservers,
                  initialRoute: initialRoute,
                  pageRouteBuilder: pageRouteBuilder ??
                      <T>(RouteSettings settings, WidgetBuilder builder) {
                        return m.MaterialPageRoute<T>(
                          builder: builder,
                          settings: settings,
                        );
                      },
                  home: home,
                  routes: routes,
                  builder: builder,
                  title: title,
                  onGenerateTitle: onGenerateTitle,
                  textStyle: textStyle,
                  color: color ?? accentColor,
                  locale: locale,
                  localizationsDelegates: localizationsDelegates,
                  localeListResolutionCallback: localeListResolutionCallback,
                  localeResolutionCallback: localeResolutionCallback,
                  supportedLocales: supportedLocales,
                  showPerformanceOverlay: showPerformanceOverlay,
                  showSemanticsDebugger: showSemanticsDebugger,
                  debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                  shortcuts: shortcuts,
                  actions: actions,
                  restorationScopeId: restorationScopeId,
                );
        },
      ),
    );
  }
}
