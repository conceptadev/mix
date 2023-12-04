import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/decoration/decoration_dto.dart';
import 'package:mix/src/attributes/gradient/gradient_dto.dart';

import '../../../helpers/attribute_generator.dart';
import '../../../helpers/testing_utils.dart';

void main() {
  const linearGradient = LinearGradient(
    colors: Colors.accents,
  );

  final linearGradientDto = LinearGradientDto(
    colors: Colors.accents.map(ColorDto.new).toList(),
  );

  group('BoxDecorationDto', () {
    test('merge returns merged object correctly', () {
      final decoration1 = BoxDecorationDto(color: Colors.red.toDto());
      final decoration2 = BoxDecorationDto(gradient: linearGradientDto);
      final merged = decoration1.merge(decoration2);
      expect(merged.color, decoration1.color);
      expect(merged.gradient, decoration2.gradient);
    });
    test('resolve returns correct BoxDecoration with default values', () {
      const attr = BoxDecorationDto();
      final decoration = attr.resolve(EmptyMixData);
      expect(decoration, const BoxDecoration());
      return const Placeholder();
    });
    test('resolve returns correct BoxDecoration with specific values', () {
      final attr = BoxDecorationDto(
          color: Colors.red.toDto(), gradient: linearGradientDto);
      final decoration = attr.resolve(EmptyMixData);
      expect(decoration.color, Colors.red);
      expect(decoration.gradient, linearGradient);
      return const Placeholder();
    });
    test('Equality holds when all properties are the same', () {
      final decoration1 = BoxDecorationDto(color: Colors.red.toDto());
      final decoration2 = BoxDecorationDto(color: Colors.red.toDto());
      expect(decoration1, decoration2);
    });
    test('Equality fails when properties are different', () {
      final decoration1 = BoxDecorationDto(color: Colors.red.toDto());
      final decoration2 = BoxDecorationDto(color: Colors.blue.toDto());
      expect(decoration1, isNot(decoration2));
    });
  });

  group('ShapeDecorationDto', () {
    test('merge returns merged object correctly', () {
      final decoration1 = ShapeDecorationDto(color: Colors.red.toDto());
      final decoration2 = ShapeDecorationDto(gradient: linearGradientDto);
      final merged = decoration1.merge(decoration2);
      expect(merged.color, decoration1.color);
      expect(merged.gradient, decoration2.gradient);
    });
    test('resolve returns correct ShapeDecoration with default values', () {
      const shapeDecoration = ShapeDecoration(shape: CircleBorder());
      const attr = ShapeDecorationDto(shape: CircleBorder());

      final decoration = attr.resolve(EmptyMixData);
      expect(decoration, shapeDecoration);
    });
    test('resolve returns correct ShapeDecoration with specific values', () {
      final boxShadow = RandomGenerator.boxShadow();

      final decoration1 = ShapeDecorationDto(
        gradient: linearGradientDto,
        shape: const CircleBorder(),
        shadows: [boxShadow.toDto()],
      );

      final resolvedValue = decoration1.resolve(EmptyMixData);

      expect(decoration1.gradient, linearGradientDto);
      expect(decoration1.color, isNull);
      expect(decoration1.shape, const CircleBorder());
      expect(decoration1.shadows, [boxShadow.toDto()]);

      expect(resolvedValue.gradient, linearGradient);
      expect(resolvedValue.color, isNull);
      expect(resolvedValue.shape, const CircleBorder());
      expect(resolvedValue.shadows, [boxShadow]);
    });
    test('Equality holds when all properties are the same', () {
      final decoration1 = ShapeDecorationDto(color: Colors.red.toDto());
      final decoration2 = ShapeDecorationDto(color: Colors.red.toDto());
      expect(decoration1, decoration2);
    });
    test('Equality fails when properties are different', () {
      final decoration1 = ShapeDecorationDto(color: Colors.red.toDto());
      final decoration2 = ShapeDecorationDto(color: Colors.blue.toDto());
      expect(decoration1, isNot(decoration2));
    });
  });
}
