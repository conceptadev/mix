import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/decorators/clip_decorator.dart';
import 'package:mix/src/utils/decorators_util.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('Decorators', () {
    test('aspectRatio creates AspectRatioDecorator correctly', () {
      final aspectRatioDecorator = aspectRatio(2.0);

      expect(aspectRatioDecorator.aspectRatio, 2.0);
    });

    test('expanded creates FlexibleDecorator correctly', () {
      final flexibleDecorator = expanded();

      expect(flexibleDecorator.flexFit, FlexFit.tight);
    });

    test('flexible creates FlexibleDecorator correctly', () {
      final flexibleDecorator = flexible();

      expect(flexibleDecorator.flexFit, FlexFit.loose);
    });

    test('opacity creates OpacityDecorator correctly', () {
      final opacityDecorator = opacity(0.5);

      expect(opacityDecorator.value, 0.5);
    });

    test('rotate creates RotateDecorator correctly', () {
      final rotateDecorator = rotate(2);

      expect(rotateDecorator.value, 2);
    });

    test('rotate90 creates RotateDecorator correctly', () {
      final rotateDecorator = rotate90();

      expect(rotateDecorator.value, 1);
    });

    test('rotate180 creates RotateDecorator correctly', () {
      final rotateDecorator = rotate180();

      expect(rotateDecorator.value, 2);
    });

    test('rotate270 creates RotateDecorator correctly', () {
      final rotateDecorator = rotate270();

      expect(rotateDecorator.value, 3);
    });

    test('scale creates ScaleDecorator correctly', () {
      final scaleDecorator = scale(0.5);

      expect(scaleDecorator.scale, 0.5);
    });

    test('clipRRect creates ClipRRectDecorator correctly', () {
      final clipRRectDecorator = clipRRect(10.0);

      expect(clipRRectDecorator.borderRadius, BorderRadius.circular(10.0));
    });

    test('clipOval creates ClipOvalDecorator correctly', () {
      final clipOvalDecorator = clipOval();

      expect(clipOvalDecorator.render(const Empty(), EmptyMixData),
          isA<ClipOval>());
    });

    test('clipPath creates ClipPathDecorator correctly', () {
      final clipPathDecorator = clipPath();

      expect(clipPathDecorator.render(const Empty(), EmptyMixData),
          isA<ClipPath>());
    });

    test('clipTriangle creates ClipPathDecorator correctly', () {
      final clipTriangleDecorator = clipTriangle();

      expect(clipTriangleDecorator.render(const Empty(), EmptyMixData),
          isA<ClipPath>());
      expect(clipTriangleDecorator.clipper, isA<TriangleClipper>());
    });
  });
}
