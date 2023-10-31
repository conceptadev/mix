import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/data_attributes.dart';
import 'package:mix/src/core/dto/alignment_dto.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('AlignmentGeometryAttribute', () {
    test('from returns AlignmentAttribute for Alignment', () {
      const alignment = Alignment(0.5, 0.5);
      final result = AlignmentGeometryAttribute(alignment.toDto);

      final resolvedValue = result.resolve(EmptyMixData) as Alignment;

      expect(result, isA<AlignmentGeometryAttribute>());
      expect((resolvedValue).x, 0.5);
      expect((resolvedValue).y, 0.5);
    });

    test('from returns AlignmentDirectionalAttribute for AlignmentDirectional',
        () {
      const alignment = AlignmentDirectional(0.5, 0.5);
      final result = AlignmentGeometryAttribute(alignment.toDto);

      final resolvedValue =
          result.resolve(EmptyMixData) as AlignmentDirectional;

      expect(result, isA<AlignmentGeometryAttribute>());
      expect(resolvedValue, isA<AlignmentDirectional>());
      expect((resolvedValue).start, 0.5);
      expect((resolvedValue).y, 0.5);
    });
  });

  group('AlignmentAttribute', () {
    test('merge returns merged object correctly', () {
      const dto1 = AlignmentGeometryData(x: 0.1, y: 0.2);
      const dto2 = AlignmentGeometryData(x: 0.3);

      const attr1 = AlignmentGeometryAttribute(dto1);
      const attr2 = AlignmentGeometryAttribute(dto2);

      final merged = attr1.merge(attr2);

      final resolvedValue = merged.resolve(EmptyMixData) as Alignment;

      expect(resolvedValue.x, 0.3); // should take from attr2
      expect(resolvedValue.y, 0.2); // should take from attr1
    });

    test('merge returns itself if other is null', () {
      const dto1 = AlignmentGeometryData(x: 0.1, y: 0.2);
      const attr1 = AlignmentGeometryAttribute(dto1);
      final merged = attr1.merge(null);

      expect(merged, attr1);
    });

    test(
      'resolve returns correct Alignment',
      () {
        const dto1 = AlignmentGeometryData(x: 0.5, y: 0.5);
        const attr = AlignmentGeometryAttribute(dto1);
        final alignment = attr.resolve(EmptyMixData);

        expect(alignment, const Alignment(0.5, 0.5));
        return const Placeholder();
      },
    );

    test(
      'resolve uses default values if null',
      () {
        const dto = AlignmentGeometryData();
        const attr = AlignmentGeometryAttribute(dto);
        final alignment = attr.resolve(EmptyMixData);

        expect(alignment, const Alignment(0.0, 0.0));
        return const Placeholder();
      },
    );

    test('Equality holds when properties are the same', () {
      const dto1 = AlignmentGeometryData(x: 0.1, y: 0.2);
      const dto2 = AlignmentGeometryData(x: 0.1, y: 0.2);

      const attr1 = AlignmentGeometryAttribute(dto1);
      const attr2 = AlignmentGeometryAttribute(dto2);

      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      const dto1 = AlignmentGeometryData(x: 0.1, y: 0.2);
      const dto2 = AlignmentGeometryData(x: 0.2, y: 0.2);

      const attr1 = AlignmentGeometryAttribute(dto1);
      const attr2 = AlignmentGeometryAttribute(dto2);

      expect(attr1, isNot(attr2));
    });
  });
}
