import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/attribute_generator.dart';
import '../../../helpers/testing_utils.dart';

void main() {
  group(
    'ContainerUtility',
    () {
      const containerUtility = ContainerUtility(UtilityTestAttribute.new);
      test('call() returns correct instance', () {
        final container = containerUtility(
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          color: Colors.blue,
          constraints: const BoxConstraints(
              maxHeight: 100, maxWidth: 200, minWidth: 50, minHeight: 40),
          decoration: RandomGenerator.boxDecoration(),
          height: 10,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          transform: Matrix4.identity(),
          width: 10,
        );

        expect(container.value.alignment, Alignment.center);
        expect(container.value.clipBehavior, Clip.antiAlias);
        expect(container.value.color, const ColorDto(Colors.blue));
        expect(
            container.value.constraints,
            const BoxConstraintsDto(
                maxHeight: 100, maxWidth: 200, minWidth: 50, minHeight: 40));
        expect(container.value.decoration, isA<BoxDecorationDto>());

        expect(container.value.height, 10);
        expect(container.value.margin,
            const SpacingDto(bottom: 10, left: 10, right: 10, top: 10));
        expect(container.value.padding,
            const SpacingDto(bottom: 10, left: 10, right: 10, top: 10));
        expect(container.value.transform, Matrix4.identity());
        expect(container.value.width, 10);
      });

      // alignment()
      test('alignment() returns correct instance', () {
        final container = containerUtility.alignment(Alignment.center);

        expect(container.value.alignment, Alignment.center);
      });

      // clipBehavior()
      test('clipBehavior() returns correct instance', () {
        final container = containerUtility.clipBehavior(Clip.antiAlias);

        expect(container.value.clipBehavior, Clip.antiAlias);
      });

      // color()
      test('color() returns correct instance', () {
        final container = containerUtility.color(Colors.blue);

        expect(container.value.color, const ColorDto(Colors.blue));
      });

      // constraints()
      test('constraints() returns correct instance', () {
        expect(container.constraints, isA<BoxConstraintsUtility>());
      });

      // decoration()
      test('decoration() returns correct instance', () {
        expect(containerUtility.decoration, isA<BoxDecorationUtility>());
      });

      // height()
      test('height() returns correct instance', () {
        final container = containerUtility.height(10);

        expect(container.value.height, 10);
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

        expect(container.value.transform, Matrix4.identity());
      });

      // width()
      test('width() returns correct instance', () {
        final container = containerUtility.width(10);

        expect(container.value.width, 10);
      });
    },
  );
}
