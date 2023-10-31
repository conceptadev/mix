import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/data_attributes.dart';
import 'package:mix/src/core/dto/constraints_dto.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('BoxConstraintsData', () {
    group('merge', () {
      test('should merge non-null values correctly', () {
        const data1 = BoxConstraintsData(
            minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100);
        const data2 = BoxConstraintsData(
            minWidth: 60, maxWidth: 110, minHeight: 60, maxHeight: 110);

        final result = data1.merge(data2);

        expect(result.minWidth, 60);
        expect(result.maxWidth, 110);
        expect(result.minHeight, 60);
        expect(result.maxHeight, 110);
      });

      test('should retain original values when merging with null values', () {
        const data1 = BoxConstraintsData(
            minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100);
        const data2 = BoxConstraintsData();

        final result = data1.merge(data2);

        expect(result.minWidth, 50);
        expect(result.maxWidth, 100);
        expect(result.minHeight, 50);
        expect(result.maxHeight, 100);
      });
    });

    group('resolve', () {
      test('should resolve constraints correctly with non-null values', () {
        const data = BoxConstraintsData(
            minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100);

        final result = data.resolve(EmptyMixData);

        expect(
            result,
            const BoxConstraints(
                minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100));
      });

      test('should resolve constraints correctly with null values', () {
        const data = BoxConstraintsData();

        final result = data.resolve(EmptyMixData);

        expect(
            result,
            const BoxConstraints(
                minWidth: 0,
                maxWidth: double.infinity,
                minHeight: 0,
                maxHeight: double.infinity));
      });
    });

    group('toAttribute', () {
      test('should return a BoxConstraintsAttribute object', () {
        const data = BoxConstraintsData();

        final result = data.toAttribute();

        expect(result, isA<BoxConstraintsAttribute>());
      });
    });

    group('equality', () {
      test('should compare equality correctly', () {
        const data1 = BoxConstraintsData(
            minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100);
        const data2 = BoxConstraintsData(
            minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100);
        const data3 = BoxConstraintsData(
            minWidth: 60, maxWidth: 110, minHeight: 60, maxHeight: 110);

        expect(data1, data2);
        expect(data1, isNot(data3));
      });
    });
  });
}
