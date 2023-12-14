import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/attribute_generator.dart';

void main() {
  group(
    'BoxUtility',
    () {
      const boxUtility = BoxSpecUtility();
      test('call() returns correct instance', () {
        final container = boxUtility(
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          constraints: const BoxConstraints(
              maxHeight: 100, maxWidth: 200, minWidth: 50, minHeight: 40),
          decoration: RandomGenerator.boxDecoration(),
          height: 10,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          transform: Matrix4.identity(),
          width: 10,
        );

        expect(container.alignment, Alignment.center);
        expect(container.clipBehavior, Clip.antiAlias);

        expect(
            container.constraints,
            const BoxConstraintsDto(
                maxHeight: 100, maxWidth: 200, minWidth: 50, minHeight: 40));
        expect(container.decoration, isA<BoxDecorationDto>());

        expect(container.height, 10);
        expect(container.margin,
            const SpacingDto.only(bottom: 10, left: 10, right: 10, top: 10));
        expect(container.padding,
            const SpacingDto.only(bottom: 10, left: 10, right: 10, top: 10));
        expect(container.transform, Matrix4.identity());
        expect(container.width, 10);
      });

      test('alignment() returns correct instance', () {
        final container = boxUtility.alignment(Alignment.center);

        expect(container.alignment, Alignment.center);
      });

      test('clipBehavior() returns correct instance', () {
        final container = boxUtility.clipBehavior(Clip.antiAlias);

        expect(container.clipBehavior, Clip.antiAlias);
      });

      test('color() returns correct instance', () {
        final container = boxUtility.color(Colors.blue);

        expect((container.decoration as BoxDecorationDto).color,
            const ColorDto(Colors.blue));
      });

      test('constraints() returns correct instance', () {
        expect(box.constraints, isA<BoxConstraintsUtility>());
      });

      test('shape() returns correct instance', () {
        expect(boxUtility.shapeDecoration, isA<ShapeDecorationUtility>());
      });

      test('height() returns correct instance', () {
        final container = boxUtility.height(10);

        expect(container.height, 10);
      });

      test('margin() returns correct instance', () {
        expect(boxUtility.margin, isA<SpacingUtility>());
      });

      test('padding() returns correct instance', () {
        expect(boxUtility.padding, isA<SpacingUtility>());
      });

      test('transform() returns correct instance', () {
        final container = boxUtility.transform(Matrix4.identity());

        expect(container.transform, Matrix4.identity());
      });

      test('width() returns correct instance', () {
        final container = boxUtility.width(10);

        expect(container.width, 10);
      });
    },
  );
}
