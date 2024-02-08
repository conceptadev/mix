import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('PressableNotifier', () {
    const gestureData = PressableStateData(
      focused: true,
      disabled: false,
      state: PressableState.pressed,
      cursorPosition: PressableCursorPosition(
        alignment: Alignment.center,
        offset: Offset.zero,
      ),
    );
    test('constructor', () {
      final notifier = PressableDataNotifier(
        data: gestureData,
        child: Container(),
      );

      expect(notifier.data.state, PressableState.pressed);
      expect(notifier.data.focused, true);
      expect(notifier.child, isA<Container>());
    });

    test('of', () {
      final notifier = PressableDataNotifier(
        data: gestureData,
        child: Container(),
      );

      final otherNotifier = PressableDataNotifier(
        data: const PressableStateData(
          focused: false,
          disabled: true,
          state: PressableState.none,
          cursorPosition: PressableCursorPosition(
            alignment: Alignment.center,
            offset: Offset.zero,
          ),
        ),
        child: Container(),
      );

      final sameNotifier = PressableDataNotifier(
        data: gestureData,
        child: Container(),
      );

      expect(notifier.updateShouldNotify(otherNotifier), true);
      expect(notifier.updateShouldNotify(sameNotifier), false);
      expect(
        () => PressableDataNotifier.of(MockBuildContext()),
        throwsAssertionError,
      );
    });

    testWidgets('can get it from context', (tester) async {
      await tester.pumpWithPressable(
        Container(),
        state: PressableState.pressed,
        focus: true,
      );

      final context = tester.element(find.byType(Container));

      final notifier = PressableDataNotifier.of(context);

      expect(notifier, isA<PressableStateData>());
      expect(notifier.state, PressableState.pressed);
      expect(notifier.focused, true);
    });
  });
}
