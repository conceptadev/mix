import 'package:example/providers/dark_mode.provider.dart';
import 'package:example/remix/screens/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final darkMode = ref.watch(darkModeProvider).state;
      return MaterialApp(
        title: 'Remix',
        debugShowCheckedModeBanner: false,
        theme: darkMode ? ThemeData.dark() : ThemeData.light(),
        home: AppShell(),
      );
    });
  }
}
