import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

import '../../utils/extensions/widget_tester.dart';

void main() {
  group('RxCheckbox', () {
    testWidgets('renders with default properties', (WidgetTester tester) async {
      await tester.pumpRxComponent(RxCheckbox());

      expect(find.byType(RxBlankCheckbox), findsOneWidget);
      expect(find.byIcon(Icons.check_rounded), findsOneWidget);
    });

    testWidgets('respects disabled state', (WidgetTester tester) async {
      await tester.pumpRxComponent(RxCheckbox(disabled: true));

      final Pressable pressable = tester.widget(find.byType(Pressable));

      expect(pressable.controller!.disabled, isTrue);
    });

    testWidgets('respects value state', (WidgetTester tester) async {
      await tester.pumpRxComponent(RxCheckbox(value: true));

      final Pressable pressable = tester.widget(find.byType(Pressable));

      expect(pressable.controller!.selected, isTrue);
    });

    testWidgets('uses custom icons when provided', (WidgetTester tester) async {
      await tester.pumpRxComponent(
        RxCheckbox(
          iconChecked: Icons.done,
          iconUnchecked: Icons.close,
        ),
      );

      final RxBlankCheckbox checkbox =
          tester.widget(find.byType(RxBlankCheckbox));
      expect(checkbox.iconChecked, Icons.done);
      expect(checkbox.iconUnchecked, Icons.close);
    });

    testWidgets('calls onChanged when tapped', (WidgetTester tester) async {
      bool? changedValue;
      await tester.pumpRxComponent(RxCheckbox(
        value: false,
        onChanged: (value) => changedValue = value,
      ));

      await tester.tap(find.byType(RxCheckbox));
      expect(changedValue, isTrue);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      final $checkbox = CheckboxSpecUtility.self;
      final color = Colors.red;

      await tester.pumpRxComponent(RxCheckbox(
        value: true,
        variant: CheckboxVariant.surface,
        style: Style(
          // TODO: Discuss about this
          CheckboxVariant.surface(
            $on.selected(
              $checkbox.container.color(color),
            ),
          ),
        ),
      ));
      await tester.pumpAndSettle(Duration(milliseconds: 150));

      final Container container = tester.widget(find.byType(Container));
      expect((container.decoration as BoxDecoration).color, color);
    });
  });
}
