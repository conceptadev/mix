import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart' as r;

void main() {
  group('Checkbox', () {
    testWidgets('renders with default properties', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: r.Checkbox(
            style: r.CheckboxStyle(),
          ),
        ),
      );

      expect(find.byType(r.Checkbox), findsOneWidget);
      expect(find.byIcon(Icons.check_rounded), findsOneWidget);
    });

    testWidgets('respects disabled state', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: r.Checkbox(
            disabled: true,
            style: r.CheckboxStyle(),
          ),
        ),
      );

      final Pressable pressable = tester.widget(find.byType(Pressable));

      expect(pressable.controller!.disabled, isTrue);
    });

    testWidgets('respects value state', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: r.Checkbox(
            value: true,
            style: r.CheckboxStyle(),
          ),
        ),
      );

      final Pressable pressable = tester.widget(find.byType(Pressable));

      expect(pressable.controller!.selected, isTrue);
    });

    testWidgets('uses custom icons when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: r.Checkbox(
            style: r.CheckboxStyle(),
            iconChecked: Icons.done,
            iconUnchecked: Icons.close,
          ),
        ),
      );

      final r.Checkbox checkbox = tester.widget(find.byType(r.Checkbox));
      expect(checkbox.iconChecked, Icons.done);
      expect(checkbox.iconUnchecked, Icons.close);
    });

    testWidgets('calls onChanged when tapped', (WidgetTester tester) async {
      bool? changedValue;
      await tester.pumpWidget(
        MaterialApp(
          home: r.Checkbox(
            style: const r.CheckboxStyle(),
            value: false,
            onChanged: (value) => changedValue = value,
          ),
        ),
      );

      await tester.tap(find.byType(r.Checkbox));
      expect(changedValue, isTrue);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      const color = Colors.red;

      await tester.pumpWidget(const MaterialApp(
        home: r.Checkbox(
          value: false,
          style: FakeCheckboxStyle(color),
        ),
      ));
      await tester.pumpAndSettle(const Duration(milliseconds: 150));

      final Container container = tester.widget(find.byType(Container));
      expect((container.decoration as BoxDecoration).color, color);
    });
  });
}

class FakeCheckboxStyle extends r.CheckboxStyle {
  final Color color;

  const FakeCheckboxStyle(
    this.color,
  );

  @override
  Style makeStyle(SpecConfiguration<r.CheckboxSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);
    return Style.create([
      baseStyle(),
      $.container.color(color),
    ]);
  }
}
