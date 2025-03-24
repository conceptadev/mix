import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('EdgeInsetsGeometryDto', () {
    test('only creates EdgeInsetsDto when directional values are not provided',
        () {
      final dto =
          EdgeInsetsGeometryMix.only(top: 10, bottom: 20, left: 30, right: 40);
      expect(dto, isA<EdgeInsetsMix>());
      expect(dto.top, equals(10));
      expect(dto.bottom, equals(20));
      expect((dto as EdgeInsetsMix).left, equals(30));
      expect((dto).right, equals(40));
    });

    test(
        'only creates EdgeInsetsDirectionalDto when directional values are provided',
        () {
      final dto =
          EdgeInsetsGeometryMix.only(top: 10, bottom: 20, start: 30, end: 40);
      expect(dto, isA<EdgeInsetsDirectionalMix>());
      expect(dto.top, equals(10));
      expect(dto.bottom, equals(20));
      expect((dto as EdgeInsetsDirectionalMix).start, equals(30));
      expect((dto).end, equals(40));
    });

    test('tryToMerge returns first dto if second is null', () {
      const dto1 = EdgeInsetsMix(top: 10, bottom: 20, left: 30, right: 40);
      final merged = EdgeInsetsGeometryMix.tryToMerge(dto1, null);
      expect(merged, equals(dto1));
    });

    test('tryToMerge returns second dto if first is null', () {
      const dto2 =
          EdgeInsetsDirectionalMix(top: 10, bottom: 20, start: 30, end: 40);
      final merged = EdgeInsetsGeometryMix.tryToMerge(null, dto2);
      expect(merged, equals(dto2));
    });

    test('tryToMerge merges dtos of the same type', () {
      const dto1 = EdgeInsetsMix(top: 10, bottom: 20);
      const dto2 = EdgeInsetsMix(left: 30, right: 40);
      final merged = EdgeInsetsGeometryMix.tryToMerge(dto1, dto2);
      expect(merged, isA<EdgeInsetsMix>());
      expect(merged!.top, equals(10));
      expect(merged.bottom, equals(20));
      expect((merged as EdgeInsetsMix).left, equals(30));
      expect((merged).right, equals(40));
    });

    test('tryToMerge merges dtos of different types', () {
      const dto1 = EdgeInsetsMix(top: 10, bottom: 20);
      const dto2 = EdgeInsetsDirectionalMix(start: 30, end: 40);
      final merged = EdgeInsetsGeometryMix.tryToMerge(dto1, dto2);
      expect(merged, isA<EdgeInsetsDirectionalMix>());
      expect(merged!.top, equals(10));
      expect(merged.bottom, equals(20));
      expect((merged as EdgeInsetsDirectionalMix).start, equals(30));
      expect((merged).end, equals(40));
    });
  });

  group('EdgeInsetsDto', () {
    test('all constructor sets all values', () {
      const dto = EdgeInsetsMix.all(10);
      expect(dto.top, equals(10));
      expect(dto.bottom, equals(10));
      expect(dto.left, equals(10));
      expect(dto.right, equals(10));
    });

    test('none constructor sets all values to 0', () {
      const dto = EdgeInsetsMix.none();
      expect(dto.top, equals(0));
      expect(dto.bottom, equals(0));
      expect(dto.left, equals(0));
      expect(dto.right, equals(0));
    });

    test('resolve returns EdgeInsets with token values', () {
      const dto = EdgeInsetsMix(top: 10, bottom: 20, left: 30, right: 40);
      final mix = EmptyMixData;
      final resolved = dto.resolve(mix);
      expect(resolved, isA<EdgeInsets>());
      expect(resolved.top, equals(10));
      expect(resolved.bottom, equals(20));
      expect(resolved.left, equals(30));
      expect(resolved.right, equals(40));
    });
  });

  group('EdgeInsetsDirectionalDto', () {
    test('all constructor sets all values', () {
      const dto = EdgeInsetsDirectionalMix.all(10);
      expect(dto.top, equals(10));
      expect(dto.bottom, equals(10));
      expect(dto.start, equals(10));
      expect(dto.end, equals(10));
    });

    test('none constructor sets all values to 0', () {
      const dto = EdgeInsetsDirectionalMix.none();
      expect(dto.top, equals(0));
      expect(dto.bottom, equals(0));
      expect(dto.start, equals(0));
      expect(dto.end, equals(0));
    });

    test('resolve returns EdgeInsetsDirectional with token values', () {
      const dto =
          EdgeInsetsDirectionalMix(top: 10, bottom: 20, start: 30, end: 40);
      final mix = EmptyMixData;
      final resolved = dto.resolve(mix);
      expect(resolved, isA<EdgeInsetsDirectional>());
      expect(resolved.top, equals(10));
      expect(resolved.bottom, equals(20));
      expect(resolved.start, equals(30));
      expect(resolved.end, equals(40));
    });
  });

  group('EdgeInsetsGeometryExt', () {
    test('toDto converts EdgeInsets to EdgeInsetsDto', () {
      const edgeInsets =
          EdgeInsets.only(top: 10, bottom: 20, left: 30, right: 40);
      final dto = edgeInsets.toDto();
      expect(dto, isA<EdgeInsetsMix>());
      expect(dto.top, equals(10));
      expect(dto.bottom, equals(20));
      expect((dto).left, equals(30));
      expect((dto).right, equals(40));
    });

    test('toDto converts EdgeInsetsDirectional to EdgeInsetsDirectionalDto',
        () {
      const edgeInsetsDirectional =
          EdgeInsetsDirectional.only(top: 10, bottom: 20, start: 30, end: 40);
      final dto = edgeInsetsDirectional.toDto();
      expect(dto, isA<EdgeInsetsDirectionalMix>());
      expect(dto.top, equals(10));
      expect(dto.bottom, equals(20));
      expect((dto).start, equals(30));
      expect((dto).end, equals(40));
    });
  });
}
