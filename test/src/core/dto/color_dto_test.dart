import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/core/dto/color_dto.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('ColorData', () {
    group('merge', () {
      test('should merge colors correctly', () {
        const data1 = ColorData(Color(0xFF000000));
        const data2 = ColorData(Color(0xFFFFFFFF));
        final result = data1.merge(data2);
        expect(result.value, const Color(0xFFFFFFFF));
      });
    });

    group('resolve', () {
      // TODO: test token resolve

      // test('should resolve ColorRef correctly', () {
      //   const colorRef = ColorRef('black');
      //   const data = ColorData(colorRef);
      //   final result = data.resolve(EmptyMixData);
      //   expect(result, const Color(0xFF000000));
      // });

      test('should return the color value when it is not a ColorRef', () {
        const color = Color(0xFFFFFFFF);
        const data = ColorData(color);
        final result = data.resolve(EmptyMixData);
        expect(result, color);
      });
    });

    group('equality', () {
      test('should compare equality correctly', () {
        const data1 = ColorData(Color(0xFF000000));
        const data2 = ColorData(Color(0xFF000000));
        const data3 = ColorData(Color(0xFFFFFFFF));
        expect(data1, data2);
        expect(data1, isNot(data3));
      });
    });
  });
}
