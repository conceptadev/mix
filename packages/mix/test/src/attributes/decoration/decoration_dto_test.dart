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
  const boxShadowDto = BoxShadowMix(
    color: ColorDto(Colors.black),
    offset: Offset(1, 1),
    blurRadius: 5.0,
    spreadRadius: 5.0,
  );
  const otherBoxShadowDto = BoxShadowMix(
    color: ColorDto(Colors.black),
    offset: Offset(2, 2),
    blurRadius: 10.0,
    spreadRadius: 10.0,
  );

  group('BoxDecorationDto', () {
    test('merge returns merged object correctly', () {
      final decoration1 = BoxDecorationMix(color: Colors.red.toDto());
      final decoration2 = BoxDecorationMix(gradient: linearGradientDto);

      final merged = decoration1.merge(decoration2);
      expect(merged.color, decoration1.color);
      expect(merged.gradient, decoration2.gradient);
    });
    test('resolve returns correct BoxDecoration with default values', () {
      const attr = BoxDecorationMix();
      final decoration = attr.resolve(EmptyMixData);
      expect(decoration, const BoxDecoration());

      return const Placeholder();
    });
    test('resolve returns correct BoxDecoration with specific values', () {
      final attr = BoxDecorationMix(
        color: Colors.red.toDto(),
        gradient: linearGradientDto,
      );
      final decoration = attr.resolve(EmptyMixData);
      expect(decoration.color, Colors.red);
      expect(decoration.gradient, linearGradient);

      return const Placeholder();
    });
    test('Equality holds when all properties are the same', () {
      final decoration1 = BoxDecorationMix(color: Colors.red.toDto());
      final decoration2 = BoxDecorationMix(color: Colors.red.toDto());
      expect(decoration1, decoration2);
    });
    test('Equality fails when properties are different', () {
      final decoration1 = BoxDecorationMix(color: Colors.red.toDto());
      final decoration2 = BoxDecorationMix(color: Colors.blue.toDto());
      expect(decoration1, isNot(decoration2));
    });
  });

  group('ShapeDecorationDto', () {
    test('merge returns merged object correctly', () {
      final decoration1 = ShapeDecorationMix(color: Colors.red.toDto());
      final decoration2 = ShapeDecorationMix(gradient: linearGradientDto);
      final merged = decoration1.merge(decoration2);
      expect(merged.color, decoration1.color);
      expect(merged.gradient, decoration2.gradient);
    });
    test('resolve returns correct ShapeDecoration with default values', () {
      const shapeDecoration = ShapeDecoration(shape: CircleBorder());
      const attr = ShapeDecorationMix(shape: CircleBorderMix());

      final decoration = attr.resolve(EmptyMixData);
      expect(decoration, shapeDecoration);
    });
    test('resolve returns correct ShapeDecoration with specific values', () {
      final boxShadow = RandomGenerator.boxShadow();

      final decoration1 = ShapeDecorationMix(
        shape: const CircleBorderMix(),
        gradient: linearGradientDto,
        shadows: [boxShadow.toDto()],
      );

      final resolvedValue = decoration1.resolve(EmptyMixData);

      expect(decoration1.gradient, linearGradientDto);
      expect(decoration1.color, isNull);
      expect(decoration1.shape, const CircleBorderMix());
      expect(decoration1.shadows, [boxShadow.toDto()]);

      expect(resolvedValue.gradient, linearGradient);
      expect(resolvedValue.color, isNull);
      expect(resolvedValue.shape, const CircleBorder());
      expect(resolvedValue.shadows, [boxShadow]);
    });
    test('Equality holds when all properties are the same', () {
      final decoration1 = ShapeDecorationMix(color: Colors.red.toDto());
      final decoration2 = ShapeDecorationMix(color: Colors.red.toDto());
      expect(decoration1, decoration2);
    });
    test('Equality fails when properties are different', () {
      final decoration1 = ShapeDecorationMix(color: Colors.red.toDto());
      final decoration2 = ShapeDecorationMix(color: Colors.blue.toDto());
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

    test('BoxDecorationDto merges with another BoxDecorationDto', () {
      const boxDeco1 = BoxDecorationMix(
        color: ColorDto(Colors.red),
        gradient: linearGradientDto,
        boxShadow: [boxShadowDto],
      );
      const boxDeco2 = BoxDecorationMix(
        color: ColorDto(Colors.blue),
        gradient: otherLinearGradientDto,
        boxShadow: [otherBoxShadowDto],
      );

      final merged = boxDeco1.merge(boxDeco2);

      expect(merged, isA<BoxDecorationMix>());
      expect(merged.color, const ColorDto(Colors.blue));
      expect(merged.gradient!.stops, otherLinearGradientDto.stops);
      expect(merged.boxShadow, [otherBoxShadowDto]);
    });

    test('ShapeDecorationDto merges with another ShapeDecorationDto', () {
      const shapeDeco1 = ShapeDecorationMix(
        color: ColorDto(Colors.red),
        shape: RoundedRectangleBorderMix(),
        gradient: linearGradientDto,
        shadows: [boxShadowDto],
      );
      const shapeDeco2 = ShapeDecorationMix(
        color: ColorDto(Colors.blue),
        shape: BeveledRectangleBorderMix(),
        gradient: otherLinearGradientDto,
        shadows: [otherBoxShadowDto],
      );

      final merged = shapeDeco1.merge(shapeDeco2);

      expect(merged, isA<ShapeDecorationMix>());
      expect(merged.shape, isA<BeveledRectangleBorderMix>());
      expect(merged.color, const ColorDto(Colors.blue));
      expect(merged.gradient, otherLinearGradientDto);
      expect(merged.shadows, [otherBoxShadowDto]);
    });

    group('ShapeDecorationDto merge tests', () {
      test('Merge two ShapeDecorationDto', () {
        const shapeDeco1 = ShapeDecorationMix(
          color: ColorDto(Colors.red),
          shape: CircleBorderMix(),
          shadows: [boxShadowDto],
          image: DecorationImageMix(fit: BoxFit.contain),
        );
        const shapeDeco2 = ShapeDecorationMix(
          color: ColorDto(Colors.blue),
          gradient: LinearGradientDto(
            colors: [ColorDto(Colors.yellow), ColorDto(Colors.green)],
          ),
        );

        final merged = shapeDeco1.merge(shapeDeco2);

        expect(merged, isA<ShapeDecorationMix>());
        expect(merged.color, const ColorDto(Colors.blue));
        expect(merged.gradient, shapeDeco2.gradient);
        expect(merged.shape, shapeDeco1.shape);
        expect(merged.shadows, shapeDeco1.shadows);
        expect(merged.image, shapeDeco1.image);
      });

      test(
        'merge with a BoxDecoration when isMergeable true',
        () {
          final firstBorderRadius =
              const BorderRadius.all(Radius.circular(10)).toDto();
          final secondBorderRadius =
              const BorderRadius.all(Radius.circular(20)).toDto();
          final shapeDeco1 = ShapeDecorationMix(
            color: const ColorDto(Colors.red),
            shape: RoundedRectangleBorderMix(
              borderRadius: firstBorderRadius,
            ),
            shadows: const [boxShadowDto],
            image: const DecorationImageMix(fit: BoxFit.contain),
          );

          final boxDeco1 = BoxDecorationMix(
            color: const ColorDto(Colors.red),
            borderRadius: secondBorderRadius,
            boxShadow: const [otherBoxShadowDto],
            image: const DecorationImageMix(fit: BoxFit.contain),
          );
          final merged = DecorationMix.tryToMerge(shapeDeco1, boxDeco1)
              as ShapeDecorationMix;
          final shapeBorder = (merged.shape as RoundedRectangleBorderMix);

          expect(boxDeco1.isMergeable, true);
          expect(merged, isA<ShapeDecorationMix>());
          expect(merged.color, boxDeco1.color);
          expect(merged.shape,
              RoundedRectangleBorderMix(borderRadius: secondBorderRadius));
          expect(merged.shadows, boxDeco1.boxShadow);
          expect(merged.image, boxDeco1.image);
          expect(shapeBorder.borderRadius, boxDeco1.borderRadius);
        },
      );

      test('do not merge with a BoxDecoration when isMergeable false', () {
        const shapeDeco1 = ShapeDecorationMix(
          color: ColorDto(Colors.red),
          shape: StarBorderMix(),
          shadows: [boxShadowDto],
          image: DecorationImageMix(fit: BoxFit.contain),
        );

        const boxDeco1 = BoxDecorationMix(
          image: DecorationImageMix(fit: BoxFit.fill),
          backgroundBlendMode: BlendMode.clear,
        );

        final merged = DecorationMix.tryToMerge(shapeDeco1, boxDeco1);

        expect(boxDeco1.isMergeable, false);
        expect(merged, isA<BoxDecorationMix>());
        expect(merged?.color, shapeDeco1.color);
        expect(merged?.boxShadow, shapeDeco1.boxShadow);
        expect(merged?.image, boxDeco1.image);
      });
    });

    group('BoxDecorationDto merge tests', () {
      test('Merge two BoxDecorationDto', () {
        final firstBorderRadius =
            const BorderRadius.all(Radius.circular(10)).toDto();
        final secondBorderRadius =
            const BorderRadius.all(Radius.circular(20)).toDto();

        const borderSide = BorderSideMix(
          color: ColorDto(Colors.yellow),
          width: 1,
        );
        final boxDeco1 = BoxDecorationMix(
          color: const ColorDto(Colors.red),
          shape: BoxShape.circle,
          boxShadow: const [boxShadowDto],
          border: const BorderMix(
            top: borderSide,
          ),
          borderRadius: firstBorderRadius,
          image: const DecorationImageMix(fit: BoxFit.contain),
          backgroundBlendMode: BlendMode.clear,
        );
        final boxDeco2 = BoxDecorationMix(
          color: const ColorDto(Colors.blue),
          gradient: const LinearGradientDto(
            colors: [ColorDto(Colors.yellow), ColorDto(Colors.green)],
          ),
          border: const BorderMix(
            bottom: borderSide,
          ),
          borderRadius: secondBorderRadius,
          image: const DecorationImageMix(fit: BoxFit.cover),
          backgroundBlendMode: BlendMode.colorBurn,
        );

        final merged = boxDeco1.merge(boxDeco2);

        expect(merged, isA<BoxDecorationMix>());
        expect(merged.color, boxDeco2.color);
        expect(merged.gradient, boxDeco2.gradient);
        expect(merged.boxShadow, boxDeco1.boxShadow);
        expect(merged.border,
            const BorderMix(top: borderSide, bottom: borderSide));
        expect(merged.borderRadius, boxDeco2.borderRadius);
        expect(merged.image, boxDeco2.image);

        expect(merged.backgroundBlendMode, boxDeco2.backgroundBlendMode);
      });

      test('Merge ShapeDecorationDto when isMergeable is true', () {
        final firstBorderRadius =
            const BorderRadius.all(Radius.circular(10)).toDto();
        final secondBorderRadius =
            const BorderRadius.all(Radius.circular(20)).toDto();

        const borderSide = BorderSideMix(
          color: ColorDto(Colors.yellow),
          width: 1,
        );
        final boxDeco1 = BoxDecorationMix(
          color: const ColorDto(Colors.red),
          shape: BoxShape.circle,
          boxShadow: const [boxShadowDto],
          border: const BorderMix(
            top: borderSide,
          ),
          borderRadius: firstBorderRadius,
          image: const DecorationImageMix(fit: BoxFit.contain),
        );
        final shapeDeco1 = ShapeDecorationMix(
          color: const ColorDto(Colors.red),
          shape: RoundedRectangleBorderMix(
            borderRadius: secondBorderRadius,
          ),
          shadows: const [boxShadowDto],
          image: const DecorationImageMix(fit: BoxFit.contain),
        );

        final merged =
            DecorationMix.tryToMerge(boxDeco1, shapeDeco1) as BoxDecorationMix;

        expect(shapeDeco1.isMergeable, true);
        expect(merged, isA<BoxDecorationMix>());
        expect(merged.color, shapeDeco1.color);
        expect(merged.shape, BoxShape.rectangle);
        expect(merged.boxShadow, shapeDeco1.shadows);
        expect(merged.image, shapeDeco1.image);
        expect(merged.borderRadius, secondBorderRadius);
      });
    });
  });
}
