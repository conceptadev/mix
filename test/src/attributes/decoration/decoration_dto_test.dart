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
      expect(merged.shape, isA<BeveledRectangleBorderDto>());
      expect(merged.color, const ColorDto(Colors.blue));
      expect(merged.gradient, otherLinearGradientDto);
      expect(merged.shadows, [otherBoxShadowDto]);
    });

    test('ShapeDecorationDto merges with BoxDecorationDto', () {
      const shapeDeco = ShapeDecorationDto(
        color: ColorDto(Colors.red),
        shape: CircleBorderDto(),
        gradient: linearGradientDto,
        shadows: [boxShadowDto],
      );
      const boxDeco = BoxDecorationDto(
        color: ColorDto(Colors.blue),
        gradient: otherLinearGradientDto,
        boxShadow: [otherBoxShadowDto],
      );

      final merged = shapeDeco.merge(boxDeco) as BoxDecorationDto;

      expect(merged, isA<BoxDecorationDto>());
      expect(merged.shape, BoxShape.circle);
      expect(merged.color, const ColorDto(Colors.blue));
      expect(merged.gradient, otherLinearGradientDto);
      expect(merged.boxShadow, [otherBoxShadowDto]);
    });

    test('BoxDecorationDto merges with ShapeDecorationDto', () {
      const boxDeco = BoxDecorationDto(
        color: ColorDto(Colors.red),
        gradient: linearGradientDto,
        boxShadow: [boxShadowDto],
      );
      const shapeDeco = ShapeDecorationDto(
        color: ColorDto(Colors.blue),
        shape: RoundedRectangleBorderDto(),
        gradient: otherLinearGradientDto,
        shadows: [otherBoxShadowDto],
      );

      final merged = boxDeco.merge(shapeDeco) as ShapeDecorationDto;

      expect(merged, isA<ShapeDecorationDto>());
      expect(merged.shape, isA<RoundedRectangleBorderDto>());
      expect(merged.color, const ColorDto(Colors.blue));
      expect(merged.gradient, otherLinearGradientDto);
      expect(merged.shadows, [otherBoxShadowDto]);
    });
  });

  test('Advanced behavior', () {
    final boxDecorStyle = Style(
      $box.color(Colors.green),
      $box.border.all(color: Colors.red),
      $box.padding.vertical(5),
      $box.padding.horizontal(10),
    );

    final shapeDecorStyle = boxDecorStyle.add(
      $box.shapeDecoration.shape.circle(),
    );

    final ctx = MockBuildContext();

    final boxDecorSpec = BoxSpec.from(
      boxDecorStyle.of(ctx),
    ).decoration as BoxDecoration?;

    final shapeDecorSpec = BoxSpec.from(
      shapeDecorStyle.of(ctx),
    ).decoration as ShapeDecoration?;

    expect((boxDecorSpec!.color), Colors.green);
    expect((boxDecorSpec.border), isA<BoxBorder>());

    expect((shapeDecorSpec!.color), Colors.green);
    expect((shapeDecorSpec.shape), isA<CircleBorder>());
    expect(
      shapeDecorSpec.shape,
      const CircleBorder(
        side: BorderSide(color: Colors.red),
      ),
    );
  });

  group('DecorationMergeDtoStrategy', () {
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
    test('merges two BoxDecorationDto instances correctly', () {
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

      final merged = boxDeco1.merge(boxDeco2) as BoxDecorationDto;

      expect(merged, isA<BoxDecorationDto>());
      expect(merged.color, const ColorDto(Colors.blue));
      expect(merged.gradient, otherLinearGradientDto);
      expect(merged.boxShadow, [otherBoxShadowDto]);
    });

    test('merges two ShapeDecorationDto instances correctly', () {
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
      expect(merged.shape, isA<BeveledRectangleBorderDto>());
      expect(merged.color, const ColorDto(Colors.blue));
      expect(merged.gradient, otherLinearGradientDto);
      expect(merged.shadows, [otherBoxShadowDto]);
    });

    test('merges ShapeDecorationDto with BoxDecorationDto correctly', () {
      const shapeDeco = ShapeDecorationDto(
        color: ColorDto(Colors.red),
        shape: CircleBorderDto(),
        gradient: linearGradientDto,
        shadows: [boxShadowDto],
      );
      const boxDeco = BoxDecorationDto(
        color: ColorDto(Colors.blue),
        gradient: otherLinearGradientDto,
        boxShadow: [otherBoxShadowDto],
      );

      final merged = shapeDeco.merge(boxDeco) as BoxDecorationDto;

      expect(merged, isA<BoxDecorationDto>());
      expect(merged.shape, BoxShape.circle);
      expect(merged.color, const ColorDto(Colors.blue));
      expect(merged.gradient, otherLinearGradientDto);
      expect(merged.boxShadow, [otherBoxShadowDto]);
    });

    test('merges BoxDecorationDto with ShapeDecorationDto correctly', () {
      final borderDto = Border.all(color: Colors.blue).toDto();
      final boxDeco = BoxDecorationDto(
        color: Colors.red.toDto(),
        gradient: linearGradientDto,
        border: borderDto,
        boxShadow: const [boxShadowDto],
      );
      const shapeDeco = ShapeDecorationDto(
        color: ColorDto(Colors.blue),
        shape: RoundedRectangleBorderDto(),
        gradient: otherLinearGradientDto,
        shadows: [otherBoxShadowDto],
      );

      final merged = boxDeco.merge(shapeDeco) as ShapeDecorationDto;

      expect(merged, isA<ShapeDecorationDto>());
      expect(merged.shape, isA<RoundedRectangleBorderDto>());
      expect((merged.shape as RoundedRectangleBorderDto).side, borderDto.top);
      expect(merged.color, const ColorDto(Colors.blue));
      expect(merged.gradient, otherLinearGradientDto);
      expect(merged.shadows, [otherBoxShadowDto]);
    });

    test('throws MergeStrategyException for incompatible types', () {
      const boxDeco = BoxDecorationDto();
      const otherDto = _OtherDecorationDto();

      expect(
        () => boxDeco.merge(otherDto),
        throwsA(isA<UnimplementedError>()),
      );
    });
  });
}

class _OtherDecorationDto extends DecorationDto {
  const _OtherDecorationDto()
      : super(color: null, gradient: null, boxShadow: null);

  @override
  _OtherDecorationDto mergeDecoration(DecorationDto other) {
    return this;
  }

  @override
  @override
  Decoration resolve(MixData mix) {
    throw UnimplementedError();
  }

  @override
  get props => [];
}
