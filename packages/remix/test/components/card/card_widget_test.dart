import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/card/card.dart';

import '../../utils/extensions/widget_tester.dart';

void main() {
  group('RxCard', () {
    final $card = CardSpecUtility.self;

    testWidgets('renders with default type', (WidgetTester tester) async {
      await tester.pumpRxComponent(
        const RxCard(
          children: [Text('Test')],
        ),
      );

      expect(find.byType(RxBlankCard), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      const color = Colors.red;

      final customStyle = Style(
        $card.container.color(color),
      );

      await tester.pumpRxComponent(
        RxCard(
          style: customStyle,
          children: const [Text('Custom Style')],
        ),
      );

      final card = tester.widget<Container>(find.byType(Container));
      expect((card.decoration as BoxDecoration).color, equals(color));
    });

    testWidgets('renders multiple children', (WidgetTester tester) async {
      await tester.pumpRxComponent(
        const RxCard(
          children: [
            Text('Child 1'),
            Text('Child 2'),
            Text('Child 3'),
          ],
        ),
      );

      expect(find.text('Child 1'), findsOneWidget);
      expect(find.text('Child 2'), findsOneWidget);
      expect(find.text('Child 3'), findsOneWidget);
    });

    testWidgets('applies different card variants', (WidgetTester tester) async {
      for (final variant in CardVariant.values) {
        await tester.pumpRxComponent(
          RxCard(
            variant: variant,
            children: const [Text('Variant Test')],
          ),
        );

        final card = tester.widget<RxBlankCard>(find.byType(RxBlankCard));
        final appliedVariantStillInStyle =
            card.style.variants.values.any((e) => e.variant == variant);

        expect(appliedVariantStillInStyle, false);
      }
    });

    testWidgets('applies different card sizes', (WidgetTester tester) async {
      for (final size in CardSize.values) {
        await tester.pumpRxComponent(
          RxCard(
            size: size,
            children: const [Text('Variant Test')],
          ),
        );

        final card = tester.widget<RxBlankCard>(find.byType(RxBlankCard));
        final appliedVariantStillInStyle =
            card.style.variants.values.any((e) => e.variant == size);

        expect(appliedVariantStillInStyle, false);
      }
    });
  });
}
