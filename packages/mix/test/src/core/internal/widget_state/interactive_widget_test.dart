import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/core/internal/widget_state/interactive_widget.dart';

void main() {
  group('InteractiveMixState', () {
    testWidgets('should update enabled state', (WidgetTester tester) async {
      await tester.pumpWidget(
        InteractiveState(
          enabled: true,
          focused: false,
          hovered: false,
          pointerPosition: null,
          child: Container(),
        ),
      );

      expect(InteractiveState.enabledOf(tester.element(find.byType(Container))),
          isTrue);
      expect(
          InteractiveState.disabledOf(tester.element(find.byType(Container))),
          isFalse);

      await tester.pumpWidget(
        InteractiveState(
          enabled: false,
          focused: false,
          hovered: false,
          pointerPosition: null,
          child: Container(),
        ),
      );

      expect(InteractiveState.enabledOf(tester.element(find.byType(Container))),
          isFalse);
      expect(
          InteractiveState.disabledOf(tester.element(find.byType(Container))),
          isTrue);
    });

    testWidgets('should update focused state', (WidgetTester tester) async {
      await tester.pumpWidget(
        InteractiveState(
          enabled: true,
          focused: true,
          hovered: false,
          pointerPosition: null,
          child: Container(),
        ),
      );

      expect(InteractiveState.focusedOf(tester.element(find.byType(Container))),
          isTrue);

      await tester.pumpWidget(
        InteractiveState(
          enabled: true,
          focused: false,
          hovered: false,
          pointerPosition: null,
          child: Container(),
        ),
      );

      expect(InteractiveState.focusedOf(tester.element(find.byType(Container))),
          isFalse);
    });

    testWidgets('should update hovered state', (WidgetTester tester) async {
      await tester.pumpWidget(
        InteractiveState(
          enabled: true,
          focused: false,
          hovered: true,
          pointerPosition: null,
          child: Container(),
        ),
      );

      expect(InteractiveState.hoveredOf(tester.element(find.byType(Container))),
          isTrue);

      await tester.pumpWidget(
        InteractiveState(
          enabled: true,
          focused: false,
          hovered: false,
          pointerPosition: null,
          child: Container(),
        ),
      );

      expect(InteractiveState.hoveredOf(tester.element(find.byType(Container))),
          isFalse);
    });

    testWidgets('should update pointer position', (WidgetTester tester) async {
      const pointerPosition = PointerPosition(
        position: Alignment.center,
        offset: Offset.zero,
      );

      await tester.pumpWidget(
        InteractiveState(
          enabled: true,
          focused: false,
          hovered: false,
          pointerPosition: pointerPosition,
          child: Container(),
        ),
      );

      expect(
          InteractiveState.pointerPositionOf(
              tester.element(find.byType(Container))),
          equals(pointerPosition));

      await tester.pumpWidget(
        InteractiveState(
          enabled: true,
          focused: false,
          hovered: false,
          pointerPosition: null,
          child: Container(),
        ),
      );

      expect(
          InteractiveState.pointerPositionOf(
              tester.element(find.byType(Container))),
          isNull);
    });
  });
}
