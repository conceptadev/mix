import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/alignment_attribute.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('AlignmentGeometryAttribute', () {
    test('from returns AlignmentAttribute for Alignment', () {
      final alignment = const Alignment(0.5, 0.5).toAttribute();

      final resolvedValue = alignment.resolve(EmptyMixData) as Alignment;

      expect(alignment, isA<AlignmentGeometryAttribute>());
      expect(resolvedValue.x, 0.5);
      expect(resolvedValue.y, 0.5);
    });

    test('from returns AlignmentDirectionalAttribute for AlignmentDirectional',
        () {
      final alignment = const AlignmentDirectional(0.5, 0.5).toAttribute();

      final resolvedValue =
          alignment.resolve(EmptyMixData) as AlignmentDirectional;

      expect(alignment, isA<AlignmentGeometryAttribute>());
      expect(resolvedValue, isA<AlignmentDirectional>());
      expect(resolvedValue, isA<AlignmentDirectional>());
      expect(resolvedValue.start, 0.5);
      expect(resolvedValue.y, 0.5);
    });
  });

  group('AlignmentAttribute', () {
    test('merge returns merged object correctly', () {
      const attr1 = AlignmentGeometryAttribute(x: 0.1, y: 0.2);
      const attr2 = AlignmentGeometryAttribute(x: 0.3);

      final merged = attr1.merge(attr2);

      final resolvedValue = merged.resolve(EmptyMixData) as Alignment;

      expect(resolvedValue.x, 0.3); // should take from attr2
      expect(resolvedValue.y, 0.2); // should take from attr1
      expect(resolvedValue, isA<Alignment>());
    });

    test('merge returns itself if other is null', () {
      const attr1 = AlignmentGeometryAttribute(x: 0.1, y: 0.2);

      final merged = attr1.merge(null);

      expect(merged, attr1);
    });

    test(
      'resolve returns correct Alignment',
      () {
        const attr = AlignmentGeometryAttribute(x: 0.5, y: 0.5);

        final alignment = attr.resolve(EmptyMixData);

        expect(alignment, const Alignment(0.5, 0.5));
        return const Placeholder();
      },
    );

    test(
      'resolve uses default values if null',
      () {
        const attr = AlignmentGeometryAttribute();

        final alignment = attr.resolve(EmptyMixData);

        expect(alignment, const Alignment(0.0, 0.0));
        return const Placeholder();
      },
    );

    test('Equality holds when properties are the same', () {
      const attr1 = AlignmentGeometryAttribute(x: 0.1, y: 0.2);
      const attr2 = AlignmentGeometryAttribute(x: 0.1, y: 0.2);

      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      const attr1 = AlignmentGeometryAttribute(x: 0.1, y: 0.2);
      const attr2 = AlignmentGeometryAttribute(x: 0.2, y: 0.2);

      expect(attr1, isNot(attr2));
    });
  });
}
