import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('PressableNotifier', () {
    const gestureData = WidgetStateData(
      state: WidgetState.pressed,
      status: WidgetStatus.enabled,
      focus: true,
      hover: false,
    );
    test('constructor', () {
      final notifier = WidgetStateNotifier(
        data: gestureData,
        child: Container(),
      );

      expect(notifier.data.state, WidgetState.pressed);
      expect(notifier.data.focus, true);
      expect(notifier.child, isA<Container>());
    });

    test('of', () {
      final notifier = WidgetStateNotifier(
        data: gestureData,
        child: Container(),
      );

      final otherNotifier = WidgetStateNotifier(
        data: const WidgetStateData(
          focus: false,
          state: WidgetState.none,
          status: WidgetStatus.disabled,
          hover: false,
        ),
        child: Container(),
      );

      final sameNotifier = WidgetStateNotifier(
        data: gestureData,
        child: Container(),
      );

      expect(notifier.updateShouldNotify(otherNotifier), true);
      expect(notifier.updateShouldNotify(sameNotifier), false);
      expect(WidgetStateNotifier.of(MockBuildContext()), null);
    });

    testWidgets('can get it from context', (tester) async {
      await tester.pumpWithPressable(
        Container(),
        state: WidgetState.pressed,
        focus: true,
      );

      final context = tester.element(find.byType(Container));

      final notifier = WidgetStateNotifier.of(context);

      expect(notifier, isA<WidgetStateData>());
      expect(notifier!.state, WidgetState.pressed);
      expect(notifier.focus, true);
    });
  });
}
