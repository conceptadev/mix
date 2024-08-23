import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/src/components/progress/progress.dart';

import '../../utils/extensions/widget_tester.dart';

void main() {
  group('RxProgress', () {
    testWidgets('renders with default values', (WidgetTester tester) async {
      await tester.pumpRxComponent(const RxProgress());

      final progressFinder = find.byType(RxBlankProgress);
      expect(progressFinder, findsOneWidget);

      final RxBlankProgress progress = tester.widget(progressFinder);
      expect(progress.value, 0.0);
    });

    testWidgets('applies custom size', (WidgetTester tester) async {
      const size = ProgressSize.size3;
      await tester.pumpRxComponent(const RxProgress(size: size));

      final progressFinder = find.byType(RxProgress);
      final RxProgress progress = tester.widget(progressFinder);
      expect(progress.size, equals(size));
    });

    testWidgets('applies custom type', (WidgetTester tester) async {
      const type = ProgressVariant.soft;
      await tester.pumpRxComponent(const RxProgress(variant: type));

      final progressFinder = find.byType(RxProgress);
      final RxProgress progress = tester.widget(progressFinder);
      expect(progress.variant, equals(type));
    });

    testWidgets('applies custom radius', (WidgetTester tester) async {
      const radius = ProgressRadius.full;
      await tester.pumpRxComponent(const RxProgress(radius: radius));

      final progressFinder = find.byType(RxProgress);
      final RxProgress progress = tester.widget(progressFinder);
      expect(progress.radius, equals(radius));
    });

    testWidgets('applies custom value', (WidgetTester tester) async {
      await tester.pumpRxComponent(const RxProgress(value: 0.5));

      final progressFinder = find.byType(RxBlankProgress);
      final RxBlankProgress progress = tester.widget(progressFinder);
      expect(progress.value, 0.5);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      final $progress = ProgressSpecUtility.self;

      await tester.pumpRxComponent(
        RxProgress(
          variant: ProgressVariant.surface,
          style: Style(
            ProgressVariant.surface(
              $progress.fill.color.red(),
            ),
          ),
        ),
      );

      final progressFinder = find.byType(RxBlankProgress);
      final RxBlankProgress progress = tester.widget(progressFinder);
      expect(progress.style, isNotNull);
    });
  });
}
