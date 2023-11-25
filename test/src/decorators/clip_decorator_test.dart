import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/decorators/clip_decorator.dart';

import '../../helpers/testing_utils.dart';

class _CustomRectClipper extends CustomClipper<Rect> {
  const _CustomRectClipper();
  @override
  Rect getClip(Size size) => Rect.fromLTWH(0, 0, size.width, size.height);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

class _CustomRRectClipper extends CustomClipper<RRect> {
  const _CustomRRectClipper();
  @override
  RRect getClip(Size size) =>
      RRect.fromLTRBR(0, 0, size.width, size.height, const Radius.circular(10));

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) => false;
}

class _CustomPathClipper extends CustomClipper<Path> {
  const _CustomPathClipper();
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

void main() {
  group('ClipOvalDecorator', () {
    testWidgets(
      'renders',
      (WidgetTester tester) async {
        // Create a ClipDecorator
        const clipDecorator = ClipOvalDecorator();

        // Build our app and trigger a frame
        await tester.pumpWidget(
          MaterialApp(
            home: clipDecorator.build(
              Container(color: Colors.blue),
              EmptyMixData,
            ),
          ),
        );

        final finder = find.byType(ClipOval);
        final context = tester.element(finder);
        final clipOvalWidget = context.widget as ClipOval;

        // Verify that the ClipOval widget is in the tree
        expect(finder, findsOneWidget);
        expect(clipOvalWidget, isNotNull);
        expect(clipOvalWidget, isA<ClipOval>());
      },
    );

    test('merge', () {
      const clipDecorator = ClipOvalDecorator(clipBehavior: Clip.antiAlias);
      const other = ClipOvalDecorator(clipper: _CustomRectClipper());
      final merged = clipDecorator.merge(other);
      expect(merged, isNotNull);
      expect(merged.clipBehavior, Clip.antiAlias);
      expect(merged.clipper, isA<_CustomRectClipper>());
    });
  });

  // ClipPathDecorator
  group('ClipPathDecorator', () {
    testWidgets(
      'renders',
      (WidgetTester tester) async {
        // Create a ClipDecorator
        const clipDecorator = ClipPathDecorator(
          clipper: _CustomPathClipper(),
        );

        // Build our app and trigger a frame
        await tester.pumpWidget(
          MaterialApp(
            home: clipDecorator.build(
              Container(color: Colors.blue),
              EmptyMixData,
            ),
          ),
        );

        final finder = find.byType(ClipPath);
        final context = tester.element(finder);
        final clipPathWidget = context.widget as ClipPath;

        // Verify that the ClipPath widget is in the tree
        expect(finder, findsOneWidget);
        expect(clipPathWidget, isNotNull);
        expect(clipPathWidget, isA<ClipPath>());
      },
    );

    test('merge', () {
      const clipDecorator = ClipPathDecorator(clipBehavior: Clip.antiAlias);
      const other = ClipPathDecorator(clipper: _CustomPathClipper());
      final merged = clipDecorator.merge(other);
      expect(merged, isNotNull);
      expect(merged.clipBehavior, Clip.antiAlias);
      expect(merged.clipper, isA<_CustomPathClipper>());
    });
  });

  // ClipRectDecorator
  group('ClipRectDecorator', () {
    testWidgets(
      'renders',
      (WidgetTester tester) async {
        // Create a ClipDecorator
        const clipDecorator = ClipRectDecorator(
          clipper: _CustomRectClipper(),
        );

        // Build our app and trigger a frame
        await tester.pumpWidget(
          MaterialApp(
            home: clipDecorator.build(
              Container(color: Colors.blue),
              EmptyMixData,
            ),
          ),
        );

        final finder = find.byType(ClipRect);
        final context = tester.element(finder);
        final clipRectWidget = context.widget as ClipRect;

        // Verify that the ClipRect widget is in the tree
        expect(finder, findsOneWidget);
        expect(clipRectWidget, isNotNull);
        expect(clipRectWidget, isA<ClipRect>());
      },
    );

    test('merge', () {
      const clipDecorator = ClipRectDecorator(clipBehavior: Clip.antiAlias);
      const other = ClipRectDecorator(clipper: _CustomRectClipper());
      final merged = clipDecorator.merge(other);
      expect(merged, isNotNull);
      expect(merged.clipBehavior, Clip.antiAlias);
      expect(merged.clipper, isA<_CustomRectClipper>());
    });
  });

  // ClipRRectDecorator
  group('ClipRRectDecorator', () {
    testWidgets(
      'renders',
      (WidgetTester tester) async {
        // Create a ClipDecorator
        const clipDecorator = ClipRRectDecorator(
          clipper: _CustomRRectClipper(),
        );

        // Build our app and trigger a frame
        await tester.pumpWidget(
          MaterialApp(
            home: clipDecorator.build(
              Container(color: Colors.blue),
              EmptyMixData,
            ),
          ),
        );

        final finder = find.byType(ClipRRect);
        final context = tester.element(finder);
        final clipRRectWidget = context.widget as ClipRRect;

        // Verify that the ClipRRect widget is in the tree
        expect(finder, findsOneWidget);
        expect(clipRRectWidget, isNotNull);
        expect(clipRRectWidget, isA<ClipRRect>());
      },
    );

    test('merge', () {
      const clipDecorator = ClipRRectDecorator(clipBehavior: Clip.antiAlias);
      const other = ClipRRectDecorator(clipper: _CustomRRectClipper());
      final merged = clipDecorator.merge(other);
      expect(merged, isNotNull);
      expect(merged.clipBehavior, Clip.antiAlias);
      expect(merged.clipper, isA<_CustomRRectClipper>());
    });
  });
}
