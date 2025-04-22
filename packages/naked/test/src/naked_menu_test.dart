import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/naked.dart';

// Test extensions for NakedMenu
extension _NakedMenuFinders on CommonFinders {
  Finder nakedMenuContent() => byType(NakedMenuContent);
  Finder nakedMenuItem() => byType(NakedMenuItem);
  Finder nakedMenuItemWithText(String text) =>
      find.descendant(of: nakedMenuItem(), matching: find.text(text));
}

// Test extensions for WidgetTester to interact with NakedMenu
extension _NakedMenuTester on WidgetTester {
  Future<void> pumpMenu(Widget widget) async {
    await pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ),
    ));
  }

  Future<void> closeMenuWithEscape() async {
    await sendKeyEvent(LogicalKeyboardKey.escape);
    await pumpAndSettle();
  }

  Future<TestGesture> hoverMenuItem(String text) async {
    final gesture = await createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);
    await pump();
    await gesture.moveTo(getCenter(find.nakedMenuItemWithText(text)));
    await pump();

    return gesture;
  }

  Future<void> tapOutsideMenu() async {
    await tapAt(const Offset(10, 10));
    await pump();
  }
}

// Helper for verifying states
extension _NakedMenuMatcher on WidgetTester {
  bool isMenuOpen() => any(find.nakedMenuContent());

  bool isMenuClosed() => !any(find.nakedMenuContent());
}

