import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/core/widget_state/internal/gesture_mix_state.dart';

import '../../../helpers/context_finder.dart';
import '../../../helpers/testing_utils.dart';

extension _WidgetTesterX on WidgetTester {
  PressEventMixWidgetState findPressEventWidget() {
    return findWidgetOfType<PressEventMixWidgetState>();
  }
}

void main() {
  testWidgets(
      'Pressable should transition through (onTapDown and onTapUp) states correctly',
      (tester) async {
    int counter = 0;
    await tester.pumpMaterialApp(
      PressableBox(
        onPress: () {
          counter++;
        },
        child: Text('$counter'),
      ),
    );

    // Initial state should be idle
    expect(tester.findPressEventWidget().event, PressEvent.idle);

    // Press down on the PressableBox
    final gesture = await tester.press(find.byType(PressableBox));
    await tester.pumpAndSettle();
    expect(tester.findPressEventWidget().event, PressEvent.onTapDown);

    // Release the press
    await gesture.up();
    await tester.pumpAndSettle();
    expect(tester.findPressEventWidget().event, PressEvent.onTapUp);

    expect(counter, equals(1));

    await tester.pump(const Duration(milliseconds: 300));
    expect(tester.findPressEventWidget().event, PressEvent.idle);
  });
}
