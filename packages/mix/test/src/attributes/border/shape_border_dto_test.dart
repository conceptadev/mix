import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('RoundedRectangleBorderDto', () {
    test('merge should combine two RoundedRectangleBorderDtos correctly', () {
      const original = RoundedRectangleBorderMix(
        borderRadius: BorderRadiusMix(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(10),
        ),
        side: BorderSideMix(color: ColorMix(Colors.red), width: 1.0),
      );
      final merged = original.merge(
        const RoundedRectangleBorderMix(
          borderRadius: BorderRadiusMix(
            topLeft: Radius.circular(25),
          ),
          side: BorderSideMix(color: ColorMix(Colors.blue), width: 2.0),
        ),
      );

      expect(merged.borderRadius!.topLeft, const Radius.circular(25));
      expect(merged.borderRadius!.topRight, const Radius.circular(20));
      expect(merged.borderRadius!.bottomLeft, const Radius.circular(5));
      expect(merged.borderRadius!.bottomRight, const Radius.circular(10));

      expect(merged.side!.color, const ColorMix(Colors.blue));
      expect(merged.side!.width, 2.0);
    });

    test(
      'resolve should create a RoundedRectangleBorder with the correct values',
      () {
        const dto = RoundedRectangleBorderMix(
          borderRadius: BorderRadiusMix(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(10),
          ),
          side: BorderSideMix(color: ColorMix(Colors.red), width: 1.0),
        );

        final roundedRectangleBorder = dto.resolve(EmptyMixData);

        final borderRadius =
            roundedRectangleBorder.borderRadius as BorderRadius;

        expect(borderRadius.topLeft, const Radius.circular(15));
        expect(borderRadius.topRight, const Radius.circular(20));
        expect(borderRadius.bottomLeft, const Radius.circular(5));
        expect(borderRadius.bottomRight, const Radius.circular(10));

        expect(roundedRectangleBorder.side.color, Colors.red);
        expect(roundedRectangleBorder.side.width, 1.0);
      },
    );
  });

  // CircleBorderDto
  group('CircleBorderDto', () {
    test('merge should combine two CircleBorderDtos correctly', () {
      const original = CircleBorderMix(
        side: BorderSideMix(color: ColorMix(Colors.red), width: 1.0),
        eccentricity: 0.5,
      );
      final merged = original.merge(
        const CircleBorderMix(
          side: BorderSideMix(color: ColorMix(Colors.blue), width: 2.0),
          eccentricity: 0.75,
        ),
      );

      expect(merged.eccentricity, 0.75);
      expect(merged.side!.color, const ColorMix(Colors.blue));
      expect(merged.side!.width, 2.0);
    });

    test('resolve should create a CircleBorder with the correct values', () {
      const dto = CircleBorderMix(
        side: BorderSideMix(color: ColorMix(Colors.red), width: 1.0),
        eccentricity: 0.5,
      );

      final circleBorder = dto.resolve(EmptyMixData);

      expect(circleBorder.eccentricity, 0.5);
      expect(circleBorder.side.color, Colors.red);
      expect(circleBorder.side.width, 1.0);
    });
  });

  // BeveledRectangleBorderDto
  group('BeveledRectangleBorderDto', () {
    test('merge should combine two BeveledRectangleBorderDtos correctly', () {
      const original = BeveledRectangleBorderMix(
        borderRadius: BorderRadiusMix(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(10),
        ),
        side: BorderSideMix(color: ColorMix(Colors.red), width: 1.0),
      );
      final merged = original.merge(
        const BeveledRectangleBorderMix(
          borderRadius: BorderRadiusMix(
            topLeft: Radius.circular(25),
          ),
          side: BorderSideMix(color: ColorMix(Colors.blue), width: 2.0),
        ),
      );

      expect(merged.borderRadius!.topLeft, const Radius.circular(25));
      expect(merged.borderRadius!.topRight, const Radius.circular(20));
      expect(merged.borderRadius!.bottomLeft, const Radius.circular(5));
      expect(merged.borderRadius!.bottomRight, const Radius.circular(10));

      expect(merged.side!.color, const ColorMix(Colors.blue));
      expect(merged.side!.width, 2.0);
    });

    test(
      'resolve should create a BeveledRectangleBorder with the correct values',
      () {
        const dto = BeveledRectangleBorderMix(
          borderRadius: BorderRadiusMix(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(10),
          ),
          side: BorderSideMix(color: ColorMix(Colors.red), width: 1.0),
        );

        final beveledRectangleBorder = dto.resolve(EmptyMixData);

        final borderRadius =
            beveledRectangleBorder.borderRadius as BorderRadius;

        expect(borderRadius.topLeft, const Radius.circular(15));
        expect(borderRadius.topRight, const Radius.circular(20));
        expect(borderRadius.bottomLeft, const Radius.circular(5));
        expect(borderRadius.bottomRight, const Radius.circular(10));

        expect(beveledRectangleBorder.side.color, Colors.red);
        expect(beveledRectangleBorder.side.width, 1.0);
      },
    );
  });

  // StadiumBorderDto
  group('StadiumBorderDto', () {
    test('merge should combine two StadiumBorderDtos correctly', () {
      const original = StadiumBorderMix(
        side: BorderSideMix(color: ColorMix(Colors.red), width: 1.0),
      );
      final merged = original.merge(
        const StadiumBorderMix(
          side: BorderSideMix(color: ColorMix(Colors.blue), width: 2.0),
        ),
      );

      expect(merged.side!.color, const ColorMix(Colors.blue));
      expect(merged.side!.width, 2.0);
    });

    test('resolve should create a StadiumBorder with the correct values', () {
      const dto = StadiumBorderMix(
        side: BorderSideMix(color: ColorMix(Colors.red), width: 1.0),
      );

      final stadiumBorder = dto.resolve(EmptyMixData);

      expect(stadiumBorder.side.color, Colors.red);
      expect(stadiumBorder.side.width, 1.0);
    });
  });

  // ContinuousRectangleBorderDto
  group('ContinuousRectangleBorderDto', () {
    test(
      'merge should combine two ContinuousRectangleBorderDtos correctly',
      () {
        const original = ContinuousRectangleBorderMix(
          borderRadius: BorderRadiusMix(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(10),
          ),
          side: BorderSideMix(color: ColorMix(Colors.red), width: 1.0),
        );
        final merged = original.merge(
          const ContinuousRectangleBorderMix(
            borderRadius: BorderRadiusMix(
              topLeft: Radius.circular(25),
            ),
            side: BorderSideMix(color: ColorMix(Colors.blue), width: 2.0),
          ),
        );

        final borderRadius = merged.borderRadius as BorderRadiusMix;

        expect(borderRadius.topLeft, const Radius.circular(25));
        expect(borderRadius.topRight, const Radius.circular(20));
        expect(borderRadius.bottomLeft, const Radius.circular(5));
        expect(borderRadius.bottomRight, const Radius.circular(10));

        expect(merged.side!.color, const ColorMix(Colors.blue));
        expect(merged.side!.width, 2.0);
      },
    );

    test(
      'resolve should create a ContinuousRectangleBorder with the correct values',
      () {
        const dto = ContinuousRectangleBorderMix(
          borderRadius: BorderRadiusMix(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(10),
          ),
          side: BorderSideMix(color: ColorMix(Colors.red), width: 1.0),
        );

        final continuousRectangleBorder = dto.resolve(EmptyMixData);

        final borderRadius =
            continuousRectangleBorder.borderRadius as BorderRadius;

        expect(borderRadius.topLeft, const Radius.circular(15));
        expect(borderRadius.topRight, const Radius.circular(20));
        expect(borderRadius.bottomLeft, const Radius.circular(5));
        expect(borderRadius.bottomRight, const Radius.circular(10));

        expect(continuousRectangleBorder.side.color, Colors.red);
        expect(continuousRectangleBorder.side.width, 1.0);
      },
    );
  });

  // Tests for ShapeBorderDto
  group('ShapeBorderDto', () {
    test(
        'maybeFrom factory method should create the correct ShapeBorderDto subclass or return null',
        () {
      const roundedRectangleBorder = RoundedRectangleBorder();
      const circleBorder = CircleBorder();
      const beveledRectangleBorder = BeveledRectangleBorder();
      const continuousRectangleBorder = ContinuousRectangleBorder();
      const stadiumBorder = StadiumBorder();

      expect(roundedRectangleBorder.toDto(), isA<RoundedRectangleBorderMix>());
      expect(circleBorder.toDto(), isA<CircleBorderMix>());
      expect(beveledRectangleBorder.toDto(), isA<BeveledRectangleBorderMix>());
      expect(continuousRectangleBorder.toDto(),
          isA<ContinuousRectangleBorderMix>());
      expect(stadiumBorder.toDto(), isA<StadiumBorderMix>());
    });
  });

  // Tests for OutlinedBorderDto
  group('OutlinedBorderDto', () {
    test(
        'from factory method should create the correct OutlinedBorderDto subclass',
        () {
      const roundedRectangleBorder = RoundedRectangleBorder();
      const circleBorder = CircleBorder();
      const beveledRectangleBorder = BeveledRectangleBorder();
      const continuousRectangleBorder = ContinuousRectangleBorder();
      const stadiumBorder = StadiumBorder();

      expect(roundedRectangleBorder.toDto(), isA<RoundedRectangleBorderMix>());
      expect(circleBorder.toDto(), isA<CircleBorderMix>());
      expect(beveledRectangleBorder.toDto(), isA<BeveledRectangleBorderMix>());
      expect(continuousRectangleBorder.toDto(),
          isA<ContinuousRectangleBorderMix>());
      expect(stadiumBorder.toDto(), isA<StadiumBorderMix>());
    });

    test('resolve method should create the correct OutlinedBorder instance',
        () {
      const roundedRectangleBorderDto = RoundedRectangleBorderMix();
      const circleBorderDto = CircleBorderMix();
      const beveledRectangleBorderDto = BeveledRectangleBorderMix();
      const continuousRectangleBorderDto = ContinuousRectangleBorderMix();
      const stadiumBorderDto = StadiumBorderMix();

      expect(roundedRectangleBorderDto.resolve(EmptyMixData),
          isA<RoundedRectangleBorder>());
      expect(circleBorderDto.resolve(EmptyMixData), isA<CircleBorder>());
      expect(beveledRectangleBorderDto.resolve(EmptyMixData),
          isA<BeveledRectangleBorder>());
      expect(continuousRectangleBorderDto.resolve(EmptyMixData),
          isA<ContinuousRectangleBorder>());
      expect(stadiumBorderDto.resolve(EmptyMixData), isA<StadiumBorder>());
    });
  });

  // Additional tests for RoundedRectangleBorderDto
  group('RoundedRectangleBorderDto', () {
    test(
        'from factory method should create RoundedRectangleBorderDto from RoundedRectangleBorder',
        () {
      final roundedRectangleBorder = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.red),
      );

      final roundedRectangleBorderDto = roundedRectangleBorder.toDto();

      expect(roundedRectangleBorderDto.borderRadius,
          equals(BorderRadius.circular(10).toDto()));
      expect(roundedRectangleBorderDto.side,
          equals(const BorderSide(color: Colors.red).toDto()));
    });

    test('merge method should handle null values correctly', () {
      final roundedRectangleBorderDto = RoundedRectangleBorderMix(
        borderRadius: BorderRadius.circular(10).toDto(),
        side: const BorderSide(color: Colors.red).toDto(),
      );

      final mergedDto = roundedRectangleBorderDto.merge(null);

      expect(mergedDto, equals(roundedRectangleBorderDto));
    });
  });

  // Additional tests for CircleBorderDto
  group('CircleBorderDto', () {
    test('from factory method should create CircleBorderDto from CircleBorder',
        () {
      const circleBorder = CircleBorder(
        side: BorderSide(color: Colors.blue),
        eccentricity: 0.8,
      );

      final circleBorderDto = circleBorder.toDto();

      expect(circleBorderDto.side,
          equals(const BorderSide(color: Colors.blue).toDto()));
      expect(circleBorderDto.eccentricity, equals(0.8));
    });

    test('merge method should handle null values correctly', () {
      final circleBorderDto = CircleBorderMix(
        side: const BorderSide(color: Colors.blue).toDto(),
        eccentricity: 0.8,
      );

      final mergedDto = circleBorderDto.merge(null);

      expect(mergedDto, equals(circleBorderDto));
    });
  });

  // Additional tests for BeveledRectangleBorderDto
  group('BeveledRectangleBorderDto', () {
    test(
        'from factory method should create BeveledRectangleBorderDto from BeveledRectangleBorder',
        () {
      final beveledRectangleBorder = BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.green),
      );

      final beveledRectangleBorderDto = beveledRectangleBorder.toDto();

      expect(beveledRectangleBorderDto.borderRadius,
          equals(BorderRadius.circular(10).toDto()));
      expect(beveledRectangleBorderDto.side,
          equals(const BorderSide(color: Colors.green).toDto()));
    });

    test('merge method should handle null values correctly', () {
      final beveledRectangleBorderDto = BeveledRectangleBorderMix(
        borderRadius: BorderRadius.circular(10).toDto(),
        side: const BorderSide(color: Colors.green).toDto(),
      );

      final mergedDto = beveledRectangleBorderDto.merge(null);

      expect(mergedDto, equals(beveledRectangleBorderDto));
    });
  });

  // Additional tests for ContinuousRectangleBorderDto
  group('ContinuousRectangleBorderDto', () {
    test(
        'from factory method should create ContinuousRectangleBorderDto from ContinuousRectangleBorder',
        () {
      final continuousRectangleBorder = ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.orange),
      );

      final continuousRectangleBorderDto = continuousRectangleBorder.toDto();

      expect(continuousRectangleBorderDto.borderRadius,
          equals(BorderRadius.circular(10).toDto()));
      expect(continuousRectangleBorderDto.side,
          equals(const BorderSide(color: Colors.orange).toDto()));
    });

    test('merge method should handle null values correctly', () {
      final continuousRectangleBorderDto = ContinuousRectangleBorderMix(
        borderRadius: BorderRadius.circular(10).toDto(),
        side: const BorderSide(color: Colors.orange).toDto(),
      );

      final mergedDto = continuousRectangleBorderDto.merge(null);

      expect(mergedDto, equals(continuousRectangleBorderDto));
    });
  });

  // Additional tests for StadiumBorderDto
  group('StadiumBorderDto', () {
    test(
        'from factory method should create StadiumBorderDto from StadiumBorder',
        () {
      const stadiumBorder = StadiumBorder(
        side: BorderSide(color: Colors.purple),
      );

      final stadiumBorderDto = stadiumBorder.toDto();

      expect(stadiumBorderDto.side,
          equals(const BorderSide(color: Colors.purple).toDto()));
    });

    test('merge method should handle null values correctly', () {
      final stadiumBorderDto = StadiumBorderMix(
        side: const BorderSide(color: Colors.purple).toDto(),
      );

      final mergedDto = stadiumBorderDto.merge(null);

      expect(mergedDto, equals(stadiumBorderDto));
    });
  });

  // Additional tests for StarBorderDto
  group('StarBorderDto', () {
    test('from factory method should create StarBorderDto from StarBorder', () {
      const starBorder = StarBorder(
        side: BorderSide(color: Colors.teal),
        points: 5,
        innerRadiusRatio: 0.5,
        pointRounding: 0.2,
        valleyRounding: 0.1,
        rotation: 0.3,
        squash: 0.4,
      );

      final starBorderDto = starBorder.toDto();

      expect(starBorderDto.side,
          equals(const BorderSide(color: Colors.teal).toDto()));
      expect(starBorderDto.points, equals(5));
      expect(starBorderDto.innerRadiusRatio, equals(0.5));
      expect(starBorderDto.pointRounding, equals(0.2));
      expect(starBorderDto.valleyRounding, equals(0.1));
      expect(starBorderDto.rotation, equals(0.3));
      expect(starBorderDto.squash, equals(0.4));
    });

    test('merge method should handle null values correctly', () {
      final starBorderDto = StarBorderMix(
        side: const BorderSide(color: Colors.teal).toDto(),
        points: 5,
        innerRadiusRatio: 0.5,
        pointRounding: 0.2,
        valleyRounding: 0.1,
        rotation: 0.3,
        squash: 0.4,
      );

      final mergedDto = starBorderDto.merge(null);

      expect(mergedDto, equals(starBorderDto));
    });
  });

  // Additional tests for LinearBorderDto
  group('LinearBorderDto', () {
    test('from factory method should create LinearBorderDto from LinearBorder',
        () {
      const linearBorder = LinearBorder(
        side: BorderSide(color: Colors.brown),
        start: LinearBorderEdge(size: 0.1, alignment: 0.1),
        end: LinearBorderEdge(size: 0.2, alignment: 0.2),
        top: LinearBorderEdge(size: 0.3, alignment: 0.3),
        bottom: LinearBorderEdge(size: 0.4, alignment: 0.4),
      );

      final linearBorderDto = linearBorder.toDto();

      expect(linearBorderDto.side,
          equals(const BorderSide(color: Colors.brown).toDto()));
      expect(linearBorderDto.start,
          equals(const LinearBorderEdge(size: 0.1, alignment: 0.1).toDto()));
      expect(linearBorderDto.end,
          equals(const LinearBorderEdge(size: 0.2, alignment: 0.2).toDto()));
      expect(linearBorderDto.top,
          equals(const LinearBorderEdge(size: 0.3, alignment: 0.3).toDto()));
      expect(linearBorderDto.bottom,
          equals(const LinearBorderEdge(size: 0.4, alignment: 0.4).toDto()));
    });

    test('merge method should handle null values correctly', () {
      final linearBorderDto = LinearBorderMix(
        side: const BorderSide(color: Colors.brown).toDto(),
        start: const LinearBorderEdge(size: 0.1, alignment: 0.1).toDto(),
        end: const LinearBorderEdge(size: 0.2, alignment: 0.2).toDto(),
        top: const LinearBorderEdge(size: 0.3, alignment: 0.3).toDto(),
        bottom: const LinearBorderEdge(size: 0.4, alignment: 0.4).toDto(),
      );

      final mergedDto = linearBorderDto.merge(null);

      expect(mergedDto, equals(linearBorderDto));
    });

    // Additional tests for LinearBorderEdgeDto
    group('LinearBorderEdgeDto', () {
      test(
          'from factory method should create LinearBorderEdgeDto from LinearBorderEdge',
          () {
        const linearBorderEdge = LinearBorderEdge(size: 1.0, alignment: 0.1);

        final linearBorderEdgeDto = linearBorderEdge.toDto();

        expect(linearBorderEdgeDto.size, equals(1.0));
        expect(linearBorderEdgeDto.alignment, equals(0.1));
      });

      test('merge method should handle null values correctly', () {
        const linearBorderEdgeDto =
            LinearBorderEdgeMix(size: 1.0, alignment: 0.1);

        final mergedDto = linearBorderEdgeDto.merge(null);

        expect(mergedDto, equals(linearBorderEdgeDto));
      });

      // test equality
      test('== should return true if two LinearBorderEdgeDto are equal', () {
        const linearBorderEdgeDto1 =
            LinearBorderEdgeMix(size: 1.0, alignment: 0.1);
        const linearBorderEdgeDto2 =
            LinearBorderEdgeMix(size: 1.0, alignment: 0.1);

        expect(linearBorderEdgeDto1, equals(linearBorderEdgeDto2));
      });
    });

    // Additional tests for ShapeBorderUtility
    group('ShapeBorderUtility', () {
      test('should create utility instances for each shape border type', () {
        final shapeBorderUtility =
            ShapeBorderMixUtility(UtilityTestAttribute.new);

        expect(shapeBorderUtility.roundedRectangle,
            isA<RoundedRectangleBorderMixUtility>());
        expect(shapeBorderUtility.circle, isA<CircleBorderUtility>());
        expect(shapeBorderUtility.beveledRectangle,
            isA<BeveledRectangleBorderUtility>());
        expect(shapeBorderUtility.stadium, isA<StadiumBorderUtility>());
        expect(shapeBorderUtility.continuousRectangle,
            isA<ContinuousRectangleBorderUtility>());
      });
    });
  });

  group('ShapeBorderDto.tryToMerge', () {
    test('should return null when both inputs are null', () {
      final result = ShapeBorderMix.tryToMerge(null, null);
      expect(result, isNull);
    });

    test('should return the non-null input when one input is null', () {
      const dto = RoundedRectangleBorderMix();
      expect(ShapeBorderMix.tryToMerge(dto, null), equals(dto));
      expect(ShapeBorderMix.tryToMerge(null, dto), equals(dto));
    });

    test(
        'should return the second input when both inputs are not OutlinedBorderDto',
        () {
      const dto1 = CircleBorderMix();
      const dto2 = StarBorderMix();
      expect(ShapeBorderMix.tryToMerge(dto1, dto2), equals(dto2));
    });

    test(
        'should call OutlinedBorderDto.tryToMerge when both inputs are OutlinedBorderDto',
        () {
      const dto1 = RoundedRectangleBorderMix(
          borderRadius: BorderRadiusMix(topLeft: Radius.circular(10)));
      final dto2 = RoundedRectangleBorderMix(
          side: BorderSideMix(color: Colors.red.toDto()));
      final expectedResult = RoundedRectangleBorderMix(
        borderRadius: const BorderRadiusMix(topLeft: Radius.circular(10)),
        side: BorderSideMix(color: Colors.red.toDto()),
      );
      expect(ShapeBorderMix.tryToMerge(dto1, dto2), equals(expectedResult));
    });
  });

  group('OutlinedBorderDto.tryToMerge', () {
    test('should return null when both inputs are null', () {
      final result = OutlinedBorderMix.tryToMerge(null, null);
      expect(result, isNull);
    });

    test('should return the non-null input when one input is null', () {
      const dto = RoundedRectangleBorderMix();
      expect(OutlinedBorderMix.tryToMerge(dto, null), equals(dto));
      expect(OutlinedBorderMix.tryToMerge(null, dto), equals(dto));
    });

    test('should call _exhaustiveMerge when both inputs are not null', () {
      const dto1 = RoundedRectangleBorderMix(
          borderRadius: BorderRadiusMix(topLeft: Radius.circular(10)));
      final dto2 = RoundedRectangleBorderMix(
          side: BorderSideMix(color: Colors.red.toDto()));
      final expectedResult = RoundedRectangleBorderMix(
        borderRadius: const BorderRadiusMix(topLeft: Radius.circular(10)),
        side: BorderSideMix(color: Colors.red.toDto()),
      );
      expect(OutlinedBorderMix.tryToMerge(dto1, dto2), equals(expectedResult));
    });
  });
  group('RoundedRectangleBorderDto', () {
    test(
        'adapt method should return the same instance if input is RoundedRectangleBorderDto',
        () {
      const dtoA = RoundedRectangleBorderMix(
        borderRadius: BorderRadiusMix(topLeft: Radius.circular(10)),
        side: BorderSideMix(width: 2.0),
      );
      const dtoB = RoundedRectangleBorderMix(
        borderRadius: BorderRadiusMix(topLeft: Radius.circular(20)),
        side: BorderSideMix(width: 4.0),
      );
      expect(dtoA.adapt(dtoB), equals(dtoB));
    });

    test(
        'adapt method should create a new instance from other OutlinedBorderDto',
        () {
      const dtoA = RoundedRectangleBorderMix();
      const dtoB = CircleBorderMix(side: BorderSideMix(width: 3.0));
      final result = dtoA.adapt(dtoB);
      expect(result, isA<RoundedRectangleBorderMix>());
      expect(result.side, equals(dtoB.side));
      expect(result.borderRadius, isNull);
    });
  });

  group('BeveledRectangleBorderDto', () {
    test(
        'adapt method should return the same instance if input is BeveledRectangleBorderDto',
        () {
      const dtoA = BeveledRectangleBorderMix(
        borderRadius: BorderRadiusMix(topLeft: Radius.circular(5)),
        side: BorderSideMix(width: 1.5),
      );
      const dtoB = BeveledRectangleBorderMix(
        borderRadius: BorderRadiusMix(topLeft: Radius.circular(5)),
        side: BorderSideMix(width: 3),
      );
      expect(dtoA.adapt(dtoB), equals(dtoB));
    });

    test(
        'adapt method should create a new instance from other OutlinedBorderDto',
        () {
      const dtoA = BeveledRectangleBorderMix();
      const dtoB = StadiumBorderMix(side: BorderSideMix(width: 2.5));
      final result = dtoA.adapt(dtoB);
      expect(result, isA<BeveledRectangleBorderMix>());
      expect(result.side, equals(dtoB.side));
      expect(result.borderRadius, isNull);
    });
  });

  group('ContinuousRectangleBorderDto', () {
    test(
        'adapt method should return the same instance if input is ContinuousRectangleBorderDto',
        () {
      const dtoA = ContinuousRectangleBorderMix(
        borderRadius: BorderRadiusMix(topLeft: Radius.circular(8)),
        side: BorderSideMix(width: 1.2),
      );
      const dtoB = ContinuousRectangleBorderMix(
        borderRadius: BorderRadiusMix(topLeft: Radius.circular(16)),
        side: BorderSideMix(width: 3),
      );
      expect(dtoA.adapt(dtoB), equals(dtoB));
    });

    test(
        'adapt method should create a new instance from other OutlinedBorderDto',
        () {
      const dtoA = ContinuousRectangleBorderMix();
      const dtoB = RoundedRectangleBorderMix(
        side: BorderSideMix(width: 1.8),
        borderRadius: BorderRadiusMix(
          topLeft: Radius.circular(10),
        ),
      );
      final result = dtoA.adapt(dtoB);
      expect(result, isA<ContinuousRectangleBorderMix>());
      expect(result.side, equals(dtoB.side));
      expect(result.borderRadius, equals(dtoB.borderRadius));
    });
  });

  group('CircleBorderDto', () {
    test(
        'adapt method should return the same instance if input is CircleBorderDto',
        () {
      const dtoA =
          CircleBorderMix(side: BorderSideMix(width: 2.2), eccentricity: 0.5);
      const dtoB =
          CircleBorderMix(side: BorderSideMix(width: 22), eccentricity: 0.7);
      expect(dtoA.adapt(dtoB), equals(dtoB));
    });

    test(
        'adapt method should create a new instance from other OutlinedBorderDto',
        () {
      const dtoA = CircleBorderMix();
      const dtoB = BeveledRectangleBorderMix(side: BorderSideMix(width: 1.7));
      final result = dtoA.adapt(dtoB);
      expect(result, isA<CircleBorderMix>());
      expect(result.side, equals(dtoB.side));
      expect(result.eccentricity, isNull);
    });
  });

  group('StarBorderDto', () {
    test(
        'adapt method should create a new instance from other OutlinedBorderDto',
        () {
      const dtoA = StarBorderMix();
      const dtoB = ContinuousRectangleBorderMix(
        side: BorderSideMix(width: 1.3),
      );

      final result = dtoA.adapt(dtoB);
      expect(result, isA<StarBorderMix>());
      expect(result.side, equals(dtoB.side));
      expect(result.points, isNull);
      expect(result.innerRadiusRatio, isNull);
      expect(result.pointRounding, isNull);
      expect(result.valleyRounding, isNull);
      expect(result.rotation, isNull);
      expect(result.squash, isNull);
    });
  });

  group('LinearBorderDto', () {
    test(
        'adapt method should return the same instance if input is LinearBorderDto',
        () {
      const dtoA = LinearBorderMix(
        side: BorderSideMix(width: 1.9),
        start: LinearBorderEdgeMix(size: 2.0, alignment: 0.5),
      );
      const dtoB = LinearBorderMix(
        side: BorderSideMix(width: 19),
        start: LinearBorderEdgeMix(size: 20, alignment: 0.9),
      );
      expect(dtoA.adapt(dtoB), equals(dtoB));
    });

    test(
        'adapt method should create a new instance from other OutlinedBorderDto',
        () {
      const dtoA = LinearBorderMix();
      const dtoB = StadiumBorderMix(side: BorderSideMix(width: 2.1));
      final result = dtoA.adapt(dtoB);
      expect(result, isA<LinearBorderMix>());
      expect(result.side, equals(dtoB.side));
      expect(result.start, isNull);
      expect(result.end, isNull);
      expect(result.top, isNull);
      expect(result.bottom, isNull);
    });
  });

  group('StadiumBorderDto', () {
    test(
        'adapt method should return the same instance if input is StadiumBorderDto',
        () {
      const dtoA = StadiumBorderMix(side: BorderSideMix(width: 1.6));
      const dtoB = StadiumBorderMix(side: BorderSideMix(width: 16));
      expect(dtoA.adapt(dtoB), equals(dtoB));
    });

    test(
        'adapt method should create a new instance from other OutlinedBorderDto',
        () {
      const dtoA = StadiumBorderMix();
      const dtoB = CircleBorderMix(side: BorderSideMix(width: 2.3));
      final result = dtoA.adapt(dtoB);
      expect(result, isA<StadiumBorderMix>());
      expect(result.side, equals(dtoB.side));
    });
  });
}
