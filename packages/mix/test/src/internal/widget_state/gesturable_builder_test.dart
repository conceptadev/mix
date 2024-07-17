import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/internal/widget_state/gesturable_builder.dart';

void main() {
  group('GesturableWidget', () {
    const key = Key('context_key');
    const unpressDelay = Duration(milliseconds: 500);
    testWidgets('should update press state when tapped', (tester) async {
      bool onTapCalled = false;
      await tester.pumpWidget(
        GesturableWidget(
          onTap: () {
            onTapCalled = true;
          },
          unpressDelay: unpressDelay,
          child: Builder(builder: (context) {
            return const SizedBox(
              key: key,
            );
          }),
        ),
      );

      await tester.tap(find.byType(GesturableWidget));
      await tester.pump();

      final context = tester.element(find.byKey(key));

      expect(GesturableState.pressedOf(context), isTrue);
      expect(onTapCalled, isTrue);
    });

    testWidgets('should update long press state when long pressed',
        (tester) async {
      bool onLongPressCalled = false;
      await tester.pumpWidget(
        GesturableWidget(
          onLongPress: () {
            onLongPressCalled = true;
          },
          unpressDelay: unpressDelay,
          child: const SizedBox(
            key: key,
          ),
        ),
      );

      final context = tester.element(find.byKey(key));
      await tester.longPress(find.byType(GesturableWidget));

      expect(onLongPressCalled, isTrue);
      expect(GesturableState.longPressedOf(context), isTrue);
    });

    testWidgets('should update press state after delay when tapped',
        (tester) async {
      await tester.pumpWidget(
        const GesturableWidget(
          unpressDelay: Duration(milliseconds: 100),
          child: SizedBox(key: key),
        ),
      );

      await tester.tap(find.byType(GesturableWidget));
      await tester.pump();
      final context = tester.element(find.byKey(key));
      expect(
        GesturableState.pressedOf(context),
        isTrue,
        reason: 'GesturableState should be pressed immediately after tap',
      );

      await tester.pump(
        const Duration(milliseconds: 50),
      );
      expect(
        GesturableState.pressedOf(context),
        isTrue,
        reason: 'GesturableState should still be pressed 50ms after tap',
      );

      await tester.pump(
        const Duration(milliseconds: 100),
      );
      expect(
        GesturableState.pressedOf(context),
        isFalse,
        reason:
            'GesturableState should be unpressed after unpressDelay has passed',
      );
    });

    testWidgets('should not update press state when disabled', (tester) async {
      await tester.pumpWidget(
        const GesturableWidget(
          enabled: false,
          unpressDelay: Duration.zero,
          child: SizedBox(key: key),
        ),
      );

      await tester.tap(find.byType(GesturableWidget));
      final context = tester.element(find.byKey(key));
      expect(GesturableState.pressedOf(context), isFalse);
    });
  });
}
