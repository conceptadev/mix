import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/naked.dart';

void main() {
  group('NakedRadioGroup with NakedFocusManager', () {
    testWidgets('selects options when tapped', (WidgetTester tester) async {
      String? selectedValue = 'option1';
      final List<String> events = [];

      Widget buildRadioGroup() {
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                NakedRadioGroup<String>(
                  value: selectedValue,
                  onChanged: (value) {
                    selectedValue = value;
                    events.add('Selected: $value');
                  },
                  child: const Column(
                    children: [
                      NakedRadioButton<String>(
                        value: 'option1',
                        child: Text('Option 1'),
                      ),
                      NakedRadioButton<String>(
                        value: 'option2',
                        child: Text('Option 2'),
                      ),
                      NakedRadioButton<String>(
                        value: 'option3',
                        child: Text('Option 3'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }

      await tester.pumpWidget(buildRadioGroup());

      // Verify initial selection
      expect(selectedValue, 'option1');

      // Tap option 2
      await tester.tap(find.text('Option 2'));
      await tester.pump();
      await tester.pumpWidget(buildRadioGroup());

      // Verify selection changed to option2
      expect(selectedValue, 'option2');
      expect(events.last, 'Selected: option2');

      // Tap option 3
      await tester.tap(find.text('Option 3'));
      await tester.pump();
      await tester.pumpWidget(buildRadioGroup());

      // Verify selection changed to option3
      expect(selectedValue, 'option3');
      expect(events.last, 'Selected: option3');

      // Tap option 1
      await tester.tap(find.text('Option 1'));
      await tester.pump();
      await tester.pumpWidget(buildRadioGroup());

      // Verify selection changed to option1
      expect(selectedValue, 'option1');
      expect(events.last, 'Selected: option1');
    });

    testWidgets('provides proper accessibility semantics',
        (WidgetTester tester) async {
      String? selectedValue = 'option2';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                NakedRadioGroup<String>(
                  value: selectedValue,
                  onChanged: (value) {
                    selectedValue = value;
                  },
                  child: const Column(
                    children: [
                      NakedRadioButton<String>(
                        value: 'option1',
                        semanticLabel: 'First option',
                        child: Text('Option 1'),
                      ),
                      NakedRadioButton<String>(
                        value: 'option2',
                        semanticLabel: 'Second option',
                        child: Text('Option 2'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Check semantics for radio buttons
      final SemanticsHandle handle = tester.ensureSemantics();

      // First option should not be checked
      final firstRadio = tester.getSemantics(find.text('Option 1'));
      expect(firstRadio.hasFlag(SemanticsFlag.isChecked), isFalse);
      expect(firstRadio.hasFlag(SemanticsFlag.isEnabled), isTrue);
      expect(firstRadio.label, 'First option');

      // Second option should be checked
      final secondRadio = tester.getSemantics(find.text('Option 2'));
      expect(secondRadio.hasFlag(SemanticsFlag.isChecked), isTrue);
      expect(secondRadio.hasFlag(SemanticsFlag.isEnabled), isTrue);
      expect(secondRadio.label, 'Second option');

      handle.dispose();
    });

    testWidgets('disables radio buttons correctly',
        (WidgetTester tester) async {
      String? selectedValue = 'option1';
      bool valueChanged = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                NakedRadioGroup<String>(
                  value: selectedValue,
                  onChanged: (value) {
                    selectedValue = value;
                    valueChanged = true;
                  },
                  enabled: false, // Entire group is disabled
                  child: const Column(
                    children: [
                      NakedRadioButton<String>(
                        value: 'option1',
                        child: Text('Option 1'),
                      ),
                      NakedRadioButton<String>(
                        value: 'option2',
                        child: Text('Option 2'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Ensure initial state
      expect(selectedValue, 'option1');
      expect(valueChanged, isFalse);

      // Try to tap option 2
      await tester.tap(find.text('Option 2'));
      await tester.pump();

      // Verify selection didn't change
      expect(selectedValue, 'option1');
      expect(valueChanged, isFalse);

      // Check semantics for disabled radio buttons
      final SemanticsHandle handle = tester.ensureSemantics();

      // Radio buttons should be disabled
      final firstRadio = tester.getSemantics(find.text('Option 1'));
      expect(firstRadio.hasFlag(SemanticsFlag.isEnabled), isFalse);

      final secondRadio = tester.getSemantics(find.text('Option 2'));
      expect(secondRadio.hasFlag(SemanticsFlag.isEnabled), isFalse);

      handle.dispose();
    });

    testWidgets('restores focus when removed', (WidgetTester tester) async {
      final showRadioGroup = ValueNotifier<bool>(true);
      final focusNode = FocusNode();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Focus(
                  focusNode: focusNode,
                  child: const Text('Focus target'),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: showRadioGroup,
                  builder: (context, value, child) {
                    if (!value) return const SizedBox();
                    return NakedRadioGroup<String>(
                      value: 'option1',
                      onChanged: (_) {},
                      trapFocus: true,
                      child: const Column(
                        children: [
                          NakedRadioButton<String>(
                            value: 'option1',
                            child: Text('Option 1'),
                          ),
                          NakedRadioButton<String>(
                            value: 'option2',
                            child: Text('Option 2'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );

      // Focus on parent element
      focusNode.requestFocus();
      await tester.pump();

      // Tab into radio group
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();

      // Remove radio group
      showRadioGroup.value = false;
      await tester.pump();

      // Verify radio group is gone
      expect(find.text('Option 1'), findsNothing);
      expect(find.text('Option 2'), findsNothing);

      // Verify focus is back on original element
      expect(focusNode.hasFocus, isTrue);
    });
  });
}
