import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  const linearGradient = LinearGradient(colors: Colors.accents);
  final gradientDto = linearGradient.toAttribute();
  group('BoxDecorationDto', () {
    test('merge returns merged object correctly', () {
      final attr1 = BoxDecorationAttribute(color: Colors.red.toAttribute());
      final attr2 = BoxDecorationAttribute(gradient: gradientDto);
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
          color: Colors.red.toAttribute(), gradient: gradientDto);
      final decoration = attr.resolve(EmptyMixData);
      expect(decoration.color, Colors.red);
      expect(decoration.gradient, linearGradient);
      return const Placeholder();
    });
    test('Equality holds when all properties are the same', () {
      final attr1 = BoxDecorationAttribute(color: Colors.red.toAttribute());
      final attr2 = BoxDecorationAttribute(color: Colors.red.toAttribute());
      expect(attr1, attr2);
    });
    test('Equality fails when properties are different', () {
      final attr1 = BoxDecorationAttribute(color: Colors.red.toAttribute());
      final attr2 = BoxDecorationAttribute(color: Colors.blue.toAttribute());
      expect(attr1, isNot(attr2));
    });
  });

  group('ShapeDecorationDto', () {
    test('merge returns merged object correctly', () {
      final attr1 = ShapeDecorationAttribute(color: Colors.red.toAttribute());
      final attr2 = ShapeDecorationAttribute(gradient: gradientDto);
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
        gradient: linearGradient.toAttribute(),
      );

      final attr2 = ShapeDecorationAttribute(
        color: Colors.red.toAttribute(),
      );
      final decoration1 = attr1.resolve(EmptyMixData);
      final decoration2 = attr2.resolve(EmptyMixData);

      expect(decoration1.gradient, linearGradient);
      expect(decoration2.color, Colors.red);
    });
    test('Equality holds when all properties are the same', () {
      final attr1 = ShapeDecorationAttribute(color: Colors.red.toAttribute());
      final attr2 = ShapeDecorationAttribute(color: Colors.red.toAttribute());
      expect(attr1, attr2);
    });
    test('Equality fails when properties are different', () {
      final attr1 = ShapeDecorationAttribute(color: Colors.red.toAttribute());
      final attr2 = ShapeDecorationAttribute(color: Colors.blue.toAttribute());
      expect(attr1, isNot(attr2));
    });
  });
}
