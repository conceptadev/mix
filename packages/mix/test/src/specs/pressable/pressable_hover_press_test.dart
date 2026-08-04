import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('Pressable hover and press interaction', () {
    testWidgets(
      'press state clears when the pointer leaves the detector bounds',
      (tester) async {
        final controller = WidgetStatesController();

        await tester.pumpWidget(
          MaterialApp(
            home: Center(
              child: Pressable(
                controller: controller,
                onPress: () {},
                child: const SizedBox(
                  width: 100,
                  height: 100,
                  child: Text('Pressable'),
                ),
              ),
            ),
          ),
        );

        // Verify initial state
        expect(controller.has(WidgetState.pressed), isFalse);
        expect(controller.has(WidgetState.hovered), isFalse);

        // Move mouse over widget
        final gesture = await tester.createGesture(
          kind: PointerDeviceKind.mouse,
        );
        await gesture.addPointer(
          location: tester.getCenter(find.text('Pressable')),
        );
        await tester.pumpAndSettle();

        expect(controller.has(WidgetState.hovered), isTrue);
        expect(controller.has(WidgetState.pressed), isFalse);

        // Press down
        await gesture.down(tester.getCenter(find.text('Pressable')));
        await tester.pumpAndSettle();

        expect(controller.has(WidgetState.pressed), isTrue);
        expect(controller.has(WidgetState.hovered), isTrue);

        // Move mouse away while still pressed
        await gesture.moveTo(Offset.zero);
        await tester.pumpAndSettle();

        // When moving out while pressed, the gesture is cancelled
        // This is standard Flutter behavior - onTapCancel is called
        expect(
          controller.has(WidgetState.pressed),
          isFalse,
          reason:
              'Press state is cleared when gesture moves outside (onTapCancel)',
        );

        // Note: Hover state may still be true with mouse gestures in tests
        // This is a limitation of the test framework

        // Release press
        await gesture.up();
        await tester.pumpAndSettle();

        expect(controller.has(WidgetState.pressed), isFalse);
      },
    );

    testWidgets('press state is cleared on tap cancel', (tester) async {
      final controller = WidgetStatesController();
      bool onPressCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: Pressable(
              controller: controller,
              onPress: () => onPressCalled = true,
              child: const SizedBox(
                width: 100,
                height: 100,
                child: Text('Pressable'),
              ),
            ),
          ),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);

      // Hover in
      await gesture.addPointer(
        location: tester.getCenter(find.text('Pressable')),
      );
      await tester.pumpAndSettle();
      expect(controller.has(WidgetState.hovered), isTrue);

      // Press down
      await gesture.down(tester.getCenter(find.text('Pressable')));
      await tester.pumpAndSettle();
      expect(controller.has(WidgetState.pressed), isTrue);

      // Move out - this triggers tap cancel
      await gesture.moveTo(Offset.zero);
      await tester.pumpAndSettle();

      // Press state should be cleared on cancel
      expect(controller.has(WidgetState.pressed), isFalse);

      // Release
      await gesture.up();
      await tester.pumpAndSettle();

      // onPress should not have been called since gesture was cancelled
      expect(onPressCalled, isFalse);
    });

    testWidgets('focus loss does not clear a pointer-owned press', (
      tester,
    ) async {
      final focusNode = FocusNode();
      final controller = WidgetStatesController();
      addTearDown(focusNode.dispose);
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: Pressable(
              focusNode: focusNode,
              controller: controller,
              onPress: () {},
              child: const SizedBox(width: 100, height: 100),
            ),
          ),
        ),
      );
      focusNode.requestFocus();
      await tester.pump();

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(
        location: tester.getCenter(find.byType(Pressable)),
      );
      await gesture.down(tester.getCenter(find.byType(Pressable)));
      await tester.pump();
      expect(controller.pressed, isTrue);

      focusNode.unfocus();
      await tester.pump();
      expect(controller.pressed, isTrue);

      await gesture.up();
      await tester.pump();
      expect(controller.pressed, isFalse);
    });
  });
}
