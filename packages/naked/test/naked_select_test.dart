import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/naked.dart';

void main() {
  group('NakedSelect', () {
    testWidgets('renders trigger correctly when closed',
        (WidgetTester tester) async {
      const triggerKey = Key('select-trigger');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NakedSelect<String>(
              isOpen: false,
              child: NakedSelectTrigger(
                key: triggerKey,
                child: Text('Select trigger'),
              ),
            ),
          ),
        ),
      );

      expect(find.byKey(triggerKey), findsOneWidget);
      expect(find.text('Select trigger'), findsOneWidget);
      // No menu should be visible when closed
      expect(find.byType(NakedSelectMenu), findsNothing);
    });

    testWidgets('NakedSelectItem can be created with isSelected property',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NakedSelectItem<String>(
              value: 'test',
              isSelected: true,
              child: Text('Selected Item'),
            ),
          ),
        ),
      );

      final itemWidget = tester.widget<NakedSelectItem<String>>(
          find.byType(NakedSelectItem<String>));
      expect(itemWidget.isSelected, isTrue);
      expect(itemWidget.value, equals('test'));
      expect(find.text('Selected Item'), findsOneWidget);
    });

    testWidgets('menu renders its child content', (WidgetTester tester) async {
      const menuKey = Key('select-menu');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NakedSelectMenu(
              key: menuKey,
              child: Text('Menu Content'),
            ),
          ),
        ),
      );

      expect(find.byKey(menuKey), findsOneWidget);
      expect(find.text('Menu Content'), findsOneWidget);
    });

    testWidgets('trigger has correct properties', (WidgetTester tester) async {
      final triggerKey = UniqueKey();
      bool wasHovered = false;
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NakedSelectTrigger(
              key: triggerKey,
              onStateHover: (hovered) => wasHovered = hovered,
              onStatePressed: (pressed) => wasPressed = pressed,
              child: const Text('Trigger'),
            ),
          ),
        ),
      );

      // Test properties and callbacks
      expect(find.byKey(triggerKey), findsOneWidget);
      expect(find.text('Trigger'), findsOneWidget);

      // Test hover callback
      final hoverGesture =
          await tester.createGesture(kind: PointerDeviceKind.mouse);
      await hoverGesture.addPointer(location: Offset.zero);
      await tester.pump();
      await hoverGesture.moveTo(tester.getCenter(find.byKey(triggerKey)));
      await tester.pump();
      expect(wasHovered, isTrue);

      // Test press callback using press/up
      final pressGesture =
          await tester.press(find.byKey(triggerKey)); // Simulate press down
      await tester.pump(); // Allow callback to fire
      expect(wasPressed, isTrue); // Check state *during* press

      await tester.pump(const Duration(milliseconds: 50)); // Hold press briefly
      await pressGesture.up(); // Release the pointer
      await tester.pump(); // Allow release callback to fire
      expect(wasPressed, isFalse); // Check state after release
    });

    testWidgets('NakedSelect has correct default properties',
        // skip: true, // Keep skipped for now if this fix doesn't work
        (WidgetTester tester) async {
      const triggerKey = Key('trigger');
      const menuKey = Key('menu');
      const itemKey = Key('item');

      // Provide a structurally valid, minimal NakedSelect setup
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NakedSelect<String>(
              selectedValue: null, // Ensure default state
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NakedSelectTrigger(
                    key: triggerKey,
                    child: Text('Select Trigger'),
                  ),
                  // Menu needs to be structurally present, even if visually hidden
                  NakedSelectMenu(
                    key: menuKey,
                    child: NakedSelectItem<String>(
                      key: itemKey,
                      value: 'test',
                      isSelected: false, // Ensure default state
                      child: Text('Test Item'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Verify the NakedSelect widget itself exists
      expect(find.byType(NakedSelect<String>), findsOneWidget,
          reason: 'NakedSelect widget should be found');

      // Check default properties on the found widget
      final selectWidget =
          tester.widget<NakedSelect<String>>(find.byType(NakedSelect<String>));
      expect(selectWidget.isOpen, isFalse,
          reason: 'Default isOpen should be false');
      expect(selectWidget.trapFocus, isTrue,
          reason: 'Default trapFocus should be true');
      expect(selectWidget.autofocus, isTrue,
          reason: 'Default autofocus should be true');
      expect(selectWidget.enableTypeAhead, isTrue,
          reason: 'Default enableTypeAhead should be true');
      expect(selectWidget.focusSelectedItemOnOpen, isTrue,
          reason: 'Default focusSelectedItemOnOpen should be true');
      expect(selectWidget.preferredPositions.length, 4,
          reason: 'Default preferredPositions length should be 4');
      expect(selectWidget.allowMultiple, isFalse,
          reason: 'Default allowMultiple should be false');
      expect(selectWidget.closeOnSelect, isTrue,
          reason: 'Default closeOnSelect should be true');
      expect(selectWidget.isDisabled, isFalse,
          reason: 'Default isDisabled should be false');
      expect(selectWidget.selectedValues, isNull,
          reason: 'Default selectedValues should be null');
    });
  });
}

// Test controller for NakedSelect
class TestSelectController extends StatefulWidget {
  final bool closeOnSelect;

  const TestSelectController({
    Key? key,
    this.closeOnSelect = true,
  }) : super(key: key);

  @override
  State<TestSelectController> createState() => _TestSelectControllerState();
}

class _TestSelectControllerState extends State<TestSelectController> {
  bool _isOpen = false;
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NakedSelect<String>(
          isOpen: _isOpen,
          onIsOpenChanged: (value) {
            setState(() {
              _isOpen = value;
            });
          },
          selectedValue: _selectedValue,
          onSelectedValueChanged: (value) {
            setState(() {
              _selectedValue = value;
            });
          },
          closeOnSelect: widget.closeOnSelect,
          trapFocus: true,
          autofocus: true,
          child: Column(
            children: [
              const NakedSelectTrigger(
                child: Text('Trigger'),
              ),
              if (_isOpen)
                NakedSelectMenu(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Column(
                      children: [
                        NakedSelectItem<String>(
                          value: 'option1',
                          child: Text('Option 1'),
                        ),
                        NakedSelectItem<String>(
                          value: 'option2',
                          child: Text('Option 2'),
                        ),
                        NakedSelectItem<String>(
                          value: 'option3',
                          child: Text('Option 3'),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Test widget with selected value for focus tests
class TestSelectWithSelectedValue extends StatefulWidget {
  final String selectedValue;
  final FocusNode firstItemFocusNode;
  final FocusNode secondItemFocusNode;

  const TestSelectWithSelectedValue({
    Key? key,
    required this.selectedValue,
    required this.firstItemFocusNode,
    required this.secondItemFocusNode,
  }) : super(key: key);

  @override
  State<TestSelectWithSelectedValue> createState() =>
      _TestSelectWithSelectedValueState();
}

class _TestSelectWithSelectedValueState
    extends State<TestSelectWithSelectedValue> {
  bool _isOpen = false;
  late String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NakedSelect<String>(
          isOpen: _isOpen,
          onIsOpenChanged: (value) {
            setState(() {
              _isOpen = value;
            });
          },
          selectedValue: _selectedValue,
          onSelectedValueChanged: (value) {
            setState(() {
              _selectedValue = value;
            });
          },
          focusSelectedItemOnOpen: true,
          child: Column(
            children: [
              const NakedSelectTrigger(
                child: Text('Trigger'),
              ),
              NakedSelectMenu(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NakedSelectItem<String>(
                      value: 'option1',
                      focusNode: widget.firstItemFocusNode,
                      child: const Text('Option 1'),
                    ),
                    NakedSelectItem<String>(
                      value: 'option2',
                      focusNode: widget.secondItemFocusNode,
                      child: const Text('Option 2'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Test widget with three items for Home/End key navigation testing
class TestSelectWithThreeItems extends StatefulWidget {
  final FocusNode firstItemFocusNode;
  final FocusNode secondItemFocusNode;
  final FocusNode thirdItemFocusNode;

  const TestSelectWithThreeItems({
    Key? key,
    required this.firstItemFocusNode,
    required this.secondItemFocusNode,
    required this.thirdItemFocusNode,
  }) : super(key: key);

  @override
  State<TestSelectWithThreeItems> createState() =>
      _TestSelectWithThreeItemsState();
}

class _TestSelectWithThreeItemsState extends State<TestSelectWithThreeItems> {
  bool _isOpen = false;
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NakedSelect<String>(
          isOpen: _isOpen,
          onIsOpenChanged: (value) {
            setState(() {
              _isOpen = value;
            });
          },
          selectedValue: _selectedValue,
          onSelectedValueChanged: (value) {
            setState(() {
              _selectedValue = value;
            });
          },
          child: Column(
            children: [
              const NakedSelectTrigger(
                child: Text('Trigger'),
              ),
              NakedSelectMenu(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NakedSelectItem<String>(
                      value: 'option1',
                      focusNode: widget.firstItemFocusNode,
                      child: const Text('Option 1'),
                    ),
                    NakedSelectItem<String>(
                      value: 'option2',
                      focusNode: widget.secondItemFocusNode,
                      child: const Text('Option 2'),
                    ),
                    NakedSelectItem<String>(
                      value: 'option3',
                      focusNode: widget.thirdItemFocusNode,
                      child: const Text('Option 3'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Test widget with fruits for type-ahead testing
class TestSelectWithFruits extends StatefulWidget {
  final FocusNode appleFocusNode;
  final FocusNode bananeFocusNode;
  final FocusNode cherryFocusNode;

  const TestSelectWithFruits({
    Key? key,
    required this.appleFocusNode,
    required this.bananeFocusNode,
    required this.cherryFocusNode,
  }) : super(key: key);

  @override
  State<TestSelectWithFruits> createState() => _TestSelectWithFruitsState();
}

class _TestSelectWithFruitsState extends State<TestSelectWithFruits> {
  bool _isOpen = false;
  String? _selectedFruit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NakedSelect<String>(
          isOpen: _isOpen,
          onIsOpenChanged: (value) {
            setState(() {
              _isOpen = value;
            });
          },
          selectedValue: _selectedFruit,
          onSelectedValueChanged: (value) {
            setState(() {
              _selectedFruit = value;
            });
          },
          enableTypeAhead: true,
          child: Column(
            children: [
              const NakedSelectTrigger(
                child: Text('Select Fruit'),
              ),
              NakedSelectMenu(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NakedSelectItem<String>(
                      value: 'Apple',
                      focusNode: widget.appleFocusNode,
                      child: const Text('Apple'),
                    ),
                    NakedSelectItem<String>(
                      value: 'Banana',
                      focusNode: widget.bananeFocusNode,
                      child: const Text('Banana'),
                    ),
                    NakedSelectItem<String>(
                      value: 'Cherry',
                      focusNode: widget.cherryFocusNode,
                      child: const Text('Cherry'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
