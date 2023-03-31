import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/dtos/border/border_side.dto.dart';
import 'package:mix/src/dtos/color.dto.dart';

void main() {
  group('BorderSideDto', () {
    test('fromBorderSide() constructor', () {
      BorderSide borderSide = const BorderSide(
        color: Colors.red,
        width: 2.0,
        style: BorderStyle.solid,
        // Removed for compatibility
        // strokeAlign: 12.0,
      );

      BorderSideDto result = BorderSideDto.fromBorderSide(borderSide);

      expect(result.color?.value, borderSide.color);
      expect(result.width, borderSide.width);
      expect(result.style, borderSide.style);
      expect(result.strokeAlign, borderSide.strokeAlign);
    });
    test('copyWith() & merge() method', () {
      BorderSide borderSide = const BorderSide(
        color: Colors.red,
        width: 2.0,
        style: BorderStyle.solid,
        // Removed for compatibility
        // strokeAlign: 12.0,
      );

      BorderSideDto result = BorderSideDto.fromBorderSide(borderSide);

      BorderSideDto copy = result.copyWith(
        color: const ColorDto(Colors.blue),
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

      final result = BorderSideDto.fromBorderSide(borderSide);

      const same = BorderSideDto.only(
        color: ColorDto.from(Colors.red),
        width: 2.0,
        style: BorderStyle.solid,
        strokeAlign: 12.0,
      );

      const different = BorderSideDto.only(
        color: ColorDto(Colors.blue),
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
