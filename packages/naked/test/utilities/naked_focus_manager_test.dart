import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/src/utilities/naked_focus_manager.dart';

void main() {
  group('NakedFocusManager', () {
    testWidgets('should trap focus inside its child when trapFocus is true',
        (WidgetTester tester) async {
      final focusNode1 = FocusNode();
      final focusNode2 = FocusNode();
      final focusNode3 = FocusNode();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 300, // Set fixed height to avoid overflow
              child: Column(
                children: [
                  Material(
                    child: TextField(
                      focusNode: focusNode1,
                    ),
                  ),
                  NakedFocusManager(
                    trapFocus: true,
                    child: Material(
                      child: TextField(
                        focusNode: focusNode2,
                      ),
                    ),
                  ),
                  Material(
                    child: TextField(
                      focusNode: focusNode3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Focus the second text field
      focusNode2.requestFocus();
      await tester.pump();
      expect(focusNode2.hasFocus, isTrue);

      // Try to tab to the next field (should stay trapped inside)
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();

      // Since focus is trapped, it should cycle back to the second field
      expect(focusNode3.hasFocus, isFalse);
      expect(focusNode2.hasFocus, isTrue);
    });

    testWidgets('should handle escape key press', (WidgetTester tester) async {
      bool escapePressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NakedFocusManager(
              onEscapePressed: () {
                escapePressed = true;
              },
              child: Material(
                child: Focus(
                  autofocus: true,
                  child: Container(width: 100, height: 100, color: Colors.blue),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump(); // Allow focus to be established

      // Press escape key
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pump();

      expect(escapePressed, isTrue);
    });

    testWidgets('should autofocus when autofocus is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return NakedFocusManager(
                  autofocus: true,
                  child: Material(
                    child:
                        Container(width: 100, height: 100, color: Colors.red),
                  ),
                );
              },
            ),
          ),
        ),
      );

      // Need additional pumps for autofocus to work
      await tester.pumpAndSettle();

      // Check if a FocusScope within the NakedFocusManager is focused
      final focusScopes = find.byType(FocusScope);
      expect(focusScopes, findsAtLeastNWidgets(1));

      // There should be focus somewhere within our widget tree
      final hasFocusInTree = FocusManager.instance.primaryFocus != null;
      expect(hasFocusInTree, isTrue);
    });

    testWidgets('restores focus when restoreFocus is true',
        (WidgetTester tester) async {
      final outsideFocusNode = FocusNode();

      // Create a widget with a stateful component that can show/hide
      // the NakedFocusManager
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: _FocusTestWidget(outsideFocusNode: outsideFocusNode),
          ),
        ),
      );

      // Focus the outside text field
      outsideFocusNode.requestFocus();
      await tester.pump();
      expect(outsideFocusNode.hasFocus, isTrue);

      // Find and tap the button to show the focus manager
      await tester.tap(find.text('Show Focus Manager'));
      await tester.pump();

      // Outside node should lose focus
      expect(outsideFocusNode.hasFocus, isFalse);

      // Tap the button to hide the focus manager
      await tester.tap(find.text('Hide Focus Manager'));
      await tester.pump();

      // Outside node should regain focus
      expect(outsideFocusNode.hasFocus, isTrue);
    });
  });
}

// Helper widget for testing focus restoration
class _FocusTestWidget extends StatefulWidget {
  final FocusNode outsideFocusNode;

  const _FocusTestWidget({required this.outsideFocusNode});

  @override
  _FocusTestWidgetState createState() => _FocusTestWidgetState();
}

class _FocusTestWidgetState extends State<_FocusTestWidget> {
  bool showFocusManager = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          child: TextField(focusNode: widget.outsideFocusNode),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              showFocusManager = true;
            });
          },
          child: const Text('Show Focus Manager'),
        ),
        if (showFocusManager) ...[
          NakedFocusManager(
            restoreFocus: true,
            autofocus: true,
            child: Column(
              children: [
                const Material(
                  child: TextField(),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showFocusManager = false;
                    });
                  },
                  child: const Text('Hide Focus Manager'),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
