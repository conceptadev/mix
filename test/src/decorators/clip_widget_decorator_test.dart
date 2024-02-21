import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('ClipPathWidgetSpec', () {
    const clipper = _PathClipper();
    const clipper2 = _OtherPathClipper();

    const clipBehavior = Clip.antiAlias;

    test('Constructor assigns clipper correctly', () {
      const decorator =
          ClipPathWidgetSpec(clipBehavior: clipBehavior, clipper: clipper);

      expect(decorator.clipper, clipper);
      expect(decorator.clipBehavior, clipBehavior);
    });

    test('Lerp method interpolates correctly', () {
      const start = ClipPathWidgetSpec(clipper: clipper);
      const end = ClipPathWidgetSpec(clipper: clipper2);
      final result = start.lerp(end, 0.5);

      expect(result.clipper, clipper2);
    });

    test('Equality and hashcode test', () {
      const spec1 =
          ClipPathWidgetSpec(clipBehavior: clipBehavior, clipper: clipper);
      const spec2 =
          ClipPathWidgetSpec(clipBehavior: clipBehavior, clipper: clipper);
      const spec3 =
          ClipPathWidgetSpec(clipBehavior: clipBehavior, clipper: clipper2);

      expect(spec1, spec2);
      expect(spec1.hashCode, spec2.hashCode);
      expect(spec1 == spec3, false);
      expect(spec1.hashCode == spec3.hashCode, false);
    });

    testWidgets(
      'Build method creates ClipPath widget with correct clipper',
      (WidgetTester tester) async {
        const decorator = ClipPathWidgetSpec(clipper: clipper);

        await tester.pumpMaterialApp(decorator.build(Container()));

        final ClipPath clipPathWidget = tester.widget(find.byType(ClipPath));

        expect(find.byType(ClipPath), findsOneWidget);
        expect(clipPathWidget.clipper, clipper);
        expect(clipPathWidget.clipBehavior, clipBehavior);
        expect(clipPathWidget.child, isA<Container>());
      },
    );
  });

  // ClipPathWidgetDecorator
  group('ClipPathWidgetDecorator', () {
    const clipper = _PathClipper();
    const clipper2 = _OtherPathClipper();
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;

    test('merge', () {
      const decorator =
          ClipPathWidgetDecorator(clipper: clipper, clipBehavior: clipBehavior);
      const other = ClipPathWidgetDecorator(
          clipper: clipper2, clipBehavior: clipBehavior2);
      final result = decorator.merge(other);
      expect(result, other);
    });

    test('resolve', () {
      const decorator =
          ClipPathWidgetDecorator(clipper: clipper, clipBehavior: clipBehavior);
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<ClipPathWidgetSpec>());
      expect(result.clipper, clipper);
      expect(result.clipBehavior, clipBehavior);
    });
  });

  group('ClipRRectWidgetSpec', () {
    final borderRadius = BorderRadius.circular(10.0);
    final borderRadius2 = BorderRadius.circular(20.0);
    const clipper = _RRectClipper();
    const clipper2 = _OtherRRectClipper();
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;

    test('Constructor assigns borderRadius correctly', () {
      final decorator = ClipRRectWidgetSpec(
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        clipper: clipper,
      );

      expect(decorator.borderRadius, borderRadius);
      expect(decorator.clipBehavior, clipBehavior);
      expect(decorator.clipper, clipper);
    });

    test('Lerp method interpolates correctly', () {
      final start = ClipRRectWidgetSpec(
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        clipper: clipper,
      );
      final end = ClipRRectWidgetSpec(
        borderRadius: borderRadius2,
        clipBehavior: clipBehavior2,
        clipper: clipper2,
      );
      final result = start.lerp(end, 0.5);

      expect(result.borderRadius, BorderRadius.circular(15));
      expect(result.clipBehavior, clipBehavior2);
      expect(result.clipper, clipper2);
    });

    test('Equality and hashcode test', () {
      final decorator1 = ClipRRectWidgetSpec(
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        clipper: clipper,
      );
      final decorator2 = ClipRRectWidgetSpec(
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        clipper: clipper,
      );
      final decorator3 = ClipRRectWidgetSpec(
        borderRadius: borderRadius2,
        clipBehavior: clipBehavior2,
        clipper: clipper2,
      );

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });
  });

  // ClipRRectWidgetDecorator
  group('ClipRRectWidgetDecorator', () {
    final borderRadius = BorderRadius.circular(10.0);
    final borderRadius2 = BorderRadius.circular(20.0);
    const clipper = _RRectClipper();
    const clipper2 = _OtherRRectClipper();
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;

    test('merge', () {
      final decorator = ClipRRectWidgetDecorator(
        borderRadius: borderRadius,
        clipper: clipper,
        clipBehavior: clipBehavior,
      );
      final other = ClipRRectWidgetDecorator(
        borderRadius: borderRadius2,
        clipper: clipper2,
        clipBehavior: clipBehavior2,
      );
      final result = decorator.merge(other);
      expect(result, other);
    });

    test('resolve', () {
      final decorator = ClipRRectWidgetDecorator(
        borderRadius: borderRadius,
        clipper: clipper,
        clipBehavior: clipBehavior,
      );
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<ClipRRectWidgetSpec>());
      expect(result.borderRadius, borderRadius);
      expect(result.clipBehavior, clipBehavior);
      expect(result.clipper, clipper);
    });
  });

  // ClipOvalWidgetSpec
  group('ClipOvalWidgetSpec', () {
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;
    const clipper = _RectClipper();
    const clipper2 = _OtherRectClipper();

    test('Constructor assigns clipper correctly', () {
      const decorator = ClipOvalWidgetSpec(
        clipBehavior: clipBehavior,
        clipper: clipper,
      );

      expect(decorator.clipper, clipper);
      expect(decorator.clipBehavior, clipBehavior);
    });

    test('Lerp method interpolates correctly', () {
      const start =
          ClipOvalWidgetSpec(clipBehavior: clipBehavior, clipper: clipper);
      const end =
          ClipOvalWidgetSpec(clipBehavior: clipBehavior2, clipper: clipper2);
      final result = start.lerp(end, 0.5);

      expect(result.clipper, clipper2);
      expect(result.clipBehavior, clipBehavior2);
    });

    test('Equality and hashcode test', () {
      const decorator1 =
          ClipOvalWidgetSpec(clipBehavior: clipBehavior, clipper: clipper);
      const decorator2 =
          ClipOvalWidgetSpec(clipBehavior: clipBehavior, clipper: clipper);
      const decorator3 =
          ClipOvalWidgetSpec(clipBehavior: clipBehavior2, clipper: clipper2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates ClipOval widget with correct clipper',
      (WidgetTester tester) async {
        const decorator = ClipOvalWidgetSpec(clipper: clipper);

        await tester.pumpMaterialApp(decorator.build(Container()));

        final ClipOval clipOvalWidget = tester.widget(find.byType(ClipOval));

        expect(find.byType(ClipOval), findsOneWidget);
        expect(clipOvalWidget.clipper, clipper);
        expect(clipOvalWidget.clipBehavior, clipBehavior);
        expect(clipOvalWidget.child, isA<Container>());
      },
    );
  });

  // ClipOvalWidgetDecorator
  group('ClipOvalWidgetDecorator', () {
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;
    const clipper = _RectClipper();
    const clipper2 = _OtherRectClipper();

    test('merge', () {
      const decorator = ClipOvalWidgetDecorator(
        clipper: clipper,
        clipBehavior: clipBehavior,
      );
      const other = ClipOvalWidgetDecorator(
        clipper: clipper2,
        clipBehavior: clipBehavior2,
      );
      final result = decorator.merge(other);
      expect(result, other);
    });

    test('resolve', () {
      const decorator = ClipOvalWidgetDecorator(
        clipper: clipper,
        clipBehavior: clipBehavior,
      );
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<ClipOvalWidgetSpec>());
      expect(result.clipper, clipper);
      expect(result.clipBehavior, clipBehavior);
    });
  });

  // ClipRectWidgetSpec
  group('ClipRectWidgetSpec', () {
    const clipBehavior = Clip.hardEdge;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;
    const clipper = _RectClipper();
    const clipper2 = _OtherRectClipper();

    test('Constructor assigns clipper correctly', () {
      const decorator = ClipRectWidgetSpec(
        clipBehavior: clipBehavior,
        clipper: clipper,
      );

      expect(decorator.clipper, clipper);
      expect(decorator.clipBehavior, clipBehavior);
    });

    test('Lerp method interpolates correctly', () {
      const start =
          ClipRectWidgetSpec(clipBehavior: clipBehavior, clipper: clipper);
      const end =
          ClipRectWidgetSpec(clipBehavior: clipBehavior2, clipper: clipper2);
      final result = start.lerp(end, 0.5);

      expect(result.clipper, clipper2);
      expect(result.clipBehavior, clipBehavior2);
    });

    test('Equality and hashcode test', () {
      const decorator1 =
          ClipRectWidgetSpec(clipBehavior: clipBehavior, clipper: clipper);
      const decorator2 =
          ClipRectWidgetSpec(clipBehavior: clipBehavior, clipper: clipper);
      const decorator3 =
          ClipRectWidgetSpec(clipBehavior: clipBehavior2, clipper: clipper2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates ClipRect widget with correct clipper',
      (WidgetTester tester) async {
        const decorator = ClipRectWidgetSpec(clipper: clipper);

        await tester.pumpMaterialApp(decorator.build(Container()));

        final ClipRect clipRectWidget = tester.widget(find.byType(ClipRect));

        expect(find.byType(ClipRect), findsOneWidget);
        expect(clipRectWidget.clipper, clipper);
        expect(clipRectWidget.clipBehavior, clipBehavior);
        expect(clipRectWidget.child, isA<Container>());
      },
    );
  });

  // ClipRectWidgetDecorator
  group('ClipRectWidgetDecorator', () {
    const clipBehavior = Clip.hardEdge;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;
    const clipper = _RectClipper();
    const clipper2 = _OtherRectClipper();

    test('merge', () {
      const decorator = ClipRectWidgetDecorator(
        clipper: clipper,
        clipBehavior: clipBehavior,
      );
      const other = ClipRectWidgetDecorator(
        clipper: clipper2,
        clipBehavior: clipBehavior2,
      );
      final result = decorator.merge(other);
      expect(result, other);
    });

    test('resolve', () {
      const decorator = ClipRectWidgetDecorator(
        clipper: clipper,
        clipBehavior: clipBehavior,
      );
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<ClipRectWidgetSpec>());
      expect(result.clipper, clipper);
      expect(result.clipBehavior, clipBehavior);
    });
  });

  // ClipTriangleWidgetSpec
  group('ClipTriangleWidgetSpec', () {
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;

    test('Constructor assigns clipper correctly', () {
      const decorator = ClipTriangleWidgetSpec(clipBehavior: clipBehavior);

      expect(decorator.clipBehavior, clipBehavior);
    });

    test('Lerp method interpolates correctly', () {
      const start = ClipTriangleWidgetSpec(clipBehavior: clipBehavior);
      const end = ClipTriangleWidgetSpec(clipBehavior: clipBehavior2);
      final result = start.lerp(end, 0.5);

      expect(result.clipBehavior, clipBehavior2);
    });

    test('Equality and hashcode test', () {
      const decorator1 = ClipTriangleWidgetSpec(clipBehavior: clipBehavior);
      const decorator2 = ClipTriangleWidgetSpec(clipBehavior: clipBehavior);
      const decorator3 = ClipTriangleWidgetSpec(clipBehavior: clipBehavior2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates ClipPath widget with correct clipper',
      (WidgetTester tester) async {
        const decorator = ClipTriangleWidgetSpec(clipBehavior: clipBehavior);

        await tester.pumpMaterialApp(decorator.build(Container()));

        final ClipPath clipPathWidget = tester.widget(find.byType(ClipPath));

        expect(find.byType(ClipPath), findsOneWidget);
        expect(clipPathWidget.clipper, isA<TriangleClipper>());
        expect(clipPathWidget.clipBehavior, clipBehavior);
        expect(clipPathWidget.child, isA<Container>());
      },
    );
  });

  // ClipTriangleWidgetDecorator
  group('ClipTriangleWidgetDecorator', () {
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;

    test('merge', () {
      const decorator = ClipTriangleWidgetDecorator(clipBehavior: clipBehavior);
      const other = ClipTriangleWidgetDecorator(clipBehavior: clipBehavior2);
      final result = decorator.merge(other);
      expect(result, other);
    });

    test('resolve', () {
      const decorator = ClipTriangleWidgetDecorator(clipBehavior: clipBehavior);
      final result = decorator.resolve(EmptyMixData);
      expect(result, isA<ClipTriangleWidgetSpec>());
      expect(result.clipBehavior, clipBehavior);
    });
  });
}

class _PathClipper extends CustomClipper<Path> {
  const _PathClipper();
  @override
  Path getClip(Size size) {
    return Path();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _OtherPathClipper extends _PathClipper {
  const _OtherPathClipper();
}

class _RectClipper extends CustomClipper<Rect> {
  const _RectClipper();
  @override
  Rect getClip(Size size) {
    return Rect.zero;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}

class _OtherRectClipper extends _RectClipper {
  const _OtherRectClipper();
}

class _RRectClipper extends CustomClipper<RRect> {
  const _RRectClipper();
  @override
  RRect getClip(Size size) {
    return RRect.fromRectAndRadius(Rect.zero, Radius.zero);
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) {
    return false;
  }
}

class _OtherRRectClipper extends _RRectClipper {
  const _OtherRRectClipper();
}
