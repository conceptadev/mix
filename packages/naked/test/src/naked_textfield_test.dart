import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/naked.dart';

extension _WidgetTesterX on WidgetTester {
  Future<void> pumpTextField(Widget widget) async {
    await pumpWidget(
      WidgetsApp(
        color: Colors.white,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => widget,
        ),
      ),
    );
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
}

void main() {
  group('Basic Functionality', () {
    testWidgets('renders correctly with builder', (WidgetTester tester) async {
      await tester.pumpTextField(
        NakedTextField(
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(border: Border.all()),
              child: child,
            );
          },
        ),
      );

      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(EditableText), findsOneWidget);
    });

    testWidgets('allows text input', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpTextField(
        NakedTextField(
          controller: controller,
          builder: (context, child) => child,
        ),
      );

      await tester.tap(find.byType(NakedTextField));
      await tester.pump();
      await tester.enterText(find.byType(NakedTextField), 'Hello, World!');

      expect(controller.text, equals('Hello, World!'));
    });

    testWidgets('does not allow text input when readOnly is true',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpTextField(
        NakedTextField(
          controller: controller,
          readOnly: true,
          builder: (context, child) => child,
        ),
      );

      await tester.tap(find.byType(NakedTextField));
      await tester.pump();
      await tester.enterText(find.byType(NakedTextField), 'Hello, World!');

      expect(controller.text, equals(''));
    });

    testWidgets('does not allow text input when disabled',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpTextField(
        NakedTextField(
          controller: controller,
          enabled: false,
          builder: (context, child) => child,
        ),
      );

      await tester.tap(find.byType(NakedTextField));
      await tester.pump();
      await tester.enterText(find.byType(NakedTextField), 'Hello, World!');

      expect(controller.text, equals(''));
    });
  });

  group('State Callbacks', () {
    testWidgets('calls onHoverState when hovered', (WidgetTester tester) async {
      bool isHovered = false;
      await tester.pumpTextField(
        Padding(
          padding: const EdgeInsets.all(1),
          child: NakedTextField(
            onHoverState: (value) => isHovered = value,
            builder: (context, child) => child,
          ),
        ),
      );

      final gesture = await tester.simulateHover(NakedTextField);
      expect(isHovered, true);

      await gesture.moveTo(Offset.zero);
      await tester.pump();
      expect(isHovered, false);
    });

    testWidgets('calls onPressedState on tap down/up',
        (WidgetTester tester) async {
      bool isPressed = false;
      await tester.pumpTextField(
        NakedTextField(
          onPressedState: (value) => isPressed = value,
          builder: (context, child) => child,
        ),
      );

      final gesture = await tester.press(find.byType(NakedTextField));
      await tester.pumpAndSettle();
      expect(isPressed, true);

      await gesture.up();
      await tester.pump();
      expect(isPressed, false);
    });

    testWidgets('calls onFocusState when focused/unfocused',
        (WidgetTester tester) async {
      bool isFocused = false;
      final focusNode = FocusNode();

      await tester.pumpTextField(
        NakedTextField(
          focusNode: focusNode,
          onFocusState: (value) => isFocused = value,
          builder: (context, child) => child,
        ),
      );

      focusNode.requestFocus();
      await tester.pump();
      expect(isFocused, true);

      focusNode.unfocus();
      await tester.pump();
      expect(isFocused, false);
    });

    testWidgets('calls onChanged when text changes',
        (WidgetTester tester) async {
      String changedText = '';
      await tester.pumpTextField(
        NakedTextField(
          onChanged: (value) => changedText = value,
          builder: (context, child) => child,
        ),
      );

      await tester.tap(find.byType(NakedTextField));
      await tester.pump();
      await tester.enterText(find.byType(NakedTextField), 'Hello, World!');

      expect(changedText, equals('Hello, World!'));
    });
  });

  group('Input Management', () {
    testWidgets('obeys maxLines parameter', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpTextField(
        NakedTextField(
          controller: controller,
          maxLines: 3,
          builder: (context, child) => child,
        ),
      );

      final editableText =
          tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.maxLines, 3);
    });

    testWidgets('obeys minLines parameter', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpTextField(
        NakedTextField(
          controller: controller,
          minLines: 2,
          maxLines: 4,
          builder: (context, child) => child,
        ),
      );

      final editableText =
          tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.minLines, 2);
    });

    testWidgets('respects maxLength parameter', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpTextField(
        NakedTextField(
          controller: controller,
          maxLength: 5,
          builder: (context, child) => child,
        ),
      );

      await tester.tap(find.byType(NakedTextField));
      await tester.pump();
      await tester.enterText(find.byType(NakedTextField), '123456789');

      expect(controller.text, equals('12345'));
    });
  });

  group('Text Formatting', () {
    testWidgets('obscures text when obscureText is true',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpTextField(
        NakedTextField(
          controller: controller,
          obscureText: true,
          builder: (context, child) => child,
        ),
      );

      await tester.tap(find.byType(NakedTextField));
      await tester.pump();
      await tester.enterText(find.byType(NakedTextField), 'password');

      expect(controller.text, equals('password'));
      final editableText =
          tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.obscureText, true);
    });

    testWidgets('uses custom obscuringCharacter', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpTextField(
        NakedTextField(
          controller: controller,
          obscureText: true,
          obscuringCharacter: '-',
          builder: (context, child) => child,
        ),
      );

      final editableText =
          tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.obscuringCharacter, '-');
    });

    testWidgets('respects textAlign parameter', (WidgetTester tester) async {
      await tester.pumpTextField(
        NakedTextField(
          textAlign: TextAlign.justify,
          builder: (context, child) => child,
        ),
      );

      final editableText =
          tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.textAlign, TextAlign.justify);
    });

    testWidgets('applies input formatters', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpTextField(
        NakedTextField(
          controller: controller,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          builder: (context, child) => child,
        ),
      );

      await tester.tap(find.byType(NakedTextField));
      await tester.pump();
      await tester.enterText(find.byType(NakedTextField), 'abc123def');

      expect(controller.text, equals('123'));
    });
  });

  group('Keyboard Interaction', () {
    testWidgets('respects keyboard type', (WidgetTester tester) async {
      await tester.pumpTextField(
        NakedTextField(
          keyboardType: TextInputType.number,
          builder: (context, child) => child,
        ),
      );

      await tester.tap(find.byType(NakedTextField));
      await tester.pump();

      final editableText =
          tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.keyboardType, TextInputType.number);
    });

    testWidgets('respects text input action', (WidgetTester tester) async {
      await tester.pumpTextField(
        NakedTextField(
          textInputAction: TextInputAction.search,
          builder: (context, child) => child,
        ),
      );

      await tester.tap(find.byType(NakedTextField));
      await tester.pump();

      final editableText =
          tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.textInputAction, TextInputAction.search);
    });

    testWidgets('calls onSubmitted when action button is pressed',
        (WidgetTester tester) async {
      String submitted = '';
      await tester.pumpTextField(
        NakedTextField(
          onSubmitted: (value) => submitted = value,
          builder: (context, child) => child,
        ),
      );

      await tester.tap(find.byType(NakedTextField));
      await tester.pump();
      await tester.enterText(find.byType(NakedTextField), 'Hello, World!');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(submitted, equals('Hello, World!'));
    });
  });

  group('Selection Behavior', () {
    testWidgets('allows text selection', (WidgetTester tester) async {
      final controller = TextEditingController(text: 'Hello, World!');
      await tester.pumpTextField(
        NakedTextField(
          controller: controller,
          builder: (context, child) => child,
        ),
      );

      await tester.tap(find.byType(NakedTextField));
      await tester.pump();

      await tester.tapAt(tester.getTopLeft(find.byType(NakedTextField)));
      await tester.tapAt(tester.getTopLeft(find.byType(NakedTextField)));
      await tester.pump();

      expect(controller.selection.isValid, isTrue);
      expect(controller.selection.isCollapsed, isFalse);
    });

    testWidgets('cursor has the specified width', (WidgetTester tester) async {
      await tester.pumpTextField(
        NakedTextField(
          cursorWidth: 5.0,
          builder: (context, child) => child,
        ),
      );

      final editableText =
          tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.cursorWidth, 5.0);
    });

    testWidgets('cursor has the specified color', (WidgetTester tester) async {
      await tester.pumpTextField(
        NakedTextField(
          cursorColor: Colors.red,
          builder: (context, child) => child,
        ),
      );

      final editableText =
          tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.cursorColor, Colors.red);
    });
  });

  group('Accessibility', () {
    testWidgets('provides semantic properties for accessibility',
        (WidgetTester tester) async {
      await tester.pumpTextField(
        NakedTextField(
          builder: (context, child) => child,
        ),
      );

      final semantics = tester.getSemantics(find.byType(NakedTextField).first);
      expect(semantics.hasFlag(SemanticsFlag.isTextField), true);
    });

    testWidgets('respects enabled state for semantics',
        (WidgetTester tester) async {
      for (var enabled in [false, true]) {
        await tester.pumpTextField(
          NakedTextField(
            enabled: enabled,
            builder: (context, child) => child,
          ),
        );

        final semantics =
            tester.getSemantics(find.byType(NakedTextField).first);
        expect(semantics.hasFlag(SemanticsFlag.isEnabled), enabled);

        await tester.pumpWidget(Container());
      }
    });
  });
}
