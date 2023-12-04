import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('Decorators: ', () {
    test('aspectRatio creates AspectRatioDecorator correctly', () {
      final aspectRatioDecorator = aspectRatio(2.0);

      expect(aspectRatioDecorator.value, 2.0);
    });

    test('expanded creates FlexibleDecorator correctly', () {
      final flexibleDecorator = flexible.expanded();

      expect(flexibleDecorator.fit, FlexFit.tight);
    });

    test('default flexible creates FlexibleDecorator correctly', () {
      final flexibleDecorator = flexible();
      final widget =
          flexibleDecorator.build(const Empty(), EmptyMixData) as Flexible;

      expect(flexibleDecorator.fit, null);
      expect(widget, isA<Flexible>());
      expect(widget.fit, FlexFit.loose);
      expect(widget.flex, 1);
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
      final rotateDecorator = rotate.d90;

      expect(rotateDecorator.value, 1);
    });

    test('rotate180 creates RotateDecorator correctly', () {
      final rotateDecorator = rotate.d180;

      expect(rotateDecorator.value, 2);
    });

    test('rotate270 creates RotateDecorator correctly', () {
      final rotateDecorator = rotate.d270;

      expect(rotateDecorator.value, 3);
    });

    test('scale creates ScaleDecorator correctly', () {
      final scaleDecorator = scale(0.5);

      expect(scaleDecorator.value, 0.5);
    });

    test('clipRRect creates ClipRRectDecorator correctly', () {
      final clipRRectDecorator =
          clipRRect(borderRadius: BorderRadius.circular(10.0));

      expect(clipRRectDecorator.borderRadius, BorderRadius.circular(10.0));
    });

    test('clipOval creates ClipOvalDecorator correctly', () {
      final clipOvalDecorator = clipOval();

      expect(clipOvalDecorator.build(const Empty(), EmptyMixData),
          isA<ClipOval>());
    });

    test('clipPath creates ClipPathDecorator correctly', () {
      final clipPathDecorator = clipPath();

      expect(clipPathDecorator.build(const Empty(), EmptyMixData),
          isA<ClipPath>());
    });

    test('clipTriangle creates ClipPathDecorator correctly', () {
      final clipTriangleDecorator = clipTriangle();

      expect(clipTriangleDecorator.build(const Empty(), EmptyMixData),
          isA<ClipPath>());
      expect(clipTriangleDecorator.clipper, isA<TriangleClipper>());
    });
  });
}
