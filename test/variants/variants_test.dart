import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  testWidgets('System Theme Variants', (tester) async {
    final mix = Mix(
      bgColor(Colors.green),
      onDark(bgColor(Colors.black)),
      h(50),
      w(50),
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        home: Box(
          mix: mix,
        ),
      ),
    );
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
          onNot(onDark)(bgColor(Colors.black)),
          h(50),
          w(50),
        ),
      ),
    ));

    final colorWidget = tester.widget<Container>(find.byType(Container));
    expect(colorWidget.color, Colors.black);
  });
}
