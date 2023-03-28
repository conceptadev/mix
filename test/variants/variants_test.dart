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
        theme: ThemeData.dark(),
        home: Box(
          mix: mix,
        ),
      ),
    );
    final containerWidget =
        find.byType(Container).evaluate().first.widget as Container;

    final widgetFinder = find.byType(BoxMixedWidget);

    // Get BuildContext for boxWidget
    BuildContext context = tester.element(widgetFinder);

    expect(context.brightness, Brightness.dark);
    expect(containerWidget.color, isNot(equals(Colors.green)));
    expect(containerWidget.color, Colors.black);
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

  testWidgets('when Variant', (tester) async {
    bool hasError = true;

    Widget box() {
      return Box(
        mix: Mix(
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
