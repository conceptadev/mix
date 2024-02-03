import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group(
    'BoxUtility',
    () {
      const boxUtility = BoxSpecUtility();
      test('call() returns correct instance', () {
        const constraints = BoxConstraintsDto(
          maxHeight: 100,
          maxWidth: 200,
          minWidth: 50,
          minHeight: 40,
        );

        const spacing = SpacingDto.all(10);

        final container = boxUtility.only(
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          constraints: constraints,
          height: 10,
          margin: spacing,
          padding: spacing,
          transform: Matrix4.identity(),
          width: 10,
        );

        expect(container.alignment, Alignment.center);
        expect(container.clipBehavior, Clip.antiAlias);

        expect(
          container.constraints,
          constraints,
        );

        expect(container.height, 10);
        expect(
          container.margin,
          spacing,
        );
        expect(
          container.padding,
          spacing,
        );
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

      test('decoration() returns correct instance', () {
        final container = boxUtility.decoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        );

        expect(container.decoration!.color, const ColorDto(Colors.amber));

        final decorationDTO = container.decoration as BoxDecorationDto;
        expect(
          decorationDTO.borderRadius,
          BorderRadiusGeometryDto.from(BorderRadius.circular(10)),
        );
      });

      test('foregroundDecoration() returns correct instance', () {
        final container = boxUtility.foregroundDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        );

        expect(
          container.foregroundDecoration!.color,
          const ColorDto(Colors.amber),
          reason: 'The color is not correct',
        );

        final foregroundDecorationDTO =
            container.foregroundDecoration as BoxDecorationDto;
        expect(
          foregroundDecorationDTO.borderRadius,
          BorderRadiusGeometryDto.from(BorderRadius.circular(10)),
          reason: 'The BorderRadius is not correct',
        );
      });
    },
  );
}
