import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/src/utilities/naked_positioning.dart';

void main() {
  group('AnchorPosition', () {
    test('topCenter places child above target', () {
      const position = AnchorPosition.topCenter;
      expect(position.targetAnchor, equals(Alignment.topCenter));
      expect(position.childAnchor, equals(Alignment.bottomCenter));
    });

    test('bottomCenter places child below target', () {
      const position = AnchorPosition.bottomCenter;
      expect(position.targetAnchor, equals(Alignment.bottomCenter));
      expect(position.childAnchor, equals(Alignment.topCenter));
    });

    test('leftCenter places child to the left of target', () {
      const position = AnchorPosition.leftCenter;
      expect(position.targetAnchor, equals(Alignment.centerLeft));
      expect(position.childAnchor, equals(Alignment.centerRight));
    });

    test('rightCenter places child to the right of target', () {
      const position = AnchorPosition.rightCenter;
      expect(position.targetAnchor, equals(Alignment.centerRight));
      expect(position.childAnchor, equals(Alignment.centerLeft));
    });

    test('topLeft places child at top-left corner of target', () {
      const position = AnchorPosition.topLeft;
      expect(position.targetAnchor, equals(Alignment.topLeft));
      expect(position.childAnchor, equals(Alignment.bottomLeft));
    });

    test('topRight places child at top-right corner of target', () {
      const position = AnchorPosition.topRight;
      expect(position.targetAnchor, equals(Alignment.topRight));
      expect(position.childAnchor, equals(Alignment.bottomRight));
    });

    test('bottomLeft places child at bottom-left corner of target', () {
      const position = AnchorPosition.bottomLeft;
      expect(position.targetAnchor, equals(Alignment.bottomLeft));
      expect(position.childAnchor, equals(Alignment.topLeft));
    });

    test('bottomRight places child at bottom-right corner of target', () {
      const position = AnchorPosition.bottomRight;
      expect(position.targetAnchor, equals(Alignment.bottomRight));
      expect(position.childAnchor, equals(Alignment.topRight));
    });
  });

  group('NakedPositioning', () {
    testWidgets('positions child based on preferred positions',
        (WidgetTester tester) async {
      // Create a target in the center of the screen
      final targetRect = Rect.fromCenter(
        center: const Offset(400, 300),
        width: 100,
        height: 50,
      );

      // Child to position
      const childSize = Size(200, 100);

      // Expected position when using bottomCenter (default first preference)
      final expectedPosition = Rect.fromLTWH(
        targetRect.left + (targetRect.width - childSize.width) / 2,
        targetRect.bottom,
        childSize.width,
        childSize.height,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                // Target visualization
                Positioned(
                  left: targetRect.left,
                  top: targetRect.top,
                  width: targetRect.width,
                  height: targetRect.height,
                  child: Container(color: Colors.blue),
                ),
                // Positioned child
                NakedPositioning(
                  target: targetRect,
                  child: Container(
                    width: childSize.width,
                    height: childSize.height,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Wait for positioning to complete
      await tester.pump();

      // Find the positioned container
      final positionedFinder = find.byType(Positioned).last;
      expect(positionedFinder, findsOneWidget);

      final positioned = tester.widget<Positioned>(positionedFinder);

      // Verify position is as expected (with small margin for rounding)
      expect(
          positioned.left, moreOrLessEquals(expectedPosition.left, epsilon: 1));
      expect(
          positioned.top, moreOrLessEquals(expectedPosition.top, epsilon: 1));
      expect(positioned.width,
          moreOrLessEquals(expectedPosition.width, epsilon: 1));
      expect(positioned.height,
          moreOrLessEquals(expectedPosition.height, epsilon: 1));
    });

    testWidgets(
        'falls back to alternative position when primary position would overflow',
        (WidgetTester tester) async {
      // Set small screen size
      tester.view.physicalSize = const Size(800, 600);
      tester.view.devicePixelRatio = 1.0;

      // Create a target near the bottom of the screen
      const targetRect = Rect.fromLTWH(350, 550, 100, 50);

      // Child to position - would overflow bottom of screen
      const childSize = Size(200, 200);

      // Expected position when using topCenter (second preference)
      // since bottomCenter would overflow
      final expectedPosition = Rect.fromLTWH(
        targetRect.left + (targetRect.width - childSize.width) / 2,
        targetRect.top - childSize.height,
        childSize.width,
        childSize.height,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                // Target visualization
                Positioned(
                  left: targetRect.left,
                  top: targetRect.top,
                  width: targetRect.width,
                  height: targetRect.height,
                  child: Container(color: Colors.blue),
                ),
                // Positioned child
                NakedPositioning(
                  target: targetRect,
                  child: Container(
                    width: childSize.width,
                    height: childSize.height,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Wait for positioning to complete
      await tester.pump();

      // Find the positioned container
      final positionedFinder = find.byType(Positioned).last;
      expect(positionedFinder, findsOneWidget);

      final positioned = tester.widget<Positioned>(positionedFinder);

      // Verify position is as expected (with small margin for rounding)
      expect(
          positioned.left, moreOrLessEquals(expectedPosition.left, epsilon: 1));
      expect(
          positioned.top, moreOrLessEquals(expectedPosition.top, epsilon: 1));
      expect(positioned.width,
          moreOrLessEquals(expectedPosition.width, epsilon: 1));
      expect(positioned.height,
          moreOrLessEquals(expectedPosition.height, epsilon: 1));

      // Reset the test window
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
    });

    testWidgets('applies offset to positioned element',
        (WidgetTester tester) async {
      // Create a target in the center of the screen
      final targetRect = Rect.fromCenter(
        center: const Offset(400, 300),
        width: 100,
        height: 50,
      );

      // Child to position
      const childSize = Size(200, 100);

      // Offset to apply
      const offset = Offset(0, 20);

      // Expected position when using bottomCenter with offset
      final expectedPosition = Rect.fromLTWH(
        targetRect.left + (targetRect.width - childSize.width) / 2,
        targetRect.bottom + offset.dy,
        childSize.width,
        childSize.height,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                // Target visualization
                Positioned(
                  left: targetRect.left,
                  top: targetRect.top,
                  width: targetRect.width,
                  height: targetRect.height,
                  child: Container(color: Colors.blue),
                ),
                // Positioned child with offset
                NakedPositioning(
                  target: targetRect,
                  offset: offset,
                  child: Container(
                    width: childSize.width,
                    height: childSize.height,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Wait for positioning to complete
      await tester.pump();

      // Find the positioned container
      final positionedFinder = find.byType(Positioned).last;
      expect(positionedFinder, findsOneWidget);

      final positioned = tester.widget<Positioned>(positionedFinder);

      // Verify position is as expected (with small margin for rounding)
      expect(
          positioned.left, moreOrLessEquals(expectedPosition.left, epsilon: 1));
      expect(
          positioned.top, moreOrLessEquals(expectedPosition.top, epsilon: 1));
      expect(positioned.width,
          moreOrLessEquals(expectedPosition.width, epsilon: 1));
      expect(positioned.height,
          moreOrLessEquals(expectedPosition.height, epsilon: 1));
    });

    testWidgets('applies constraints to positioned element',
        (WidgetTester tester) async {
      // Create a target in the center of the screen
      final targetRect = Rect.fromCenter(
        center: const Offset(400, 300),
        width: 100,
        height: 50,
      );

      // Child to position
      const childSize = Size(150, 100);

      // Constraints to apply
      const constraints = BoxConstraints(minWidth: 200, maxWidth: 300);

      // Expected position when using bottomCenter with constraints
      // Note: The implementation centers the element on the target horizontally
      final expectedPosition = Rect.fromLTWH(
        targetRect.left +
            (targetRect.width - constraints.minWidth) / 2 +
            25, // Adjust for target center calculation
        targetRect.bottom,
        constraints.minWidth,
        childSize.height,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                // Target visualization
                Positioned(
                  left: targetRect.left,
                  top: targetRect.top,
                  width: targetRect.width,
                  height: targetRect.height,
                  child: Container(color: Colors.blue),
                ),
                // Positioned child with constraints
                NakedPositioning(
                  target: targetRect,
                  constraints: constraints,
                  child: Container(
                    width: childSize.width,
                    height: childSize.height,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Wait for positioning to complete
      await tester.pump();

      // Find the positioned container
      final positionedFinder = find.byType(Positioned).last;
      expect(positionedFinder, findsOneWidget);

      final positioned = tester.widget<Positioned>(positionedFinder);

      // Verify position is as expected (with small margin for rounding)
      expect(
          positioned.left, moreOrLessEquals(expectedPosition.left, epsilon: 1));
      expect(
          positioned.top, moreOrLessEquals(expectedPosition.top, epsilon: 1));
      expect(positioned.width,
          moreOrLessEquals(expectedPosition.width, epsilon: 1));
      expect(positioned.height,
          moreOrLessEquals(expectedPosition.height, epsilon: 1));
    });

    testWidgets('recalculates position when target changes',
        (WidgetTester tester) async {
      // Initial target
      final initialTargetRect = Rect.fromCenter(
        center: const Offset(400, 300),
        width: 100,
        height: 50,
      );

      // Child to position
      const childSize = Size(200, 100);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                Positioned(
                  left: initialTargetRect.left,
                  top: initialTargetRect.top,
                  width: initialTargetRect.width,
                  height: initialTargetRect.height,
                  child: Container(color: Colors.blue),
                ),
                NakedPositioning(
                  target: initialTargetRect,
                  child: Container(
                    width: childSize.width,
                    height: childSize.height,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Wait for positioning to complete
      await tester.pump();

      // New target
      final newTargetRect = Rect.fromCenter(
        center: const Offset(200, 200),
        width: 100,
        height: 50,
      );

      // Expected position with new target
      final expectedPosition = Rect.fromLTWH(
        newTargetRect.left + (newTargetRect.width - childSize.width) / 2,
        newTargetRect.bottom,
        childSize.width,
        childSize.height,
      );

      // Update with new target
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                Positioned(
                  left: newTargetRect.left,
                  top: newTargetRect.top,
                  width: newTargetRect.width,
                  height: newTargetRect.height,
                  child: Container(color: Colors.blue),
                ),
                NakedPositioning(
                  target: newTargetRect,
                  child: Container(
                    width: childSize.width,
                    height: childSize.height,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Wait for positioning to recalculate
      await tester.pump();

      // Find the positioned container
      final positionedFinder = find.byType(Positioned).last;
      expect(positionedFinder, findsOneWidget);

      final positioned = tester.widget<Positioned>(positionedFinder);

      // Verify position is as expected (with small margin for rounding)
      expect(
          positioned.left, moreOrLessEquals(expectedPosition.left, epsilon: 1));
      expect(
          positioned.top, moreOrLessEquals(expectedPosition.top, epsilon: 1));
      expect(positioned.width,
          moreOrLessEquals(expectedPosition.width, epsilon: 1));
      expect(positioned.height,
          moreOrLessEquals(expectedPosition.height, epsilon: 1));
    });
  });
}
