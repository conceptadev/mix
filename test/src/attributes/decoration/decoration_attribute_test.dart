import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/gradient/gradient_dto.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  const gradient = LinearGradient(
    colors: Colors.accents,
  );
  final linearGradient = LinearGradientDto(
    colors: Colors.accents.map(ColorDto.new).toList(),
  );

  final gradientAttribute = GradientAttribute(linearGradient);

  group('BoxDecorationDto', () {
    test('merge returns merged object correctly', () {
      final attr1 = BoxDecorationAttribute(color: Colors.red.toDto());
      final attr2 = BoxDecorationAttribute(gradient: gradientAttribute);
      final merged = attr1.merge(attr2);
      expect(merged.color, attr1.color);
      expect(merged.gradient, attr2.gradient);
    });
    test('resolve returns correct BoxDecoration with default values', () {
      const attr = BoxDecorationAttribute();
      final decoration = attr.resolve(EmptyMixData);
      expect(decoration, const BoxDecoration());
      return const Placeholder();
    });
    test('resolve returns correct BoxDecoration with specific values', () {
      final attr = BoxDecorationAttribute(
          color: Colors.red.toDto(), gradient: gradientAttribute);
      final decoration = attr.resolve(EmptyMixData);
      expect(decoration.color, Colors.red);
      expect(decoration.gradient, gradient);
      return const Placeholder();
    });
    test('Equality holds when all properties are the same', () {
      final attr1 = BoxDecorationAttribute(color: Colors.red.toDto());
      final attr2 = BoxDecorationAttribute(color: Colors.red.toDto());
      expect(attr1, attr2);
    });
    test('Equality fails when properties are different', () {
      final attr1 = BoxDecorationAttribute(color: Colors.red.toDto());
      final attr2 = BoxDecorationAttribute(color: Colors.blue.toDto());
      expect(attr1, isNot(attr2));
    });
  });

  group('ShapeDecorationDto', () {
    test('merge returns merged object correctly', () {
      final attr1 = ShapeDecorationAttribute(color: Colors.red.toDto());
      final attr2 = ShapeDecorationAttribute(gradient: gradientAttribute);
      final merged = attr1.merge(attr2);
      expect(merged.color, attr1.color);
      expect(merged.gradient, attr2.gradient);
    });
    test('resolve returns correct ShapeDecoration with default values', () {
      const shapeDecoration = ShapeDecoration(shape: CircleBorder());
      const attr = ShapeDecorationAttribute(shape: CircleBorder());

      final decoration = attr.resolve(EmptyMixData);
      expect(decoration, shapeDecoration);
    });
    test('resolve returns correct ShapeDecoration with specific values', () {
      final attr1 = ShapeDecorationAttribute(
        gradient: gradientAttribute,
      );

      final attr2 = ShapeDecorationAttribute(
        color: Colors.red.toDto(),
      );
      final decoration1 = attr1.resolve(EmptyMixData);
      final decoration2 = attr2.resolve(EmptyMixData);

      expect(decoration1.gradient, linearGradient.resolve(EmptyMixData));
      expect(decoration2.color, Colors.red);
    });
    test('Equality holds when all properties are the same', () {
      final attr1 = ShapeDecorationAttribute(color: Colors.red.toDto());
      final attr2 = ShapeDecorationAttribute(color: Colors.red.toDto());
      expect(attr1, attr2);
    });
    test('Equality fails when properties are different', () {
      final attr1 = ShapeDecorationAttribute(color: Colors.red.toDto());
      final attr2 = ShapeDecorationAttribute(color: Colors.blue.toDto());
      expect(attr1, isNot(attr2));
    });
  });
}
