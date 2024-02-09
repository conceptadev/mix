import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('RoundedRectangleBorderDto', () {
    test('merge should combine two RoundedRectangleBorderDtos correctly', () {
      const original = RoundedRectangleBorderDto(
        borderRadius: BorderRadiusGeometryDto(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(10),
        ),
        side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
      );
      final merged = original.merge(
        const RoundedRectangleBorderDto(
          borderRadius: BorderRadiusGeometryDto(
            topLeft: Radius.circular(25),
          ),
          side: BorderSideDto(color: ColorDto(Colors.blue), width: 2.0),
        ),
      ) as RoundedRectangleBorderDto;

      expect(merged.borderRadius!.topLeft, const Radius.circular(25));
      expect(merged.borderRadius!.topRight, const Radius.circular(20));
      expect(merged.borderRadius!.bottomLeft, const Radius.circular(5));
      expect(merged.borderRadius!.bottomRight, const Radius.circular(10));

      expect(merged.side!.color, const ColorDto(Colors.blue));
      expect(merged.side!.width, 2.0);
    });

    test(
      'resolve should create a RoundedRectangleBorder with the correct values',
      () {
        const dto = RoundedRectangleBorderDto(
          borderRadius: BorderRadiusGeometryDto(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(10),
          ),
          side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
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
      const original = CircleBorderDto(
        side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
        eccentricity: 0.5,
      );
      final merged = original.merge(
        const CircleBorderDto(
          side: BorderSideDto(color: ColorDto(Colors.blue), width: 2.0),
          eccentricity: 0.75,
        ),
      ) as CircleBorderDto;

      expect(merged.eccentricity, 0.75);
      expect(merged.side!.color, const ColorDto(Colors.blue));
      expect(merged.side!.width, 2.0);
    });

    test('resolve should create a CircleBorder with the correct values', () {
      const dto = CircleBorderDto(
        side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
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
      const original = BeveledRectangleBorderDto(
        borderRadius: BorderRadiusGeometryDto(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(10),
        ),
        side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
      );
      final merged = original.merge(
        const BeveledRectangleBorderDto(
          borderRadius: BorderRadiusGeometryDto(
            topLeft: Radius.circular(25),
          ),
          side: BorderSideDto(color: ColorDto(Colors.blue), width: 2.0),
        ),
      ) as BeveledRectangleBorderDto;

      expect(merged.borderRadius!.topLeft, const Radius.circular(25));
      expect(merged.borderRadius!.topRight, const Radius.circular(20));
      expect(merged.borderRadius!.bottomLeft, const Radius.circular(5));
      expect(merged.borderRadius!.bottomRight, const Radius.circular(10));

      expect(merged.side!.color, const ColorDto(Colors.blue));
      expect(merged.side!.width, 2.0);
    });

    test(
      'resolve should create a BeveledRectangleBorder with the correct values',
      () {
        const dto = BeveledRectangleBorderDto(
          borderRadius: BorderRadiusGeometryDto(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(10),
          ),
          side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
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
      const original = StadiumBorderDto(
        side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
      );
      final merged = original.merge(
        const StadiumBorderDto(
          side: BorderSideDto(color: ColorDto(Colors.blue), width: 2.0),
        ),
      ) as StadiumBorderDto;

      expect(merged.side!.color, const ColorDto(Colors.blue));
      expect(merged.side!.width, 2.0);
    });

    test('resolve should create a StadiumBorder with the correct values', () {
      const dto = StadiumBorderDto(
        side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
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
        const original = ContinuousRectangleBorderDto(
          borderRadius: BorderRadiusGeometryDto(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(10),
          ),
          side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
        );
        final merged = original.merge(
          const ContinuousRectangleBorderDto(
            borderRadius: BorderRadiusGeometryDto(
              topLeft: Radius.circular(25),
            ),
            side: BorderSideDto(color: ColorDto(Colors.blue), width: 2.0),
          ),
        ) as ContinuousRectangleBorderDto;

        expect(merged.borderRadius!.topLeft, const Radius.circular(25));
        expect(merged.borderRadius!.topRight, const Radius.circular(20));
        expect(merged.borderRadius!.bottomLeft, const Radius.circular(5));
        expect(merged.borderRadius!.bottomRight, const Radius.circular(10));

        expect(merged.side!.color, const ColorDto(Colors.blue));
        expect(merged.side!.width, 2.0);
      },
    );

    test(
      'resolve should create a ContinuousRectangleBorder with the correct values',
      () {
        const dto = ContinuousRectangleBorderDto(
          borderRadius: BorderRadiusGeometryDto(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(10),
          ),
          side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
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
}
