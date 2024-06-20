import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remix/components/switch/switch.dart';

void main() {
  group('RemixSwitch', () {
    testWidgets(
        'when pressed must call the onChanged with the opposite value of isChecked',
        (tester) async {
      const isActive = true;

      await tester.pumpWidget(
        MaterialApp(
          home: RemixSwitch(
            active: isActive,
            onChanged: (value) {
              expect(value, !isActive);
            },
          ),
        ),
      );

      await tester.tap(find.byType(RemixSwitch));
      await tester.pumpAndSettle(const Duration(milliseconds: 150));
    });

    testWidgets('when disabled must not call onChanged',
        (WidgetTester tester) async {
      bool didCallOnChanged = false;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: RemixSwitch(
            active: false,
            disabled: true,
            onChanged: (value) {
              didCallOnChanged = true;
            },
          ),
        ),
      ));

      await tester.tap(find.byType(RemixSwitch));
      await tester.pumpAndSettle(const Duration(milliseconds: 150));

      expect(didCallOnChanged, isFalse);
    });

    testWidgets('initially checked or unchecked based on isChecked value',
        (WidgetTester tester) async {
      for (var isChecked in [true, false]) {
        await tester.pumpWidget(MaterialApp(
          home: RemixSwitch(
            active: isChecked,
            onChanged: (value) {},
          ),
        ));

        expect(
          find.byWidgetPredicate(
            (widget) => widget is RemixSwitch && widget.active == isChecked,
          ),
          findsOneWidget,
        );
      }
    });
  });
}
