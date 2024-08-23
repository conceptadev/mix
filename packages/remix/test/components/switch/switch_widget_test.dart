import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remix/src/components/switch/switch.dart';

void main() {
  group('XSwitch', () {
    testWidgets('renders correctly with default props',
        (WidgetTester tester) async {
      bool value = false;
      await tester.pumpWidget(
        MaterialApp(
          home: XSwitch(
            value: value,
            onChanged: (bool newValue) {
              value = newValue;
            },
          ),
        ),
      );

      expect(find.byType(XSwitch), findsOneWidget);
    });

    testWidgets('calls onChanged when tapped', (WidgetTester tester) async {
      bool value = false;
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return MaterialApp(
              home: XSwitch(
                value: value,
                onChanged: (bool newValue) {
                  setState(() {
                    value = newValue;
                  });
                },
              ),
            );
          },
        ),
      );

      await tester.tap(find.byType(XSwitch));
      await tester.pump();

      expect(value, isTrue);
    });

    testWidgets('does not call onChanged when disabled',
        (WidgetTester tester) async {
      bool value = false;

      await tester.pumpWidget(
        MaterialApp(
          home: XSwitch(
            value: value,
            onChanged: (newValue) {
              value = newValue;
            },
            disabled: true,
          ),
        ),
      );

      await tester.tap(find.byType(XSwitch));
      await tester.pump();

      expect(value, isFalse);
    });

    testWidgets('verifies the alignment of the switch when value is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: XSwitch(
            value: true,
            onChanged: (_) {},
          ),
        ),
      );

      final Container container = tester.widget(find.byWidgetPredicate(
          (widget) => widget is Container && widget.alignment != null));
      expect(container.alignment, equals(Alignment.centerRight));
    });

    testWidgets('verifies the alignment of the switch when value is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: XSwitch(
            value: false,
            onChanged: (_) {},
          ),
        ),
      );

      final Container container = tester.widget(find.byWidgetPredicate(
          (widget) => widget is Container && widget.alignment != null));
      expect(container.alignment, equals(Alignment.centerLeft));
    });
  });
}
