import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../empty_widget.dart';
import '../../helpers/testing_utils.dart';

void main() {
  group('Decorators: ', () {
    const aspectRatio = AspectRatioUtility(UtilityTestAttribute.new);
    const flexible = FlexibleDecoratorUtility(UtilityTestAttribute.new);

    const opacity = OpacityUtility(UtilityTestAttribute.new);
    const rotate = RotateUtility(UtilityTestAttribute.new);
    const scale = ScaleUtility(UtilityTestAttribute.new);
    const clip = ClipDecoratorUtility(UtilityTestAttribute.new);
    test('aspectRatio creates AspectRatioDecorator correctly', () {
      final aspectRatioDecorator = aspectRatio(2.0);

      expect(aspectRatioDecorator.value.aspectRatio, 2.0);
    });

    test('expanded creates FlexibleDecoratorUtility correctly', () {
      const flexible = FlexibleDecoratorUtility(UtilityTestAttribute.new);
      final flexibleDecorator = flexible.expanded();

      expect(flexibleDecorator.value.fit, FlexFit.tight);
    });

    test('default flexible creates FlexibleDecoratorUtility correctly', () {
      final flexibleDecorator = flexible();
      final widget = flexibleDecorator.value.build(EmptyMixData, const Empty()) as Flexible;

      expect(flexibleDecorator.value.fit, null);
      expect(widget, isA<Flexible>());
      expect(widget.fit, FlexFit.loose);
      expect(widget.flex, 1);
    });

    test('opacity creates OpacityDecorator correctly', () {
      final opacityDecorator = opacity(0.5);

      expect(opacityDecorator.value.opacity, 0.5);
    });

    test('rotate creates RotateDecorator correctly', () {
      final rotateDecorator = rotate(2);

      expect(rotateDecorator.value.quarterTurns, 2);
    });

    test('rotate90 creates RotateDecorator correctly', () {
      final rotateDecorator = rotate.d90();

      expect(rotateDecorator.value.quarterTurns, 1);
    });

    test('rotate180 creates RotateDecorator correctly', () {
      final rotateDecorator = rotate.d180();

      expect(rotateDecorator.value.quarterTurns, 2);
    });

    test('rotate270 creates RotateDecorator correctly', () {
      final rotateDecorator = rotate.d270();

      expect(rotateDecorator.value.quarterTurns, 3);
    });

    test('scale creates ScaleDecorator correctly', () {
      final scaleDecorator = scale(0.5);

      expect(scaleDecorator.value.scale, 0.5);
    });

    test('clipRRect creates ClipRRectDecorator correctly', () {
      final clipRRectDecorator = clip.rrect(borderRadius: BorderRadius.circular(10.0));

      expect(clipRRectDecorator.value.borderRadius, BorderRadius.circular(10.0));
    });

    test('clipOval creates ClipOvalDecorator correctly', () {
      final clipOvalDecorator = clip.oval();

      expect(clipOvalDecorator.value.build(EmptyMixData, const Empty()), isA<ClipOval>());
    });

    test('clipPath creates ClipPathDecorator correctly', () {
      final clipPathDecorator = clip.path();

      expect(clipPathDecorator.value.build(EmptyMixData, const Empty()), isA<ClipPath>());
    });

    test('clipTriangle creates ClipPathDecorator correctly', () {
      final clipTriangleDecorator = clip.triangle();

      final widget = clipTriangleDecorator.value.build(EmptyMixData, const Empty()) as ClipPath;

      expect(widget.clipper, isA<TriangleClipper>());
    });
  });
}
