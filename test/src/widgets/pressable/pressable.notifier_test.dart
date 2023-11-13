import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('PressableNotifier', () {
    test('constructor', () {
      final notifier = PressableNotifier(
        state: PressableState.pressed,
        focus: true,
        child: Container(),
      );

      expect(notifier.state, PressableState.pressed);
      expect(notifier.focus, true);
      expect(notifier.child, isA<Container>());
    });

    test('of', () {
      final notifier = PressableNotifier(
        state: PressableState.pressed,
        focus: true,
        child: Container(),
      );

      final otherNotifier = PressableNotifier(
        state: PressableState.hover,
        focus: false,
        child: Container(),
      );

      final sameNotifier = PressableNotifier(
        focus: true,
        state: PressableState.pressed,
        child: Container(),
      );

      expect(notifier.updateShouldNotify(otherNotifier), true);
      expect(notifier.updateShouldNotify(sameNotifier), false);
      expect(PressableNotifier.of(MockBuildContext()), null);
    });

    testWidgets('can get it from context', (tester) async {
      await tester.pumpWithPressable(
        Container(),
        state: PressableState.pressed,
        focus: true,
      );

      final context = tester.element(find.byType(Container));

      final notifier = PressableNotifier.of(context);

      expect(notifier, isA<PressableNotifier>());
      expect(notifier!.state, PressableState.pressed);
      expect(notifier.focus, true);
    });
  });
}
