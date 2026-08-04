import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

class _ProbeIntent extends Intent {
  const _ProbeIntent();
}

void main() {
  group('Pressable keyboard lifecycle', () {
    testWidgets('Space and Enter hold pressed and activate once on key up', (
      tester,
    ) async {
      final focusNode = FocusNode();
      final controller = WidgetStatesController();
      addTearDown(focusNode.dispose);
      addTearDown(controller.dispose);
      var presses = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Pressable(
            focusNode: focusNode,
            controller: controller,
            onPress: () => presses++,
            child: const SizedBox(width: 100, height: 100),
          ),
        ),
      );
      focusNode.requestFocus();
      await tester.pump();

      for (final key in [LogicalKeyboardKey.space, LogicalKeyboardKey.enter]) {
        await tester.sendKeyDownEvent(key);
        await tester.pump();
        expect(controller.pressed, isTrue);
        expect(presses, 0);

        await tester.sendKeyRepeatEvent(key);
        await tester.sendKeyRepeatEvent(key);
        await tester.pump();
        expect(controller.pressed, isTrue);
        expect(presses, 0);

        await tester.sendKeyUpEvent(key);
        await tester.pump();
        expect(controller.pressed, isFalse);
        expect(presses, 1);

        presses = 0;
      }
    });

    testWidgets('focus loss cancels held keyboard activation', (tester) async {
      final focusNode = FocusNode();
      final controller = WidgetStatesController();
      addTearDown(focusNode.dispose);
      addTearDown(controller.dispose);
      var presses = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Pressable(
            focusNode: focusNode,
            controller: controller,
            onPress: () => presses++,
            child: const SizedBox(width: 100, height: 100),
          ),
        ),
      );
      focusNode.requestFocus();
      await tester.pump();
      await tester.sendKeyDownEvent(LogicalKeyboardKey.space);
      await tester.pump();
      expect(controller.pressed, isTrue);

      focusNode.unfocus();
      await tester.pump();
      expect(controller.pressed, isFalse);

      await tester.sendKeyUpEvent(LogicalKeyboardKey.space);
      await tester.pump();
      expect(presses, 0);
    });

    testWidgets('disabling while held cancels activation', (tester) async {
      final focusNode = FocusNode();
      final controller = WidgetStatesController();
      addTearDown(focusNode.dispose);
      addTearDown(controller.dispose);
      var enabled = true;
      var presses = 0;
      late StateSetter setState;

      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, stateSetter) {
              setState = stateSetter;

              return Pressable(
                enabled: enabled,
                focusNode: focusNode,
                controller: controller,
                onPress: () => presses++,
                child: const SizedBox(width: 100, height: 100),
              );
            },
          ),
        ),
      );
      focusNode.requestFocus();
      await tester.pump();
      await tester.sendKeyDownEvent(LogicalKeyboardKey.enter);
      await tester.pump();
      expect(controller.pressed, isTrue);

      setState(() => enabled = false);
      await tester.pump();
      expect(controller.pressed, isFalse);

      await tester.sendKeyUpEvent(LogicalKeyboardKey.enter);
      await tester.pump();
      expect(presses, 0);
    });

    testWidgets('disposal clears a held state without activation', (
      tester,
    ) async {
      final focusNode = FocusNode();
      final controller = WidgetStatesController();
      addTearDown(focusNode.dispose);
      addTearDown(controller.dispose);
      var presses = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Pressable(
            focusNode: focusNode,
            controller: controller,
            onPress: () => presses++,
            child: const SizedBox(width: 100, height: 100),
          ),
        ),
      );
      focusNode.requestFocus();
      await tester.pump();
      await tester.sendKeyDownEvent(LogicalKeyboardKey.space);
      await tester.pump();
      expect(controller.pressed, isTrue);

      await tester.pumpWidget(const MaterialApp(home: SizedBox()));
      expect(controller.pressed, isFalse);

      await tester.sendKeyUpEvent(LogicalKeyboardKey.space);
      expect(presses, 0);
    });

    testWidgets('controller swap does not carry a held keyboard press', (
      tester,
    ) async {
      final focusNode = FocusNode();
      final externalController = WidgetStatesController();
      addTearDown(focusNode.dispose);
      addTearDown(externalController.dispose);
      var useExternalController = true;
      var presses = 0;
      late StateSetter setState;

      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, stateSetter) {
              setState = stateSetter;

              return Pressable(
                focusNode: focusNode,
                controller: useExternalController ? externalController : null,
                onPress: () => presses++,
                child: Box(
                  key: const Key('controller-swap-box'),
                  style: BoxStyler()
                      .size(100, 100)
                      .color(Colors.blue)
                      .onPressed(BoxStyler().color(Colors.red)),
                ),
              );
            },
          ),
        ),
      );
      focusNode.requestFocus();
      await tester.pump();
      await tester.sendKeyDownEvent(LogicalKeyboardKey.space);
      await tester.pump();
      expect(externalController.pressed, isTrue);

      setState(() => useExternalController = false);
      await tester.pump();

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byKey(const Key('controller-swap-box')),
          matching: find.byType(Container),
        ),
      );
      expect(externalController.pressed, isFalse);
      expect((container.decoration! as BoxDecoration).color, Colors.blue);

      await tester.sendKeyUpEvent(LogicalKeyboardKey.space);
      await tester.pump();
      expect(presses, 0);
    });

    testWidgets('onKeyEvent runs first and can suppress key-up activation', (
      tester,
    ) async {
      final focusNode = FocusNode();
      final controller = WidgetStatesController();
      addTearDown(focusNode.dispose);
      addTearDown(controller.dispose);
      final pressedSeenByHandler = <bool>[];
      var presses = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Pressable(
            focusNode: focusNode,
            controller: controller,
            onPress: () => presses++,
            onKeyEvent: (_, event) {
              pressedSeenByHandler.add(controller.pressed);

              return event is KeyUpEvent
                  ? KeyEventResult.handled
                  : KeyEventResult.ignored;
            },
            child: const SizedBox(width: 100, height: 100),
          ),
        ),
      );
      focusNode.requestFocus();
      await tester.pump();

      await tester.sendKeyDownEvent(LogicalKeyboardKey.space);
      await tester.pump();
      expect(controller.pressed, isTrue);

      await tester.sendKeyUpEvent(LogicalKeyboardKey.space);
      await tester.pump();

      expect(pressedSeenByHandler, [false, true]);
      expect(controller.pressed, isFalse);
      expect(presses, 0);
    });

    testWidgets('keeps custom actions but reserves Space and Enter', (
      tester,
    ) async {
      final focusNode = FocusNode();
      addTearDown(focusNode.dispose);
      BuildContext? actionContext;
      var presses = 0;
      var probes = 0;
      var customActivations = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Pressable(
            focusNode: focusNode,
            onPress: () => presses++,
            actions: <Type, Action<Intent>>{
              _ProbeIntent: CallbackAction<_ProbeIntent>(
                onInvoke: (_) => probes++,
              ),
              ActivateIntent: CallbackAction<ActivateIntent>(
                onInvoke: (_) => customActivations++,
              ),
            },
            child: Builder(
              builder: (context) {
                actionContext = context;
                return const SizedBox(width: 100, height: 100);
              },
            ),
          ),
        ),
      );

      Actions.invoke(actionContext!, const _ProbeIntent());
      expect(probes, 1);

      focusNode.requestFocus();
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();

      expect(presses, 1);
      expect(customActivations, 0);
    });
  });

  group('Pressable focus visibility', () {
    testWidgets('requires focus and traditional focus-highlight mode', (
      tester,
    ) async {
      final focusManager = FocusManager.instance;
      final previousStrategy = focusManager.highlightStrategy;
      addTearDown(() => focusManager.highlightStrategy = previousStrategy);
      focusManager.highlightStrategy = FocusHighlightStrategy.alwaysTouch;

      final focusNode = FocusNode();
      addTearDown(focusNode.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Pressable(
            focusNode: focusNode,
            child: Box(
              key: const Key('focus-visible-box'),
              style: BoxStyler()
                  .size(100, 100)
                  .color(Colors.blue)
                  .onFocusVisible(BoxStyler().color(Colors.red)),
            ),
          ),
        ),
      );
      focusNode.requestFocus();
      await tester.pump();

      BoxDecoration decoration() {
        final container = tester.widget<Container>(
          find.descendant(
            of: find.byKey(const Key('focus-visible-box')),
            matching: find.byType(Container),
          ),
        );

        return container.decoration! as BoxDecoration;
      }

      expect(focusNode.hasFocus, isTrue);
      expect(decoration().color, Colors.blue);

      focusManager.highlightStrategy = FocusHighlightStrategy.alwaysTraditional;
      await tester.pump();
      expect(decoration().color, Colors.red);

      focusNode.unfocus();
      await tester.pumpAndSettle();
      expect(focusNode.hasFocus, isFalse);
      expect(decoration().color, Colors.blue);
    });
  });

  group('Pressable semantics contract', () {
    testWidgets('maps button, link, and none roles exactly', (tester) async {
      final handle = tester.ensureSemantics();

      for (final role in PressableSemanticsRole.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Pressable(
              key: ValueKey(role),
              semanticsLabel: role.name,
              semanticsRole: role,
              onPress: () {},
              child: const SizedBox(width: 100, height: 100),
            ),
          ),
        );

        final flags = tester
            .getSemantics(find.byKey(ValueKey(role)))
            .flagsCollection;
        expect(flags.isButton, role == PressableSemanticsRole.button);
        expect(flags.isLink, role == PressableSemanticsRole.link);
      }

      handle.dispose();
    });

    testWidgets('exposes only enabled callbacks as semantic actions', (
      tester,
    ) async {
      final handle = tester.ensureSemantics();

      for (final enabled in [true, false]) {
        for (final hasTap in [true, false]) {
          for (final hasLongPress in [true, false]) {
            final key = ValueKey((enabled, hasTap, hasLongPress));
            await tester.pumpWidget(
              MaterialApp(
                home: Pressable(
                  key: key,
                  enabled: enabled,
                  semanticsLabel: 'Action',
                  onPress: hasTap ? () {} : null,
                  onLongPress: hasLongPress ? () {} : null,
                  child: const SizedBox(width: 100, height: 100),
                ),
              ),
            );

            final semantics = tester.getSemantics(find.byKey(key));
            expect(
              semantics,
              isSemantics(
                label: 'Action',
                isButton: true,
                hasEnabledState: true,
                isEnabled: enabled,
                hasTapAction: enabled && hasTap,
                hasLongPressAction: enabled && hasLongPress,
              ),
            );
            final data = semantics.getSemanticsData();
            expect(data.hasAction(SemanticsAction.tap), enabled && hasTap);
            expect(
              data.hasAction(SemanticsAction.longPress),
              enabled && hasLongPress,
            );
          }
        }
      }

      handle.dispose();
    });
  });
}
