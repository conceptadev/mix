import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/core/widget_state/internal/gesture_mix_state.dart';
import 'package:mix/src/core/widget_state/internal/mix_widget_state_builder.dart';
import 'package:mix/src/core/widget_state/widget_state_controller.dart';

void main() {
  group('GestureMixStateWidget', () {
    const key = Key('context_key');
    const unpressDelay = Duration(milliseconds: 500);

    GestureMixStateWidget buildGestureMixStateWidget({
      Duration unpressDelay = unpressDelay,
      Function()? onTap,
      Function()? onLongPress,
      Function(DragStartDetails)? onPanStart,
      Function(DragDownDetails)? onPanDown,
      Function(DragUpdateDetails)? onPanUpdate,
      Function(DragEndDetails)? onPanEnd,
      Function(TapUpDetails)? onTapUp,
      Function()? onTapCancel,
      Function(LongPressStartDetails)? onLongPressStart,
      Function(LongPressEndDetails)? onLongPressEnd,
      Function()? onLongPressCancel,
      Function()? onPanCancel,
      bool enableFeedback = false,
      bool excludeFromSemantics = false,
      HitTestBehavior hitTestBehavior = HitTestBehavior.opaque,
      MixWidgetStateController? controller,
    }) {
      controller ??= MixWidgetStateController();
      return GestureMixStateWidget(
        controller: controller,
        onTap: onTap,
        onLongPress: onLongPress,
        unpressDelay: unpressDelay,
        onPanStart: onPanStart,
        onPanDown: onPanDown,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        onTapUp: onTapUp,
        onTapCancel: onTapCancel,
        onLongPressStart: onLongPressStart,
        onLongPressEnd: onLongPressEnd,
        onLongPressCancel: onLongPressCancel,
        onPanCancel: onPanCancel,
        enableFeedback: enableFeedback,
        excludeFromSemantics: excludeFromSemantics,
        hitTestBehavior: hitTestBehavior,
        child: MixWidgetStateBuilder(
          controller: controller,
          builder: (_) => const SizedBox(
            key: key,
            height: 100,
            width: 100,
          ),
        ),
      );
    }

    testWidgets('should update press state when tapped', (tester) async {
      final controller = MixWidgetStateController();
      bool onTapCalled = false;
      bool onControllerTapCalled = false;
      await tester.pumpWidget(
        buildGestureMixStateWidget(
          controller: controller,
          onTap: () {
            onTapCalled = true;
          },
        ),
      );

      controller.addListener(() {
        if (onControllerTapCalled) return;
        onControllerTapCalled = controller.pressed;
      });

      await tester.tap(find.byKey(key));
      await tester.pump();

      expect(onControllerTapCalled, isTrue);
      expect(onTapCalled, isTrue);
    });

    testWidgets('should update long press state when long pressed',
        (tester) async {
      final controller = MixWidgetStateController();
      bool onLongPressCalled = false;
      bool onControllerLongPressCalled = false;
      await tester.pumpWidget(
        buildGestureMixStateWidget(
          controller: controller,
          onLongPress: () {
            onLongPressCalled = true;
          },
        ),
      );

      controller.addListener(() {
        if (onControllerLongPressCalled) return;
        onControllerLongPressCalled = controller.longPressed;
      });

      await tester.longPress(find.byKey(key));
      await tester.pump();

      expect(onControllerLongPressCalled, isTrue);
      expect(onLongPressCalled, isTrue);
    });

    testWidgets('should update press state after delay when tapped',
        (tester) async {
      final controller = MixWidgetStateController();
      await tester.pumpWidget(
        buildGestureMixStateWidget(
          controller: controller,
          onTap: () {},
          unpressDelay: const Duration(milliseconds: 100),
        ),
      );

      await tester.tap(find.byKey(key));
      await tester.pump();
      expect(controller.pressed, isTrue);

      await tester.pump(const Duration(milliseconds: 50));
      expect(controller.pressed, isTrue);

      await tester.pump(const Duration(milliseconds: 100));
      expect(controller.pressed, isFalse);
    });

    testWidgets('should not update press state when disabled', (tester) async {
      final controller = MixWidgetStateController();
      await tester
          .pumpWidget(buildGestureMixStateWidget(controller: controller));

      await tester.tap(find.byKey(key));
      await tester.pump();
      expect(controller.pressed, isFalse);
    });

    testWidgets('should handle pan gestures correctly', (tester) async {
      bool isPanStartCalled = false;
      bool isPanDownCalled = false;
      bool isPanUpdateCalled = false;
      bool isPanEndCalled = false;

      final controller = MixWidgetStateController();

      await tester.pumpWidget(
        MaterialApp(
          home: buildGestureMixStateWidget(
            controller: controller,
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
          ),
        ),
      );

      final gesture =
          await tester.startGesture(tester.getCenter(find.byKey(key)));
      await gesture.moveBy(const Offset(50, 50));
      await gesture.up();

      await tester.pump();

      expect(isPanStartCalled, isTrue);
      expect(isPanDownCalled, isTrue);
      expect(isPanUpdateCalled, isTrue);
      expect(isPanEndCalled, isTrue);
    });

    testWidgets('should provide feedback when enabled', (tester) async {
      final controller = MixWidgetStateController();

      bool onTapCalled = false;
      bool onLongPressCalled = false;
      await tester.pumpWidget(
        buildGestureMixStateWidget(
          controller: controller,
          onTap: () {
            onTapCalled = true;
          },
          onLongPress: () {
            onLongPressCalled = true;
          },
          enableFeedback: true,
        ),
      );

      await tester.tap(find.byKey(key));
      await tester.pump();
      expect(onTapCalled, isTrue);

      await tester.longPress(find.byKey(key));
      await tester.pump();
      expect(onLongPressCalled, isTrue);
    });

    testWidgets('should exclude from semantics when set', (tester) async {
      await tester.pumpWidget(
        buildGestureMixStateWidget(
          excludeFromSemantics: true,
        ),
      );

      final widget = tester.widget(find.byType(GestureMixStateWidget))
          as GestureMixStateWidget;

      expect(widget.excludeFromSemantics, isTrue);
    });

    testWidgets('should handle different hit test behaviors', (tester) async {
      final controller = MixWidgetStateController();
      await tester.pumpWidget(
        buildGestureMixStateWidget(
          controller: controller,
          onTap: () {},
          hitTestBehavior: HitTestBehavior.translucent,
        ),
      );

      await tester.tap(find.byKey(key));
      await tester.pump();
      expect(controller.pressed, isTrue);
    });

    testWidgets('should update state with external controller', (tester) async {
      final externalController = MixWidgetStateController();
      await tester.pumpWidget(
        buildGestureMixStateWidget(
          onTap: () {},
          controller: externalController,
        ),
      );

      await tester.tap(find.byKey(key));
      await tester.pump();
      expect(externalController.pressed, isTrue);
    });

    testWidgets('should handle null callbacks gracefully', (tester) async {
      final controller = MixWidgetStateController();
      await tester
          .pumpWidget(buildGestureMixStateWidget(controller: controller));

      await tester.tap(find.byKey(key));
      await tester.pump();
      expect(controller.pressed, isFalse);
    });

    testWidgets('should dispose internal controller when disposed',
        (tester) async {
      final controller = MixWidgetStateController();
      await tester.pumpWidget(_DisposableController(controller: controller));
      await tester.pumpWidget(Container());

      expect(controller.disposed, isTrue);
    });
  });
}

class _DisposableController extends StatefulWidget {
  final MixWidgetStateController controller;

  const _DisposableController({required this.controller});

  @override
  State createState() => _DisposableControllerState();
}

class _DisposableControllerState extends State<_DisposableController> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
