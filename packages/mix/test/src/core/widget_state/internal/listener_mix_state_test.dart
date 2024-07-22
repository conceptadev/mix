import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/core/widget_state/internal/listener_mix_state.dart';

void main() {
  group('PointerPositionStateWidget', () {
    testWidgets('updates pointer position on hover',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ListenerMixStateWidget(
          child: SizedBox(width: 100, height: 100),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      final beforePosition =
          ListerMixStateProvider.of(tester.element(find.byType(SizedBox)))!
              .pointerPosition;

      await gesture.moveTo(const Offset(50, 50));
      await tester.pumpAndSettle();

      final afterPosition =
          ListerMixStateProvider.of(tester.element(find.byType(SizedBox)))!
              .pointerPosition;
      expect(beforePosition, isNull);

      expect(afterPosition!.offset, equals(const Offset(50, 50)));
    });

    testWidgets('calls onHover callback', (WidgetTester tester) async {
      PointerHoverEvent? hoverEvent;
      await tester.pumpWidget(
        ListenerMixStateWidget(
          onHover: (event) => hoverEvent = event,
          child: const SizedBox(width: 100, height: 100),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      await gesture.moveTo(const Offset(50, 50));
      await tester.pumpAndSettle();

      expect(hoverEvent, isNotNull);
      expect(hoverEvent!.localPosition, equals(const Offset(50, 50)));
    });
  });
}
