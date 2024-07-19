import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/core/internal/mix_state/widget_state_controller.dart';

void main() {
  group('InteractiveMixState', () {
    testWidgets('should update enabled state', (WidgetTester tester) async {
      final controller = MixWidgetStateController();

      controller.disabled = true;
      await tester.pumpWidget(
        MixWidgetStateBuilder(
            controller: controller, builder: (_) => Container()),
      );

      var context = tester.element(find.byType(Container));

      expect(
        MixWidgetState.hasStateOf(context, MixWidgetState.disabled),
        isTrue,
      );

      controller.disabled = false;

      await tester.pump();

      context = tester.element(find.byType(Container));

      expect(
          MixWidgetState.hasStateOf(context, MixWidgetState.disabled), isFalse);
    });

    testWidgets('should update focused state', (WidgetTester tester) async {
      final controller = MixWidgetStateController();
      controller.focused = true;
      await tester.pumpWidget(
        MixWidgetStateBuilder(
            controller: controller, builder: (_) => Container()),
      );

      var context = tester.element(find.byType(Container));
      expect(
        MixWidgetState.hasStateOf(context, MixWidgetState.focused),
        isTrue,
      );

      controller.focused = false;

      await tester.pump();

      context = tester.element(find.byType(Container));

      expect(
          MixWidgetState.hasStateOf(context, MixWidgetState.focused), isFalse);
    });

    testWidgets('should update hovered state', (WidgetTester tester) async {
      final controller = MixWidgetStateController();

      controller.hovered = true;

      await tester.pumpWidget(
        MixWidgetStateBuilder(
            controller: controller, builder: (_) => Container()),
      );

      var context = tester.element(find.byType(Container));
      expect(
          MixWidgetState.hasStateOf(context, MixWidgetState.hovered), isTrue);

      controller.hovered = false;

      await tester.pump();

      context = tester.element(find.byType(Container));

      expect(
          MixWidgetState.hasStateOf(context, MixWidgetState.hovered), isFalse);
    });
  });
}
