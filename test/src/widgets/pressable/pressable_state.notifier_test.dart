import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('PressableNotifier', () {
    const gestureData = PressableStateData(
      focus: true,
      disabled: false,
      state: PressableState.pressed,
    );
    test('constructor', () {
      final notifier = PressableStateNotifier(
        data: gestureData,
        child: Container(),
      );

      expect(notifier.data.state, PressableState.pressed);
      expect(notifier.data.focus, true);
      expect(notifier.child, isA<Container>());
    });

    test('of', () {
      final notifier = PressableStateNotifier(
        data: gestureData,
        child: Container(),
      );

      final otherNotifier = PressableStateNotifier(
        data: const PressableStateData(
          focus: false,
          disabled: true,
          state: PressableState.none,
        ),
        child: Container(),
      );

      final sameNotifier = PressableStateNotifier(
        data: gestureData,
        child: Container(),
      );

      expect(notifier.updateShouldNotify(otherNotifier), true);
      expect(notifier.updateShouldNotify(sameNotifier), false);
      expect(PressableStateNotifier.of(MockBuildContext()), null);
    });

    testWidgets('can get it from context', (tester) async {
      await tester.pumpWithPressable(
        Container(),
        state: PressableState.pressed,
        focus: true,
      );

      final context = tester.element(find.byType(Container));

      final notifier = PressableStateNotifier.of(context);

      expect(notifier, isA<PressableStateData>());
      expect(notifier!.state, PressableState.pressed);
      expect(notifier.focus, true);
    });
  });
}
