import 'package:flutter/material.dart' as m;
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/src/components/card/card.dart';

void main() {
  group('Card', () {
    testWidgets('renders with default type', (WidgetTester tester) async {
      await tester.pumpWidget(
        const m.MaterialApp(
          home: Card(
            style: CardStyle(),
            child: m.Text('Test'),
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      const color = m.Colors.red;

      await tester.pumpWidget(
        const m.MaterialApp(
          home: Card(
            style: FakeCardStyle(color),
            child: m.Text('Custom Style'),
          ),
        ),
      );

      final card = tester.widget<m.Container>(find.byType(m.Container));
      expect((card.decoration as m.BoxDecoration).color, equals(color));
    });

    testWidgets('renders multiple children', (WidgetTester tester) async {
      await tester.pumpWidget(
        const m.MaterialApp(
          home: Card(
            style: CardStyle(),
            child: m.Text('Child 1'),
          ),
        ),
      );

      expect(find.text('Child 1'), findsOneWidget);
    });
  });
}

class FakeCardStyle extends CardStyle {
  final m.Color color;

  const FakeCardStyle(
    this.color,
  );

  @override
  Style makeStyle(SpecConfiguration<CardSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);
    return Style.create([
      baseStyle(),
      $.container.color(color),
    ]);
  }
}
