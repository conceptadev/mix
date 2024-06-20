import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remix/components/checkbox/checkbox.dart';

void main() {
  group('RemixCheckbox', () {
    testWidgets(
        'when pressed must call the onChanged with the oposite value of isChecked',
        (tester) async {
      const isChecked = true;

      await tester.pumpWidget(
        MaterialApp(
          home: RemixCheckbox(
            value: isChecked,
            label: 'Checkbox',
            onChanged: (value) {
              expect(value, !isChecked);
            },
          ),
        ),
      );

      await tester.tap(find.byType(RemixCheckbox));
      await tester.pumpAndSettle();
    });

    testWidgets('when disabled must not call onChanged',
        (WidgetTester tester) async {
      bool didCallOnChanged = false;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: RemixCheckbox(
            value: false,
            disabled: true,
            onChanged: (value) {
              didCallOnChanged = true;
            },
          ),
        ),
      ));

      await tester.tap(find.byType(RemixCheckbox));
      await tester.pumpAndSettle();

      expect(didCallOnChanged, false);
    });

    testWidgets('initially checked or unchecked based on isChecked value',
        (WidgetTester tester) async {
      for (var isChecked in [true, false]) {
        await tester.pumpWidget(MaterialApp(
          home: RemixCheckbox(
            value: isChecked,
            label: 'Checkbox',
            onChanged: (value) {},
          ),
        ));

        expect(
          find.byWidgetPredicate(
            (widget) => widget is RemixCheckbox && widget.value == isChecked,
          ),
          findsOneWidget,
        );
      }
    });

    testWidgets('label is displayed correctly', (WidgetTester tester) async {
      const label = 'Test Checkbox';

      await tester.pumpWidget(MaterialApp(
        home: RemixCheckbox(
          value: false,
          label: label,
          onChanged: (value) {},
        ),
      ));

      expect(
        find.byWidgetPredicate(
          (widget) => widget is Text && widget.data == label,
        ),
        findsOneWidget,
      );
    });

    testWidgets('correct icon is displayed based on isChecked value',
        (WidgetTester tester) async {
      const iconChecked = Icons.star;
      const iconUnchecked = Icons.star_border;

      for (var isChecked in [true, false]) {
        await tester.pumpWidget(MaterialApp(
          home: RemixCheckbox(
            value: isChecked,
            iconChecked: iconChecked,
            iconUnchecked: iconUnchecked,
            label: 'Checkbox',
            onChanged: (value) {},
          ),
        ));

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Icon &&
                widget.icon == (isChecked ? iconChecked : iconUnchecked),
          ),
          findsOneWidget,
        );
      }
    });
  });
}
