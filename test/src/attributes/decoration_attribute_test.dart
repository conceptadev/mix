import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  const linearGradient = LinearGradient(colors: Colors.accents);
  const gradientAttribute = GradientAttribute(linearGradient);
  group('BoxDecorationDto', () {
    test('merge returns merged object correctly', () {
      final attr1 = BoxDecorationDto(color: Colors.red.toDto());
      const attr2 = BoxDecorationDto(gradient: gradientAttribute);
      final merged = attr1.merge(attr2);
      expect(merged.color, attr1.color);
      expect(merged.gradient, attr2.gradient);
    });
    test('resolve returns correct BoxDecoration with default values', () {
      const attr = BoxDecorationDto();
      final decoration = attr.resolve(EmptyMixData);
      expect(decoration, const BoxDecoration());
      return const Placeholder();
    });
    test('resolve returns correct BoxDecoration with specific values', () {
      final attr = BoxDecorationDto(
          color: Colors.red.toDto(), gradient: gradientAttribute);
      final decoration = attr.resolve(EmptyMixData);
      expect(decoration.color, Colors.red);
      expect(decoration.gradient, linearGradient);
      return const Placeholder();
    });
    test('Equality holds when all properties are the same', () {
      final attr1 = BoxDecorationDto(color: Colors.red.toDto());
      final attr2 = BoxDecorationDto(color: Colors.red.toDto());
      expect(attr1, attr2);
    });
    test('Equality fails when properties are different', () {
      final attr1 = BoxDecorationDto(color: Colors.red.toDto());
      final attr2 = BoxDecorationDto(color: Colors.blue.toDto());
      expect(attr1, isNot(attr2));
    });
  });

  group('ShapeDecorationDto', () {
    test('merge returns merged object correctly', () {
      final attr1 = ShapeDecorationDto(color: Colors.red.toDto());
      const attr2 = ShapeDecorationDto(gradient: gradientAttribute);
      final merged = attr1.merge(attr2);
      expect(merged.color, attr1.color);
      expect(merged.gradient, attr2.gradient);
    });
    test('resolve returns correct ShapeDecoration with default values', () {
      const shapeDecoration = ShapeDecoration(shape: CircleBorder());
      const attr = ShapeDecorationDto(shape: CircleBorder());

      final decoration = attr.resolve(EmptyMixData);
      expect(decoration, shapeDecoration);
    });
    test('resolve returns correct ShapeDecoration with specific values', () {
      final attr1 = ShapeDecorationDto(
        gradient: linearGradient.toDto(),
      );

      final attr2 = ShapeDecorationDto(
        color: Colors.red.toDto(),
      );
      final decoration1 = attr1.resolve(EmptyMixData);
      final decoration2 = attr2.resolve(EmptyMixData);

      expect(decoration1.gradient, linearGradient);
      expect(decoration2.color, Colors.red);
    });
    test('Equality holds when all properties are the same', () {
      final attr1 = ShapeDecorationDto(color: Colors.red.toDto());
      final attr2 = ShapeDecorationDto(color: Colors.red.toDto());
      expect(attr1, attr2);
    });
    test('Equality fails when properties are different', () {
      final attr1 = ShapeDecorationDto(color: Colors.red.toDto());
      final attr2 = ShapeDecorationDto(color: Colors.blue.toDto());
      expect(attr1, isNot(attr2));
    });
  });
}
