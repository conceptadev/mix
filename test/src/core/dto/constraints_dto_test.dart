import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/constraints_attribute.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('BoxConstraintsData', () {
    group('merge', () {
      test('should merge non-null values correctly', () {
        const data1 = BoxConstraintsAttribute(
            minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100);
        const data2 = BoxConstraintsAttribute(
            minWidth: 60, maxWidth: 110, minHeight: 60, maxHeight: 110);

        final result = data1.merge(data2);

        expect(result.minWidth, 60);
        expect(result.maxWidth, 110);
        expect(result.minHeight, 60);
        expect(result.maxHeight, 110);
      });

      test('should retain original values when merging with null values', () {
        const data1 = BoxConstraintsAttribute(
            minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100);
        const data2 = BoxConstraintsAttribute();

        final result = data1.merge(data2);

        expect(result.minWidth, 50);
        expect(result.maxWidth, 100);
        expect(result.minHeight, 50);
        expect(result.maxHeight, 100);
      });
    });

    group('resolve', () {
      test('should resolve constraints correctly with non-null values', () {
        const data = BoxConstraintsAttribute(
            minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100);

        final result = data.resolve(EmptyMixData);

        expect(
            result,
            const BoxConstraints(
                minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100));
      });

      test('should resolve constraints correctly with null values', () {
        const data = BoxConstraintsAttribute();

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

    group('equality', () {
      test('should compare equality correctly', () {
        const data1 = BoxConstraintsAttribute(
            minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100);
        const data2 = BoxConstraintsAttribute(
            minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100);
        const data3 = BoxConstraintsAttribute(
            minWidth: 60, maxWidth: 110, minHeight: 60, maxHeight: 110);

        expect(data1, data2);
        expect(data1, isNot(data3));
      });
    });
  });
}
