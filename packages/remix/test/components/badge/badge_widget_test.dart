import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

void main() {
  group('XBadge', () {
    final $badge = BadgeSpecUtility.self;

    testWidgets('renders the label', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: XBadge(label: 'Test'),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
      expect(find.byType(XBadge), findsOneWidget);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      const color = Colors.red;

      final customStyle = Style(
        $badge.container.color(color),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: XBadge(
            label: 'Custom',
            style: customStyle,
          ),
        ),
      );

      final badgeFinder = find.byType(XBadge);
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
