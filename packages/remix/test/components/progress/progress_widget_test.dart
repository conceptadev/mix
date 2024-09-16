import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/src/components/progress/progress.dart';

void main() {
  group('XProgress', () {
    testWidgets('renders with default values', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Progress(
            value: 0.0,
            style: ProgressStyle(),
          ),
        ),
      );

      final progressFinder = find.byType(Progress);
      expect(progressFinder, findsOneWidget);

      final Progress progress = tester.widget(progressFinder);
      expect(progress.value, 0.0);
    });

    testWidgets('applies custom value', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Progress(
            value: 0.5,
            style: ProgressStyle(),
          ),
        ),
      );

      final progressFinder = find.byType(Progress);
      final Progress progress = tester.widget(progressFinder);
      expect(progress.value, 0.5);
    });

    // testWidgets('applies custom style', (WidgetTester tester) async {
    //   const color = Colors.red;

    //   await tester.pumpWidget(
    //     const MaterialApp(
    //       home: Progress(
    //         value: 0.1,
    //         style: FakeProgressStyle(color),
    //       ),
    //     ),
    //   );

    //   final progressFinder = find.byType(Progress);
    //   final Progress progress = tester.widget(progressFinder);

    //   expect(progress.style, isNotNull);
    // });
  });
}

class FakeProgressStyle extends ProgressStyle {
  final Color color;

  const FakeProgressStyle(
    this.color,
  );

  @override
  Style makeStyle(SpecConfiguration<ProgressSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);
    return Style.create([
      baseStyle(),
      $.container.color(color),
    ]);
  }
}
