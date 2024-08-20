import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/override_modifiers_order.dart';
import '../../../helpers/testing_utils.dart';

void main() {
  testWidgets('Stack', (tester) async {
    final style = Style(
      $stack.fit.expand(),
      $stack.alignment.topCenter(),
      $stack.clipBehavior.antiAlias(),
      $stack.textDirection.ltr(),
    );
    await tester.pumpMaterialApp(
      StyledStack(
        style: style,
        children: [
          Container(color: const Color(0xFF000000), width: 100, height: 100),
          Container(color: const Color(0xFF0000FF), width: 50, height: 50),
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

  testWidgets('StackSpec handles onEnd', (WidgetTester tester) async {
    var countPressTime = 0;
    var countOnEnd = 0;

    await tester.pumpMaterialApp(
      PressableBox(
        onPress: () {
          countPressTime++;
        },
        child: SpecBuilder(
          style: Style(
            $stack.wrap.transform.scale(1),
            $on.press(
              $stack.wrap.transform.scale(1.5),
            ),
          ).animate(),
          builder: (context) {
            final spec = StackSpec.of(context);

            return StackSpecWidget(
              spec: spec,
              onEndSpecModifiersAnimation: () => countOnEnd++,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                )
              ],
            );
          },
        ),
      ),
    );

    final containerFinder = find.byType(Pressable);
    await tester.tap(containerFinder);

    await tester.pumpAndSettle();

    expect(countPressTime, 1);
    expect(countOnEnd, 1);
  });

  testWidgets('ZBox', (tester) async {
    final style = Style(
      $stack.fit.expand(),
      $stack.alignment.topCenter(),
      $stack.textDirection.ltr(),
      $stack.clipBehavior.antiAlias(),
      $box.color(Colors.red),
    );

    await tester.pumpMaterialApp(ZBox(style: style, children: const []));

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

  testWidgets(
    'StyledStack should apply modifiers only once',
    (tester) async {
      await tester.pumpMaterialApp(
        StyledStack(
          style: Style(
            $flex.gap(10),
            $with.align(),
          ),
          children: const [
            SizedBox(
              height: 10,
              width: 20,
            ),
          ],
        ),
      );

      expect(find.byType(Align), findsOneWidget);
    },
  );

  testWidgets(
    'ZBox should apply modifiers only once',
    (tester) async {
      await tester.pumpMaterialApp(
        ZBox(
          style: Style(
            $flex.gap(10),
            $stack.alignment.center(),
            $with.align(),
          ),
          children: const [
            SizedBox(
              height: 10,
              width: 20,
            ),
          ],
        ),
      );

      expect(find.byType(Align), findsOneWidget);
    },
  );

  testWidgets(
    'Renders modifiers in the correct order with many overrides',
    (tester) async {
      testOverrideModifiersOrder(
        tester,
        widgetBuilder: (style, orderOfModifiers) {
          return ZBox(
            style: style,
            orderOfModifiers: orderOfModifiers,
          );
        },
      );
    },
  );
}
