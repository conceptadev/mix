import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/naked.dart';

void main() {
  group('NakedCheckbox', () {
    testWidgets('renders child widget', (WidgetTester tester) async {
      const key = Key('test-child');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NakedCheckbox(
              child: Container(
                key: key,
                width: 24,
                height: 24,
                color: Colors.red,
              ),
            ),
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('handles checked state', (WidgetTester tester) async {
      bool? checkboxValue = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return NakedCheckbox(
                  onChanged: (value) {
                    setState(() {
                      checkboxValue = value;
                    });
                  },
                  isChecked: checkboxValue == true,
                  child: Container(
                    width: 24,
                    height: 24,
                    color: checkboxValue == true ? Colors.green : Colors.grey,
                  ),
                );
              },
            ),
          ),
        ),
      );

      // Initially unchecked
      expect(checkboxValue, false);

      // Tap to change to checked
      await tester.tap(find.byType(NakedCheckbox));
      await tester.pump();
      expect(checkboxValue, true);

      // Tap again to change to unchecked
      await tester.tap(find.byType(NakedCheckbox));
      await tester.pump();
      expect(checkboxValue, false);
    });

    testWidgets('supports indeterminate state', (WidgetTester tester) async {
      bool? checkboxValue; // Start with indeterminate

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return NakedCheckbox(
                  onChanged: (value) {
                    setState(() {
                      checkboxValue = value;
                    });
                  },
                  isChecked: checkboxValue == true,
                  isIndeterminate: checkboxValue == null,
                  child: Container(
                    width: 24,
                    height: 24,
                    color: checkboxValue == true
                        ? Colors.green
                        : checkboxValue == null
                            ? Colors.amber
                            : Colors.grey,
                  ),
                );
              },
            ),
          ),
        ),
      );

      // Initially indeterminate
      expect(checkboxValue, null);

      // Tap to change from indeterminate to checked
      await tester.tap(find.byType(NakedCheckbox));
      await tester.pump();
      expect(checkboxValue, true);

      // Tap again to change to unchecked
      await tester.tap(find.byType(NakedCheckbox));
      await tester.pump();
      expect(checkboxValue, false);
    });

    testWidgets('disabled checkbox does not respond to taps',
        (WidgetTester tester) async {
      bool? checkboxValue = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return NakedCheckbox(
                  onChanged: (value) {
                    setState(() {
                      checkboxValue = value;
                    });
                  },
                  isChecked: checkboxValue == true,
                  isDisabled: true,
                  child: Container(
                    width: 24,
                    height: 24,
                    color: Colors.grey.shade300,
                  ),
                );
              },
            ),
          ),
        ),
      );

      // Tap on disabled checkbox
      await tester.tap(find.byType(NakedCheckbox));
      await tester.pump();

      // Value should not change
      expect(checkboxValue, false);
    });
  });
}
