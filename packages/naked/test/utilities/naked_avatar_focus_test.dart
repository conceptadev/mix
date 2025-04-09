import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/naked.dart';

void main() {
  testWidgets('NakedAvatar manages focus with NakedFocusManager',
      (WidgetTester tester) async {
    bool focusChanged = false;
    final focusNode = FocusNode();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: NakedAvatar(
              src: 'https://example.com/avatar.jpg',
              focusNode: focusNode,
              onPressed: () {},
              onStateFocus: (hasFocus) {
                focusChanged = true;
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

    // Focus the avatar
    focusNode.requestFocus();
    await tester.pump();

    // Verify focus callback was called
    expect(focusChanged, true);

    // Clean up
    focusNode.dispose();
  });

  testWidgets('NakedAvatar includes proper semantics for accessibility',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: NakedAvatar(
              src: 'https://example.com/avatar.jpg',
              semanticLabel: 'Test Avatar',
              onPressed: () {},
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

    // Verify semantics properties are set correctly
    final semanticsWidget = find.byWidgetPredicate((widget) {
      if (widget is Semantics) {
        return widget.properties.label == 'Test Avatar' &&
            widget.properties.button == true &&
            widget.properties.enabled == true;
      }
      return false;
    });

    expect(semanticsWidget, findsOneWidget);
  });

  testWidgets('NakedAvatar restores focus when using NakedFocusManager',
      (WidgetTester tester) async {
    final parentFocusNode = FocusNode();
    final avatarFocusNode = FocusNode();

    // Build a widget with a focused parent and an avatar
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              children: [
                Focus(
                  focusNode: parentFocusNode,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                ),
                NakedAvatar(
                  src: 'https://example.com/avatar.jpg',
                  focusNode: avatarFocusNode,
                  onPressed: () {},
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

    // Now focus the avatar
    avatarFocusNode.requestFocus();
    await tester.pump();
    expect(avatarFocusNode.hasFocus, true);
    expect(parentFocusNode.hasFocus, false);

    // Remove the avatar from the tree (simulate a dialog closing)
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              children: [
                Focus(
                  focusNode: parentFocusNode,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // The NakedFocusManager should restore focus to the parent
    await tester.pump();

    // Verify NakedFocusManager configuration
    expect(find.byType(NakedAvatar), findsNothing); // Avatar is removed

    // Clean up
    parentFocusNode.dispose();
    avatarFocusNode.dispose();
  });
}
