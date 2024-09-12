import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart' as r;

void main() {
  group('XBadge', () {
    testWidgets('renders the label', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: r.Badge(
            label: 'Test',
            style: r.BadgeStyle(),
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
      expect(find.byType(r.Badge), findsOneWidget);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      const color = Colors.red;

      await tester.pumpWidget(
        const MaterialApp(
          home: r.Badge(
            label: 'Custom',
            style: FakeBadgeStyle(color),
          ),
        ),
      );

      final badgeFinder = find.byType(r.Badge);
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

class FakeBadgeStyle extends r.BadgeStyle {
  final Color color;
  const FakeBadgeStyle(this.color);

  @override
  Style makeStyle(SpecConfiguration<r.BadgeSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);
    return Style.create([
      baseStyle(),
      $.container.color(color),
    ]);
  }
}
