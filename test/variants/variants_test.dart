import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

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

  testWidgets('Variant onDark light', (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: StyledContainer(
        style: StyleMix(
          onDark(backgroundColor(Colors.teal)),
          backgroundColor(Colors.red),
        ),
      ),
    ));

    final colorWidget = tester.widget<Container>(find.byType(Container));
    expect(colorWidget.color, isNot(equals(Colors.black)));
  });

  testWidgets('Variant onDark dark', (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: StyledContainer(
        style: StyleMix(
          onDark(backgroundColor(Colors.teal)),
          backgroundColor(Colors.red),
        ),
      ),
    ));

    final colorWidget = tester.widget<Container>(find.byType(Container));
    expect(colorWidget.color, Colors.teal);
  });

  testWidgets('Variant onHover', (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: Pressable(
        onPressed: () {},
        child: StyledContainer(
          style: StyleMix(
            onHover(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    ));

    final colorWidget = tester.widget<Container>(find.byType(Container));
    expect(colorWidget.color, Colors.red);

    // TODO: Figure out how to simulate hover
    /*
    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);
    addTearDown(() => gesture.removePointer());
    await tester.pump();
    await gesture.moveTo(tester.getCenter(find.byType(StyledContainer)));
    await tester.pumpAndSettle();

    expect(colorWidget.color, Colors.teal);
    */
  });

  testWidgets('Variant onXSmall', (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: StyledContainer(
        style: StyleMix(
          onXSmall(backgroundColor(Colors.teal)),
          backgroundColor(Colors.red),
        ),
      ),
    ));

    final colorWidget = tester.widget<Container>(find.byType(Container));
    expect(colorWidget.color, Colors.red);

    // Set screen size to xsmall
    await tester.binding.setSurfaceSize(const Size(100, 100));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpAndSettle();

    final colorWidget2 = tester.widget<Container>(find.byType(Container));

    expect(colorWidget2.color, Colors.teal);
  });
}

/*
onXSmall
onMedium
onSmall
onLarge

onPortrait
onLandscape

onDark
onLight

onRTL
onLTR

onDisabled
onEnabled

onFocus
onHover
onPress
onLongPress

onNot
*/