import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/context_finder.dart';
import '../../../helpers/testing_utils.dart';

extension _WidgetTesterX on WidgetTester {
  PressEventMixWidgetState findPressEventWidget() {
    return findWidgetOfType<PressEventMixWidgetState>();
  }
}

class _Counter {
  int value = 0;

  void increment() {
    value++;
  }
}

Future<TestGesture> _setupPressableWidgetWithInitialTests(
    WidgetTester tester, _Counter counter) async {
  await tester.pumpMaterialApp(
    PressableBox(
      onPress: counter.increment,
      onLongPress: () {},
      child: Text('$counter'),
    ),
  );

  // Initial state should be idle
  expect(tester.findPressEventWidget().event, PressEvent.idle);

  // Press down on the PressableBox
  final gesture = await tester.press(find.byType(PressableBox));

  await tester.pumpAndSettle();
  expect(tester.findPressEventWidget().event, PressEvent.onTapDown);

  return gesture;
}

void main() {
  testWidgets(
      'Pressable should transition through (onTapDown and onTapUp) states correctly',
      (tester) async {
    final counter = _Counter();
    final gesture =
        await _setupPressableWidgetWithInitialTests(tester, counter);

    // Release the press
    await gesture.up();
    await tester.pumpAndSettle();
    expect(tester.findPressEventWidget().event, PressEvent.onTapUp);

    expect(counter.value, equals(1));

    await tester.pump(const Duration(milliseconds: 300));
    expect(tester.findPressEventWidget().event, PressEvent.idle);
  });

  testWidgets(
      'Pressable should transition through (onTapDown and cancel) states correctly',
      (tester) async {
    final counter = _Counter();
    final gesture =
        await _setupPressableWidgetWithInitialTests(tester, counter);

    // Cancel the press
    await gesture.cancel();
    await tester.pumpAndSettle();

    await tester.pump(const Duration(milliseconds: 300));
    expect(tester.findPressEventWidget().event, PressEvent.idle);

    expect(counter.value, equals(0));
  });

  testWidgets(
      'Pressable should handle long press state transitions and maintain correct state',
      (tester) async {
    final counter = _Counter();
    final _ = await _setupPressableWidgetWithInitialTests(tester, counter);

    // Long press on the PressableBox
    await tester.longPress(find.byType(PressableBox));
    await tester.pumpAndSettle();

    expect(tester.findPressEventWidget().event, PressEvent.idle);

    BuildContext context = tester.element(find.byType(Text));
    final isLongPressed = $on.longPress.when(context);

    expect(isLongPressed, isTrue);
    expect(counter.value, equals(0));
  });
}
