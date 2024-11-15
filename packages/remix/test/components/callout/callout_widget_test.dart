import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart' as r;
import 'package:remix/src/components/callout/callout.dart';

void main() {
  group('XCallout', () {
    testWidgets('renders with custom label', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: r.Callout(text: 'Test Callout', style: r.CalloutStyle()),
        ),
      );

      expect(find.text('Test Callout'), findsOneWidget);
      expect(find.byType(r.Callout), findsOneWidget);
    });

    testWidgets('renders with custom icon', (WidgetTester tester) async {
      const icon = Icons.abc_rounded;
      await tester.pumpWidget(
        const MaterialApp(
          home: r.Callout(
            icon: icon,
            text: 'Test Callout',
            style: r.CalloutStyle(),
          ),
        ),
      );

      expect(find.byIcon(icon), findsOneWidget);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      const color = Colors.red;

      await tester.pumpWidget(
        const MaterialApp(
          home: r.Callout(
            text: 'Test Callout',
            style: FakeCalloutStyle(color),
          ),
        ),
      );

      final badgeFinder = find.byType(r.Callout);
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

class FakeCalloutStyle extends CalloutStyle {
  final Color color;

  const FakeCalloutStyle(this.color);

  @override
  Style makeStyle(SpecConfiguration<CalloutSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);

    return Style.create([baseStyle(), $.container.color(color)]);
  }
}
