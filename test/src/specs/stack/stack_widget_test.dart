import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  testWidgets('Stack', (tester) async {
    final style = Style(
      stack.fit.expand(),
      stack.alignment.topCenter(),
      stack.clipBehavior.antiAlias(),
      stack.textDirection.ltr(),
    );
    await tester.pumpMaterialApp(
      StyledStack(
        style: style,
        children: [
          Container(
            height: 100,
            width: 100,
            color: const Color(0xFF000000),
          ),
          Container(
            height: 50,
            width: 50,
            color: const Color(0xFF0000FF),
          ),
        ],
      ),
    );

    final stackWidget = tester.widget<Stack>(find.byType(Stack));

    expect(find.byType(Stack), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(2));
    expect(stackWidget.alignment, Alignment.topCenter);
    expect(stackWidget.fit, StackFit.expand);
    expect(stackWidget.clipBehavior, Clip.antiAlias);
    expect(stackWidget.textDirection, TextDirection.ltr);
  });

  testWidgets('ZBox', (tester) async {
    final style = Style(
      stack.fit.expand(),
      stack.alignment.topCenter(),
      stack.textDirection.ltr(),
      stack.clipBehavior.antiAlias(),
      backgroundColor(Colors.red),
    );

    await tester.pumpMaterialApp(
      ZBox(
        style: style,
        children: const [],
      ),
    );

    final stackWidget = tester.widget<Stack>(find.byType(Stack));
    final container = tester.widget<Container>(find.byType(Container));

    expect(find.byType(Stack), findsOneWidget);

    expect(find.byType(Container), findsOneWidget);

    expect((container.decoration as BoxDecoration).color, Colors.red);

    expect(stackWidget.alignment, Alignment.topCenter);
    expect(stackWidget.fit, StackFit.expand);
    expect(stackWidget.clipBehavior, Clip.antiAlias);
    expect(stackWidget.textDirection, TextDirection.ltr);
  });
}
