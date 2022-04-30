import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  testWidgets('System Theme Variants', (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: Box(
        mix: Mix(
          (dark)(bgColor(Colors.black)),
          h(50),
          w(50),
        ),
      ),
    ));

    final colorWidget = tester.widget<Container>(find.byType(Container));
    expect(colorWidget.color, Colors.black);
  });

  testWidgets('not Variant', (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: Box(
        mix: Mix(
          not(dark)(bgColor(Colors.black)),
          h(50),
          w(50),
        ),
      ),
    ));

    final colorWidget = tester.widget<Container>(find.byType(Container));
    expect(colorWidget.color, Colors.black);
  });
}
