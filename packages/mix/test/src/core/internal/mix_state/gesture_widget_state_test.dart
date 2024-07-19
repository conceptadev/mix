import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/core/internal/mix_state/gesture_mix_state.dart';
import 'package:mix/src/core/internal/mix_state/widget_state_controller.dart';

void main() {
  group('GesturableWidget', () {
    const key = Key('context_key');
    const unpressDelay = Duration(milliseconds: 500);

    GestureMixStateController controllerOf(BuildContext context) {
      return _MixStateController.ofType<GestureMixStateController>(context);
    }

    testWidgets('should update press state when tapped', (tester) async {
      bool onTapCalled = false;
      await tester.pumpWidget(
        GestureMixStateWidget(
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

      await tester.tap(find.byType(GestureMixStateWidget));
      await tester.pump();

      final context = tester.element(find.byKey(key));

      expect(controllerOf(context).pressed, isTrue);
      expect(onTapCalled, isTrue);
    });

    testWidgets('should update long press state when long pressed',
        (tester) async {
      bool onLongPressCalled = false;
      await tester.pumpWidget(
        GestureMixStateWidget(
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
      await tester.longPress(find.byType(GestureMixStateWidget));

      expect(onLongPressCalled, isTrue);
      expect(controllerOf(context).longPressed, isTrue);
    });

    testWidgets('should update press state after delay when tapped',
        (tester) async {
      await tester.pumpWidget(
        const GestureMixStateWidget(
          unpressDelay: Duration(milliseconds: 100),
          child: SizedBox(key: key),
        ),
      );

      await tester.tap(find.byType(GestureMixStateWidget));
      await tester.pump();
      final context = tester.element(find.byKey(key));
      expect(
        controllerOf(context).pressed,
        isTrue,
        reason: 'GesturableState should be pressed immediately after tap',
      );

      await tester.pump(
        const Duration(milliseconds: 50),
      );
      expect(
        controllerOf(context).pressed,
        isTrue,
        reason: 'GesturableState should still be pressed 50ms after tap',
      );

      await tester.pump(
        const Duration(milliseconds: 100),
      );
      expect(
        controllerOf(context).pressed,
        isFalse,
        reason:
            'GesturableState should be unpressed after unpressDelay has passed',
      );
    });

    testWidgets('should not update press state when disabled', (tester) async {
      await tester.pumpWidget(
        const GestureMixStateWidget(
          enabled: false,
          unpressDelay: Duration.zero,
          child: SizedBox(key: key),
        ),
      );

      await tester.tap(find.byType(GestureMixStateWidget));
      final context = tester.element(find.byKey(key));
      expect(controllerOf(context).pressed, isFalse);
    });

    testWidgets('GesturableWidget pan functions test', (
      WidgetTester tester,
    ) async {
      bool isPanStartCalled = false;
      bool isPanDownCalled = false;
      bool isPanUpdateCalled = false;
      bool isPanEndCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: GestureMixStateWidget(
            onPanStart: (details) {
              isPanStartCalled = true;
            },
            onPanDown: (details) {
              isPanDownCalled = true;
            },
            onPanUpdate: (details) {
              isPanUpdateCalled = true;
            },
            onPanEnd: (details) {
              isPanEndCalled = true;
            },
            unpressDelay: Duration.zero,
            child: const SizedBox(width: 100, height: 100),
          ),
        ),
      );

      final gesturableWidget = find.byType(GestureMixStateWidget);
      expect(gesturableWidget, findsOneWidget);

      final gesturableWidgetCenter = tester.getCenter(gesturableWidget);
      final gesture = await tester.startGesture(gesturableWidgetCenter);
      await gesture.moveBy(const Offset(50, 50), timeStamp: Durations.medium1);
      // move back to the original position
      await gesture.moveBy(const Offset(-50, -50),
          timeStamp: Durations.medium1);
      await gesture.up();

      // move it again but cancel it
      await gesture.down(gesturableWidgetCenter);

      await gesture.moveBy(const Offset(50, 50));
      await gesture.cancel(timeStamp: const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 200));

      expect(
        isPanStartCalled,
        isTrue,
        reason: 'onPanStart was not called',
      );
      expect(
        isPanDownCalled,
        isTrue,
        reason: 'onPanDown was not called',
      );
      expect(
        isPanUpdateCalled,
        isTrue,
        reason: 'onPanUpdate was not called',
      );
      expect(
        isPanEndCalled,
        isTrue,
        reason: 'onPanEnd was not called',
      );
    });
  });
}
