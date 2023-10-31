import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('BorderRadiusGeometryAttribute', () {
    test('from factory returns BorderRadiusAttribute for BorderRadius', () {
      const borderRadius = BorderRadius.all(Radius.circular(10.0));
      final result = borderRadius.toDto;

      final resolvedValue = result.resolve(EmptyMixData) as BorderRadius;

      expect(result, isA<BorderRadiusGeometryDto>());
      expect(resolvedValue, isA<BorderRadius>());
      expect((resolvedValue).topLeft.y, 10.0);
      expect((resolvedValue).topRight.y, 10.0);
      expect((resolvedValue).bottomLeft.y, 10.0);
      expect((resolvedValue).bottomRight.y, 10.0);
    });

    test(
        'from factory returns BorderRadiusDirectionalAttribute for BorderRadiusDirectional',
        () {
      final result = BorderRadiusGeometryDto.circular(
        10.0,
      ).toDirectional;

      final resolvedValue =
          result.resolve(EmptyMixData) as BorderRadiusDirectional;

      expect(result, isA<BorderRadiusGeometryDto>());
      expect(resolvedValue, isA<BorderRadiusDirectional>());
      expect((resolvedValue).topStart.y, 10.0);
      expect((resolvedValue).topEnd.y, 10.0);
      expect((resolvedValue).bottomStart.y, 10.0);
      expect((resolvedValue).bottomEnd.y, 10.0);
    });

    test('merge returns merged object correctly', () {
      final attr1 = BorderRadiusGeometryDto.circular(10.0);
      const attr2 =
          BorderRadiusGeometryDto(topLeft: RadiusDto.elliptical(20.0, 20.0));

      final merged = attr1.merge(attr2);

      final resolvedValue = merged.resolve(EmptyMixData) as BorderRadius;

      expect(resolvedValue.topLeft.x, 20.0);
      expect(resolvedValue.topLeft.y, 20.0);
      expect(resolvedValue.topRight.x, 10.0);
      expect(resolvedValue.topRight.y, 10.0);
      expect(resolvedValue.bottomLeft.x, 10.0);
      expect(resolvedValue.bottomLeft.y, 10.0);
      expect(resolvedValue.bottomRight.x, 10.0);
      expect(resolvedValue.bottomRight.y, 10.0);
    });

    test('resolve returns correct BorderRadius', () {
      final attr = BorderRadiusGeometryDto.circular(10.0);
      final borderRadius = attr.resolve(EmptyMixData) as BorderRadius;

      expect(borderRadius.topLeft, const Radius.circular(10.0));
      expect(borderRadius.topRight, const Radius.circular(10.0));
      expect(borderRadius.bottomLeft, const Radius.circular(10.0));
      expect(borderRadius.bottomRight, const Radius.circular(10.0));
    });

    test('Equality holds when all attributes are the same', () {
      final attr1 = BorderRadiusGeometryDto.circular(15.0);
      final attr2 = BorderRadiusGeometryDto.circular(15.0);

      expect(attr1, attr2);
    });

    test('Equality fails when attributes are different', () {
      final attr1 = BorderRadiusGeometryDto.circular(10.0);
      const attr2 = BorderRadiusGeometryDto(
        topLeft: RadiusDto.elliptical(
          10.0,
          30.0,
        ),
      );

      expect(attr1, isNot(attr2));
    });
  });

  group('BorderSideDto', () {
    test('fromBorderSide() constructor', () {
      BorderSide borderSide = const BorderSide(
        color: Colors.red,
        width: 2.0,
        style: BorderStyle.solid,
        // Removed for compatibility
        // strokeAlign: 12.0,
      );

      BorderSideDto result = borderSide.toDto;

      final resolvedValue = result.resolve(EmptyMixData);

      expect(resolvedValue.color, borderSide.color);
      expect(resolvedValue.width, borderSide.width);
      expect(resolvedValue.style, borderSide.style);
      expect(resolvedValue.strokeAlign, borderSide.strokeAlign);
    });
    test('copyWith() & merge() method', () {
      BorderSide borderSide = const BorderSide(
        color: Colors.red,
        width: 2.0,
        style: BorderStyle.solid,
        // Removed for compatibility
        // strokeAlign: 12.0,
      );

      BorderSideDto result = borderSide.toDto;

      BorderSideDto copy = result.copyWith(
        color: Colors.blue.toDto,
        width: 3.0,
        strokeAlign: 13.0,
      );

      BorderSideDto merge = result.merge(copy);

      expect(copy.color?.value, Colors.blue);
      expect(copy.width, 3.0);
      expect(copy.style, BorderStyle.solid);
      // Removed for compatibility
      // expect(copy.strokeAlign, 13.0);

      expect(copy, merge);
    });
  });

  test(
    'BorderSideDto equality',
    () {
      const borderSide = BorderSide(
        color: Colors.red,
        width: 2.0,
        style: BorderStyle.solid,
        strokeAlign: 12.0,
      );

      final result = borderSide.toDto;

      final same = BorderSideDto(
        color: Colors.red.toDto,
        width: 2.0,
        style: BorderStyle.solid,
        strokeAlign: 12.0,
      );

      final different = BorderSideDto(
        color: Colors.blue.toDto,
        width: 3.0,
        style: BorderStyle.solid,
        strokeAlign: 13.0,
      );

      final mergedDifferent = different.merge(same);

      final mergedSame = result.merge(same);

      expect(
        result,
        mergedSame,
        reason: 'merge same objects should return the same object',
      );
      expect(
        result,
        isNot(different),
        reason: 'different objects should not be equal',
      );
      expect(
        mergedDifferent,
        isNot(different),
        reason: 'merged different objects should not be equal',
      );
    },
  );
}
