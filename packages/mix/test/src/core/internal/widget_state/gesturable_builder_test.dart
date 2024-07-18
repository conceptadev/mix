import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/core/internal/widget_state/gesturable_builder.dart';

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

    testWidgets('GesturableWidget pan functions test', (
      WidgetTester tester,
    ) async {
      bool isPanStartCalled = false;
      bool isPanDownCalled = false;
      bool isPanUpdateCalled = false;
      bool isPanEndCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: GesturableWidget(
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

      final gesturableWidget = find.byType(GesturableWidget);
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
