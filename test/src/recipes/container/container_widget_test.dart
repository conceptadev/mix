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

    final boxDecorationAttr = box.decoration(
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
    final containerWidget = tester.widget<Container>(containerFinder);

    final containerSpec = boxDecorationAttr.resolve(EmptyMixData);

    expect(containerWidget.padding, containerSpec.padding);
    expect(containerWidget.margin, containerSpec.margin);
    expect(containerWidget.alignment, containerSpec.alignment);
    expect(containerWidget.clipBehavior, containerSpec.clipBehavior);
    expect(containerWidget.decoration, isA<BoxDecoration>());
    expect(containerWidget.decoration, equals(containerSpec.decoration));
  });
}
