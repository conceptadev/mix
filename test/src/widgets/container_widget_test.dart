import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  testWidgets('StyledContainer', (WidgetTester tester) async {
    final paddingAttr = padding(10);
    final marginAttr = margin(10);
    final backgroundColorAttr = backgroundColor(Colors.red);
    final alignmentAttr = alignment.center();
    final clipAttr = clip.hardEdge();

    final boxDecorationAttr = boxDecoration(
      border: border(color: Colors.red, width: 1, style: BorderStyle.solid),
      borderRadius: borderRadius(10),
      color: const ColorAttribute(Colors.red),
    );

    await tester.pumpStyledWidget(
      StyledContainer(
        style: StyleMix(
          paddingAttr,
          marginAttr,
          backgroundColorAttr,
          alignmentAttr,
          clipAttr,
          boxDecorationAttr,
        ),
      ),
    );

    final containerFinder = find.byType(Container);
    Container containerWidget = tester.widget<Container>(containerFinder);

    final containerDecoration = containerWidget.decoration as BoxDecoration;

    final resolvedDecoration = boxDecorationAttr.resolve(EmptyMixData);

    expect(containerFinder, findsOneWidget);
    expect(containerWidget.margin, marginAttr.resolve(EmptyMixData));
    expect(containerWidget.padding, paddingAttr.resolve(EmptyMixData));
    expect(containerWidget.clipBehavior, clipAttr.resolve(EmptyMixData));
    expect(containerWidget.alignment, alignmentAttr.resolve(EmptyMixData));
    expect(containerWidget.clipBehavior, clipAttr.resolve(EmptyMixData));
    expect(containerDecoration.border, resolvedDecoration.border);
    expect(containerDecoration.color, resolvedDecoration.color);
    expect(containerDecoration.borderRadius, resolvedDecoration.borderRadius);
  });
}
