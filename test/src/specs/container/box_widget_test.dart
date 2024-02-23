import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  testWidgets('Box', (WidgetTester tester) async {
    final paddingAttr = box.padding(10);
    final marginAttr = box.margin(15);
    final alignmentAttr = box.alignment.center();
    final clipAttr = box.clipBehavior.hardEdge();

    final boxDecorationAttr = box.decoration(
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
            height(100),
            width(100),
            align(),
          ),
          child: const Box(),
        ),
      );

      expect(find.byType(Align), findsOneWidget);
    },
  );

  testWidgets(
    'AnimatedBox should apply decorators only once',
    (tester) async {
      await tester.pumpMaterialApp(
        AnimatedBox(
          duration: Duration.zero,
          style: Style(
            height(100),
            width(100),
            align(),
          ),
          child: const AnimatedBox(
            duration: Duration.zero,
          ),
        ),
      );

      expect(find.byType(Align), findsOneWidget);
    },
  );
}
