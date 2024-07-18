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
  group('InteractiveWidget', () {
    testWidgets(
        'passes mouseCursor to FocusableActionDetector and skips first MouseRegion',
        (WidgetTester tester) async {
      const mouseCursor = SystemMouseCursors.click;

      await tester.pumpWidget(
        const InteractiveWidget(
          mouseCursor: mouseCursor,
          child: SizedBox(),
        ),
      );

      final mouseRegionFinder = find.byType(MouseRegion);
      expect(mouseRegionFinder, findsNWidgets(2));

      final firstMouseRegion =
          tester.widget<MouseRegion>(mouseRegionFinder.first);
      expect(firstMouseRegion.cursor, equals(MouseCursor.defer));

      final focusableActionDetectorFinder =
          find.byType(FocusableActionDetector);
      expect(focusableActionDetectorFinder, findsOneWidget);

      final secondMouseRegionFinder = find.descendant(
        of: focusableActionDetectorFinder,
        matching: find.byType(MouseRegion),
      );
      expect(secondMouseRegionFinder, findsOneWidget);

      final secondMouseRegion =
          tester.widget<MouseRegion>(secondMouseRegionFinder);
      expect(secondMouseRegion.cursor, equals(mouseCursor));
    });
  });
}
