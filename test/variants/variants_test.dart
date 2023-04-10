import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/aliases/container_alias.dart';
import 'package:mix/src/aliases/context_variants_alias.dart';
import 'package:mix/src/extensions/build_context_ext.dart';
import 'package:mix/src/factory/style_mix.dart';
import 'package:mix/src/widgets/container/container.widget.dart';

void main() {
  testWidgets('System Theme Variants', (tester) async {
    final style = StyleMix(
      backgroundColor(Colors.green),
      onDark(backgroundColor(Colors.black)),
      height(50),
      width(50),
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.dark(),
        home: StyledContainer(
          style: style,
        ),
      ),
    );
    final containerWidget =
        find.byType(Container).evaluate().first.widget as Container;

    final widgetFinder = find.byType(MixedContainer);

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
      home: StyledContainer(
        style: StyleMix(
          onNot(onDark)(backgroundColor(Colors.black)),
          height(50),
          width(50),
        ),
      ),
    ));

    final colorWidget = tester.widget<Container>(find.byType(Container));
    expect(colorWidget.color, Colors.black);
  });
}
