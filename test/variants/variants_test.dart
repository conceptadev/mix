import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  testWidgets('System Theme Variants', (tester) async {
    final mix = MixFactory(
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
      home: const Box(
        mix: MixFactory(
          onNot(onDark)(bgColor(Colors.black)),
          h(50),
          w(50),
        ),
      ),
    ));

    final colorWidget = tester.widget<Container>(find.byType(Container));
    expect(colorWidget.color, Colors.black);
  });

  testWidgets('when Variant', (tester) async {
    bool hasError = true;

    Widget box() {
      return const Box(
        mix: MixFactory(
          when(hasError)(
            bgColor(Colors.red),
          )(
            bgColor(Colors.blue),
          ),
        ),
      );
    }

    await tester.pumpWidget(box());

    final whenWidget = tester.widget<Container>(find.byType(Container));
    expect(whenWidget.color, Colors.red);

    hasError = false;
    await tester.pumpWidget(box());

    final elseWidget = tester.widget<Container>(find.byType(Container));
    expect(elseWidget.color, Colors.blue);
  });
}
