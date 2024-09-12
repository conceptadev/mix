import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/src/components/card/card.dart';

void main() {
  group('XCard', () {
    final $card = CardSpecUtility.self;

    testWidgets('renders with default type', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Card(
            children: [Text('Test')],
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      const color = Colors.red;

      final customStyle = Style(
        $card.container.color(color),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Card(
            style: customStyle,
            children: const [Text('Custom Style')],
          ),
        ),
      );

      final card = tester.widget<Container>(find.byType(Container));
      expect((card.decoration as BoxDecoration).color, equals(color));
    });

    testWidgets('renders multiple children', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Card(
            children: [
              Text('Child 1'),
              Text('Child 2'),
              Text('Child 3'),
            ],
          ),
        ),
      );

      expect(find.text('Child 1'), findsOneWidget);
      expect(find.text('Child 2'), findsOneWidget);
      expect(find.text('Child 3'), findsOneWidget);
    });
  });
}
