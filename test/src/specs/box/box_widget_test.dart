import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  testWidgets('Box', (WidgetTester tester) async {
    final paddingAttr = $box.padding(10);
    final marginAttr = $box.margin(15);
    final alignmentAttr = $box.alignment.center();
    final clipAttr = $box.clipBehavior.hardEdge();

    final boxDecorationAttr = $box.decoration(
      border: Border.all(color: Colors.red, width: 1, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(10),
      color: Colors.red,
    );

    await tester.pumpStyledWidget(
      Box(
        style: Style(
          paddingAttr,
          marginAttr,
          alignmentAttr,
          clipAttr,
          boxDecorationAttr,
        ),
      ),
    );

    final containerFinder = find.byType(Container);
    final containerWidget = tester.widget<Container>(containerFinder);

    expect(containerWidget.padding, const EdgeInsets.all(10));
    expect(containerWidget.margin, const EdgeInsets.all(15));
    expect(containerWidget.alignment, Alignment.center);
    expect(containerWidget.clipBehavior, Clip.hardEdge);
    expect(
      containerWidget.decoration,
      BoxDecoration(
        color: Colors.red,
        border:
            Border.all(color: Colors.red, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  });

  testWidgets(
    'Box should apply decorators only once',
    (tester) async {
      await tester.pumpMaterialApp(
        Box(
          style: Style(
            $box.height(100),
            $box.width(100),
            $with.align(),
          ),
          child: const Box(),
        ),
      );

      expect(find.byType(Align), findsOneWidget);
    },
  );
  testWidgets('BoxSpec properties should match Container properties',
      (WidgetTester tester) async {
    final boxSpec = BoxSpec(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      constraints: const BoxConstraints(minWidth: 100, maxHeight: 200),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      foregroundDecoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2),
      ),
      transform: Matrix4.rotationZ(0.1),
      transformAlignment: Alignment.topLeft,
      clipBehavior: Clip.antiAlias,
      width: 150,
      height: 100,
    );

    const containerKey = Key('container');
    final container = Container(
      key: containerKey,
      alignment: boxSpec.alignment,
      padding: boxSpec.padding,
      margin: boxSpec.margin,
      constraints: boxSpec.constraints,
      decoration: boxSpec.decoration,
      foregroundDecoration: boxSpec.foregroundDecoration,
      transform: boxSpec.transform,
      transformAlignment: boxSpec.transformAlignment,
      clipBehavior: boxSpec.clipBehavior ?? Clip.none,
      width: boxSpec.width,
      height: boxSpec.height,
    );

    const boxKey = Key('box');
    final box = BoxSpecWidget(key: boxKey, spec: boxSpec);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              box,
              container,
            ],
          ),
        ),
      ),
    );

    final containerFinder = find.byKey(containerKey);
    expect(containerFinder, findsOneWidget);

    final boxFinder = find.byKey(boxKey);
    expect(boxFinder, findsOneWidget);

    final containerWidget = tester.widget<Container>(containerFinder);
    final boxWidget = tester.widget<Container>(find.descendant(
      of: boxFinder,
      matching: find.byType(Container),
    ));

    expect(containerWidget.alignment, boxWidget.alignment);
    expect(containerWidget.padding, boxWidget.padding);
    expect(containerWidget.margin, boxWidget.margin);
    expect(containerWidget.constraints, boxWidget.constraints);
    expect(containerWidget.decoration, boxWidget.decoration);
    expect(
        containerWidget.foregroundDecoration, boxWidget.foregroundDecoration);
    expect(containerWidget.transform, boxWidget.transform);
    expect(containerWidget.transformAlignment, boxWidget.transformAlignment);
    expect(containerWidget.clipBehavior, boxWidget.clipBehavior);
    expect(containerWidget.constraints, boxWidget.constraints);
  });
}
