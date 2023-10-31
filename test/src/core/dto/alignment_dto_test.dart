import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/core/dto/alignment_dto.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('AlignmentGeometryData', () {
    group('merge', () {
      test('should merge non-null values correctly', () {
        const data1 = AlignmentGeometryData(x: 1, y: 1);
        const data2 = AlignmentGeometryData(x: 2, y: 2);

        final result = data1.merge(data2);

        expect(result.x, 2);
        expect(result.y, 2);
      });

      test('should retain original values when merging with null values', () {
        const data1 = AlignmentGeometryData(x: 1, y: 1);
        const data2 = AlignmentGeometryData();

        final result = data1.merge(data2);

        expect(result.x, 1);
        expect(result.y, 1);
      });

      test(
          'should throw UnsupportedError when merging non-compatible alignments',
          () {
        const data1 = AlignmentGeometryData(isDirectional: true);
        const data2 = AlignmentGeometryData();

        expect(() => data1.merge(data2), throwsUnsupportedError);
      });
    });

    group('resolve', () {
      test('should resolve non-directional alignment correctly', () {
        const data = AlignmentGeometryData(x: 1, y: 1);

        final result = data.resolve(EmptyMixData);

        expect(result, const Alignment(1, 1));
      });

      test('should resolve directional alignment correctly', () {
        const data = AlignmentGeometryData(start: 1, y: 1, isDirectional: true);

        final result = data.resolve(EmptyMixData);

        expect(result, const AlignmentDirectional(1, 1));
      });

      test('should use default values when resolving with null values', () {
        const data = AlignmentGeometryData();

        final result = data.resolve(EmptyMixData);

        expect(result, const Alignment(0.0, 0.0));
      });
    });

    group('equality', () {
      test('should compare equality correctly', () {
        const data1 = AlignmentGeometryData(x: 1, y: 1);
        const data2 = AlignmentGeometryData(x: 1, y: 1);
        const data3 = AlignmentGeometryData(x: 2, y: 2);

        expect(data1, data2);
        expect(data1, isNot(data3));
      });

      test('should consider directional flag in equality comparison', () {
        const data1 = AlignmentGeometryData(isDirectional: true);
        const data2 = AlignmentGeometryData(isDirectional: false);

        expect(data1, isNot(data2));
      });
    });

    // It's crucial to test the case where start, x, and y are null as well.
    test('should handle null values for start, x, and y correctly', () {
      const data = AlignmentGeometryData();
      expect(data.start, isNull);
      expect(data.x, isNull);
      expect(data.y, isNull);
    });
  });
}
