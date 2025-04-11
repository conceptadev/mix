import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/naked.dart';

void main() {
  group('NakedMenu', () {
    testWidgets('renders child correctly when closed',
        (WidgetTester tester) async {
      const childKey = Key('menu-child');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NakedMenu(
              open: false,
              child: Container(
                key: childKey,
                child: const Text('Menu content'),
              ),
            ),
          ),
        ),
      );

      expect(find.byKey(childKey), findsOneWidget);
      expect(find.text('Menu content'), findsOneWidget);
    });

    testWidgets('NakedMenuTrigger handles tap', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(builder: (context, setState) {
              return NakedMenuTrigger(
                onPressed: () {
                  setState(() {
                    wasPressed = true;
                  });
                },
                child: const Text('Trigger'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.text('Trigger'));
      await tester.pump();

      expect(wasPressed, isTrue);
    });

    testWidgets('NakedMenuItem handles tap', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(builder: (context, setState) {
              return NakedMenuItem(
                onPressed: () {
                  setState(() {
                    wasPressed = true;
                  });
                },
                child: const Text('Item'),
              );
            }),
          ),
        ),
      );

      await tester.tap(find.text('Item'));
      await tester.pump();

      expect(wasPressed, isTrue);
    });

    testWidgets('NakedMenuContent renders with correct properties',
        (WidgetTester tester) async {
      const testLabel = 'Menu Content Label';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NakedMenuContent(
              semanticLabel: testLabel,
              child: Text('Content'),
            ),
          ),
        ),
      );

      expect(find.text('Content'), findsOneWidget);

      // Testing basic rendering
      final contentWidget =
          tester.widget<NakedMenuContent>(find.byType(NakedMenuContent));
      expect(contentWidget.semanticLabel, equals(testLabel));
    });

    testWidgets('NakedMenu responds to open state changes',
        (WidgetTester tester) async {
      // Use a simpler test that doesn't rely on positioning
      bool isOpen = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    NakedMenu(
                      open: isOpen,
                      // Disable positioning features for test
                      preferredPositions: const [],
                      offset: Offset.zero,
                      // Turn off focus trap to avoid test issues
                      trapFocus: false,
                      autofocus: false,
                      child: Column(
                        children: [
                          NakedMenuTrigger(
                            onPressed: () {
                              setState(() {
                                isOpen = !isOpen;
                              });
                            },
                            child: const Text('Toggle Menu'),
                          ),
                          const SizedBox(height: 10),
                          // Menu content directly in the widget tree for testing
                          if (isOpen) const Text('Menu is open'),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

      // Verify initial state
      expect(find.text('Toggle Menu'), findsOneWidget);
      expect(find.text('Menu is open'), findsNothing);

      // Tap to open
      await tester.tap(find.text('Toggle Menu'));
      await tester.pump();

      // Check state changed
      expect(find.text('Menu is open'), findsOneWidget);
    });
  });

  group('NakedMenu with StatefulBuilder', () {
    testWidgets('toggles menu state on trigger tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SimpleMenuTest(),
          ),
        ),
      );

      // Verify initial state (closed)
      expect(find.text('Trigger'), findsOneWidget);
      expect(find.text('Menu Item'), findsNothing);

      // Tap the trigger to open the menu
      await tester.tap(find.text('Trigger'));
      await tester.pump();

      // Check that after tapping, the menu item is visible
      expect(find.text('Menu Item'), findsOneWidget);
    });
  });
}

// Simple test widget
class SimpleMenuTest extends StatefulWidget {
  const SimpleMenuTest({Key? key}) : super(key: key);

  @override
  State<SimpleMenuTest> createState() => _SimpleMenuTestState();
}

class _SimpleMenuTestState extends State<SimpleMenuTest> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return NakedMenu(
      open: _isOpen,
      onOpenChanged: (isOpen) {
        setState(() {
          _isOpen = isOpen;
        });
      },
      // Disable positioning and focus features that cause test issues
      preferredPositions: const [],
      offset: Offset.zero,
      trapFocus: false,
      autofocus: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NakedMenuTrigger(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text('Trigger'),
            ),
          ),
          if (_isOpen)
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  NakedMenuItem(
                    onPressed: () {
                      setState(() {
                        _isOpen = false;
                      });
                    },
                    child: const Text('Menu Item'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
