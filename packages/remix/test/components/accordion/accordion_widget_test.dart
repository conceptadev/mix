import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

void main() {
  group('XAccordion', () {
    testWidgets('renders with required properties',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Accordion(
            style: const AccordionStyle(),
            header: (spec) => XAccordionHeaderSpecWidget(
              title: 'Test Accordion',
              spec: spec,
            ),
            content: (spec) => TextSpecWidget(
              'Accordion Content',
              spec: spec,
            ),
          ),
        ),
      );

      expect(find.text('Test Accordion'), findsOneWidget);
      expect(find.text('Accordion Content'), findsOneWidget);
    });

    testWidgets('renders with custom icons', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Accordion(
            style: const AccordionStyle(),
            header: (spec) => XAccordionHeaderSpecWidget(
              title: 'Custom Icons',
              spec: spec,
              leadingIcon: Icons.star,
              trailingIcon: Icons.arrow_drop_down,
            ),
            content: (spec) => TextSpecWidget(
              'Content',
              spec: spec,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.arrow_drop_down), findsOneWidget);
    });

    // testWidgets('respects initiallyExpanded property', //
    //     (WidgetTester tester) async {
    //   await tester.pumpRxComponent(
    //     RxAccordion(
    //       title: 'Initially Expanded',
    //       content: Text('Expanded Content'),
    //       initiallyExpanded: true,
    //     ),
    //   );
    //   await tester.pumpAndSettle();

    //   final offstageWidget =
    //       tester.widgetList<Offstage>(find.byType(Offstage)).first;
    //   expect(offstageWidget.offstage, isTrue);
    // });

    testWidgets('applies custom style', (WidgetTester tester) async {
      const color = Colors.purpleAccent;

      await tester.pumpWidget(
        MaterialApp(
          home: Accordion(
            header: (spec) => XAccordionHeaderSpecWidget(
              spec: spec,
              title: 'Styled Accordion',
              trailingIcon: Icons.rocket_launch,
            ),
            content: (spec) => TextSpecWidget(
              'Styled Content',
              spec: spec,
            ),
            style: const FakeAccordionStyle(color),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.rocket_launch), findsOneWidget);

      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.color, color);
    });
  });
}

class FakeAccordionStyle extends AccordionStyle {
  final Color color;
  const FakeAccordionStyle(this.color);

  @override
  Style makeStyle(SpecConfiguration<AccordionSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);
    return Style.create([
      baseStyle(),
      $.header.trailingIcon.color(color),
    ]);
  }
}