void main() {
  group('NakedMenu', () {
    group('Basic Functionality', () {
      testWidgets('Renders child widget', (WidgetTester tester) async {
        await tester.pumpMenu(
          const NakedMenu(
            open: true,
            menu: NakedMenuContent(
              child: Text('Menu Content'),
            ),
            child: Text('child'),
          ),
        );

        expect(find.text('child'), findsOneWidget);
        expect(find.text('Menu Content'), findsNothing);
      });

      testWidgets('Renders menu content when open',
          (WidgetTester tester) async {
        await tester.pumpMenu(
          const NakedMenu(
            open: true,
            menu: NakedMenuContent(
              child: Text('Menu Content'),
            ),
            child: Text('child'),
          ),
        );

        await tester.pump();
        expect(find.text('child'), findsOneWidget);
        expect(find.text('Menu Content'), findsOneWidget);
      });

      testWidgets('Opens when open property is true',
          (WidgetTester tester) async {
        bool isOpen = false;

        await tester.pumpMenu(
          StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  NakedButton(
                    onPressed: () => setState(() => isOpen = true),
                    child: const Text('Open Menu'),
                  ),
                  NakedMenu(
                    open: isOpen,
                    menu: const NakedMenuContent(
                      child: Text('Menu Content'),
                    ),
                    child: const Text('child'),
                  ),
                ],
              );
            },
          ),
        );

        expect(find.text('Menu Content'), findsNothing);
        await tester.tap(find.text('Open Menu'));
        await tester.pumpAndSettle();
        expect(find.text('Menu Content'), findsOneWidget);
      });

      testWidgets('Closes when open property is false',
          (WidgetTester tester) async {
        bool isOpen = true;

        await tester.pumpMenu(
          StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  NakedButton(
                    onPressed: () => setState(() => isOpen = false),
                    child: const Text('Close Menu'),
                  ),
                  NakedMenu(
                    open: isOpen,
                    menu: const NakedMenuContent(
                      child: Text('Menu Content'),
                    ),
                    child: const Text('child'),
                  ),
                ],
              );
            },
          ),
        );

        await tester.pump();
        expect(find.text('Menu Content'), findsOneWidget);
        await tester.tap(find.text('Close Menu'));
        await tester.pumpAndSettle();
        expect(find.text('Menu Content'), findsNothing);
      });

      testWidgets('Does not respond when disabled',
          (WidgetTester tester) async {
        bool onMenuCloseCalled = false;

        await tester.pumpMenu(
          NakedMenu(
            enabled: false,
            onMenuClose: () => onMenuCloseCalled = true,
            menu: const NakedMenuContent(
              child: Text('Menu Content'),
            ),
            child: const Text('child'),
          ),
        );

        await tester.tap(find.text('child'));
        expect(onMenuCloseCalled, false);
      });

      testWidgets('Places menu according to menuAlignment parameter',
          (WidgetTester tester) async {
        await tester.pumpMenu(
          Center(
            child: NakedMenu(
              open: true,
              menuAlignment: const AlignmentPair(
                target: Alignment.bottomCenter,
                follower: Alignment.topCenter,
              ),
              menu: const NakedMenuContent(
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: Center(child: Text('Menu Content')),
                ),
              ),
              child: Container(
                width: 100,
                height: 40,
                color: Colors.blue,
                child: const Center(child: Text('child')),
              ),
            ),
          ),
        );

        await tester.pump();
        expect(find.byType(NakedMenu), findsOneWidget);
        expect(find.byType(NakedMenuContent), findsOneWidget);

        expect(find.text('Menu Content'), findsOneWidget);
      });
    });

    group('State Management', () {
      testWidgets('Closes when Escape key pressed',
          (WidgetTester tester) async {
        bool isOpen = true;

        await tester.pumpMenu(
          StatefulBuilder(
            builder: (context, setState) {
              return NakedMenu(
                open: isOpen,
                onMenuClose: () => setState(() => isOpen = false),
                menu: const NakedMenuContent(
                  child: Text('Menu Content'),
                ),
                child: const Text('child'),
              );
            },
          ),
        );

        await tester.pumpAndSettle();
        expect(tester.isMenuOpen(), true);

        await tester.closeMenuWithEscape();
        expect(isOpen, false);
        expect(tester.isMenuClosed(), true);
      });

      testWidgets('Closes when menu item selected (if closeOnSelect is true)',
          (WidgetTester tester) async {
        bool isOpen = true;

        await tester.pumpMenu(
          StatefulBuilder(
            builder: (context, setState) {
              return NakedMenu(
                open: isOpen,
                closeOnSelect: true,
                onMenuClose: () {
                  setState(() => isOpen = false);
                },
                menu: NakedMenuContent(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const NakedMenuItem(
                        child: Text('Item 1'),
                      ),
                      NakedMenuItem(
                        onPressed: () {},
                        child: const Text('Item 2'),
                      ),
                    ],
                  ),
                ),
                child: const Text('child'),
              );
            },
          ),
        );

        await tester.pump();
        expect(tester.isMenuOpen(), true);

        await tester.tap(find.text('Item 1'));
        await tester.pumpAndSettle();

        expect(isOpen, false);
        expect(tester.isMenuClosed(), true);
      });
    });

    group('Keyboard Interaction', () {
      testWidgets('Traps focus within menu when opens',
          (WidgetTester tester) async {
        bool item1Focused = false;
        bool item2Focused = false;

        await tester.pumpMenu(
          Center(
            child: NakedMenu(
              open: true,
              menu: NakedMenuContent(
                child: Column(
                  children: [
                    NakedMenuItem(
                      onPressed: () {},
                      onFocusState: (value) {
                        item1Focused = value;
                      },
                      child: const Text('Item 1'),
                    ),
                    NakedMenuItem(
                      onPressed: () {},
                      onFocusState: (value) {
                        item2Focused = value;
                      },
                      child: const Text('Item 2'),
                    ),
                  ],
                ),
              ),
              child: const Text('child'),
            ),
          ),
        );

        await tester.pump();
        expect(find.text('Item 1'), findsOneWidget);
        expect(find.text('Item 2'), findsOneWidget);

        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pump();

        expect(item1Focused, true);
        expect(item2Focused, false);

        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pump();

        expect(item1Focused, false);
        expect(item2Focused, true);
      });
    });

    // group('Accessibility', () {
    //   testWidgets('Provides semantic labels when provided',
    //       (WidgetTester tester) async {
    //     await tester.pumpMenu(
    //       const NakedMenu(
    //         semanticLabel: 'Test Menu',
    //         menu: NakedMenuContent(
    //           child: Text('Menu Content'),
    //         ),
    //         child: Text('child'),
    //       ),
    //     );

    //     expect(
    //       tester.getSemantics(find.byType(Semantics).first),
    //       matchesSemantics(label: 'Test Menu'),
    //     );
    //   });
    // });
  });

  group('NakedMenuContent', () {
    testWidgets('Renders child widget(s)', (WidgetTester tester) async {
      await tester.pumpMenu(
        const NakedMenuContent(
          child: Text('Menu Content'),
        ),
      );

      expect(find.text('Menu Content'), findsOneWidget);
    });

    testWidgets('Closes when clicking outside (if closeOnClickOutside is true)',
        (WidgetTester tester) async {
      bool isOpen = true;

      await tester.pumpMenu(
        StatefulBuilder(
          builder: (context, setState) {
            return Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {},
                    child: const SizedBox(
                      width: 50,
                      height: 50,
                      child: ColoredBox(color: Colors.red),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 100,
                  child: NakedMenu(
                    open: isOpen,
                    onMenuClose: () => setState(() => isOpen = false),
                    menu: const NakedMenuContent(
                      closeOnClickOutside: true,
                      child: SizedBox(
                        width: 100,
                        height: 50,
                        child: Center(child: Text('Menu Content')),
                      ),
                    ),
                    child: const Text('child'),
                  ),
                ),
              ],
            );
          },
        ),
      );

      await tester.pump();
      expect(tester.isMenuOpen(), true);

      // Tap outside the menu
      await tester.tapOutsideMenu();
      expect(isOpen, false);
      expect(tester.isMenuClosed(), true);
    });
  });

  group('NakedMenuItem', () {
    group('Basic Functionality', () {
      testWidgets('Renders child widget', (WidgetTester tester) async {
        await tester.pumpMenu(
          const NakedMenuItem(
            child: Text('Menu Item'),
          ),
        );

        expect(find.text('Menu Item'), findsOneWidget);
      });

      testWidgets('Handles tap/click when enabled',
          (WidgetTester tester) async {
        bool pressed = false;

        await tester.pumpMenu(
          NakedMenuItem(
            onPressed: () => pressed = true,
            child: const Text('Menu Item'),
          ),
        );

        await tester.tap(find.text('Menu Item'));
        expect(pressed, true);
      });

      testWidgets('Does not respond when disabled',
          (WidgetTester tester) async {
        bool pressed = false;

        await tester.pumpMenu(
          NakedMenuItem(
            enabled: false,
            onPressed: () => pressed = true,
            child: const Text('Menu Item'),
          ),
        );

        await tester.tap(find.text('Menu Item'));
        expect(pressed, false);
      });
    });

    group('State Callbacks', () {
      testWidgets('Calls state callbacks appropriately',
          (WidgetTester tester) async {
        bool hovered = false;
        bool pressed = false;
        bool focused = false;

        await tester.pumpMenu(
          NakedMenuItem(
            onHoverState: (value) => hovered = value,
            onPressedState: (value) => pressed = value,
            onFocusState: (value) => focused = value,
            child: const Text('Menu Item'),
          ),
        );

        // Test hover
        final gesture = await tester.hoverMenuItem('Menu Item');
        expect(hovered, true);
        await gesture.removePointer();

        await tester.pump();
        expect(hovered, false);

        // Test pressed state
        final pressGesture = await tester.press(find.text('Menu Item'));
        expect(pressed, true);

        await pressGesture.removePointer();
        await tester.pumpAndSettle();
        expect(pressed, false);

        // Test focus state
        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pump();
        expect(focused, true);

        // Clean up
        await gesture.removePointer();
      });
    });

    group('Keyboard Interaction', () {
      testWidgets('Activates with Space and Enter keys',
          (WidgetTester tester) async {
        bool pressed = false;

        final focusNode = FocusNode();

        await tester.pumpMenu(
          NakedMenuItem(
            focusNode: focusNode,
            onPressed: () => pressed = true,
            child: const Text('Menu Item'),
          ),
        );

        // Focus the item
        focusNode.requestFocus();
        await tester.pump();

        // Test space key
        await tester.sendKeyEvent(LogicalKeyboardKey.space);
        await tester.pump();
        expect(pressed, true);

        // Reset and test enter key
        pressed = false;
        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pump();
        expect(pressed, true);

        // Cleanup
        focusNode.dispose();
      });
    });
  });
}
