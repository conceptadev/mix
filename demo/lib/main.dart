import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_shell.dart';
import 'docs/docs.dart';
import 'providers/dark_mode.provider.dart';
import 'theme.dart';

void main() async {
  if (!kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    await DesktopWindow.setMinWindowSize(const Size(600, 600));
  }

  // setPathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(builder: (context, ref, _) {
        final darkMode = ref.watch(darkModeProvider);

        return MaterialApp(
          title: 'Mix Gallery',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          initialRoute: '/',
          routes: {
            '/': (context) => const AppShell(),
            '/docs/variants': (context) => const VariantsDefaultExample(),
            '/docs/variants/or': (context) => const VariantsOrOperator(),
            '/docs/variants/and': (context) => const VariantsAndOperator(),
            '/docs/variants/catalog/pressable': (context) =>
                const VariantsCatalogPressable(),
          },
          onUnknownRoute: (settings) {
            return PageRouteBuilder(pageBuilder: (context, _, __) {
              final theme = Theme.of(context);

              return Scaffold(
                body: Center(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      '404',
                      style: theme.textTheme.headlineLarge,
                    ),
                    Text(
                      'Sorry, we couldn\'t find the page you\'re looking for :/',
                      style: theme.textTheme.titleMedium,
                    ),
                  ]),
                ),
              );
            });
          },
          builder: (context, child) {
            return Material(
              child: child ?? const SizedBox.shrink(),
            );
          },
        );
      }),
    );
  }
}
