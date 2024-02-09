import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('IntrinsicHeightDecorator Tests', () {
    testWidgets(
      'Build method creates AspectRatio widget with correct aspectRatio',
      (WidgetTester tester) async {
        const decorator = IntrinsicHeightDecorator();

        await tester
            .pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final IntrinsicHeight intrinsicHeight =
            tester.widget(find.byType(IntrinsicHeight));

        expect(find.byType(IntrinsicHeight), findsOneWidget);

        expect(intrinsicHeight.child, isA<Container>());
      },
    );
  });

  group('IntrinsicWidthDecorator Tests', () {
    testWidgets(
      'Build method creates AspectRatio widget with correct aspectRatio',
      (WidgetTester tester) async {
        const decorator = IntrinsicWidthDecorator();

        await tester
            .pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final IntrinsicWidth intrinsicWidth =
            tester.widget(find.byType(IntrinsicWidth));

        expect(find.byType(IntrinsicWidth), findsOneWidget);

        expect(intrinsicWidth.child, isA<Container>());
      },
    );
  });

  group('AspectRatioDecorator Tests', () {
    test('Constructor assigns aspectRatio correctly', () {
      const aspectRatio = 2.0;
      const decorator = AspectRatioDecorator(aspectRatio);

      expect(decorator.aspectRatio, aspectRatio);
    });

    test('Lerp method interpolates correctly', () {
      const start = AspectRatioDecorator(1.0);
      const end = AspectRatioDecorator(3.0);
      final result = start.lerp(end, 0.5);

      expect(result.aspectRatio, 2.0);
    });

    test('Equality and hashcode test', () {
      const decorator1 = AspectRatioDecorator(1.0);
      const decorator2 = AspectRatioDecorator(1.0);
      const decorator3 = AspectRatioDecorator(2.0);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates AspectRatio widget with correct aspectRatio',
      (WidgetTester tester) async {
        const aspectRatio = 2.0;
        const decorator = AspectRatioDecorator(aspectRatio);

        await tester
            .pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final AspectRatio aspectRatioWidget =
            tester.widget(find.byType(AspectRatio));

        expect(find.byType(AspectRatio), findsOneWidget);
        expect(aspectRatioWidget.aspectRatio, aspectRatio);

        expect(aspectRatioWidget.child, isA<Container>());
        expect(aspectRatioWidget.aspectRatio, aspectRatio);
      },
    );
  });

  group('VisibilityDecorator Tests', () {
    test('Constructor assigns visible correctly', () {
      const visible = true;
      const decorator = VisibilityDecorator(visible);

      expect(decorator.visible, visible);
    });

    test('Lerp method interpolates correctly', () {
      const start = VisibilityDecorator(true);
      const end = VisibilityDecorator(false);
      final afterResult = start.lerp(end, 0.5);
      final beforeResult = start.lerp(end, 0.49);

      expect(beforeResult.visible, true);
      expect(afterResult.visible, false);
    });

    test('Equality and hashcode test', () {
      const decorator1 = VisibilityDecorator(true);
      const decorator2 = VisibilityDecorator(true);
      const decorator3 = VisibilityDecorator(false);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates Visibility widget with correct visible property',
      (WidgetTester tester) async {
        const visible = true;
        const decorator = VisibilityDecorator(visible);

        await tester
            .pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final Visibility visibilityWidget =
            tester.widget(find.byType(Visibility));

        expect(find.byType(Visibility), findsOneWidget);
        expect(visibilityWidget.visible, visible);
        expect(visibilityWidget.child, isA<Container>());
      },
    );
  });

  group('OpacityDecorator Tests', () {
    test('Constructor assigns opacity correctly', () {
      const opacity = 0.5;
      const decorator = OpacityDecorator(opacity);

      expect(decorator.opacity, opacity);
    });

    test('Lerp method interpolates correctly', () {
      const start = OpacityDecorator(0.0);
      const end = OpacityDecorator(1.0);
      final result = start.lerp(end, 0.5);

      expect(result.opacity, 0.5);
    });

    test('Equality and hashcode test', () {
      const decorator1 = OpacityDecorator(0.5);
      const decorator2 = OpacityDecorator(0.5);
      const decorator3 = OpacityDecorator(0.8);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates Opacity widget with correct opacity',
      (WidgetTester tester) async {
        const opacity = 0.5;
        const decorator = OpacityDecorator(opacity);

        await tester
            .pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final Opacity opacityWidget = tester.widget(find.byType(Opacity));

        expect(find.byType(Opacity), findsOneWidget);
        expect(opacityWidget.opacity, opacity);
        expect(opacityWidget.child, isA<Container>());
      },
    );
  });

  group('FlexibleDecorator Tests', () {
    test('Constructor assigns flex and fit correctly', () {
      const flex = 2;
      const fit = FlexFit.tight;
      const decorator = FlexibleDecorator(flex: flex, fit: fit);

      expect(decorator.flex, flex);
      expect(decorator.fit, fit);
    });

    test('Lerp method interpolates correctly', () {
      const start = FlexibleDecorator(flex: 1, fit: FlexFit.loose);
      const end = FlexibleDecorator(flex: 3, fit: FlexFit.tight);
      final result = start.lerp(end, 0.5);

      expect(result.flex, 2);
      expect(result.fit, FlexFit.tight);
    });

    test('Merge method combines properties correctly', () {
      const decorator1 = FlexibleDecorator(flex: 1, fit: FlexFit.loose);
      const decorator2 = FlexibleDecorator(flex: 3);
      final result = decorator1.merge(decorator2);

      expect(result.flex, 3);
      expect(result.fit, FlexFit.loose);
    });

    test('Equality and hashcode test', () {
      const decorator1 = FlexibleDecorator(flex: 1, fit: FlexFit.tight);
      const decorator2 = FlexibleDecorator(flex: 1, fit: FlexFit.tight);
      const decorator3 = FlexibleDecorator(flex: 2, fit: FlexFit.loose);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates Flexible widget with correct flex and fit',
      (WidgetTester tester) async {
        const flex = 2;
        const fit = FlexFit.tight;
        const decorator = FlexibleDecorator(flex: flex, fit: fit);

        await tester.pumpMaterialApp(
          Row(children: [decorator.build(EmptyMixData, Container())]),
        );

        final Flexible flexibleWidget = tester.widget(find.byType(Flexible));

        expect(find.byType(Flexible), findsOneWidget);
        expect(flexibleWidget.flex, flex);
        expect(flexibleWidget.fit, fit);
        expect(flexibleWidget.child, isA<Container>());
      },
    );
  });

  group('RotateDecorator Tests', () {
    test('Constructor assigns quarterTurns correctly', () {
      const quarterTurns = 1;
      const decorator = RotateDecorator(quarterTurns);

      expect(decorator.quarterTurns, quarterTurns);
    });

    test('Lerp method interpolates correctly', () {
      const start = RotateDecorator(0);
      const end = RotateDecorator(4);
      final result = start.lerp(end, 0.5);

      expect(result.quarterTurns, 2);
    });

    test('Equality and hashcode test', () {
      const decorator1 = RotateDecorator(1);
      const decorator2 = RotateDecorator(1);
      const decorator3 = RotateDecorator(2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates RotatedBox widget with correct quarterTurns',
      (WidgetTester tester) async {
        const quarterTurns = 1;
        const decorator = RotateDecorator(quarterTurns);

        await tester
            .pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final RotatedBox rotatedBoxWidget =
            tester.widget(find.byType(RotatedBox));

        expect(find.byType(RotatedBox), findsOneWidget);
        expect(rotatedBoxWidget.quarterTurns, quarterTurns);
        expect(rotatedBoxWidget.child, isA<Container>());
      },
    );
  });

  group('ScaleDecorator Tests', () {
    test('Constructor assigns scale correctly', () {
      const scale = 1.5;
      const decorator = ScaleDecorator(scale);

      expect(decorator.scale, scale);
    });

    test('Lerp method interpolates correctly', () {
      const start = ScaleDecorator(1.0);
      const end = ScaleDecorator(2.0);
      final result = start.lerp(end, 0.5);

      expect(result.scale, 1.5);
    });

    test('Equality and hashcode test', () {
      const decorator1 = ScaleDecorator(1.0);
      const decorator2 = ScaleDecorator(1.0);
      const decorator3 = ScaleDecorator(1.5);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates Transform.scale widget with correct scale',
      (WidgetTester tester) async {
        const scale = 1.5;
        const decorator = ScaleDecorator(scale);

        await tester
            .pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final Transform transformWidget = tester.widget(find.byType(Transform));

        expect(find.byType(Transform), findsOneWidget);
        expect(
          transformWidget.transform,
          Matrix4.diagonal3Values(scale, scale, 1.0),
        );
        expect(transformWidget.child, isA<Container>());
      },
    );
  });

  // clipPath, clipRRect, clipOval, clipRect, clipTriangle
  group('ClipPathDecorator Tests', () {
    const clipper = _PathClipper();
    const clipper2 = _OtherPathClipper();

    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;
    test('Constructor assigns clipper correctly', () {
      const decorator =
          ClipPathDecorator(clipBehavior: clipBehavior, clipper: clipper);

      expect(decorator.clipper, clipper);
      expect(decorator.clipBehavior, clipBehavior);
    });

    test('Lerp method interpolates correctly', () {
      const start = ClipPathDecorator(clipper: clipper);
      const end = ClipPathDecorator(clipper: clipper2);
      final result = start.lerp(end, 0.5);

      expect(result.clipper, clipper2);
    });

    test('Merge method combines properties correctly', () {
      const decorator1 =
          ClipPathDecorator(clipBehavior: clipBehavior, clipper: clipper);
      const decorator2 =
          ClipPathDecorator(clipBehavior: clipBehavior2, clipper: clipper2);
      final result = decorator1.merge(decorator2);

      expect(result.clipper, clipper2);
      expect(result.clipBehavior, clipBehavior2);
    });

    test('Equality and hashcode test', () {
      const decorator1 =
          ClipPathDecorator(clipBehavior: clipBehavior, clipper: clipper);
      const decorator2 =
          ClipPathDecorator(clipBehavior: clipBehavior, clipper: clipper);
      const decorator3 =
          ClipPathDecorator(clipBehavior: clipBehavior, clipper: clipper2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates ClipPath widget with correct clipper',
      (WidgetTester tester) async {
        const decorator = ClipPathDecorator(clipper: clipper);

        await tester
            .pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final ClipPath clipPathWidget = tester.widget(find.byType(ClipPath));

        expect(find.byType(ClipPath), findsOneWidget);
        expect(clipPathWidget.clipper, clipper);
        expect(clipPathWidget.clipBehavior, clipBehavior);
        expect(clipPathWidget.child, isA<Container>());
      },
    );
  });

  group('ClipRRectDecorator Tests', () {
    final borderRadius = BorderRadius.circular(10.0);
    final borderRadius2 = BorderRadius.circular(20.0);
    const clipper = _RRectClipper();
    const clipper2 = _OtherRRectClipper();
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;

    test('Constructor assigns borderRadius correctly', () {
      final decorator = ClipRRectDecorator(
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        clipper: clipper,
      );

      expect(decorator.borderRadius, borderRadius);
      expect(decorator.clipBehavior, clipBehavior);
      expect(decorator.clipper, clipper);
    });

    test('Lerp method interpolates correctly', () {
      final start = ClipRRectDecorator(
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        clipper: clipper,
      );
      final end = ClipRRectDecorator(
        borderRadius: borderRadius2,
        clipBehavior: clipBehavior2,
        clipper: clipper2,
      );
      final result = start.lerp(end, 0.5);

      expect(result.borderRadius, BorderRadius.circular(15));
      expect(result.clipBehavior, clipBehavior2);
      expect(result.clipper, clipper2);
    });

    test('Merge method combines properties correctly', () {
      final decorator1 = ClipRRectDecorator(
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        clipper: clipper,
      );
      final decorator2 = ClipRRectDecorator(
        borderRadius: borderRadius2,
        clipBehavior: clipBehavior2,
        clipper: clipper2,
      );
      final result = decorator1.merge(decorator2);

      expect(result.borderRadius, borderRadius2);
      expect(result.clipBehavior, clipBehavior2);
      expect(result.clipper, clipper2);
    });

    test('Equality and hashcode test', () {
      final decorator1 = ClipRRectDecorator(
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        clipper: clipper,
      );
      final decorator2 = ClipRRectDecorator(
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        clipper: clipper,
      );
      final decorator3 = ClipRRectDecorator(
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

  // ClipOvalDecorator
  group('ClipOvalDecorator Tests', () {
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;
    const clipper = _RectClipper();
    const clipper2 = _OtherRectClipper();

    test('Constructor assigns clipper correctly', () {
      const decorator = ClipOvalDecorator(
        clipBehavior: clipBehavior,
        clipper: clipper,
      );

      expect(decorator.clipper, clipper);
      expect(decorator.clipBehavior, clipBehavior);
    });

    test('Lerp method interpolates correctly', () {
      const start =
          ClipOvalDecorator(clipBehavior: clipBehavior, clipper: clipper);
      const end =
          ClipOvalDecorator(clipBehavior: clipBehavior2, clipper: clipper2);
      final result = start.lerp(end, 0.5);

      expect(result.clipper, clipper2);
      expect(result.clipBehavior, clipBehavior2);
    });

    test('Merge method combines properties correctly', () {
      const decorator1 =
          ClipOvalDecorator(clipBehavior: clipBehavior, clipper: clipper);
      const decorator2 =
          ClipOvalDecorator(clipBehavior: clipBehavior2, clipper: clipper2);
      final result = decorator1.merge(decorator2);

      expect(result.clipper, clipper2);
      expect(result.clipBehavior, clipBehavior2);
    });

    test('Equality and hashcode test', () {
      const decorator1 =
          ClipOvalDecorator(clipBehavior: clipBehavior, clipper: clipper);
      const decorator2 =
          ClipOvalDecorator(clipBehavior: clipBehavior, clipper: clipper);
      const decorator3 =
          ClipOvalDecorator(clipBehavior: clipBehavior2, clipper: clipper2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates ClipOval widget with correct clipper',
      (WidgetTester tester) async {
        const decorator = ClipOvalDecorator(clipper: clipper);

        await tester
            .pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final ClipOval clipOvalWidget = tester.widget(find.byType(ClipOval));

        expect(find.byType(ClipOval), findsOneWidget);
        expect(clipOvalWidget.clipper, clipper);
        expect(clipOvalWidget.clipBehavior, clipBehavior);
        expect(clipOvalWidget.child, isA<Container>());
      },
    );
  });

  // ClipRectDecorator
  group('ClipRectDecorator Tests', () {
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;
    const clipper = _RectClipper();
    const clipper2 = _OtherRectClipper();

    test('Constructor assigns clipper correctly', () {
      const decorator = ClipRectDecorator(
        clipBehavior: clipBehavior,
        clipper: clipper,
      );

      expect(decorator.clipper, clipper);
      expect(decorator.clipBehavior, clipBehavior);
    });

    test('Lerp method interpolates correctly', () {
      const start =
          ClipRectDecorator(clipBehavior: clipBehavior, clipper: clipper);
      const end =
          ClipRectDecorator(clipBehavior: clipBehavior2, clipper: clipper2);
      final result = start.lerp(end, 0.5);

      expect(result.clipper, clipper2);
      expect(result.clipBehavior, clipBehavior2);
    });

    test('Merge method combines properties correctly', () {
      const decorator1 =
          ClipRectDecorator(clipBehavior: clipBehavior, clipper: clipper);
      const decorator2 =
          ClipRectDecorator(clipBehavior: clipBehavior2, clipper: clipper2);
      final result = decorator1.merge(decorator2);

      expect(result.clipper, clipper2);
      expect(result.clipBehavior, clipBehavior2);
    });

    test('Equality and hashcode test', () {
      const decorator1 =
          ClipRectDecorator(clipBehavior: clipBehavior, clipper: clipper);
      const decorator2 =
          ClipRectDecorator(clipBehavior: clipBehavior, clipper: clipper);
      const decorator3 =
          ClipRectDecorator(clipBehavior: clipBehavior2, clipper: clipper2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates ClipRect widget with correct clipper',
      (WidgetTester tester) async {
        const decorator = ClipRectDecorator(clipper: clipper);

        await tester
            .pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final ClipRect clipRectWidget = tester.widget(find.byType(ClipRect));

        expect(find.byType(ClipRect), findsOneWidget);
        expect(clipRectWidget.clipper, clipper);
        expect(clipRectWidget.clipBehavior, clipBehavior);
        expect(clipRectWidget.child, isA<Container>());
      },
    );
  });

  // ClipTriangleDecorator
  group('ClipTriangleDecorator Tests', () {
    const clipBehavior = Clip.antiAlias;
    const clipBehavior2 = Clip.antiAliasWithSaveLayer;

    test('Constructor assigns clipper correctly', () {
      const decorator = ClipTriangleDecorator(clipBehavior: clipBehavior);

      expect(decorator.clipBehavior, clipBehavior);
    });

    test('Lerp method interpolates correctly', () {
      const start = ClipTriangleDecorator(clipBehavior: clipBehavior);
      const end = ClipTriangleDecorator(clipBehavior: clipBehavior2);
      final result = start.lerp(end, 0.5);

      expect(result.clipBehavior, clipBehavior2);
    });

    test('Merge method combines properties correctly', () {
      const decorator1 = ClipTriangleDecorator(clipBehavior: clipBehavior);
      const decorator2 = ClipTriangleDecorator(clipBehavior: clipBehavior2);
      final result = decorator1.merge(decorator2);

      expect(result.clipBehavior, clipBehavior2);
    });

    test('Equality and hashcode test', () {
      const decorator1 = ClipTriangleDecorator(clipBehavior: clipBehavior);
      const decorator2 = ClipTriangleDecorator(clipBehavior: clipBehavior);
      const decorator3 = ClipTriangleDecorator(clipBehavior: clipBehavior2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates ClipPath widget with correct clipper',
      (WidgetTester tester) async {
        const decorator = ClipTriangleDecorator(clipBehavior: clipBehavior);

        await tester
            .pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final ClipPath clipPathWidget = tester.widget(find.byType(ClipPath));

        expect(find.byType(ClipPath), findsOneWidget);
        expect(clipPathWidget.clipper, isA<TriangleClipper>());
        expect(clipPathWidget.clipBehavior, clipBehavior);
        expect(clipPathWidget.child, isA<Container>());
      },
    );
  });

  // AlignDecorator
  group('AlignDecorator Tests', () {
    const alignment = Alignment.center;
    const alignment2 = Alignment.bottomRight;

    test('Constructor assigns alignment correctly', () {
      const decorator = AlignDecorator(alignment: alignment);

      expect(decorator.alignment, alignment);
    });

    test('Lerp method interpolates correctly', () {
      const start = AlignDecorator(alignment: alignment);
      const end = AlignDecorator(alignment: alignment2);
      final result = start.lerp(end, 0.5);

      expect(result.alignment, const Alignment(0.5, 0.5));
    });

    test('Equality and hashcode test', () {
      const decorator1 = AlignDecorator(alignment: alignment);
      const decorator2 = AlignDecorator(alignment: alignment);
      const decorator3 = AlignDecorator(alignment: alignment2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates Align widget with correct alignment',
      (WidgetTester tester) async {
        const decorator = AlignDecorator(alignment: alignment);

        await tester
            .pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final Align alignWidget = tester.widget(find.byType(Align));

        expect(find.byType(Align), findsOneWidget);
        expect(alignWidget.alignment, alignment);
        expect(alignWidget.child, isA<Container>());
      },
    );
  });

  // FractionallySizedBoxDecorator
  group('FractionallySizedBoxDecorator Tests', () {
    const widthFactor = 0.5;
    const heightFactor = 0.5;
    const widthFactor2 = 0.8;
    const heightFactor2 = 0.8;

    test('Constructor assigns widthFactor and heightFactor correctly', () {
      const decorator = FractionallySizedBoxDecorator(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      );

      expect(decorator.widthFactor, widthFactor);
      expect(decorator.heightFactor, heightFactor);
    });

    test('Lerp method interpolates correctly', () {
      const start = FractionallySizedBoxDecorator(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      );
      const end = FractionallySizedBoxDecorator(
        widthFactor: widthFactor2,
        heightFactor: heightFactor2,
      );
      final result = start.lerp(end, 0.5);

      expect(result.widthFactor, 0.65);
      expect(result.heightFactor, 0.65);
    });

    test('Equality and hashcode test', () {
      const decorator1 = FractionallySizedBoxDecorator(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      );
      const decorator2 = FractionallySizedBoxDecorator(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      );
      const decorator3 = FractionallySizedBoxDecorator(
        widthFactor: widthFactor2,
        heightFactor: heightFactor2,
      );

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates FractionallySizedBox widget with correct factors',
      (WidgetTester tester) async {
        const decorator = FractionallySizedBoxDecorator(
          widthFactor: widthFactor,
          heightFactor: heightFactor,
        );

        await tester
            .pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final FractionallySizedBox fractionallySizedBoxWidget =
            tester.widget(find.byType(FractionallySizedBox));

        expect(find.byType(FractionallySizedBox), findsOneWidget);
        expect(fractionallySizedBoxWidget, fractionallySizedBoxWidget);
        expect(fractionallySizedBoxWidget.widthFactor, widthFactor);
        expect(fractionallySizedBoxWidget.heightFactor, heightFactor);
        expect(fractionallySizedBoxWidget.child, isA<Container>());
      },
    );
  });

  // SizedBoxDecorator
  group('SizedBoxDecorator Tests', () {
    const width = 100.0;
    const height = 100.0;
    const width2 = 200.0;
    const height2 = 200.0;

    test('Constructor assigns width and height correctly', () {
      const decorator = SizedBoxDecorator(width: width, height: height);

      expect(decorator.width, width);
      expect(decorator.height, height);
    });

    test('Lerp method interpolates correctly', () {
      const start = SizedBoxDecorator(width: width, height: height);
      const end = SizedBoxDecorator(width: width2, height: height2);
      final result = start.lerp(end, 0.5);

      expect(result.width, 150.0);
      expect(result.height, 150.0);
    });

    test('Equality and hashcode test', () {
      const decorator1 = SizedBoxDecorator(width: width, height: height);
      const decorator2 = SizedBoxDecorator(width: width, height: height);
      const decorator3 = SizedBoxDecorator(width: width2, height: height2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates SizedBox widget with correct width and height',
      (WidgetTester tester) async {
        const decorator = SizedBoxDecorator(width: width, height: height);

        await tester
            .pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final SizedBox sizedBoxWidget = tester.widget(find.byType(SizedBox));

        expect(find.byType(SizedBox), findsOneWidget);
        expect(sizedBoxWidget.width, width);
        expect(sizedBoxWidget.height, height);
        expect(sizedBoxWidget.child, isA<Container>());
      },
    );
  });

  //  TransformDecorator
  group('TransformDecorator Tests', () {
    final transform = Matrix4.identity();
    final transform2 = Matrix4.rotationZ(0.5);

    test('Constructor assigns transform correctly', () {
      final decorator = TransformDecorator(transform);

      expect(decorator.transform, transform);
    });

    test('Lerp method interpolates correctly', () {
      final start = TransformDecorator(transform);
      final end = TransformDecorator(transform2);
      final result = start.lerp(end, 0.5);

      expect(
        result.transform,
        Matrix4Tween(begin: transform, end: transform2).transform(0.5),
      );
    });

    test('Equality and hashcode test', () {
      final decorator1 = TransformDecorator(transform);
      final decorator2 = TransformDecorator(transform);
      final decorator3 = TransformDecorator(transform2);

      expect(decorator1, decorator2);
      expect(decorator1.hashCode, decorator2.hashCode);
      expect(decorator1 == decorator3, false);
      expect(decorator1.hashCode == decorator3.hashCode, false);
    });

    testWidgets(
      'Build method creates Transform widget with correct transform',
      (WidgetTester tester) async {
        final decorator = TransformDecorator(transform);

        await tester
            .pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final Transform transformWidget = tester.widget(find.byType(Transform));

        expect(find.byType(Transform), findsOneWidget);
        expect(transformWidget.transform, transform);
        expect(transformWidget.child, isA<Container>());
      },
    );
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
