import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/core/internal/mix_state/interactive_mix_state.dart';
import 'package:mix/src/core/internal/mix_state/widget_state_controller.dart';

void main() {
  group('InteractiveMixState', () {
    InteractiveMixStateController controllerOf(BuildContext context) {
      return _MixStateController.ofType<InteractiveMixStateController>(context);
    }

    testWidgets('should update enabled state', (WidgetTester tester) async {
      final controller = InteractiveMixStateController();
      controller.update(InteractiveMixState.disabled, false);
      await tester.pumpWidget(
        MixStateBuilder(controller: controller, builder: (_) => Container()),
      );

      var context = tester.element(find.byType(Container));

      expect(
        controllerOf(context).enabled,
        isTrue,
      );
      expect(
        controllerOf(context).disabled,
        isFalse,
      );

      controller.update(InteractiveMixState.disabled, true);

      await tester.pump();

      context = tester.element(find.byType(Container));

      expect(controllerOf(context).enabled, isFalse);
      expect(controllerOf(context).disabled, isTrue);
    });

    testWidgets('should update focused state', (WidgetTester tester) async {
      final controller = InteractiveMixStateController();
      controller.update(InteractiveMixState.disabled, true);
      controller.update(InteractiveMixState.focused, true);
      await tester.pumpWidget(
        MixStateBuilder(controller: controller, builder: (_) => Container()),
      );

      var context = tester.element(find.byType(Container));
      expect(controllerOf(context).focused, isTrue);

      controller.update(InteractiveMixState.focused, false);

      await tester.pump();

      context = tester.element(find.byType(Container));

      expect(controllerOf(context).focused, isFalse);
    });

    testWidgets('should update hovered state', (WidgetTester tester) async {
      final controller = InteractiveMixStateController();
      controller.update(InteractiveMixState.disabled, false);
      controller.update(InteractiveMixState.hovered, true);
      await tester.pumpWidget(
        MixStateBuilder(controller: controller, builder: (_) => Container()),
      );

      var context = tester.element(find.byType(Container));
      expect(controllerOf(context).hovered, isTrue);

      controller.update(InteractiveMixState.hovered, false);

      await tester.pump();

      context = tester.element(find.byType(Container));

      expect(controllerOf(context).hovered, isFalse);
    });
  });
}
