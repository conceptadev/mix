import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

import '../../utils/extensions/widget_tester.dart';

void main() {
  group('RxAccordion', () {
    testWidgets('renders with required properties',
        (WidgetTester tester) async {
      await tester.pumpRxComponent(
        RxAccordion(
          title: 'Test Accordion',
          content: Text('Accordion Content'),
        ),
      );

      expect(find.text('Test Accordion'), findsOneWidget);
      expect(find.text('Accordion Content'), findsOneWidget);
    });

    testWidgets('renders with custom icons', (WidgetTester tester) async {
      await tester.pumpRxComponent(
        RxAccordion(
          title: 'Custom Icons',
          leadingIcon: Icons.star,
          trailingIcon: Icons.arrow_drop_down,
          content: Text('Content'),
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
      final _accordion = AccordionSpecUtility.self;
      final color = Colors.purpleAccent;

      await tester.pumpRxComponent(
        RxAccordion(
          title: 'Styled Accordion',
          content: Text('Styled Content'),
          trailingIcon: Icons.rocket_launch,
          style: Style(
            _accordion.header.trailingIcon.color(color),
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
