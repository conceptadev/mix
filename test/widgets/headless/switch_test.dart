import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('SwitchX', () {
    testWidgets('initial state', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Center(
            child: SwitchX(value: false),
          ),
        ),
      ));

      final switchFinder = find.byType(SwitchX);

      expect(switchFinder, findsOneWidget);

      final switchX = tester.widget(switchFinder) as SwitchX;

      expect(switchX.value, isFalse);
    });

    testWidgets('toggling the switch', (WidgetTester tester) async {
      bool value = false;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Center(
            child: SwitchX(
              value: value,
              onChange: (newValue) {
                value = newValue;
              },
            ),
          ),
        ),
      ));

      final switchFinder = find.byType(SwitchX);

      expect(switchFinder, findsOneWidget);

      final switchX = tester.widget(switchFinder) as SwitchX;

      expect(switchX.value, isFalse);

      await tester.tap(switchFinder);

      expect(value, isTrue);
    });
  });

  group('SwitchXTrack', () {
    testWidgets('initial state', (WidgetTester tester) async {
      await tester.pumpWidget(const SwitchXTrack());

      final switchFinder = find.byType(SwitchXTrack);

      expect(switchFinder, findsOneWidget);

      final switchX = tester.widget(switchFinder) as SwitchXTrack;

      expect(switchX.size, const Size(40, 20));
    });

    testWidgets('Default track size is 40x20', (WidgetTester tester) async {
      await tester.pumpWidget(const SwitchXTrack());
      final track = tester.widget<SwitchXTrack>(find.byType(SwitchXTrack));
      expect(track.size.width, equals(40));
      expect(track.size.height, equals(20));
    });

    testWidgets('Custom track size is applied', (WidgetTester tester) async {
      await tester.pumpWidget(SwitchXTrack(
        mix: Mix(width(60), height(30)),
      ));

      final track = tester.widget<SwitchXTrack>(find.byType(SwitchXTrack));

      expect(track.size.width, equals(60));
      expect(track.size.height, equals(30));
    });

    testWidgets(
      'Child is rendered within the track',
      (WidgetTester tester) async {
        const icon = Icons.check;

        await tester.pumpWidget(
          const Directionality(
            textDirection: TextDirection.ltr,
            child: SwitchXTrack(
              child: IconMix(icon),
            ),
          ),
        );

        expect(find.byIcon(icon), findsOneWidget);
      },
    );
  });

  group('SwitchXThumb', () {
    testWidgets('initial state', (WidgetTester tester) async {
      await tester.pumpWidget(const SwitchXThumb());

      final switchFinder = find.byType(SwitchXThumb);

      expect(switchFinder, findsOneWidget);

      final switchX = tester.widget(switchFinder) as SwitchXThumb;

      expect(switchX.size, const Size(20, 20));
    });

    testWidgets('Default thumb size is 20x20', (WidgetTester tester) async {
      await tester.pumpWidget(const SwitchXThumb());
      final thumb = tester.widget<SwitchXThumb>(find.byType(SwitchXThumb));
      expect(thumb.size.width, equals(20));
      expect(thumb.size.height, equals(20));
    });

    testWidgets('Custom thumb size is applied', (WidgetTester tester) async {
      await tester.pumpWidget(SwitchXThumb(
        mix: Mix(width(30), height(30)),
      ));

      final thumb = tester.widget<SwitchXThumb>(find.byType(SwitchXThumb));

      expect(thumb.size.width, equals(30));
      expect(thumb.size.height, equals(30));
    });

    testWidgets(
      'Child is rendered within the thumb',
      (WidgetTester tester) async {
        const icon = Icons.check;

        await tester.pumpWidget(
          const Directionality(
            textDirection: TextDirection.ltr,
            child: SwitchXThumb(
              child: IconMix(icon),
            ),
          ),
        );

        expect(find.byIcon(icon), findsOneWidget);
      },
    );
  });
}
