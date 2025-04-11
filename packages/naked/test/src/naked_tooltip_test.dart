import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/naked.dart';

extension _WidgetTesterX on WidgetTester {
  Future<void> pumpTooltip(Widget widget) async {
    await pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: Overlay(
        initialEntries: [OverlayEntry(builder: (context) => widget)],
      ),
    ));
  }
}

void _expectDistance(Offset offset1, Offset offset2, double expectedDistance) {
  final distance = (offset1 - offset2).distance;
  expect(distance, equals(expectedDistance));
}

void main() {
  group('Basic Functionality', () {
    testWidgets('renders child widget', (WidgetTester tester) async {
      await tester.pumpTooltip(
        const NakedTooltip(
          tooltipWidget: Text('Tooltip Content'),
          visible: false,
          child: Text('Hover Me'),
        ),
      );

      expect(find.text('Hover Me'), findsOneWidget);
      expect(find.text('Tooltip Content'), findsNothing);
    });

    testWidgets('shows tooltip when visible is true',
        (WidgetTester tester) async {
      await tester.pumpTooltip(
        NakedTooltip(
          tooltipWidget: const Text('Tooltip Content'),
          visible: true,
          animationStyle: AnimationStyle.noAnimation,
          child: const Text('Hover Me'),
        ),
      );

      await tester.pump();
      expect(find.text('Tooltip Content'), findsOneWidget);
    });

    testWidgets('hides tooltip when visible is false',
        (WidgetTester tester) async {
      await tester.pumpTooltip(
        NakedTooltip(
          tooltipWidget: const Text('Tooltip Content'),
          visible: false,
          animationStyle: AnimationStyle.noAnimation,
          child: const Text('Hover Me'),
        ),
      );

      await tester.pump();
      expect(find.text('Tooltip Content'), findsNothing);
    });
  });

  group('Positioning', () {
    testWidgets('positions tooltip based on anchors',
        (WidgetTester tester) async {
      final targetKey = GlobalKey();
      final tooltipKey = GlobalKey();

      await tester.pumpTooltip(
        Center(
          child: NakedTooltip(
            tooltipWidget: SizedBox(
              key: tooltipKey,
              width: 100,
              height: 50,
              child: const Text('tooltip'),
            ),
            visible: true,
            targetAnchor: Alignment.topLeft,
            followerAnchor: Alignment.bottomLeft,
            offset: Offset.zero,
            animationStyle: AnimationStyle.noAnimation,
            child: SizedBox(
              key: targetKey,
              width: 100,
              height: 50,
              child: const Text('target'),
            ),
          ),
        ),
      );

      await tester.pump(const Duration(milliseconds: 100));

      final targetFinder = find.byKey(targetKey);
      final tooltipFinder = find.byKey(tooltipKey);

      expect(tooltipFinder, findsOneWidget);

      _expectDistance(
        tester.getTopLeft(targetFinder),
        tester.getBottomLeft(tooltipFinder),
        0,
      );

      _expectDistance(
        tester.getTopLeft(tooltipFinder),
        tester.getTopLeft(targetFinder),
        50,
      );
    });

    testWidgets('applies offset correctly', (WidgetTester tester) async {
      final targetKey = GlobalKey();
      final tooltipKey = GlobalKey();

      await tester.pumpTooltip(
        Center(
          child: NakedTooltip(
            tooltipWidget: SizedBox(
              key: tooltipKey,
              width: 100,
              height: 50,
              child: const Text('Tooltip Content'),
            ),
            visible: true,
            targetAnchor: Alignment.topLeft,
            followerAnchor: Alignment.bottomLeft,
            offset: const Offset(0, 10),
            animationStyle: AnimationStyle.noAnimation,
            child: SizedBox(
              key: targetKey,
              width: 100,
              height: 50,
              child: const Text('Hover Me'),
            ),
          ),
        ),
      );

      await tester.pump();

      final targetFinder = find.byKey(targetKey);
      final tooltipFinder = find.byKey(tooltipKey);

      _expectDistance(
        tester.getTopLeft(targetFinder),
        tester.getBottomLeft(tooltipFinder),
        10,
      );
    });
  });

  group('Animation', () {
    testWidgets('applies transition builder', (WidgetTester tester) async {
      await tester.pumpTooltip(
        NakedTooltip(
          tooltipWidget: const Text('Tooltip Content'),
          visible: true,
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: const Text('Hover Me'),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text('Tooltip Content'), findsOneWidget);
    });
  });

  testWidgets('toggles tooltip visibility based on state',
      (WidgetTester tester) async {
    bool isHovered = false;

    await tester.pumpTooltip(
      StatefulBuilder(
        builder: (context, setState) {
          return GestureDetector(
            onTap: () => setState(() => isHovered = !isHovered),
            child: NakedTooltip(
              tooltipWidget: const Text('Tooltip Content'),
              visible: isHovered,
              child: const Text('Press Me'),
            ),
          );
        },
      ),
    );

    expect(find.text('Tooltip Content'), findsNothing);

    // Press
    await tester.tap(find.text('Press Me'));
    await tester.pumpAndSettle();

    expect(find.text('Tooltip Content'), findsOneWidget);

    // Press Again
    await tester.tap(find.text('Press Me'));
    await tester.pumpAndSettle();

    expect(find.text('Tooltip Content'), findsNothing);
  });
}
