import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

void main() {
  group('XCheckbox', () {
    testWidgets('renders with default properties', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: XCheckbox(),
        ),
      );

      expect(find.byType(XCheckbox), findsOneWidget);
      expect(find.byIcon(Icons.check_rounded), findsOneWidget);
    });

    testWidgets('respects disabled state', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: XCheckbox(disabled: true),
        ),
      );

      final Pressable pressable = tester.widget(find.byType(Pressable));

      expect(pressable.controller!.disabled, isTrue);
    });

    testWidgets('respects value state', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: XCheckbox(value: true),
        ),
      );

      final Pressable pressable = tester.widget(find.byType(Pressable));

      expect(pressable.controller!.selected, isTrue);
    });

    testWidgets('uses custom icons when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: XCheckbox(
            iconChecked: Icons.done,
            iconUnchecked: Icons.close,
          ),
        ),
      );

      final XCheckbox checkbox = tester.widget(find.byType(XCheckbox));
      expect(checkbox.iconChecked, Icons.done);
      expect(checkbox.iconUnchecked, Icons.close);
    });

    testWidgets('calls onChanged when tapped', (WidgetTester tester) async {
      bool? changedValue;
      await tester.pumpWidget(
        MaterialApp(
          home: XCheckbox(
            value: false,
            onChanged: (value) => changedValue = value,
          ),
        ),
      );

      await tester.tap(find.byType(XCheckbox));
      expect(changedValue, isTrue);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      final $checkbox = CheckboxSpecUtility.self;
      const color = Colors.red;

      await tester.pumpWidget(MaterialApp(
        home: XCheckbox(
          value: true,
          style: Style(
            // TODO: Discuss about this

            $on.selected(
              $checkbox.container.color(color),
            ),
          ),
        ),
      ));
      await tester.pumpAndSettle(const Duration(milliseconds: 150));

      final Container container = tester.widget(find.byType(Container));
      expect((container.decoration as BoxDecoration).color, color);
    });
  });
}
