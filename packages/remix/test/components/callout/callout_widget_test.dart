import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/callout/callout.dart';

import '../../utils/extensions/widget_tester.dart';

void main() {
  group('RxCallout', () {
    final $callout = CalloutSpecUtility.self;

    testWidgets('renders with custom label', (WidgetTester tester) async {
      await tester.pumpRxComponent(
        const RxCallout(text: 'Test Callout'),
      );

      expect(find.text('Test Callout'), findsOneWidget);
      expect(find.byType(RxBlankCallout), findsOneWidget);
    });

    testWidgets('renders with custom icon', (WidgetTester tester) async {
      await tester.pumpRxComponent(
        const RxCallout(
          text: 'Test Callout',
          icon: Icons.info,
        ),
      );

      expect(find.byIcon(Icons.info), findsOneWidget);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      const color = Colors.red;

      final customStyle = Style(
        CalloutVariant.surface(
          $callout.container.color(color),
        ),
      );

      await tester.pumpRxComponent(
        RxCallout(
          text: 'Test Callout',
          variant: CalloutVariant.surface,
          style: customStyle,
        ),
      );

      final badgeFinder = find.byType(RxCallout);
      expect(badgeFinder, findsOneWidget);

      final container = find.descendant(
        of: badgeFinder,
        matching: find.byType(Container),
      );
      expect(container, findsOneWidget);

      final containerWidget = tester.widget<Container>(container);
      expect((containerWidget.decoration! as BoxDecoration).color, color);
    });

    testWidgets('uses different variants', (WidgetTester tester) async {
      for (final variant in CalloutVariant.values) {
        await tester.pumpRxComponent(
          RxCallout(
            text: 'Test Callout',
            variant: variant,
          ),
        );

        final callout = tester.widget<RxCallout>(find.byType(RxCallout));
        expect(callout.variant, variant);
      }
    });
  });
}
