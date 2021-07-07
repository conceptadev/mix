import 'package:example/remix/theme.dart';
import 'package:example/remix/theme_provider.dart';
import 'package:example/remix/typography/typography.preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    RemixTheme(
      data: RemixThemeData(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mix Demo',
      theme: ThemeData.light(),
      home: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          title: Text('Mix Demo'),
        ),
        body: TypographyPreview(),
      ),
    );
  }
}
