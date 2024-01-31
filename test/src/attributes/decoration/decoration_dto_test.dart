import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/border/shape_border_dto.dart';
import 'package:mix/src/core/extensions/color_ext.dart';

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
      const attr = ShapeDecorationDto(shape: CircleBorderDto());

      final decoration = attr.resolve(EmptyMixData);
      expect(decoration, shapeDecoration);
    });
    test('resolve returns correct ShapeDecoration with specific values', () {
      final boxShadow = RandomGenerator.boxShadow();

      final decoration1 = ShapeDecorationDto(
        gradient: linearGradientDto,
        shape: const CircleBorderDto(),
        shadows: [boxShadow.toDto()],
      );

      final resolvedValue = decoration1.resolve(EmptyMixData);

      expect(decoration1.gradient, linearGradientDto);
      expect(decoration1.color, isNull);
      expect(decoration1.shape, const CircleBorderDto());
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

  group('DecorationDto Merge Tests', () {
    const linearGradientDto = LinearGradientDto(
        colors: [ColorDto(Colors.red), ColorDto(Colors.blue)]);
    const otherLinearGradientDto = LinearGradientDto(
        colors: [ColorDto(Colors.yellow), ColorDto(Colors.green)]);

    const boxShadowDto = BoxShadowDto(
      color: ColorDto(Colors.black),
      offset: Offset(1, 1),
      blurRadius: 5.0,
      spreadRadius: 5.0,
    );
    const otherBoxShadowDto = BoxShadowDto(
        color: ColorDto(Colors.black),
        offset: Offset(2, 2),
        blurRadius: 10.0,
        spreadRadius: 10.0);
    test('BoxDecorationDto merges with another BoxDecorationDto', () {
      const boxDeco1 = BoxDecorationDto(
        color: ColorDto(Colors.red),
        gradient: linearGradientDto,
        boxShadow: [boxShadowDto],
      );
      const boxDeco2 = BoxDecorationDto(
        color: ColorDto(Colors.blue),
        gradient: otherLinearGradientDto,
        boxShadow: [otherBoxShadowDto],
      );

      final merged = boxDeco1.merge(boxDeco2);

      expect(merged, isA<BoxDecorationDto>());
      expect(merged.color, const ColorDto(Colors.blue));
      expect(merged.gradient, otherLinearGradientDto);
      expect(merged.boxShadow, [otherBoxShadowDto]);
    });

    // Test for merging two ShapeDecorationDto instances
    test('ShapeDecorationDto merges with another ShapeDecorationDto', () {
      const shapeDeco1 = ShapeDecorationDto(
        color: ColorDto(Colors.red),
        gradient: linearGradientDto,
        shadows: [boxShadowDto],
        shape: RoundedRectangleBorderDto(),
      );
      const shapeDeco2 = ShapeDecorationDto(
        color: ColorDto(Colors.blue),
        gradient: otherLinearGradientDto,
        shadows: [otherBoxShadowDto],
        shape: BeveledRectangleBorderDto(),
      );

      final merged = shapeDeco1.merge(shapeDeco2) as ShapeDecorationDto;

      expect(merged, isA<ShapeDecorationDto>());
      expect(merged.shape, isA<BeveledRectangleBorderDto>());
      expect(merged.color, const ColorDto(Colors.blue));
      expect(merged.gradient, otherLinearGradientDto);
      expect(merged.shadows, [otherBoxShadowDto]);
    });

    // Test merging BoxDecorationDto with ShapeDecorationDto
    test('BoxDecorationDto merge with ShapeDecorationDto', () {
      const boxDeco = BoxDecorationDto(
        color: ColorDto(Colors.red),
        gradient: linearGradientDto,
        boxShadow: [boxShadowDto],
      );

      const shapeDeco = ShapeDecorationDto(
        color: ColorDto(Colors.blue),
        shape: RoundedRectangleBorderDto(),
      );

      final merged = boxDeco.merge(shapeDeco) as ShapeDecorationDto;

      expect(merged, isA<ShapeDecorationDto>());
      expect(merged.shape, isA<RoundedRectangleBorderDto>());
      expect(merged.color, const ColorDto(Colors.blue));
      expect(merged.gradient, linearGradientDto);
      expect(merged.shadows, [boxShadowDto]);
    });

    // Test merging ShapeDecorationDto with BoxDecorationDto
    test('ShapeDecorationDto merge with BoxDecorationDto', () {
      const shapeDeco = ShapeDecorationDto(
        color: ColorDto(Colors.red),
        gradient: linearGradientDto,
        shadows: [boxShadowDto],
      );

      const boxDeco = BoxDecorationDto(
        color: ColorDto(Colors.blue),
        shape: BoxShape.circle,
      );

      final merged = shapeDeco.merge(boxDeco) as BoxDecorationDto;

      expect(merged, isA<BoxDecorationDto>());
      expect(merged.color, const ColorDto(Colors.blue));
      expect(merged.gradient, linearGradientDto);
      expect(merged.boxShadow, [boxShadowDto]);
      expect(merged.shape, BoxShape.circle);
    });

    test('ShapeDecorationDto cannot merge with BoxDecoration', () {
      const shapeDeco = ShapeDecorationDto(
        color: ColorDto(Colors.red),
        gradient: linearGradientDto,
        shadows: [boxShadowDto],
        // Cannot merge because it has shape
        shape: RoundedRectangleBorderDto(),
      );

      const boxDeco = BoxDecorationDto(
        color: ColorDto(Colors.blue),
        shape: BoxShape.circle,
      );

      expect(() => shapeDeco.merge(boxDeco), throwsAssertionError);
    });
  });
}
