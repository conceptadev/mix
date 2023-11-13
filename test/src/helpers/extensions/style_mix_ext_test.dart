import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  final keyOne = UniqueKey();
  final keyTwo = UniqueKey();
  final keyThree = UniqueKey();
  testWidgets('StyleMix.container matches StyledContainer(style:StyleMix)',
      (tester) async {
    final style = StyleMix(boxDecoration(border: border(color: Colors.red)));

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: [
            style.container(child: const SizedBox(), key: keyOne),
            StyledContainer(
              key: keyTwo,
              style: style,
              child: const SizedBox(),
            ),
            StyledContainer(
              key: keyThree,
              style: StyleMix.empty,
              child: const SizedBox(),
            ),
          ],
        ),
      ),
    );

    final containerOne = tester.widget<StyledContainer>(find.byKey(keyOne));
    final containerTwo = tester.widget<StyledContainer>(find.byKey(keyTwo));
    final containerThree = tester.widget<StyledContainer>(find.byKey(keyThree));

    expect(containerOne.style, style);
    expect(containerTwo.style, style);
    expect(containerThree.style, isNot(style));
  });

  testWidgets('StyleMix.box matches StyledContainer(style:StyleMix)',
      (tester) async {
    final style = StyleMix(
      boxDecoration(
        border: border(color: Colors.red),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: [
            style.box(child: const SizedBox(), key: keyOne),
            StyledContainer(
              key: keyTwo,
              style: style,
              child: const SizedBox(),
            ),
            StyledContainer(
              key: keyThree,
              style: StyleMix.empty,
              child: const SizedBox(),
            ),
          ],
        ),
      ),
    );

    final containerOne = tester.widget<StyledContainer>(find.byKey(keyOne));
    final containerTwo = tester.widget<StyledContainer>(find.byKey(keyTwo));
    final containerThree = tester.widget<StyledContainer>(find.byKey(keyThree));

    expect(containerOne.style, style, reason: 'containerOne.style');
    expect(containerTwo.style, style, reason: 'containerTwo.style');
    expect(containerThree.style, isNot(style), reason: 'containerThree.style');
  });

  testWidgets('StyleMix.hbox matches HBox(style:StyleMix)', (tester) async {
    final style = StyleMix(boxDecoration(border: border(color: Colors.red)));

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: [
            style.hbox(children: [const SizedBox()], key: keyOne),
            HBox(
              key: keyTwo,
              style: style,
              children: const [SizedBox()],
            ),
            HBox(
              key: keyThree,
              style: StyleMix.empty,
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

  testWidgets('StyleMix.row matches StyledRow(style:StyleMix)', (tester) async {
    final style = StyleMix(boxDecoration(border: border(color: Colors.red)));

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
              style: StyleMix.empty,
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

  testWidgets('StyleMix.text matches StyledText(style:StyleMix)',
      (tester) async {
    final style = StyleMix(textStyle(color: Colors.red));

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
              style: StyleMix.empty,
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

  testWidgets('StyleMix.vbox matches VBox(style:StyleMix)', (tester) async {
    final style = StyleMix(boxDecoration(border: border(color: Colors.red)));

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: [
            style.vbox(children: [const SizedBox()], key: keyOne),
            VBox(
              key: keyTwo,
              style: style,
              children: const [SizedBox()],
            ),
            VBox(
              key: keyThree,
              style: StyleMix.empty,
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

  testWidgets('StyleMix.column matches StyledColumn(style:StyleMix)',
      (tester) async {
    final style = StyleMix(boxDecoration(border: border(color: Colors.red)));

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
              style: StyleMix.empty,
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

  testWidgets('StyleMix.icon matches StyledIcon(style:StyleMix)',
      (tester) async {
    final style = StyleMix(iconColor(Colors.black));

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
              style: StyleMix.empty,
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
