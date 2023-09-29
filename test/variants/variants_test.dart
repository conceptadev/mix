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
        home: StyledContainer(style: style),
        theme: ThemeData.dark(),
      ),
    );
    final containerWidget =
        find.byType(Container).evaluate().first.widget as Container;

    final widgetFinder = find.byType(MixedContainer);

    // Get BuildContext for boxWidget.
    BuildContext context = tester.element(widgetFinder);

    expect(context.brightness, Brightness.dark);
    expect(containerWidget.color, isNot(equals(Colors.green)));
    expect(containerWidget.color, Colors.black);
  });

  testWidgets('not Variant', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: StyledContainer(
        style: StyleMix(
          onNot(onDark)(backgroundColor(Colors.black)),
          height(50),
          width(50),
        ),
      ),
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
    ));

    final colorWidget = tester.widget<Container>(find.byType(Container));
    expect(colorWidget.color, Colors.black);
  });

  testWidgets('Variant onDark light', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: StyledContainer(
        style: StyleMix(
          onDark(backgroundColor(Colors.teal)),
          backgroundColor(Colors.red),
        ),
      ),
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
    ));

    final colorWidget = tester.widget<Container>(find.byType(Container));
    expect(colorWidget.color, isNot(equals(Colors.black)));
  });

  testWidgets('Variant onDark dark', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: StyledContainer(
        style: StyleMix(
          onDark(backgroundColor(Colors.teal)),
          backgroundColor(Colors.red),
        ),
      ),
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
    ));

    final colorWidget = tester.widget<Container>(find.byType(Container));
    expect(colorWidget.color, Colors.teal);
  });

  testWidgets('Variant onHover', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Pressable(
        child: StyledContainer(
          style: StyleMix(
            onHover(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
        onPressed: () {},
      ),
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
    ));

    final colorWidget = tester.widget<Container>(find.byType(Container));
    expect(colorWidget.color, Colors.red);

    // TODO: Figure out how to simulate hover.
  });

  testWidgets('Variant onXSmall', (tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(1000, 1000)),
        child: StyledContainer(
          style: StyleMix(
            onXSmall(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.red);

    // Set screen size to xsmall.
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(100, 100)),
        child: StyledContainer(
          style: StyleMix(
            onXSmall(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.teal);
  });

  testWidgets('Variant onSmall', (tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(3000, 3000)),
        child: StyledContainer(
          style: StyleMix(
            onSmall(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.red);
    // Set screen size to small.
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(300, 300)),
        child: StyledContainer(
          style: StyleMix(
            onSmall(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.teal);
  });

  testWidgets('Variant onMedium', (tester) async {
    // Set screen size to medium.
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(3000, 3000)),
        child: StyledContainer(
          style: StyleMix(
            onMedium(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.red);

    // Set screen size to medium.
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(1300, 1300)),
        child: StyledContainer(
          style: StyleMix(
            onMedium(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.teal);
  });

  testWidgets('Variant onLarge', (tester) async {
    // Set screen size to large.
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(3000, 3000)),
        child: StyledContainer(
          style: StyleMix(
            onLarge(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.teal);

    // Set screen size to large.
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(2000, 2000)),
        child: StyledContainer(
          style: StyleMix(
            onLarge(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.teal);
  });

  testWidgets('Variant onPortrait', (tester) async {
    // Set screen size to portrait.
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(2000, 1000)),
        child: StyledContainer(
          style: StyleMix(
            onPortrait(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.red);

    // Set screen size to portrait.
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(1000, 2000)),
        child: StyledContainer(
          style: StyleMix(
            onPortrait(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.teal);
  });

  testWidgets('Variant onLandscape', (tester) async {
    // Set screen size to landscape.
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(2000, 1000)),
        child: StyledContainer(
          style: StyleMix(
            onLandscape(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.teal);

    // Set screen size to landscape.
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(1000, 2000)),
        child: StyledContainer(
          style: StyleMix(
            onLandscape(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.red);
  });

  testWidgets('Variant onRTL', (tester) async {
    // Set screen size to RTL.
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.rtl,
        child: StyledContainer(
          style: StyleMix(
            onRTL(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.teal);

    // Set screen size to RTL.
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: StyledContainer(
          style: StyleMix(
            onRTL(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.red);
  });

  testWidgets('Variant onLTR', (tester) async {
    // Set screen size to LTR.
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: StyledContainer(
          style: StyleMix(
            onLTR(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.teal);

    // Set screen size to LTR.
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.rtl,
        child: StyledContainer(
          style: StyleMix(
            onLTR(backgroundColor(Colors.teal)),
            backgroundColor(Colors.red),
          ),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).color, Colors.red);
  });

  // TODO: Figure out how to test enabed/disabled.
}
