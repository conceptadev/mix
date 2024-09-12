import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/src/components/callout/callout.dart';

void main() {
  group('XCallout', () {
    final $callout = CalloutSpecUtility.self;

    testWidgets('renders with custom label', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Callout(text: 'Test Callout')),
      );

      expect(find.text('Test Callout'), findsOneWidget);
      expect(find.byType(Callout), findsOneWidget);
    });

    testWidgets('renders with custom icon', (WidgetTester tester) async {
      const icon = Icons.abc_rounded;
      await tester.pumpWidget(
        const MaterialApp(
          home: Callout(
            text: 'Test Callout',
            icon: icon,
          ),
        ),
      );

      expect(find.byIcon(icon), findsOneWidget);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      const color = Colors.red;

      final customStyle = Style(
        $callout.container.color(color),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Callout(
            text: 'Test Callout',
            style: customStyle,
          ),
        ),
      );

      final badgeFinder = find.byType(Callout);
      expect(badgeFinder, findsOneWidget);

      final container = find.descendant(
        of: badgeFinder,
        matching: find.byType(Container),
      );
      expect(container, findsOneWidget);

      final containerWidget = tester.widget<Container>(container);
      expect((containerWidget.decoration! as BoxDecoration).color, color);
    });
  });
}
