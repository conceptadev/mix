import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/naked.dart';

void main() {
  testWidgets('NakedAccordion basic rendering and expansion', (tester) async {
    Set<String> expanded = {};

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NakedAccordion(
            initialExpandedValues: expanded.toList(),
            onExpandedChange: (value, isExpanded) {
              if (isExpanded) {
                expanded.clear();
                expanded.add(value);
              } else {
                expanded.remove(value);
              }
            },
            children: const [
              NakedAccordionItem(
                value: 'item1',
                trigger: NakedAccordionTrigger(
                  icon: Icon(Icons.add),
                  child: Text('Trigger 1'),
                ),
                content: NakedAccordionContent(
                  child: Text('Content 1'),
                ),
              ),
              NakedAccordionItem(
                value: 'item2',
                trigger: NakedAccordionTrigger(
                  child: Text('Trigger 2'),
                ),
                content: NakedAccordionContent(
                  child: Text('Content 2'),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // Verify initial state (nothing expanded)
    expect(find.text('Trigger 1'), findsOneWidget);
    expect(find.text('Content 1'), findsOneWidget);
    expect(find.text('Trigger 2'), findsOneWidget);
    expect(find.text('Content 2'), findsOneWidget);

    // Check that nothing is expanded initially
    expect(expanded, isEmpty);

    // Tap Trigger 1
    await tester.tap(find.text('Trigger 1'));
    await tester.pumpAndSettle(); // Wait for animation

    // Verify Item 1 expanded
    expect(expanded, equals({'item1'}));
    expect(find.text('Content 1'), findsOneWidget);
    expect(find.text('Content 2'), findsOneWidget);
    await tester
        .ensureVisible(find.text('Content 1')); // Should be accessible now

    // Tap Trigger 2 (single mode, should collapse 1 and expand 2)
    await tester.tap(find.text('Trigger 2'));
    await tester.pumpAndSettle();

    // Verify Item 2 expanded, Item 1 collapsed
    expect(expanded, equals({'item2'}));
    expect(find.text('Content 1'), findsOneWidget);
    expect(find.text('Content 2'), findsOneWidget);
    await tester
        .ensureVisible(find.text('Content 2')); // Should be accessible now

    // Tap Trigger 2 again to collapse
    await tester.tap(find.text('Trigger 2'));
    await tester.pumpAndSettle();

    // Verify Item 2 collapsed
    expect(expanded, isEmpty);
    expect(find.text('Content 2'), findsOneWidget);
  });

  testWidgets('NakedAccordion multiple expansion mode', (tester) async {
    Set<String> expanded = {'item1'}; // Start with item1 expanded

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NakedAccordion(
            type: NakedAccordionType.multiple,
            initialExpandedValues: expanded.toList(),
            onExpandedChange: (value, isExpanded) {
              if (isExpanded) {
                expanded.add(value);
              } else {
                expanded.remove(value);
              }
            },
            children: const [
              NakedAccordionItem(
                value: 'item1',
                trigger: NakedAccordionTrigger(child: Text('Trigger 1')),
                content: NakedAccordionContent(child: Text('Content 1')),
              ),
              NakedAccordionItem(
                value: 'item2',
                trigger: NakedAccordionTrigger(child: Text('Trigger 2')),
                content: NakedAccordionContent(child: Text('Content 2')),
              ),
            ],
          ),
        ),
      ),
    );

    // Verify initial state (item1 expanded)
    expect(expanded, equals({'item1'}));
    expect(find.text('Content 1'), findsOneWidget);
    expect(find.text('Content 2'), findsOneWidget);
    await tester
        .ensureVisible(find.text('Content 1')); // Should be accessible now

    // Tap Trigger 2
    await tester.tap(find.text('Trigger 2'));
    await tester.pumpAndSettle();

    // Verify both items are expanded
    expect(expanded, equals({'item1', 'item2'}));
    expect(find.text('Content 1'), findsOneWidget);
    expect(find.text('Content 2'), findsOneWidget);
    await tester
        .ensureVisible(find.text('Content 1')); // Should be accessible now
    await tester
        .ensureVisible(find.text('Content 2')); // Should be accessible now

    // Tap Trigger 1 again to collapse it
    await tester.tap(find.text('Trigger 1'));
    await tester.pumpAndSettle();

    // Verify only Item 2 is expanded
    expect(expanded, equals({'item2'}));
    expect(find.text('Content 1'), findsOneWidget);
    expect(find.text('Content 2'), findsOneWidget);
    await tester
        .ensureVisible(find.text('Content 2')); // Should be accessible now
  });

  testWidgets('NakedAccordion isDisabled prevents expansion', (tester) async {
    Set<String> expanded = {};

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NakedAccordion(
            isDisabled: true, // Disable the whole accordion
            initialExpandedValues: expanded.toList(),
            onExpandedChange: (value, isExpanded) {
              if (isExpanded) {
                expanded.add(value);
              } else {
                expanded.remove(value);
              }
            },
            children: const [
              NakedAccordionItem(
                value: 'item1',
                trigger: NakedAccordionTrigger(child: Text('Trigger 1')),
                content: NakedAccordionContent(child: Text('Content 1')),
              ),
            ],
          ),
        ),
      ),
    );

    // Tap Trigger 1
    await tester.tap(find.text('Trigger 1'));
    await tester.pumpAndSettle();

    // Verify item did not expand
    expect(expanded, isEmpty);
    expect(find.text('Content 1'), findsOneWidget);
  });

  testWidgets('NakedAccordionItem isDisabled prevents expansion',
      (tester) async {
    Set<String> expanded = {};

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NakedAccordion(
            initialExpandedValues: expanded.toList(),
            onExpandedChange: (value, isExpanded) {
              if (isExpanded) {
                expanded.add(value);
              } else {
                expanded.remove(value);
              }
            },
            children: const [
              NakedAccordionItem(
                value: 'item1',
                isDisabled: true, // Disable only this item
                trigger: NakedAccordionTrigger(child: Text('Trigger 1')),
                content: NakedAccordionContent(child: Text('Content 1')),
              ),
              NakedAccordionItem(
                value: 'item2',
                trigger: NakedAccordionTrigger(child: Text('Trigger 2')),
                content: NakedAccordionContent(child: Text('Content 2')),
              ),
            ],
          ),
        ),
      ),
    );

    // Tap disabled Trigger 1
    await tester.tap(find.text('Trigger 1'));
    await tester.pumpAndSettle();

    // Verify item 1 did not expand
    expect(expanded, isEmpty);
    expect(find.text('Content 1'), findsOneWidget);

    // Tap enabled Trigger 2
    await tester.tap(find.text('Trigger 2'));
    await tester.pumpAndSettle();

    // Verify item 2 did expand
    expect(expanded, equals({'item2'}));
    expect(find.text('Content 2'), findsOneWidget);
    await tester
        .ensureVisible(find.text('Content 2')); // Should be accessible now
  });

  testWidgets('NakedAccordionTrigger isDisabled prevents expansion',
      (tester) async {
    Set<String> expanded = {};

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NakedAccordion(
            initialExpandedValues: expanded.toList(),
            onExpandedChange: (value, isExpanded) {
              if (isExpanded) {
                expanded.add(value);
              } else {
                expanded.remove(value);
              }
            },
            children: const [
              NakedAccordionItem(
                value: 'item1',
                trigger: NakedAccordionTrigger(
                  isDisabled: true, // Disable only the trigger
                  child: Text('Trigger 1'),
                ),
                content: NakedAccordionContent(child: Text('Content 1')),
              ),
            ],
          ),
        ),
      ),
    );

    // Tap disabled Trigger 1
    await tester.tap(find.text('Trigger 1'));
    await tester.pumpAndSettle();

    // Verify item 1 did not expand
    expect(expanded, isEmpty);
    expect(find.text('Content 1'), findsOneWidget);
  });

  testWidgets('NakedAccordionTrigger custom onTap overrides default toggle',
      (tester) async {
    Set<String> expanded = {};
    bool customTapCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NakedAccordion(
            initialExpandedValues: expanded.toList(),
            onExpandedChange: (value, isExpanded) {
              if (isExpanded) {
                expanded.add(value);
              } else {
                expanded.remove(value);
              }
            },
            children: [
              NakedAccordionItem(
                value: 'item1',
                trigger: NakedAccordionTrigger(
                  child: const Text('Trigger 1'),
                  onTap: () {
                    customTapCalled = true;
                  },
                ),
                content: const NakedAccordionContent(child: Text('Content 1')),
              ),
            ],
          ),
        ),
      ),
    );

    // Tap Trigger 1
    await tester.tap(find.text('Trigger 1'));
    await tester.pumpAndSettle();

    // Verify custom tap was called and item did NOT expand
    expect(customTapCalled, isTrue);
    expect(expanded, isEmpty);
    expect(find.text('Content 1'), findsOneWidget);
  });

  testWidgets('NakedAccordion respects initialExpandedValues', (tester) async {
    // Use a set to track expanded state
    final Set<String> expanded = {'item1'};

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NakedAccordion(
            initialExpandedValues: const ['item1'], // Start with item1 expanded
            onExpandedChange: (value, isExpanded) {
              if (isExpanded) {
                expanded.add(value);
              } else {
                expanded.remove(value);
              }
            },
            children: const [
              NakedAccordionItem(
                value: 'item1',
                trigger: NakedAccordionTrigger(child: Text('Trigger 1')),
                content: NakedAccordionContent(child: Text('Content 1')),
              ),
              NakedAccordionItem(
                value: 'item2',
                trigger: NakedAccordionTrigger(child: Text('Trigger 2')),
                content: NakedAccordionContent(child: Text('Content 2')),
              ),
            ],
          ),
        ),
      ),
    );

    // Verify Item 1 is expanded initially
    expect(expanded, equals({'item1'}));
    expect(find.text('Content 1'), findsOneWidget);
    expect(find.text('Content 2'), findsOneWidget);
    await tester
        .ensureVisible(find.text('Content 1')); // Should be accessible now
  });

  testWidgets('NakedAccordion respects initialExpandedValues in multiple mode',
      (tester) async {
    // Use a set to track expanded state
    final Set<String> expanded = {'item1', 'item2'};

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NakedAccordion(
            type: NakedAccordionType.multiple,
            initialExpandedValues: const [
              'item1',
              'item2'
            ], // Start with both expanded
            onExpandedChange: (value, isExpanded) {
              if (isExpanded) {
                expanded.add(value);
              } else {
                expanded.remove(value);
              }
            },
            children: const [
              NakedAccordionItem(
                value: 'item1',
                trigger: NakedAccordionTrigger(child: Text('Trigger 1')),
                content: NakedAccordionContent(child: Text('Content 1')),
              ),
              NakedAccordionItem(
                value: 'item2',
                trigger: NakedAccordionTrigger(child: Text('Trigger 2')),
                content: NakedAccordionContent(child: Text('Content 2')),
              ),
            ],
          ),
        ),
      ),
    );

    // Verify both items are expanded initially
    expect(expanded, equals({'item1', 'item2'}));
    expect(find.text('Content 1'), findsOneWidget);
    expect(find.text('Content 2'), findsOneWidget);
    await tester
        .ensureVisible(find.text('Content 1')); // Should be accessible now
    await tester
        .ensureVisible(find.text('Content 2')); // Should be accessible now
  });

  testWidgets('NakedAccordion ignores extra initial values in single mode',
      (tester) async {
    // Use a set to track expanded state
    final Set<String> expanded = {'item1'};

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NakedAccordion(
            type: NakedAccordionType.single,
            initialExpandedValues: const [
              'item1',
              'item2'
            ], // Provide multiple, but only first should apply
            onExpandedChange: (value, isExpanded) {
              if (isExpanded) {
                expanded.clear();
                expanded.add(value);
              } else {
                expanded.remove(value);
              }
            },
            children: const [
              NakedAccordionItem(
                value: 'item1',
                trigger: NakedAccordionTrigger(child: Text('Trigger 1')),
                content: NakedAccordionContent(child: Text('Content 1')),
              ),
              NakedAccordionItem(
                value: 'item2',
                trigger: NakedAccordionTrigger(child: Text('Trigger 2')),
                content: NakedAccordionContent(child: Text('Content 2')),
              ),
            ],
          ),
        ),
      ),
    );

    // Verify only the first item ('item1') is expanded
    expect(expanded, equals({'item1'}));
    expect(find.text('Content 1'), findsOneWidget);
    expect(find.text('Content 2'), findsOneWidget);
    await tester
        .ensureVisible(find.text('Content 1')); // Should be accessible now
  });
}
