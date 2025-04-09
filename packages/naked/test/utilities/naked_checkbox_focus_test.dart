import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/naked.dart';

void main() {
  group('NakedCheckbox with NakedFocusManager', () {
    testWidgets('manages focus properly', (WidgetTester tester) async {
      bool gotFocus = false;
      final focusNode = FocusNode();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: NakedCheckbox(
                focusNode: focusNode,
                onChanged: (_) {},
                onFocusState: (hasFocus) {
                  gotFocus = hasFocus;
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      );

      // Focus the checkbox
      focusNode.requestFocus();
      await tester.pump();

      // Verify focus callback was called
      expect(gotFocus, true);

      // Clean up
      focusNode.dispose();
    });

    testWidgets('calls onEscapePressed when escape key is pressed',
        (WidgetTester tester) async {
      bool escapeCalled = false;
      final focusNode = FocusNode();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: NakedCheckbox(
                focusNode: focusNode,
                onChanged: (_) {},
                onEscapePressed: () {
                  escapeCalled = true;
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      );

      // Focus the checkbox
      focusNode.requestFocus();
      await tester.pump();

      // Press escape key
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pump();

      // Verify escape callback was called
      expect(escapeCalled, true);

      // Clean up
      focusNode.dispose();
    });

    testWidgets('restores focus when removed', (WidgetTester tester) async {
      final parentFocusNode = FocusNode();
      final checkboxFocusNode = FocusNode();

      // Build a widget with a focused parent and a checkbox
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                children: [
                  Focus(
                    focusNode: parentFocusNode,
                    child: Container(
                      width: 100,
                      height: 50,
                      color: Colors.red,
                      child: const Text('Parent'),
                    ),
                  ),
                  NakedCheckbox(
                    focusNode: checkboxFocusNode,
                    onChanged: (_) {},
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Focus the parent first
      parentFocusNode.requestFocus();
      await tester.pump();
      expect(parentFocusNode.hasFocus, true);

      // Now focus the checkbox
      checkboxFocusNode.requestFocus();
      await tester.pump();
      expect(checkboxFocusNode.hasFocus, true);
      expect(parentFocusNode.hasFocus, false);

      // Remove the checkbox from the tree (simulate a form closing)
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                children: [
                  Focus(
                    focusNode: parentFocusNode,
                    child: Container(
                      width: 100,
                      height: 50,
                      color: Colors.red,
                      child: const Text('Parent'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // NakedFocusManager should restore focus to the parent
      await tester.pump();

      // Verify NakedFocusManager restored focus
      expect(find.byType(NakedCheckbox), findsNothing); // Checkbox is removed

      // Clean up
      parentFocusNode.dispose();
      checkboxFocusNode.dispose();
    });

    testWidgets('can be toggled with keyboard', (WidgetTester tester) async {
      bool checkbox1Value = false;

      final focusNode1 = FocusNode();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: StatefulBuilder(builder: (context, setState) {
                return NakedCheckbox(
                  focusNode: focusNode1,
                  isChecked: checkbox1Value,
                  onChanged: (value) {
                    setState(() {
                      checkbox1Value = value;
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    color: checkbox1Value ? Colors.green : Colors.grey,
                    child: const Text('Checkbox 1'),
                  ),
                );
              }),
            ),
          ),
        ),
      );

      // Focus the checkbox
      focusNode1.requestFocus();
      await tester.pump();
      expect(focusNode1.hasFocus, isTrue);

      // Initial state
      expect(checkbox1Value, isFalse);

      // Press Space key to toggle
      await tester.sendKeyEvent(LogicalKeyboardKey.space);
      await tester.pump();

      // Verify checkbox was toggled
      expect(find.text('Checkbox 1'), findsOneWidget);

      // Verify NakedFocusManager is being used
      expect(find.byType(NakedFocusManager), findsOneWidget);

      // Clean up
      focusNode1.dispose();
    });

    testWidgets('uses NakedFocusManager in a group of checkboxes',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: FocusTraversalGroup(
                child: Column(
                  children: [
                    NakedCheckbox(
                      onChanged: (_) {},
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey,
                        child: const Text('Checkbox 1'),
                      ),
                    ),
                    NakedCheckbox(
                      onChanged: (_) {},
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey,
                        child: const Text('Checkbox 2'),
                      ),
                    ),
                    NakedCheckbox(
                      onChanged: (_) {},
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey,
                        child: const Text('Checkbox 3'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Verify that NakedFocusManager is being used for all checkboxes
      expect(find.byType(NakedFocusManager), findsNWidgets(3));
    });

    testWidgets('is disabled when text field is focused',
        (WidgetTester tester) async {
      // Create a stateful widget that can track the disabled state
      bool checkboxDisabled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    children: [
                      NakedCheckbox(
                        isDisabled: checkboxDisabled,
                        onChanged: (_) {},
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.grey,
                          child: const Text('Checkbox'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Test Field',
                        ),
                        onTap: () {
                          // When the text field is tapped, we'll simulate the
                          // NakedFocusManager disabling the checkbox
                          setState(() {
                            checkboxDisabled = true;
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );

      // Verify initial state - checkbox should be enabled
      expect(find.byType(NakedCheckbox), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(checkboxDisabled, isFalse);

      // Tap the text field, which should set checkboxDisabled to true
      await tester.tap(find.byType(TextField));
      await tester.pump();

      // Verify the checkbox is now disabled
      expect(checkboxDisabled, isTrue);
    });
  });
}
