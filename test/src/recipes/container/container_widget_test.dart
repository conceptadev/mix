import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  testWidgets('StyledContainer', (WidgetTester tester) async {
    final paddingAttr = padding(10);
    final marginAttr = margin(10);
    final alignmentAttr = alignment.center();
    final clipAttr = clipBehavior.hardEdge();

    final boxDecorationAttr = boxDecoration(
      border: Border.all(color: Colors.red, width: 1, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(10),
      color: Colors.red,
    );

    await tester.pumpStyledWidget(
      StyledContainer(
        style: StyleMix(
          paddingAttr,
          marginAttr,
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
    expect(containerWidget.clipBehavior, clipAttr.value);
    expect(containerWidget.alignment, alignmentAttr.value);
    expect(containerWidget.clipBehavior, clipAttr.value);
    expect(containerDecoration.border, resolvedDecoration.border);
    expect(containerDecoration.color, resolvedDecoration.color);
    expect(containerDecoration.borderRadius, resolvedDecoration.borderRadius);
  });
}
