import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/src/components/progress/progress.dart';

void main() {
  group('XProgress', () {
    testWidgets('renders with default values', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: XProgress(value: 0.0)));

      final progressFinder = find.byType(XProgress);
      expect(progressFinder, findsOneWidget);

      final XProgress progress = tester.widget(progressFinder);
      expect(progress.value, 0.0);
    });

    testWidgets('applies custom value', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: XProgress(value: 0.5)));

      final progressFinder = find.byType(XProgress);
      final XProgress progress = tester.widget(progressFinder);
      expect(progress.value, 0.5);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      final $progress = ProgressSpecUtility.self;

      await tester.pumpWidget(
        MaterialApp(
          home: XProgress(
            value: 0.1,
            style: Style(
              $progress.fill.color.red(),
            ),
          ),
        ),
      );

      final progressFinder = find.byType(XProgress);
      final XProgress progress = tester.widget(progressFinder);
      expect(progress.style, isNotNull);
    });
  });
}
