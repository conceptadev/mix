import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/decorators/clip_decorator.dart';

import '../../helpers/testing_utils.dart';

class CustomRectClipper extends CustomClipper<Rect> {
  const CustomRectClipper();
  @override
  Rect getClip(Size size) => Rect.fromLTWH(0, 0, size.width, size.height);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

class CustomRRectClipper extends CustomClipper<RRect> {
  const CustomRRectClipper();
  @override
  RRect getClip(Size size) =>
      RRect.fromLTRBR(0, 0, size.width, size.height, const Radius.circular(10));

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) => false;
}

void main() {
  group('ClipDecoratorData', () {
    // equality
    test('equality', () {
      const decoratorData = ClipDto(
        clipBehavior: Clip.antiAlias,
        clipper: null,
      );
      const otherDecoratorData = ClipDto(
        clipBehavior: Clip.antiAlias,
        clipper: null,
      );
      expect(decoratorData, otherDecoratorData);
    });

    test('copyWith', () {
      const decoratorData = ClipDto(
        clipBehavior: Clip.antiAlias,
        clipper: null,
      );

      final copied = decoratorData.copyWith(
        clipBehavior: Clip.hardEdge,
        clipper: const CustomRRectClipper(),
      );

      expect(decoratorData, isNotNull);
      expect(decoratorData.clipBehavior, Clip.antiAlias);
      expect(decoratorData.clipper, isNull);
      expect(copied, isNotNull);
      expect(copied.clipBehavior, Clip.hardEdge);
      expect(copied.clipper, isA<CustomRRectClipper>());
    });

    test('lerp', () {
      const clipDecorator = ClipDto(
        clipBehavior: Clip.antiAlias,
        clipper: null,
      );
      const other = ClipDto(
        clipBehavior: Clip.hardEdge,
        clipper: CustomRRectClipper(),
      );

      final lerped = clipDecorator.lerp(other, 0.4);

      expect(lerped, isNotNull);
      expect(lerped.clipBehavior, Clip.antiAlias);
      expect(lerped.clipper, isNull);
    });
  });

  group('ClipRRectDecoratorData', () {
    // equality
    test('equality', () {
      const decoratorData = ClipRRectDecoratorData(
        clipBehavior: Clip.antiAlias,
        clipper: null,
        borderRadius: BorderRadius.zero,
      );
      const otherDecoratorData = ClipRRectDecoratorData(
        clipBehavior: Clip.antiAlias,
        clipper: null,
        borderRadius: BorderRadius.zero,
      );
      expect(decoratorData, otherDecoratorData);
    });

    test('copyWith', () {
      const decoratorData = ClipRRectDecoratorData(
        clipBehavior: Clip.antiAlias,
        clipper: null,
        borderRadius: BorderRadius.zero,
      );

      final copied = decoratorData.copyWith(
        clipBehavior: Clip.hardEdge,
        clipper: const CustomRRectClipper(),
        borderRadius: BorderRadius.circular(10.0),
      );

      expect(decoratorData, isNotNull);
      expect(decoratorData.clipBehavior, Clip.antiAlias);
      expect(decoratorData.clipper, isNull);
      expect(decoratorData.borderRadius, BorderRadius.zero);
      expect(copied, isNotNull);
      expect(copied.clipBehavior, Clip.hardEdge);
      expect(copied.clipper, isA<CustomRRectClipper>());
      expect(copied.borderRadius, BorderRadius.circular(10.0));
    });

    test('lerp', () {
      const clipDecorator = ClipRRectDecoratorData(
        clipBehavior: Clip.antiAlias,
        clipper: null,
        borderRadius: BorderRadius.zero,
      );
      final other = ClipRRectDecoratorData(
        clipBehavior: Clip.hardEdge,
        clipper: const CustomRRectClipper(),
        borderRadius: BorderRadius.circular(10.0),
      );

      final lerped = clipDecorator.lerp(other, 0.4);

      expect(lerped, isNotNull);
      expect(lerped.clipBehavior, Clip.antiAlias);
      expect(lerped.clipper, isNull);
      expect(
        lerped.borderRadius,
        BorderRadius.lerp(
          BorderRadius.zero,
          BorderRadius.circular(10.0),
          0.4,
        ),
      );

      final lerped2 = clipDecorator.lerp(other, 0.6);

      expect(lerped2, isNotNull);
      expect(lerped2.clipBehavior, Clip.hardEdge);
      expect(lerped2.clipper, isA<CustomRRectClipper>());
      expect(
        lerped2.borderRadius,
        BorderRadius.lerp(
          BorderRadius.zero,
          BorderRadius.circular(10.0),
          0.6,
        ),
      );
    });
  });
  group('ClipOvalDecorator', () {
    testWidgets(
      'renders',
      (WidgetTester tester) async {
        // Create a ClipDecorator
        const clipDecorator = ClipOvalDecorator();

        // Build our app and trigger a frame
        await tester.pumpWidget(
          MaterialApp(
            home: clipDecorator.render(
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
      const other = ClipOvalDecorator(clipper: CustomRectClipper());
      final merged = clipDecorator.merge(other);
      expect(merged, isNotNull);
      expect(merged.clipBehavior, Clip.antiAlias);
      expect(merged.clipper, isA<CustomRectClipper>());
    });

    test('resolve', () {
      const clipDecorator = ClipOvalDecorator(
          clipBehavior: Clip.hardEdge, clipper: CustomRectClipper());
      final resolved = clipDecorator.resolve(EmptyMixData);
      expect(resolved, isNotNull);
      expect(resolved.clipBehavior, Clip.hardEdge);
      expect(resolved.clipper, isA<CustomRectClipper>());
    });
  });
  group('ClipRRectDecorator', () {
    testWidgets(
      'renders',
      (WidgetTester tester) async {
        // Define the radius you want to test
        final testRadius = BorderRadius.circular(10.0);

        // Create a ClipDecorator
        final clipDecorator = ClipRRectDecorator(borderRadius: testRadius);

        // Build our app and trigger a frame
        await tester.pumpWidget(
          MaterialApp(
            home: clipDecorator.render(
              Container(color: Colors.blue),
              EmptyMixData,
            ),
          ),
        );

        final finder = find.byType(ClipRRect);
        final context = tester.element(finder);
        final clipRRectWidget = context.widget as ClipRRect;

        // Verify that the ClipRRect widget is in the tree and has the correct radius
        expect(finder, findsOneWidget);
        expect(clipRRectWidget.borderRadius, testRadius);
        expect(clipRRectWidget, isA<ClipRRect>());
      },
    );

    test('merge', () {
      const clipDecorator = ClipRRectDecorator(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.zero,
      );
      final other = ClipRRectDecorator(
        clipper: const CustomRRectClipper(),
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(10.0),
      );
      final merged = clipDecorator.merge(other);
      expect(merged, isNotNull);
      expect(merged.clipBehavior, Clip.hardEdge);
      expect(merged.borderRadius, BorderRadius.circular(10.0));
      expect(merged.clipper, isA<CustomRRectClipper>());
    });

    test('resolve', () {
      final clipDecorator = ClipRRectDecorator(
        clipper: const CustomRRectClipper(),
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(10.0),
      );
      final resolved = clipDecorator.resolve(EmptyMixData);
      expect(resolved, isNotNull);
      expect(resolved.clipBehavior, Clip.hardEdge);
      expect(resolved.borderRadius, BorderRadius.circular(10.0));
      expect(resolved.clipper, isA<CustomRRectClipper>());
    });
  });

  group('ClipRectDecorator test', () {
    testWidgets(
      'renders',
      (WidgetTester tester) async {
        // Create a ClipDecorator
        const clipDecorator = ClipRectDecorator();

        // Build our app and trigger a frame
        await tester.pumpWidget(
          MaterialApp(
            home: clipDecorator.render(
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
      const other = ClipRectDecorator(clipper: CustomRectClipper());
      final merged = clipDecorator.merge(other);
      expect(merged, isNotNull);
      expect(merged.clipBehavior, Clip.antiAlias);
      expect(merged.clipper, isA<CustomRectClipper>());
    });

    test('resolve', () {
      const clipDecorator = ClipRectDecorator(
          clipBehavior: Clip.hardEdge, clipper: CustomRectClipper());
      final resolved = clipDecorator.resolve(EmptyMixData);
      expect(resolved, isNotNull);
      expect(resolved.clipBehavior, Clip.hardEdge);
      expect(resolved.clipper, isA<CustomRectClipper>());
    });
  });

  group('ClipPathDecorator', () {
    testWidgets(
      'renders',
      (WidgetTester tester) async {
        const clipPathDecorator = ClipPathDecorator(clipper: TriangleClipper());

        await tester.pumpWidget(
          MaterialApp(
            home: clipPathDecorator.render(
              Container(color: Colors.blue),
              EmptyMixData,
            ),
          ),
        );

        final finder = find.byType(ClipPath);
        final context = tester.element(finder);
        final clipPathWidget = context.widget as ClipPath;

        // Verify that the ClipPath widget is in the tree and has the correct path
        expect(finder, findsOneWidget);
        expect(clipPathWidget.clipper, isA<TriangleClipper>());
        expect(clipPathWidget, isA<ClipPath>());
      },
    );

    test('merge', () {
      const clipPathDecorator = ClipPathDecorator(
        clipper: TriangleClipper(),
        clipBehavior: Clip.antiAlias,
      );
      const other = ClipPathDecorator(clipper: TriangleClipper());
      final merged = clipPathDecorator.merge(other);
      expect(merged, isNotNull);
      expect(merged.clipBehavior, Clip.antiAlias);
      expect(merged.clipper, isA<TriangleClipper>());
    });

    test('resolve', () {
      const clipPathDecorator = ClipPathDecorator(
        clipBehavior: Clip.hardEdge,
        clipper: TriangleClipper(),
      );
      final resolved = clipPathDecorator.resolve(EmptyMixData);
      expect(resolved, isNotNull);
      expect(resolved.clipBehavior, Clip.hardEdge);
      expect(resolved.clipper, isA<TriangleClipper>());
    });
  });
}
