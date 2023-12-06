import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('PressableNotifier', () {
    const gestureData = GestureData(
      state: GestureState.pressed,
      status: GestureStatus.enabled,
      focus: true,
      hover: false,
    );
    test('constructor', () {
      final notifier = GestureStateNotifier(
        data: gestureData,
        child: Container(),
      );

      expect(notifier.data.state, GestureState.pressed);
      expect(notifier.data.focus, true);
      expect(notifier.child, isA<Container>());
    });

    test('of', () {
      final notifier = GestureStateNotifier(
        data: gestureData,
        child: Container(),
      );

      final otherNotifier = GestureStateNotifier(
        data: const GestureData(
          focus: false,
          state: GestureState.none,
          status: GestureStatus.disabled,
          hover: false,
        ),
        child: Container(),
      );

      final sameNotifier = GestureStateNotifier(
        data: gestureData,
        child: Container(),
      );

      expect(notifier.updateShouldNotify(otherNotifier), true);
      expect(notifier.updateShouldNotify(sameNotifier), false);
      expect(GestureStateNotifier.of(MockBuildContext()), null);
    });

    testWidgets('can get it from context', (tester) async {
      await tester.pumpWithPressable(
        Container(),
        state: GestureState.pressed,
        focus: true,
      );

      final context = tester.element(find.byType(Container));

      final notifier = GestureStateNotifier.of(context);

      expect(notifier, isA<GestureData>());
      expect(notifier!.state, GestureState.pressed);
      expect(notifier.focus, true);
    });
  });
}
