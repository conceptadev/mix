import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/naked.dart';

extension _WidgetTesterX on WidgetTester {
  Future<void> pumpAccordion(Widget widget) async {
    await pumpWidget(
      WidgetsApp(
        color: const Color(0xFF000000),
        onGenerateRoute: (settings) => PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => widget,
        ),
      ),
    );
  }

  Future<TestGesture> simulateHover(Type type) async {
    final gesture = await createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);
    addTearDown(gesture.removePointer);
    await pump();

    await gesture.moveTo(getCenter(find.byType(type).first));
    await pump();

    return gesture;
  }

  void expectCursor(SystemMouseCursor cursor, {required Finder on}) async {
    final mouseRegion = widget<MouseRegion>(
        find.ancestor(of: on, matching: find.byType(MouseRegion)).first);

    expect(mouseRegion.cursor, cursor);
  }
}

void main() {
  group('Basic Functionality', () {
    testWidgets('renders triggers correctly when closed',
        (WidgetTester tester) async {
      await tester.pumpAccordion(
        NakedAccordion<String>(
          controller: AccordionController(),
          children: const [
            NakedAccordionItem(
              value: 'item1',
              trigger: Text('Trigger 1'),
              content: Text('Content 1'),
            ),
            NakedAccordionItem(
              value: 'item2',
              trigger: Text('Trigger 2'),
              content: Text('Content 2'),
            ),
          ],
        ),
      );

      expect(find.text('Trigger 1'), findsOneWidget);
      expect(find.text('Trigger 2'), findsOneWidget);
      expect(find.text('Content 1'), findsNothing);
      expect(find.text('Content 2'), findsNothing);
    });

    testWidgets('initially expands items based on initialExpandedValues',
        (WidgetTester tester) async {
      await tester.pumpAccordion(
        NakedAccordion<String>(
          controller: AccordionController(),
          initialExpandedValues: const ['item1'],
          children: const [
            NakedAccordionItem(
              value: 'item1',
              trigger: Text('Trigger 1'),
              content: Text('Content 1'),
            ),
            NakedAccordionItem(
              value: 'item2',
              trigger: Text('Trigger 2'),
              content: Text('Content 2'),
            ),
          ],
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Trigger 1'), findsOneWidget);
      expect(find.text('Content 1'), findsOneWidget);
      expect(find.text('Trigger 2'), findsOneWidget);
      expect(find.text('Content 2'), findsNothing);
    });
  });

  group('Expansion Behavior', () {
    testWidgets('expands and collapses items correctly when clicked',
        (WidgetTester tester) async {
      final controller = AccordionController<String>();

      await tester.pumpAccordion(
        StatefulBuilder(builder: (context, setState) {
          return NakedAccordion<String>(
            controller: controller,
            onTriggerPressed: (value) => setState(() {
              controller.toggle(value);
            }),
            children: const [
              NakedAccordionItem<String>(
                value: 'item1',
                trigger: NakedAccordionTrigger<String>(
                  child: Text('Trigger 1'),
                ),
                content: Text('Content 1'),
              ),
              NakedAccordionItem(
                value: 'item2',
                trigger: NakedAccordionTrigger<String>(
                  child: Text('Trigger 2'),
                ),
                content: Text('Content 2'),
              ),
            ],
          );
        }),
      );

      // Initially both items should be collapsed
      expect(find.text('Trigger 1'), findsOneWidget);
      expect(find.text('Content 1'), findsNothing);
      expect(find.text('Trigger 2'), findsOneWidget);
      expect(find.text('Content 2'), findsNothing);

      // Clicking first trigger should expand first item
      await tester.tap(find.text('Trigger 1'));
      await tester.pump();

      expect(find.text('Trigger 1'), findsOneWidget);
      expect(find.text('Content 1'), findsOneWidget);
      expect(find.text('Trigger 2'), findsOneWidget);
      expect(find.text('Content 2'), findsNothing);

      // Clicking second trigger should expand second item
      await tester.tap(find.text('Trigger 2'));
      await tester.pump();

      expect(find.text('Trigger 1'), findsOneWidget);
      expect(find.text('Content 1'), findsOneWidget);
      expect(find.text('Trigger 2'), findsOneWidget);
      expect(find.text('Content 2'), findsOneWidget);

      // Clicking first trigger again should collapse first item
      await tester.tap(find.text('Trigger 1'));
      await tester.pump();

      expect(find.text('Trigger 1'), findsOneWidget);
      expect(find.text('Content 1'), findsNothing);
      expect(find.text('Trigger 2'), findsOneWidget);
      expect(find.text('Content 2'), findsOneWidget);
    });

    testWidgets(
        'expands and collapses items correctly even with initialExpandedValues',
        (WidgetTester tester) async {
      final controller = AccordionController<String>();
      await tester.pumpAccordion(
        StatefulBuilder(builder: (context, setState) {
          void handlePress(String value) {
            setState(() {
              controller.toggle(value);
            });
          }

          return NakedAccordion<String>(
            controller: controller,
            initialExpandedValues: const [
              'item1',
            ],
            onTriggerPressed: handlePress,
            children: const [
              NakedAccordionItem(
                value: 'item1',
                trigger: NakedAccordionTrigger<String>(
                  child: Text('Trigger 1'),
                ),
                content: Text('Content 1'),
              ),
              NakedAccordionItem(
                value: 'item2',
                trigger: NakedAccordionTrigger<String>(
                  child: Text('Trigger 2'),
                ),
                content: Text('Content 2'),
              ),
            ],
          );
        }),
      );

      expect(find.text('Trigger 1'), findsOneWidget);
      expect(find.text('Content 1'), findsOneWidget);
      expect(find.text('Trigger 2'), findsOneWidget);
      expect(find.text('Content 2'), findsNothing);

      await tester.tap(find.text('Trigger 1'));
      await tester.pump();

      expect(find.text('Trigger 1'), findsOneWidget);
      expect(find.text('Content 1'), findsNothing);
      expect(find.text('Trigger 2'), findsOneWidget);
      expect(find.text('Content 2'), findsNothing);

      await tester.tap(find.text('Trigger 2'));
      await tester.pump();

      expect(find.text('Trigger 1'), findsOneWidget);
      expect(find.text('Content 1'), findsNothing);
      expect(find.text('Trigger 2'), findsOneWidget);
      expect(find.text('Content 2'), findsOneWidget);
    });
  });

  group('State Management and Callbacks', () {
    testWidgets(
        'onTriggerPressed callback is fired when any trigger is pressed',
        (WidgetTester tester) async {
      String? lastPressedTriggerValue;

      await tester.pumpAccordion(
        NakedAccordion<String>(
          controller: AccordionController(),
          onTriggerPressed: (value) => lastPressedTriggerValue = value,
          children: const [
            NakedAccordionItem(
              value: 'item1',
              trigger: NakedAccordionTrigger<String>(
                child: Text('Trigger 1'),
              ),
              content: Text('Content 1'),
            ),
            NakedAccordionItem<String>(
              value: 'item2',
              trigger: NakedAccordionTrigger<String>(
                child: Text('Trigger 2'),
              ),
              content: Text('Content 2'),
            ),
          ],
        ),
      );

      // Expand item
      await tester.tap(find.text('Trigger 1'));
      await tester.pump();

      expect(lastPressedTriggerValue, 'item1');

      // Collapse item
      await tester.tap(find.text('Trigger 2'));
      await tester.pumpAndSettle();

      expect(lastPressedTriggerValue, 'item2');
    });

    // testWidgets('item onExpandedStateChange callback is fired',
    //     (WidgetTester tester) async {
    //   bool? lastExpandedState;

    //   await tester.pumpAccordion(
    //     NakedAccordion(
    //       children: [
    //         NakedAccordionItem(
    //           value: 'item1',
    //           onExpandedStateChange: (expanded) {
    //             lastExpandedState = expanded;
    //           },
    //           trigger: const NakedAccordionTrigger(
    //             child: Text('Trigger 1'),
    //           ),
    //           content: const NakedAccordionContent(
    //             child: Text('Content 1'),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );

    //   // Expand item
    //   await tester.tap(find.text('Trigger 1'));
    //   await tester.pumpAndSettle();

    //   expect(lastExpandedState, true);

    //   // Collapse item
    //   await tester.tap(find.text('Trigger 1'));
    //   await tester.pumpAndSettle();

    //   expect(lastExpandedState, false);
    // });

    // testWidgets('onFocusItem callback is fired', (WidgetTester tester) async {
    //   String? focusedItemValue;

    //   await tester.pumpAccordion(
    //     NakedAccordion(
    //       onFocusItem: (value) {
    //         focusedItemValue = value;
    //       },
    //       children: const [
    //         NakedAccordionItem(
    //           value: 'item1',
    //           trigger: NakedAccordionTrigger(
    //             child: Text('Trigger 1'),
    //           ),
    //           content: NakedAccordionContent(
    //             child: Text('Content 1'),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );

    //   // Tap to focus
    //   await tester.tap(find.text('Trigger 1'));
    //   await tester.pump();

    //   expect(focusedItemValue, 'item1');
    // });
  });

  group('Trigger Interaction', () {
    testWidgets('calls onHoverState when hovered', (WidgetTester tester) async {
      bool isHovered = false;

      await tester.pumpAccordion(
        NakedAccordion<String>(
          initialExpandedValues: const ['item1'],
          controller: AccordionController(),
          children: [
            NakedAccordionItem(
              value: 'item1',
              trigger: NakedAccordionTrigger<String>(
                onHoverState: (value) => isHovered = value,
                child: const Text('Trigger 1'),
              ),
              content: const Text('Content 1'),
            ),
          ],
        ),
      );

      final gesture = await tester.simulateHover(NakedAccordionTrigger<String>);
      expect(isHovered, true);

      await gesture.moveTo(Offset.zero);
      await tester.pump();

      expect(isHovered, false);
    });

    testWidgets('calls onPressedState on tap down/up',
        (WidgetTester tester) async {
      bool isPressed = false;

      await tester.pumpAccordion(
        NakedAccordion<String>(
          controller: AccordionController(),
          children: [
            NakedAccordionItem(
              value: 'item1',
              trigger: NakedAccordionTrigger<String>(
                onPressedState: (value) => isPressed = value,
                child: const Text('Trigger 1'),
              ),
              content: const Text('Content 1'),
            ),
          ],
        ),
      );

      final gesture =
          await tester.press(find.byType(NakedAccordionTrigger<String>));
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

      await tester.pumpAccordion(
        NakedAccordion<String>(
          controller: AccordionController(),
          children: [
            NakedAccordionItem(
              value: 'item1',
              trigger: NakedAccordionTrigger<String>(
                focusNode: focusNode,
                onFocusState: (value) => isFocused = value,
                child: const Text('Trigger 1'),
              ),
              content: const Text('Content 1'),
            ),
          ],
        ),
      );

      focusNode.requestFocus();
      await tester.pump();
      expect(isFocused, true);

      focusNode.unfocus();
      await tester.pump();
      expect(isFocused, false);
    });
  });

  group('Accessibility', () {
    testWidgets('triggers have proper semantic properties',
        (WidgetTester tester) async {
      final controller = AccordionController<String>();

      await tester.pumpAccordion(
        StatefulBuilder(builder: (context, setState) {
          return NakedAccordion<String>(
            controller: controller,
            onTriggerPressed: (value) => setState(() {
              controller.toggle(value);
            }),
            children: const [
              NakedAccordionItem(
                value: 'item1',
                semanticLabel: 'First Section',
                trigger: NakedAccordionTrigger<String>(
                  semanticLabel: 'First Section Header',
                  child: Text('Trigger 1'),
                ),
                content: Text('Content 1'),
              ),
            ],
          );
        }),
      );

      // Get semantic node for trigger
      final SemanticsNode triggerNode =
          tester.getSemantics(find.text('Trigger 1'));

      // Verify semantic properties
      expect(triggerNode.label, 'First Section Header');
      expect(triggerNode.hasFlag(SemanticsFlag.isButton), true);
      expect(triggerNode.hasFlag(SemanticsFlag.isToggled), false);

      // Expand the accordion
      await tester.tap(find.text('Trigger 1'));
      await tester.pump();

      // Get semantic node for trigger again after expansion
      final SemanticsNode expandedTriggerNode =
          tester.getSemantics(find.text('Trigger 1'));

      // Verify it's now toggled
      expect(expandedTriggerNode.hasFlag(SemanticsFlag.isToggled), true);

      // Verify content is accessible
      expect(find.text('Content 1'), findsOneWidget);
    });

    testWidgets('supports keyboard activation', (WidgetTester tester) async {
      final controller = AccordionController<String>();
      const triggerTextKey = Key('trigger');
      const triggerTextKey2 = Key('trigger2');
      await tester.pumpAccordion(
        StatefulBuilder(builder: (context, setState) {
          return NakedAccordion<String>(
            controller: controller,
            onTriggerPressed: (value) => setState(() {
              controller.toggle(value);
            }),
            children: const [
              NakedAccordionItem<String>(
                value: 'item1',
                trigger: NakedAccordionTrigger<String>(
                  child: Text(
                    'Trigger 1',
                    key: triggerTextKey,
                  ),
                ),
                content: Text('Content 1'),
              ),
              NakedAccordionItem<String>(
                value: 'item2',
                trigger: NakedAccordionTrigger<String>(
                  child: Text(
                    'Trigger 2',
                    key: triggerTextKey2,
                  ),
                ),
                content: Text('Content 2'),
              ),
            ],
          );
        }),
      );

      // Initially content is hidden
      expect(find.text('Content 1'), findsNothing);

      // Focus the trigger
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();

      final triggerTextFinder = find.byKey(triggerTextKey);

      // Ensure it's focused
      final focusNode = Focus.of(tester.element(triggerTextFinder));
      expect(focusNode.hasFocus, true);

      // Press space to activate
      await tester.sendKeyEvent(LogicalKeyboardKey.space);
      await tester.pump();

      // Verify the accordion expanded
      expect(find.text('Content 1'), findsOneWidget);

      // press tab to focus on the next trigger
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();

      final triggerTextFinder2 = find.byKey(triggerTextKey2);
      final focusNode2 = Focus.of(tester.element(triggerTextFinder2));
      expect(focusNode2.hasFocus, true);

      // press space to activate
      await tester.sendKeyEvent(LogicalKeyboardKey.space);
      await tester.pump();

      expect(find.text('Content 2'), findsOneWidget);
    });
  });

  group('Disabled States', () {
    testWidgets('disabled item prevents interaction',
        (WidgetTester tester) async {
      final controller = AccordionController<String>();

      await tester.pumpAccordion(
        StatefulBuilder(builder: (context, setState) {
          void handlePress(String value) {
            setState(() {
              controller.toggle(value);
            });
          }

          return NakedAccordion<String>(
            controller: controller,
            onTriggerPressed: handlePress,
            children: const [
              NakedAccordionItem<String>(
                value: 'item1',
                enabled: false,
                trigger: NakedAccordionTrigger<String>(
                  child: Text('Trigger 1'),
                ),
                content: Text('Content 1'),
              ),
              NakedAccordionItem(
                value: 'item2',
                trigger: NakedAccordionTrigger<String>(
                  child: Text('Trigger 2'),
                ),
                content: Text('Content 2'),
              ),
            ],
          );
        }),
      );

      // Attempt to expand disabled item
      await tester.tap(find.text('Trigger 1'));
      await tester.pumpAndSettle();

      // Content should remain collapsed
      expect(find.text('Content 1'), findsNothing);

      // Check cursor is forbidden for disabled item
      tester.expectCursor(
        SystemMouseCursors.forbidden,
        on: find.text('Trigger 1'),
      );

      // Non-disabled item should have click cursor and work normally
      tester.expectCursor(
        SystemMouseCursors.click,
        on: find.text('Trigger 2'),
      );

      // Expand enabled item
      await tester.tap(find.text('Trigger 2'));
      await tester.pumpAndSettle();

      // Content should expand
      expect(find.text('Content 2'), findsOneWidget);
    });
  });
}
