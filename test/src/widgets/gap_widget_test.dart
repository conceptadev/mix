import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/widgets/gap_widget.dart';

void main() {
  group('Gap widget', () {
    testWidgets(
        'Gap maintains fixed width when enough space is available in a Row',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                Container(width: 100, height: 100, color: Colors.red),
                const Gap(50),
                Container(width: 100, height: 100, color: Colors.blue),
              ],
            ),
          ),
        ),
      );

      final Finder gapFinder = find.byType(Gap);
      expect(gapFinder, findsOneWidget);

      final RenderBox gapRenderBox = tester.renderObject(gapFinder);
      expect(gapRenderBox.size.width, equals(50));
    });

    testWidgets(
        'Gap maintains fixed height when enough space is available in a Column',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Container(width: 100, height: 100, color: Colors.red),
                const Gap(50),
                Container(width: 100, height: 100, color: Colors.blue),
              ],
            ),
          ),
        ),
      );

      final Finder gapFinder = find.byType(Gap);
      expect(gapFinder, findsOneWidget);

      final RenderBox gapRenderBox = tester.renderObject(gapFinder);
      expect(gapRenderBox.size.height, equals(50));
    });
  });

  testWidgets(
    'spaceBetween layout includes Gap in space distribution',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 50, height: 50, color: Colors.red),
                const Gap(20),
                Container(width: 50, height: 50, color: Colors.blue),
              ],
            ),
          ),
        ),
      );

      final Finder firstContainerFinder = find.byType(Container).first;
      final Finder gapFinder = find.byType(Gap);
      final Finder lastContainerFinder = find.byType(Container).last;

      final RenderBox firstContainerBox =
          tester.renderObject(firstContainerFinder);
      final RenderBox gapBox = tester.renderObject(gapFinder);
      final RenderBox lastContainerBox =
          tester.renderObject(lastContainerFinder);

      // Check if the Gap is positioned between the two containers
      expect(gapBox.localToGlobal(Offset.zero).dx,
          greaterThan(firstContainerBox.localToGlobal(Offset.zero).dx + 50));
      expect(gapBox.localToGlobal(Offset.zero).dx,
          lessThan(lastContainerBox.localToGlobal(Offset.zero).dx));
    },
  );

  testWidgets(
    'Gap widget adjusts size in spaceBetween layout',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 100, height: 50, color: Colors.red),
                const Gap(20),
                Container(width: 100, height: 50, color: Colors.blue),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final Finder gapFinder = find.byType(Gap);
      expect(gapFinder, findsOneWidget);

      final RenderBox gapRenderBox = tester.renderObject(gapFinder);
      // Expect the Gap to adjust its size based on available space
      // The exact size will depend on the screen size and container widths
      expect(gapRenderBox.size.width, lessThanOrEqualTo(20));
      // You may also assert that the gap width is greater than 0 if there's enough space
    },
  );
}
