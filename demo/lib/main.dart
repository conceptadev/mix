import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_shell.dart';
import 'providers/dark_mode.provider.dart';

void main() {
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
          title: 'Remix',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Inter',
          ),
          darkTheme: ThemeData(
            fontFamily: 'Inter',
            colorScheme: ColorScheme.fromSwatch(
              brightness: Brightness.dark,
            ),
          ),
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          home: const AppShell(),
        );
      }),
    );
  }
}
