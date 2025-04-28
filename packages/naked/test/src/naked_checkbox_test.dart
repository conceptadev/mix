import 'dart:ui';

import 'package:flutter/material.dart' as m;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/naked.dart';

extension _WidgetTesterX on WidgetTester {
  Future<void> pumpCheckbox(Widget widget) async {
    await pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: widget,
    ));
  }

  Future<TestGesture> simulateHover(Type type) async {
    final gesture = await createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);
    addTearDown(gesture.removePointer);
    await pump();

    await gesture.moveTo(getCenter(find.byType(type)));
    await pump();

    return gesture;
  }

  void expectCursor(SystemMouseCursor cursor, {required Finder on}) async {
    final enabledMouseRegion = widget<MouseRegion>(
        find.ancestor(of: on, matching: find.byType(MouseRegion)).first);

    expect(enabledMouseRegion.cursor, cursor);
  }
}

void main() {
  group('Basic Functionality', () {
    testWidgets('renders child widget', (WidgetTester tester) async {
      await tester.pumpCheckbox(
        NakedCheckbox(
          checked: false,
          onChanged: (_) {},
          child: const Text('Checkbox Label'),
        ),
      );

      expect(find.text('Checkbox Label'), findsOneWidget);
    });

    testWidgets('handles tap to toggle state', (WidgetTester tester) async {
      bool isChecked = false;
      await tester.pumpCheckbox(
        NakedCheckbox(
          checked: isChecked,
          onChanged: (value) => isChecked = value,
          child: const Text('Checkbox Label'),
        ),
      );

      await tester.tap(find.byType(NakedCheckbox));
      expect(isChecked, isTrue);
    });

    testWidgets('does not respond when disabled', (WidgetTester tester) async {
      bool isChecked = false;
      await tester.pumpCheckbox(
        NakedCheckbox(
          checked: isChecked,
          onChanged: (value) => isChecked = value,
          enabled: false,
          child: const Text('Checkbox Label'),
        ),
      );

      await tester.tap(find.byType(NakedCheckbox));
      expect(isChecked, isFalse);
    });

    testWidgets('does not respond when onChanged is null',
        (WidgetTester tester) async {
      await tester.pumpCheckbox(
        const NakedCheckbox(
          checked: false,
          onChanged: null,
          child: Text('Checkbox Label'),
        ),
      );

      await tester.tap(find.byType(NakedCheckbox));
      // No error should occur
    });
  });

  group('State Callbacks', () {
    testWidgets('does not call state callbacks when disabled',
        (WidgetTester tester) async {
      bool isHovered = false;
      bool isPressed = false;
      bool isFocused = false;

      await tester.pumpCheckbox(
        NakedCheckbox(
          checked: false,
          onChanged: (_) {},
          enabled: false,
          onHoverState: (value) => isHovered = value,
          onPressedState: (value) => isPressed = value,
          onFocusState: (value) => isFocused = value,
          child: const Text('Checkbox Label'),
        ),
      );

      // Test hover
      final hoverGesture = await tester.simulateHover(NakedCheckbox);
      expect(isHovered, false);
      await hoverGesture.moveTo(Offset.zero);
      await tester.pump();
      expect(isHovered, false);

      // Test press
      final pressGesture = await tester.press(find.byType(NakedCheckbox));
      await tester.pump();
      expect(isPressed, false);
      await pressGesture.up();
      await tester.pump();
      expect(isPressed, false);

      // Test focus
      final focusNode = FocusNode();
      focusNode.requestFocus();
      await tester.pump();
      expect(isFocused, false);
      focusNode.unfocus();
      await tester.pump();
      expect(isFocused, false);
    });

    testWidgets('calls onHoverState when hovered', (WidgetTester tester) async {
      bool isHovered = false;
      await tester.pumpCheckbox(
        Padding(
          padding: const EdgeInsets.all(1),
          child: NakedCheckbox(
            checked: false,
            onChanged: (_) {},
            onHoverState: (value) => isHovered = value,
            child: const Text('Checkbox Label'),
          ),
        ),
      );

      final gesture = await tester.simulateHover(NakedCheckbox);
      expect(isHovered, true);

      await gesture.moveTo(Offset.zero);
      await tester.pump();
      expect(isHovered, false);
    });

    testWidgets('calls onPressedState on tap down/up',
        (WidgetTester tester) async {
      bool isPressed = false;
      await tester.pumpCheckbox(
        NakedCheckbox(
          checked: false,
          onChanged: (_) {},
          onPressedState: (value) => isPressed = value,
          child: const Text('Checkbox Label'),
        ),
      );

      final gesture = await tester.press(find.byType(NakedCheckbox));
      await tester.pump();
      expect(isPressed, true);

      await gesture.up();
      await tester.pump();
      expect(isPressed, false);
    });

    testWidgets('calls onFocusState when focused/unfocused',
        (WidgetTester tester) async {
      bool isFocused = false;
      final focusNode = FocusNode();

      await tester.pumpCheckbox(
        NakedCheckbox(
          checked: false,
          onChanged: (_) {},
          focusNode: focusNode,
          onFocusState: (value) => isFocused = value,
          child: const Text('Checkbox Label'),
        ),
      );

      focusNode.requestFocus();
      await tester.pump();
      expect(isFocused, true);

      // Focus elsewhere
      final focusNodeCheckbox = FocusNode();
      final focusNodeOther = FocusNode();

      await tester.pumpCheckbox(
        Column(
          children: [
            NakedCheckbox(
              checked: false,
              onChanged: (_) {},
              focusNode: focusNodeCheckbox,
              onFocusState: (value) => isFocused = value,
              child: const Text('Checkbox Label'),
            ),
            m.TextButton(
              onPressed: () {},
              focusNode: focusNodeOther,
              child: const Text('Other Element'),
            ),
          ],
        ),
      );

      focusNodeCheckbox.requestFocus();
      await tester.pump();
      expect(isFocused, true);

      focusNodeOther.requestFocus();
      await tester.pump();
      expect(isFocused, false);
    });
  });

  group('Keyboard Interaction', () {
    testWidgets('toggles with Space key', (WidgetTester tester) async {
      bool isChecked = false;
      await tester.pumpCheckbox(
        NakedCheckbox(
          checked: isChecked,
          onChanged: (value) => isChecked = value,
          focusNode: FocusNode()..requestFocus(),
          child: const Text('Checkbox Label'),
        ),
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.space);
      await tester.pump();

      expect(isChecked, true);
    });

    testWidgets('toggles with Enter key', (WidgetTester tester) async {
      bool isChecked = false;
      await tester.pumpCheckbox(
        NakedCheckbox(
          checked: isChecked,
          onChanged: (value) => isChecked = value,
          focusNode: FocusNode()..requestFocus(),
          child: const Text('Checkbox Label'),
        ),
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();

      expect(isChecked, true);
    });

    testWidgets('calls onEscapePressed when Escape key pressed',
        (WidgetTester tester) async {
      bool escapePressed = false;
      await tester.pumpCheckbox(
        NakedCheckbox(
          checked: false,
          onChanged: (_) {},
          focusNode: FocusNode()..requestFocus(),
          onEscapePressed: () => escapePressed = true,
          child: const Text('Checkbox Label'),
        ),
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pump();

      expect(escapePressed, true);
    });

    testWidgets('updates pressed state with keyboard activation',
        (WidgetTester tester) async {
      bool isPressed = false;
      await tester.pumpCheckbox(
        NakedCheckbox(
          checked: false,
          onChanged: (_) {},
          focusNode: FocusNode()..requestFocus(),
          onPressedState: (value) => isPressed = value,
          child: const Text('Checkbox Label'),
        ),
      );

      await tester.sendKeyDownEvent(LogicalKeyboardKey.space);
      await tester.pump();
      expect(isPressed, true);

      await tester.sendKeyUpEvent(LogicalKeyboardKey.space);
      await tester.pump();
      expect(isPressed, false);
    });
  });

  group('Indeterminate State', () {
    testWidgets('transitions from indeterminate to checked on tap',
        (WidgetTester tester) async {
      bool? triState;
      bool isIndeterminate = true;

      await tester.pumpCheckbox(
        NakedCheckbox(
          checked: false,
          indeterminate: isIndeterminate,
          onChanged: (value) {
            triState = value;
            isIndeterminate = false;
          },
          child: const Text('Checkbox Label'),
        ),
      );

      await tester.tap(find.byType(NakedCheckbox));
      expect(triState, true);
      expect(isIndeterminate, false);
    });

    testWidgets('cannot be both checked and indeterminate',
        (WidgetTester tester) async {
      expect(
        () => NakedCheckbox(
          checked: true,
          indeterminate: true,
          onChanged: (_) {},
          child: const Text('Checkbox Label'),
        ),
        throwsAssertionError,
      );
    });
  });

  group('Accessibility', () {
    testWidgets('provides semantic checkbox property',
        (WidgetTester tester) async {
      await tester.pumpCheckbox(
        NakedCheckbox(
          checked: true,
          onChanged: (_) {},
          child: const Text('Checkbox Label'),
        ),
      );

      final semantics = tester.getSemantics(find.byType(Semantics).first);
      expect(semantics.hasFlag(SemanticsFlag.hasCheckedState), true);
      expect(semantics.hasFlag(SemanticsFlag.isChecked), true);
    });

    testWidgets('provides semantic indeterminate state',
        (WidgetTester tester) async {
      await tester.pumpCheckbox(
        NakedCheckbox(
          checked: false,
          indeterminate: true,
          onChanged: (_) {},
          child: const Text('Checkbox Label'),
        ),
      );

      final semantics = tester.getSemantics(find.byType(Semantics).first);
      expect(semantics.hasFlag(SemanticsFlag.hasToggledState), true);
      expect(semantics.hasFlag(SemanticsFlag.isToggled), true);
    });

    testWidgets('applies custom semantic label when provided',
        (WidgetTester tester) async {
      await tester.pumpCheckbox(
        NakedCheckbox(
          checked: false,
          onChanged: (_) {},
          semanticLabel: 'Custom Checkbox Label',
          child: const Text('Checkbox Label'),
        ),
      );

      final semantics = tester.getSemantics(find.byType(Semantics).first);
      expect(semantics.label, 'Custom Checkbox Label');
    });

    testWidgets('shows correct enabled/disabled state',
        (WidgetTester tester) async {
      for (var enabled in [true, false]) {
        await tester.pumpCheckbox(
          NakedCheckbox(
            checked: false,
            onChanged: (_) {},
            enabled: enabled,
            child: const Text('Checkbox Label'),
          ),
        );

        final semantics = tester.getSemantics(find.byType(Semantics).first);
        expect(semantics.hasFlag(SemanticsFlag.isEnabled), enabled);
      }
    });
  });

  group('Cursor', () {
    testWidgets('shows appropriate cursor based on interactive state',
        (WidgetTester tester) async {
      await tester.pumpCheckbox(
        Column(
          children: [
            NakedCheckbox(
              checked: false,
              onChanged: (_) {},
              child: const Text('Enabled Checkbox'),
            ),
            NakedCheckbox(
              checked: false,
              onChanged: (_) {},
              enabled: false,
              child: const Text('Disabled Checkbox'),
            ),
          ],
        ),
      );

      tester.expectCursor(
        SystemMouseCursors.click,
        on: find.text('Enabled Checkbox'),
      );

      tester.expectCursor(
        SystemMouseCursors.forbidden,
        on: find.text('Disabled Checkbox'),
      );
    });

    testWidgets('supports custom cursor', (WidgetTester tester) async {
      await tester.pumpCheckbox(
        NakedCheckbox(
          checked: false,
          onChanged: (_) {},
          cursor: SystemMouseCursors.help,
          child: const Text('Custom Cursor Checkbox'),
        ),
      );

      tester.expectCursor(
        SystemMouseCursors.help,
        on: find.text('Custom Cursor Checkbox'),
      );
    });
  });
}
