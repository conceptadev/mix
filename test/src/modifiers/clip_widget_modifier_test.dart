import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('ClipPathDecoratorSpec', () {
    const clipper = _PathClipper();
    const clipper2 = _OtherPathClipper();

    const clipBehavior = Clip.antiAlias;

    test('Constructor assigns clipper correctly', () {
      const modifier =
          ClipPathDecoratorSpec(clipBehavior: clipBehavior, clipper: clipper);

      expect(modifier.clipper, clipper);
      expect(modifier.clipBehavior, clipBehavior);
    });

    test('Lerp method interpolates correctly', () {
      const start = ClipPathDecoratorSpec(clipper: clipper);
      const end = ClipPathDecoratorSpec(clipper: clipper2);
      final result = start.lerp(end, 0.5);

      expect(result.clipper, clipper2);
    });

    test('Equality and hashcode test', () {
      const spec1 =
          ClipPathDecoratorSpec(clipBehavior: clipBehavior, clipper: clipper);
      const spec2 =
          ClipPathDecoratorSpec(clipBehavior: clipBehavior, clipper: clipper);
      const spec3 =
          ClipPathDecoratorSpec(clipBehavior: clipBehavior, clipper: clipper2);

      expect(spec1, spec2);
      expect(spec1.hashCode, spec2.hashCode);
      expect(spec1 == spec3, false);
      expect(spec1.hashCode == spec3.hashCode, false);
    });

    testWidgets(
      'Build method creates ClipPath widget with correct clipper',
      (WidgetTester tester) async {
        const modifier = ClipPathDecoratorSpec(clipper: clipper);

        await tester.pumpMaterialApp(modifier.build(Container()));

        final ClipPath clipPathWidget = tester.widget(find.byType(ClipPath));

        expect(find.byType(ClipPath), findsOneWidget);
        expect(clipPathWidget.clipper, clipper);
        expect(clipPathWidget.clipBehavior, clipBehavior);
        expect(clipPathWidget.child, isA<Container>());
      },
    );
  });

  // ClipPathDecoratorAttribute
  group('ClipPathDecoratorAttribute', () {
    const clipper = _PathClipper();
    const clipper2 = _OtherPathClipper();
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;

    test('merge', () {
      const modifier = ClipPathDecoratorAttribute(
          clipper: clipper, clipBehavior: clipBehavior);
      const other = ClipPathDecoratorAttribute(
          clipper: clipper2, clipBehavior: clipBehavior2);
      final result = modifier.merge(other);
      expect(result, other);
    });

    test('resolve', () {
      const modifier = ClipPathDecoratorAttribute(
          clipper: clipper, clipBehavior: clipBehavior);
      final result = modifier.resolve(EmptyMixData);
      expect(result, isA<ClipPathDecoratorSpec>());
      expect(result.clipper, clipper);
      expect(result.clipBehavior, clipBehavior);
    });
  });

  group('ClipRRectDecoratorSpec', () {
    final borderRadius = BorderRadius.circular(10.0);
    final borderRadius2 = BorderRadius.circular(20.0);
    const clipper = _RRectClipper();
    const clipper2 = _OtherRRectClipper();
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;

    test('Constructor assigns borderRadius correctly', () {
      final modifier = ClipRRectDecoratorSpec(
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        clipper: clipper,
      );

      expect(modifier.borderRadius, borderRadius);
      expect(modifier.clipBehavior, clipBehavior);
      expect(modifier.clipper, clipper);
    });

    test('Lerp method interpolates correctly', () {
      final start = ClipRRectDecoratorSpec(
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        clipper: clipper,
      );
      final end = ClipRRectDecoratorSpec(
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
      final modifier1 = ClipRRectDecoratorSpec(
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        clipper: clipper,
      );
      final modifier2 = ClipRRectDecoratorSpec(
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        clipper: clipper,
      );
      final modifier3 = ClipRRectDecoratorSpec(
        borderRadius: borderRadius2,
        clipBehavior: clipBehavior2,
        clipper: clipper2,
      );

      expect(modifier1, modifier2);
      expect(modifier1.hashCode, modifier2.hashCode);
      expect(modifier1 == modifier3, false);
      expect(modifier1.hashCode == modifier3.hashCode, false);
    });
  });

  // ClipRRectDecoratorAttribute
  group('ClipRRectDecoratorAttribute', () {
    final borderRadius = BorderRadius.circular(10.0);
    final borderRadius2 = BorderRadius.circular(20.0);
    const clipper = _RRectClipper();
    const clipper2 = _OtherRRectClipper();
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;

    test('merge', () {
      final modifier = ClipRRectDecoratorAttribute(
        borderRadius: borderRadius,
        clipper: clipper,
        clipBehavior: clipBehavior,
      );
      final other = ClipRRectDecoratorAttribute(
        borderRadius: borderRadius2,
        clipper: clipper2,
        clipBehavior: clipBehavior2,
      );
      final result = modifier.merge(other);
      expect(result, other);
    });

    test('resolve', () {
      final modifier = ClipRRectDecoratorAttribute(
        borderRadius: borderRadius,
        clipper: clipper,
        clipBehavior: clipBehavior,
      );
      final result = modifier.resolve(EmptyMixData);
      expect(result, isA<ClipRRectDecoratorSpec>());
      expect(result.borderRadius, borderRadius);
      expect(result.clipBehavior, clipBehavior);
      expect(result.clipper, clipper);
    });
  });

  // ClipOvalDecoratorSpec
  group('ClipOvalDecoratorSpec', () {
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;
    const clipper = _RectClipper();
    const clipper2 = _OtherRectClipper();

    test('Constructor assigns clipper correctly', () {
      const modifier = ClipOvalDecoratorSpec(
        clipBehavior: clipBehavior,
        clipper: clipper,
      );

      expect(modifier.clipper, clipper);
      expect(modifier.clipBehavior, clipBehavior);
    });

    test('Lerp method interpolates correctly', () {
      const start =
          ClipOvalDecoratorSpec(clipBehavior: clipBehavior, clipper: clipper);
      const end =
          ClipOvalDecoratorSpec(clipBehavior: clipBehavior2, clipper: clipper2);
      final result = start.lerp(end, 0.5);

      expect(result.clipper, clipper2);
      expect(result.clipBehavior, clipBehavior2);
    });

    test('Equality and hashcode test', () {
      const modifier1 =
          ClipOvalDecoratorSpec(clipBehavior: clipBehavior, clipper: clipper);
      const modifier2 =
          ClipOvalDecoratorSpec(clipBehavior: clipBehavior, clipper: clipper);
      const modifier3 =
          ClipOvalDecoratorSpec(clipBehavior: clipBehavior2, clipper: clipper2);

      expect(modifier1, modifier2);
      expect(modifier1.hashCode, modifier2.hashCode);
      expect(modifier1 == modifier3, false);
      expect(modifier1.hashCode == modifier3.hashCode, false);
    });

    testWidgets(
      'Build method creates ClipOval widget with correct clipper',
      (WidgetTester tester) async {
        const modifier = ClipOvalDecoratorSpec(clipper: clipper);

        await tester.pumpMaterialApp(modifier.build(Container()));

        final ClipOval clipOvalWidget = tester.widget(find.byType(ClipOval));

        expect(find.byType(ClipOval), findsOneWidget);
        expect(clipOvalWidget.clipper, clipper);
        expect(clipOvalWidget.clipBehavior, clipBehavior);
        expect(clipOvalWidget.child, isA<Container>());
      },
    );
  });

  // ClipOvalDecoratorAttribute
  group('ClipOvalDecoratorAttribute', () {
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;
    const clipper = _RectClipper();
    const clipper2 = _OtherRectClipper();

    test('merge', () {
      const modifier = ClipOvalDecoratorAttribute(
        clipper: clipper,
        clipBehavior: clipBehavior,
      );
      const other = ClipOvalDecoratorAttribute(
        clipper: clipper2,
        clipBehavior: clipBehavior2,
      );
      final result = modifier.merge(other);
      expect(result, other);
    });

    test('resolve', () {
      const modifier = ClipOvalDecoratorAttribute(
        clipper: clipper,
        clipBehavior: clipBehavior,
      );
      final result = modifier.resolve(EmptyMixData);
      expect(result, isA<ClipOvalDecoratorSpec>());
      expect(result.clipper, clipper);
      expect(result.clipBehavior, clipBehavior);
    });
  });

  // ClipRectDecoratorSpec
  group('ClipRectDecoratorSpec', () {
    const clipBehavior = Clip.hardEdge;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;
    const clipper = _RectClipper();
    const clipper2 = _OtherRectClipper();

    test('Constructor assigns clipper correctly', () {
      const modifier = ClipRectDecoratorSpec(
        clipBehavior: clipBehavior,
        clipper: clipper,
      );

      expect(modifier.clipper, clipper);
      expect(modifier.clipBehavior, clipBehavior);
    });

    test('Lerp method interpolates correctly', () {
      const start =
          ClipRectDecoratorSpec(clipBehavior: clipBehavior, clipper: clipper);
      const end =
          ClipRectDecoratorSpec(clipBehavior: clipBehavior2, clipper: clipper2);
      final result = start.lerp(end, 0.5);

      expect(result.clipper, clipper2);
      expect(result.clipBehavior, clipBehavior2);
    });

    test('Equality and hashcode test', () {
      const modifier1 =
          ClipRectDecoratorSpec(clipBehavior: clipBehavior, clipper: clipper);
      const modifier2 =
          ClipRectDecoratorSpec(clipBehavior: clipBehavior, clipper: clipper);
      const modifier3 =
          ClipRectDecoratorSpec(clipBehavior: clipBehavior2, clipper: clipper2);

      expect(modifier1, modifier2);
      expect(modifier1.hashCode, modifier2.hashCode);
      expect(modifier1 == modifier3, false);
      expect(modifier1.hashCode == modifier3.hashCode, false);
    });

    testWidgets(
      'Build method creates ClipRect widget with correct clipper',
      (WidgetTester tester) async {
        const modifier = ClipRectDecoratorSpec(clipper: clipper);

        await tester.pumpMaterialApp(modifier.build(Container()));

        final ClipRect clipRectWidget = tester.widget(find.byType(ClipRect));

        expect(find.byType(ClipRect), findsOneWidget);
        expect(clipRectWidget.clipper, clipper);
        expect(clipRectWidget.clipBehavior, clipBehavior);
        expect(clipRectWidget.child, isA<Container>());
      },
    );
  });

  // ClipRectDecoratorAttribute
  group('ClipRectDecoratorAttribute', () {
    const clipBehavior = Clip.hardEdge;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;
    const clipper = _RectClipper();
    const clipper2 = _OtherRectClipper();

    test('merge', () {
      const modifier = ClipRectDecoratorAttribute(
        clipper: clipper,
        clipBehavior: clipBehavior,
      );
      const other = ClipRectDecoratorAttribute(
        clipper: clipper2,
        clipBehavior: clipBehavior2,
      );
      final result = modifier.merge(other);
      expect(result, other);
    });

    test('resolve', () {
      const modifier = ClipRectDecoratorAttribute(
        clipper: clipper,
        clipBehavior: clipBehavior,
      );
      final result = modifier.resolve(EmptyMixData);
      expect(result, isA<ClipRectDecoratorSpec>());
      expect(result.clipper, clipper);
      expect(result.clipBehavior, clipBehavior);
    });
  });

  // ClipTriangleDecoratorSpec
  group('ClipTriangleDecoratorSpec', () {
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;

    test('Constructor assigns clipper correctly', () {
      const modifier = ClipTriangleDecoratorSpec(clipBehavior: clipBehavior);

      expect(modifier.clipBehavior, clipBehavior);
    });

    test('Lerp method interpolates correctly', () {
      const start = ClipTriangleDecoratorSpec(clipBehavior: clipBehavior);
      const end = ClipTriangleDecoratorSpec(clipBehavior: clipBehavior2);
      final result = start.lerp(end, 0.5);

      expect(result.clipBehavior, clipBehavior2);
    });

    test('Equality and hashcode test', () {
      const modifier1 = ClipTriangleDecoratorSpec(clipBehavior: clipBehavior);
      const modifier2 = ClipTriangleDecoratorSpec(clipBehavior: clipBehavior);
      const modifier3 = ClipTriangleDecoratorSpec(clipBehavior: clipBehavior2);

      expect(modifier1, modifier2);
      expect(modifier1.hashCode, modifier2.hashCode);
      expect(modifier1 == modifier3, false);
      expect(modifier1.hashCode == modifier3.hashCode, false);
    });

    testWidgets(
      'Build method creates ClipPath widget with correct clipper',
      (WidgetTester tester) async {
        const modifier = ClipTriangleDecoratorSpec(clipBehavior: clipBehavior);

        await tester.pumpMaterialApp(modifier.build(Container()));

        final ClipPath clipPathWidget = tester.widget(find.byType(ClipPath));

        expect(find.byType(ClipPath), findsOneWidget);
        expect(clipPathWidget.clipper, isA<TriangleClipper>());
        expect(clipPathWidget.clipBehavior, clipBehavior);
        expect(clipPathWidget.child, isA<Container>());
      },
    );
  });

  // ClipTriangleDecoratorAttribute
  group('ClipTriangleDecoratorAttribute', () {
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;

    test('merge', () {
      const modifier =
          ClipTriangleDecoratorAttribute(clipBehavior: clipBehavior);
      const other = ClipTriangleDecoratorAttribute(clipBehavior: clipBehavior2);
      final result = modifier.merge(other);
      expect(result, other);
    });

    test('resolve', () {
      const modifier =
          ClipTriangleDecoratorAttribute(clipBehavior: clipBehavior);
      final result = modifier.resolve(EmptyMixData);
      expect(result, isA<ClipTriangleDecoratorSpec>());
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
