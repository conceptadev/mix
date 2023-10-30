import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/core/dto/dtos.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('DoubleDto', () {
    test('maybeFrom returns DoubleDto for non-null value', () {
      const result = DoubleDto(5.0);
      expect(result, isA<DoubleDto>());
      expect(result.value, 5.0);
    });

    test('merge returns merged object correctly', () {
      const dto1 = DoubleDto(5.0);
      const dto2 = DoubleDto(10.0);

      final merged = dto1.merge(dto2);

      // should take from dto2
      expect(merged.value, 10.0);
    });

    test('merge returns itself if other is null', () {
      const dto1 = DoubleDto(5.0);
      final merged = dto1.merge(null);

      expect(merged, dto1);
    });

    test('resolve returns correct double', () {
      const dto = DoubleDto(5.0);

      final resolvedValue = dto.resolve(EmptyMixData);

      expect(resolvedValue, 5.0);
    });

    test('Equality holds when value is the same', () {
      const dto1 = DoubleDto(5.0);
      const dto2 = DoubleDto(5.0);

      expect(dto1, dto2);
    });

    test('Equality fails when values are different', () {
      const dto1 = DoubleDto(5.0);
      const dto2 = DoubleDto(10.0);

      expect(dto1, isNot(dto2));
    });
  });
}
