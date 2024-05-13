import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/attribute_generator.dart';
import '../../../helpers/testing_utils.dart';

void main() {
  const linearGradient = LinearGradient(colors: Colors.accents);

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
        color: Colors.red.toDto(),
        gradient: linearGradientDto,
      );
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
    test('toBoxDecorationDto converts CircleBorder correctly', () {
      const shapeDecorationDto = ShapeDecorationDto(
        color: ColorDto(Colors.blue),
        shape: CircleBorderDto(
            side: BorderSideDto(color: ColorDto(Colors.red), width: 2.0)),
        gradient: LinearGradientDto(
            colors: [ColorDto(Colors.yellow), ColorDto(Colors.green)]),
        shadows: [BoxShadowDto(color: ColorDto(Colors.black), blurRadius: 4.0)],
      );

      final boxDecorationDto = shapeDecorationDto.toBoxDecorationDto();

      expect(
        boxDecorationDto.color,
        equals(
          const ColorDto(Colors.blue),
        ),
      );
      expect(boxDecorationDto.shape, equals(BoxShape.circle));
      expect(
          boxDecorationDto.border,
          equals(
            const BoxBorderDto.fromSide(
              BorderSideDto(color: ColorDto(Colors.red), width: 2.0),
            ),
          ));
      expect(
        boxDecorationDto.gradient,
        equals(
          const LinearGradientDto(
              colors: [ColorDto(Colors.yellow), ColorDto(Colors.green)]),
        ),
      );
      expect(
          boxDecorationDto.boxShadow,
          equals([
            const BoxShadowDto(color: ColorDto(Colors.black), blurRadius: 4.0)
          ]));
    });

    test('toBoxDecorationDto converts RoundedRectangleBorder correctly', () {
      final shapeDecorationDto = ShapeDecorationDto(
        color: const ColorDto(Colors.blue),
        shape: RoundedRectangleBorderDto(
          borderRadius: BorderRadiusGeometryDto.from(
            const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          side: const BorderSideDto(color: ColorDto(Colors.red), width: 2.0),
        ),
        gradient: const LinearGradientDto(
            colors: [ColorDto(Colors.yellow), ColorDto(Colors.green)]),
        shadows: const [
          BoxShadowDto(color: ColorDto(Colors.black), blurRadius: 4.0)
        ],
      );

      final boxDecorationDto = shapeDecorationDto.toBoxDecorationDto();

      expect(
        boxDecorationDto.color,
        equals(
          const ColorDto(Colors.blue),
        ),
      );
      expect(boxDecorationDto.shape, equals(BoxShape.rectangle));
      expect(
          boxDecorationDto.borderRadius,
          equals(
            BorderRadiusGeometryDto.from(
              BorderRadius.circular(10),
            ),
          ));
      expect(
          boxDecorationDto.border,
          equals(
            const BoxBorderDto.fromSide(
              BorderSideDto(color: ColorDto(Colors.red), width: 2.0),
            ),
          ));
      expect(
        boxDecorationDto.gradient,
        equals(
          const LinearGradientDto(
              colors: [ColorDto(Colors.yellow), ColorDto(Colors.green)]),
        ),
      );
      expect(
          boxDecorationDto.boxShadow,
          equals([
            const BoxShadowDto(color: ColorDto(Colors.black), blurRadius: 4.0)
          ]));
    });

    test(
        'toBoxDecorationDto returns original ShapeDecorationDto for unsupported ShapeBorder',
        () {
      final shapeDecorationDto = ShapeDecorationDto(
        color: const ColorDto(Colors.blue),
        shape: BeveledRectangleBorderDto(
          borderRadius: BorderRadiusGeometryDto.from(
            const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          side: const BorderSideDto(color: ColorDto(Colors.red), width: 2.0),
        ),
        gradient: const LinearGradientDto(
            colors: [ColorDto(Colors.yellow), ColorDto(Colors.green)]),
        shadows: const [
          BoxShadowDto(color: ColorDto(Colors.black), blurRadius: 4.0)
        ],
      );

      final boxDecorationDto = shapeDecorationDto.toBoxDecorationDto();

      expect(boxDecorationDto.color, equals(shapeDecorationDto.color));
      expect(boxDecorationDto.shape, isNull);
      expect(boxDecorationDto.borderRadius, isNull);
      expect(boxDecorationDto.border, isNull);
      expect(boxDecorationDto.gradient, equals(shapeDecorationDto.gradient));
      expect(boxDecorationDto.boxShadow, equals(shapeDecorationDto.boxShadow));
    });
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
      shape: const CircleBorderDto(),
      gradient: linearGradientDto,
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

  group('DecorationDto Merge Tests', () {
    const linearGradientDto = LinearGradientDto(
      colors: [ColorDto(Colors.red), ColorDto(Colors.blue)],
    );
    const otherLinearGradientDto = LinearGradientDto(
      colors: [ColorDto(Colors.yellow), ColorDto(Colors.green)],
    );

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
      spreadRadius: 10.0,
    );
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
        shape: RoundedRectangleBorderDto(),
        gradient: linearGradientDto,
        shadows: [boxShadowDto],
      );
      const shapeDeco2 = ShapeDecorationDto(
        color: ColorDto(Colors.blue),
        shape: BeveledRectangleBorderDto(),
        gradient: otherLinearGradientDto,
        shadows: [otherBoxShadowDto],
      );

      final merged = shapeDeco1.merge(shapeDeco2) as ShapeDecorationDto;

      expect(merged, isA<ShapeDecorationDto>());
      expect(merged.shape, isA<RoundedRectangleBorderDto>());
      expect(merged.color, const ColorDto(Colors.blue));
      expect(merged.gradient, otherLinearGradientDto);
      expect(merged.shadows, [otherBoxShadowDto]);
    });
  });

  group('toShapeDecorationDto', () {
    test('converts BoxShape.circle correctly', () {
      const boxDecorationDto = BoxDecorationDto(
        color: ColorDto(Colors.blue),
        shape: BoxShape.circle,
        border: BoxBorderDto.fromSide(
            BorderSideDto(color: ColorDto(Colors.red), width: 2.0)),
        gradient: LinearGradientDto(
            colors: [ColorDto(Colors.yellow), ColorDto(Colors.green)]),
        boxShadow: [
          BoxShadowDto(color: ColorDto(Colors.black), blurRadius: 4.0)
        ],
      );

      final shapeDecorationDto = boxDecorationDto.toShapeDecorationDto();

      expect(
        shapeDecorationDto.color,
        equals(
          const ColorDto(Colors.blue),
        ),
      );
      expect(
          shapeDecorationDto.shape,
          equals(
            const CircleBorderDto(
              side: BorderSideDto(color: ColorDto(Colors.red), width: 2.0),
            ),
          ));
      expect(
        shapeDecorationDto.gradient,
        equals(
          const LinearGradientDto(
              colors: [ColorDto(Colors.yellow), ColorDto(Colors.green)]),
        ),
      );
      expect(
          shapeDecorationDto.shadows,
          equals([
            const BoxShadowDto(color: ColorDto(Colors.black), blurRadius: 4.0)
          ]));
    });

    test('converts BoxShape.rectangle correctly', () {
      final boxDecorationDto = BoxDecorationDto(
        color: const ColorDto(Colors.blue),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadiusGeometryDto.from(BorderRadius.circular(10)),
        border: const BoxBorderDto.fromSide(
            BorderSideDto(color: ColorDto(Colors.red), width: 2.0)),
        gradient: const LinearGradientDto(
            colors: [ColorDto(Colors.yellow), ColorDto(Colors.green)]),
        boxShadow: const [
          BoxShadowDto(color: ColorDto(Colors.black), blurRadius: 4.0)
        ],
      );

      final shapeDecorationDto = boxDecorationDto.toShapeDecorationDto();

      expect(
        shapeDecorationDto.color,
        equals(
          const ColorDto(Colors.blue),
        ),
      );
      expect(
        shapeDecorationDto.shape,
        equals(RoundedRectangleBorderDto(
          borderRadius: BorderRadiusGeometryDto.from(BorderRadius.circular(10)),
          side: const BorderSideDto(color: ColorDto(Colors.red), width: 2.0),
        )),
      );
      expect(
        shapeDecorationDto.gradient,
        equals(
          const LinearGradientDto(
              colors: [ColorDto(Colors.yellow), ColorDto(Colors.green)]),
        ),
      );
      expect(
          shapeDecorationDto.shadows,
          equals([
            const BoxShadowDto(color: ColorDto(Colors.black), blurRadius: 4.0)
          ]));
    });

    test('handles null values correctly', () {
      const boxDecorationDto = BoxDecorationDto(
        color: null,
        shape: null,
        borderRadius: null,
        border: null,
        gradient: null,
        boxShadow: null,
      );

      final shapeDecorationDto = boxDecorationDto.toShapeDecorationDto();

      expect(shapeDecorationDto.color, isNull);
      expect(shapeDecorationDto.shape, isNull);
      expect(shapeDecorationDto.gradient, isNull);
      expect(shapeDecorationDto.shadows, isNull);
    });

    test('converts BoxShape.rectangle with uniform border correctly', () {
      const boxDecorationDto = BoxDecorationDto(
        color: ColorDto(Colors.blue),
        shape: BoxShape.rectangle,
        border: BoxBorderDto.fromSide(
          BorderSideDto(color: ColorDto(Colors.red), width: 2.0),
        ),
        gradient: LinearGradientDto(
            colors: [ColorDto(Colors.yellow), ColorDto(Colors.green)]),
        boxShadow: [
          BoxShadowDto(color: ColorDto(Colors.black), blurRadius: 4.0)
        ],
      );

      final shapeDecorationDto = boxDecorationDto.toShapeDecorationDto();

      expect(
        shapeDecorationDto.color,
        equals(
          const ColorDto(Colors.blue),
        ),
      );
      expect(
        shapeDecorationDto.shape,
        equals(const RoundedRectangleBorderDto(
          side: BorderSideDto(color: ColorDto(Colors.red), width: 2.0),
        )),
      );
      expect(
        shapeDecorationDto.gradient,
        equals(
          const LinearGradientDto(
            colors: [ColorDto(Colors.yellow), ColorDto(Colors.green)],
          ),
        ),
      );
      expect(
          shapeDecorationDto.shadows,
          equals([
            const BoxShadowDto(color: ColorDto(Colors.black), blurRadius: 4.0)
          ]));
    });

    test('throws assertion error for non-uniform border with BoxShape.circle',
        () {
      const boxDecorationDto = BoxDecorationDto(
        color: ColorDto(Colors.blue),
        shape: BoxShape.circle,
        border: BoxBorderDto(
          top: BorderSideDto(color: ColorDto(Colors.red), width: 2.0),
          bottom: BorderSideDto(color: ColorDto(Colors.green), width: 4.0),
        ),
      );

      expect(() => boxDecorationDto.toShapeDecorationDto(),
          throwsA(isA<AssertionError>()));
    });

    test(
        'throws assertion error for non-uniform border with BoxShape.rectangle',
        () {
      const boxDecorationDto = BoxDecorationDto(
        color: ColorDto(Colors.blue),
        shape: BoxShape.rectangle,
        border: BoxBorderDto(
          top: BorderSideDto(color: ColorDto(Colors.red), width: 2.0),
          bottom: BorderSideDto(color: ColorDto(Colors.green), width: 4.0),
        ),
      );

      expect(() => boxDecorationDto.toShapeDecorationDto(),
          throwsA(isA<AssertionError>()));
    });
  });
}
