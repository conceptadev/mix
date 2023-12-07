import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/attribute_generator.dart';

void main() {
  group(
    'ContainerUtility',
    () {
      const containerUtility = ContainerUtility();
      test('call() returns correct instance', () {
        final container = containerUtility(
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

      // alignment()
      test('alignment() returns correct instance', () {
        final container = containerUtility.alignment(Alignment.center);

        expect(container.alignment, Alignment.center);
      });

      // clipBehavior()
      test('clipBehavior() returns correct instance', () {
        final container = containerUtility.clipBehavior(Clip.antiAlias);

        expect(container.clipBehavior, Clip.antiAlias);
      });

      // color()
      test('color() returns correct instance', () {
        final container = containerUtility.color(Colors.blue);

        expect((container.decoration as BoxDecorationDto).color,
            const ColorDto(Colors.blue));
      });

      // constraints()
      test('constraints() returns correct instance', () {
        expect(container.constraints, isA<BoxConstraintsUtility>());
      });

      // decoration()
      test('decoration() returns correct instance', () {
        expect(containerUtility.decoration, isA<DecorationUtility>());
      });

      // height()
      test('height() returns correct instance', () {
        final container = containerUtility.height(10);

        expect(container.height, 10);
      });

      // margin()
      test('margin() returns correct instance', () {
        expect(containerUtility.margin, isA<SpacingUtility>());
      });

      // padding()
      test('padding() returns correct instance', () {
        expect(containerUtility.padding, isA<SpacingUtility>());
      });

      // transform()
      test('transform() returns correct instance', () {
        final container = containerUtility.transform(Matrix4.identity());

        expect(container.transform, Matrix4.identity());
      });

      // width()
      test('width() returns correct instance', () {
        final container = containerUtility.width(10);

        expect(container.width, 10);
      });
    },
  );
}
