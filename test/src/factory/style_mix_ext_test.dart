import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  final keyOne = UniqueKey();
  final keyTwo = UniqueKey();
  final keyThree = UniqueKey();
  testWidgets('Style.container matches StyledContainer(style:Style)',
      (tester) async {
    final style = Style(
      box.decoration(
        border: Border.all(
          color: Colors.red,
        ),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: [
            style.container(child: const SizedBox(), key: keyOne),
            Box(
              key: keyTwo,
              style: style,
              child: const SizedBox(),
            ),
            Box(
              key: keyThree,
              style: const Style.empty(),
              child: const SizedBox(),
            ),
          ],
        ),
      ),
    );

    final containerOne = tester.widget<Box>(find.byKey(keyOne));
    final containerTwo = tester.widget<Box>(find.byKey(keyTwo));
    final containerThree = tester.widget<Box>(find.byKey(keyThree));

    expect(containerOne.style, style);
    expect(containerTwo.style, style);
    expect(containerThree.style, isNot(style));
  });

  testWidgets('Style.box matches StyledContainer(style:Style)', (tester) async {
    final style = Style(
      box.decoration(
        border: Border.all(color: Colors.red),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: [
            style.box(child: const SizedBox(), key: keyOne),
            Box(
              key: keyTwo,
              style: style,
              child: const SizedBox(),
            ),
            Box(
              key: keyThree,
              style: const Style.empty(),
              child: const SizedBox(),
            ),
          ],
        ),
      ),
    );

    final containerOne = tester.widget<Box>(find.byKey(keyOne));
    final containerTwo = tester.widget<Box>(find.byKey(keyTwo));
    final containerThree = tester.widget<Box>(find.byKey(keyThree));

    expect(containerOne.style, style, reason: 'containerOne.style');
    expect(containerTwo.style, style, reason: 'containerTwo.style');
    expect(containerThree.style, isNot(style), reason: 'containerThree.style');
  });

  testWidgets('Style.hbox matches HBox(style:Style)', (tester) async {
    final style = Style(box.decoration(border: Border.all(color: Colors.red)));

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: [
            style.hbox(children: [const SizedBox()], key: keyOne),
            HBox(
              style: style,
              key: keyTwo,
              children: const [SizedBox()],
            ),
            HBox(
              style: const Style.empty(),
              key: keyThree,
              children: const [SizedBox()],
            ),
          ],
        ),
      ),
    );

    final containerOne = tester.widget<HBox>(find.byKey(keyOne));
    final containerTwo = tester.widget<HBox>(find.byKey(keyTwo));
    final containerThree = tester.widget<HBox>(find.byKey(keyThree));

    expect(containerOne.style, style);
    expect(containerTwo.style, style);
    expect(containerThree.style, isNot(style));
  });

  testWidgets('Style.row matches StyledRow(style:Style)', (tester) async {
    final style = Style(
      box.decoration(
        border: Border.all(color: Colors.red),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: [
            style.row(children: [const SizedBox()], key: keyOne),
            StyledRow(
              key: keyTwo,
              style: style,
              children: const [SizedBox()],
            ),
            StyledRow(
              key: keyThree,
              style: const Style.empty(),
              children: const [SizedBox()],
            ),
          ],
        ),
      ),
    );

    final containerOne = tester.widget<StyledRow>(find.byKey(keyOne));
    final containerTwo = tester.widget<StyledRow>(find.byKey(keyTwo));
    final containerThree = tester.widget<StyledRow>(find.byKey(keyThree));

    expect(containerOne.style, style);
    expect(containerTwo.style, style);
    expect(containerThree.style, isNot(style));
  });

  testWidgets('Style.text matches StyledText(style:Style)', (tester) async {
    final style = Style(text.style(color: Colors.red));

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: [
            style.text('text', key: keyOne),
            StyledText(
              'text',
              key: keyTwo,
              style: style,
            ),
            StyledText(
              'text',
              key: keyThree,
              style: const Style.empty(),
            ),
          ],
        ),
      ),
    );

    final containerOne = tester.widget<StyledText>(find.byKey(keyOne));
    final containerTwo = tester.widget<StyledText>(find.byKey(keyTwo));
    final containerThree = tester.widget<StyledText>(find.byKey(keyThree));

    expect(containerOne.style, style);
    expect(containerTwo.style, style);
    expect(containerThree.style, isNot(style));
  });

  testWidgets('Style.vbox matches VBox(style:Style)', (tester) async {
    final style = Style(box.decoration(border: Border.all(color: Colors.red)));

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: [
            style.vbox(children: [const SizedBox()], key: keyOne),
            VBox(
              style: style,
              key: keyTwo,
              children: const [SizedBox()],
            ),
            VBox(
              style: const Style.empty(),
              key: keyThree,
              children: const [SizedBox()],
            ),
          ],
        ),
      ),
    );

    final containerOne = tester.widget<VBox>(find.byKey(keyOne));
    final containerTwo = tester.widget<VBox>(find.byKey(keyTwo));
    final containerThree = tester.widget<VBox>(find.byKey(keyThree));

    expect(containerOne.style, style);
    expect(containerTwo.style, style);
    expect(containerThree.style, isNot(style));
  });

  testWidgets('Style.column matches StyledColumn(style:Style)', (tester) async {
    final style = Style(
      box.decoration(
        border: Border.all(
          color: Colors.red,
        ),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: [
            style.column(children: [const SizedBox()], key: keyOne),
            StyledColumn(
              key: keyTwo,
              style: style,
              children: const [SizedBox()],
            ),
            StyledColumn(
              key: keyThree,
              style: const Style.empty(),
              children: const [SizedBox()],
            ),
          ],
        ),
      ),
    );

    final containerOne = tester.widget<StyledColumn>(find.byKey(keyOne));
    final containerTwo = tester.widget<StyledColumn>(find.byKey(keyTwo));
    final containerThree = tester.widget<StyledColumn>(find.byKey(keyThree));

    expect(containerOne.style, style);
    expect(containerTwo.style, style);
    expect(containerThree.style, isNot(style));
  });

  testWidgets('Style.icon matches StyledIcon(style:Style)', (tester) async {
    final style = Style(icon.color.red());

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: [
            style.icon(Icons.ac_unit, key: keyOne),
            StyledIcon(
              Icons.ac_unit,
              key: keyTwo,
              style: style,
            ),
            StyledIcon(
              Icons.ac_unit,
              key: keyThree,
              style: const Style.empty(),
            ),
          ],
        ),
      ),
    );

    final containerOne = tester.widget<StyledIcon>(find.byKey(keyOne));
    final containerTwo = tester.widget<StyledIcon>(find.byKey(keyTwo));
    final containerThree = tester.widget<StyledIcon>(find.byKey(keyThree));

    expect(containerOne.style, style);
    expect(containerTwo.style, style);
    expect(containerThree.style, isNot(style));
  });
}
