import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
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

        await tester.pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final AspectRatio aspectRatioWidget = tester.widget(find.byType(AspectRatio));

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

        await tester.pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final Visibility visibilityWidget = tester.widget(find.byType(Visibility));

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

        await tester.pumpMaterialApp(decorator.build(EmptyMixData, Container()));

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
          Row(
            children: [decorator.build(EmptyMixData, Container())],
          ),
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

        await tester.pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final RotatedBox rotatedBoxWidget = tester.widget(find.byType(RotatedBox));

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

        await tester.pumpMaterialApp(decorator.build(EmptyMixData, Container()));

        final Transform transformWidget = tester.widget(find.byType(Transform));

        expect(find.byType(Transform), findsOneWidget);
        expect(transformWidget.transform, Matrix4.diagonal3Values(scale, scale, 1.0));
        expect(transformWidget.child, isA<Container>());
      },
    );
  });

  group('ClipDecorator Tests', () {
    test('Constructor assigns properties correctly', () {
      const clipType = ClipType.rect;
      const clipBehavior = Clip.antiAlias;
      final clipper = RectClipper();
      final decorator = ClipDecorator(
        clipType: clipType,
        clipBehavior: clipBehavior,
        clipper: clipper,
      );

      expect(decorator.clipType, clipType);
      expect(decorator.clipBehavior, clipBehavior);
      expect(decorator.clipper, clipper);
    });

    test('Merge method combines properties correctly', () {
      const decorator1 = ClipDecorator(clipType: ClipType.rect, clipBehavior: Clip.antiAlias);
      const decorator2 = ClipDecorator(clipType: ClipType.oval, clipBehavior: Clip.hardEdge);

      final result = decorator1.merge(decorator2);

      expect(result.clipType, ClipType.oval);
      expect(result.clipBehavior, Clip.hardEdge);
    });

    test('Lerp method interpolates correctly', () {
      const decorator1 = ClipDecorator(clipType: ClipType.rect, clipBehavior: Clip.antiAlias);
      const decorator2 = ClipDecorator(clipType: ClipType.rect, clipBehavior: Clip.hardEdge);

      final beforeResult = decorator1.lerp(decorator2, 0.49);
      final afterResult = decorator1.lerp(decorator2, 0.5);

      expect(beforeResult.clipType, ClipType.rect);
      expect(beforeResult.clipBehavior, Clip.antiAlias);

      expect(afterResult.clipType, ClipType.rect);
      expect(afterResult.clipBehavior, Clip.hardEdge);
    });

    testWidgets('Build method creates ClipRect widget', (WidgetTester tester) async {
      const decorator = ClipDecorator(clipType: ClipType.rect);

      await tester.pumpMaterialApp(decorator.build(EmptyMixData, Container()));

      expect(find.byType(ClipRect), findsOneWidget);
    });

    testWidgets('Build method creates ClipOval widget', (WidgetTester tester) async {
      const decorator = ClipDecorator(clipType: ClipType.oval);

      await tester.pumpMaterialApp(decorator.build(EmptyMixData, Container()));

      expect(find.byType(ClipOval), findsOneWidget);
    });

    testWidgets('Build method creates ClipPath widget for triangle', (WidgetTester tester) async {
      const decorator = ClipDecorator(clipType: ClipType.triangle);

      await tester.pumpMaterialApp(decorator.build(EmptyMixData, Container()));

      expect(find.byType(ClipPath), findsOneWidget);
    });

    testWidgets('Build method creates ClipPath widget for path', (WidgetTester tester) async {
      const decorator = ClipDecorator(clipType: ClipType.path);

      await tester.pumpMaterialApp(decorator.build(EmptyMixData, Container()));

      expect(find.byType(ClipPath), findsOneWidget);
    });

    testWidgets('Build method creates ClipRRect widget', (WidgetTester tester) async {
      const decorator = ClipDecorator(
        clipType: ClipType.rRect,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      );

      await tester.pumpMaterialApp(decorator.build(EmptyMixData, Container()));

      expect(find.byType(ClipRRect), findsOneWidget);
    });
  });
}

class RectClipper extends CustomClipper<Rect> {
  const RectClipper();
  @override
  Rect getClip(Size size) {
    return Rect.zero;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
