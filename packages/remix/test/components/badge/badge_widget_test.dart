import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

import '../../utils/extensions/widget_tester.dart';

void main() {
  group('RxBadge', () {
    final $badge = BadgeSpecUtility.self;

    testWidgets('renders the label', (WidgetTester tester) async {
      await tester.pumpRxComponent(RxBadge(label: 'Test'));

      expect(find.text('Test'), findsOneWidget);
      expect(find.byType(RxBadge), findsOneWidget);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      final color = Colors.red;

      final customStyle = Style(
        BadgeVariant.solid(
          $badge.container.color(color),
        ),
      );

      await tester.pumpRxComponent(
        RxBadge(
          label: 'Custom',
          style: customStyle,
          variant: BadgeVariant.solid,
        ),
      );

      final badgeFinder = find.byType(RxBadge);
      expect(badgeFinder, findsOneWidget);

      final container = find.descendant(
        of: badgeFinder,
        matching: find.byType(Container),
      );
      expect(container, findsOneWidget);

      final containerWidget = tester.widget<Container>(container);
      expect((containerWidget.decoration! as BoxDecoration).color, color);
    });

    testWidgets('renders with different sizes', (WidgetTester tester) async {
      final key1 = Key('1');
      final key2 = Key('2');
      final key3 = Key('3');

      await tester.pumpRxComponent(
        Column(
          children: [
            RxBadge(key: key1, label: 'Small', size: BadgeSize.small),
            RxBadge(key: key2, label: 'Medium', size: BadgeSize.medium),
            RxBadge(key: key3, label: 'Large', size: BadgeSize.large),
          ],
        ),
      );

      expect(find.byKey(key1), findsOneWidget);
      expect(find.byKey(key2), findsOneWidget);
      expect(find.byKey(key3), findsOneWidget);

      final avatar1 = tester.widget<RxBadge>(find.byKey(key1));
      expect(avatar1.size, equals(BadgeSize.small));

      final avatar2 = tester.widget<RxBadge>(find.byKey(key2));
      expect(avatar2.size, equals(BadgeSize.medium));

      final avatar3 = tester.widget<RxBadge>(find.byKey(key3));
      expect(avatar3.size, equals(BadgeSize.large));
    });

    testWidgets('renders with different variants', (WidgetTester tester) async {
      final key1 = Key('1');
      final key2 = Key('2');

      await tester.pumpRxComponent(
        Column(
          children: [
            RxBadge(key: key1, label: 'Soft', variant: BadgeVariant.soft),
            RxBadge(key: key2, label: 'Solid', variant: BadgeVariant.solid),
          ],
        ),
      );

      expect(find.byKey(key1), findsOneWidget);
      expect(find.byKey(key2), findsOneWidget);

      final badge1 = tester.widget<RxBadge>(find.byKey(key1));
      expect(badge1.variant, equals(BadgeVariant.soft));

      final badge2 = tester.widget<RxBadge>(find.byKey(key2));
      expect(badge2.variant, equals(BadgeVariant.solid));
    });

    testWidgets('renders with different radii', (WidgetTester tester) async {
      final key1 = Key('1');
      final key2 = Key('2');
      final key3 = Key('3');

      await tester.pumpRxComponent(
        Column(
          children: [
            RxBadge(
                key: key1, label: 'Small Radius', radius: BadgeRadius.small),
            RxBadge(
                key: key2, label: 'Medium Radius', radius: BadgeRadius.medium),
            RxBadge(
                key: key3, label: 'Large Radius', radius: BadgeRadius.large),
          ],
        ),
      );

      expect(find.byKey(key1), findsOneWidget);
      expect(find.byKey(key2), findsOneWidget);
      expect(find.byKey(key3), findsOneWidget);

      final badge1 = tester.widget<RxBadge>(find.byKey(key1));
      expect(badge1.radius, equals(BadgeRadius.small));

      final badge2 = tester.widget<RxBadge>(find.byKey(key2));
      expect(badge2.radius, equals(BadgeRadius.medium));

      final badge3 = tester.widget<RxBadge>(find.byKey(key3));
      expect(badge3.radius, equals(BadgeRadius.large));
    });
  });
}
