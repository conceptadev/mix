import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/alignment_attribute.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('AlignmentAttribute', () {
    test('class resolves correctly', () {
      const alignment = AlignmentAttribute(x: 0.5, y: 0.6);

      final resolvedValue = alignment.resolve(EmptyMixData);

      expect(alignment, isA<AlignmentGeometryAttribute>());
      expect(alignment, isA<AlignmentAttribute>());
      expect(resolvedValue, isA<Alignment>());
      expect(resolvedValue.x, 0.5);
      expect(resolvedValue.y, 0.6);
    });
    test('merge returns merged object correctly', () {
      const attr1 = AlignmentAttribute(x: 0.1, y: 0.2);
      const attr2 = AlignmentAttribute(x: 0.3);

      final merged = attr1.merge(attr2);

      final resolvedValue = merged.resolve(EmptyMixData);

      expect(resolvedValue.x, 0.3); // should take from attr2
      expect(resolvedValue.y, 0.2); // should take from attr1
      expect(resolvedValue, isA<Alignment>());
    });

    test('AlignmentAttribute merge returns itself if other is null', () {
      const attr1 = AlignmentAttribute(x: 0.1, y: 0.2);

      final merged = attr1.merge(null);

      expect(merged, attr1);
    });

    test(
      'AlignmentAttribute resolve returns correct Alignment',
      () {
        const attr = AlignmentAttribute(x: 0.5, y: 0.5);

        final alignment = attr.resolve(EmptyMixData);

        expect(alignment, const Alignment(0.5, 0.5));
      },
    );

    test(
      'AlignmentAttribute resolve uses default values if null',
      () {
        const attr = AlignmentAttribute();

        final alignment = attr.resolve(EmptyMixData);

        expect(alignment, const Alignment(0.0, 0.0));
      },
    );

    test('AlignmentAttribute equality holds when properties are the same', () {
      const attr1 = AlignmentAttribute(x: 0.1, y: 0.2);
      const attr2 = AlignmentAttribute(x: 0.1, y: 0.2);

      expect(attr1, attr2);
    });

    test('AlignmentAttribute equality fails when properties are different', () {
      const attr1 = AlignmentAttribute(x: 0.1, y: 0.2);
      const attr2 = AlignmentAttribute(x: 0.2, y: 0.2);

      expect(attr1, isNot(attr2));
    });
  });

  group('AlignmentDirectionalAttribute', () {
    test('class resolves correctly', () {
      const alignment = AlignmentDirectionalAttribute(start: 0.5, y: 0.6);

      final resolvedValue = alignment.resolve(EmptyMixData);

      expect(alignment, isA<AlignmentGeometryAttribute>());
      expect(alignment, isA<AlignmentDirectionalAttribute>());
      expect(resolvedValue, isA<AlignmentDirectional>());
      expect(resolvedValue, isA<AlignmentDirectional>());
      expect(resolvedValue.start, 0.5);
      expect(resolvedValue.y, 0.6);
    });

    test('merge returns merged object correctly', () {
      const attr1 = AlignmentDirectionalAttribute(start: 0.1, y: 0.2);
      const attr2 = AlignmentDirectionalAttribute(start: 0.3);

      final merged = attr1.merge(attr2);

      final resolvedValue = merged.resolve(EmptyMixData);

      expect(resolvedValue.start, 0.3); // should take from attr2
      expect(resolvedValue.y, 0.2); // should take from attr1
      expect(resolvedValue, isA<AlignmentDirectional>());
    });

    test('AlignmentDirectionalAttribute merge returns itself if other is null',
        () {
      const attr1 = AlignmentDirectionalAttribute(start: 0.1, y: 0.2);

      final merged = attr1.merge(null);

      expect(merged, attr1);
    });

    test(
      'AlignmentDirectionalAttribute resolve returns correct AlignmentDirectional',
      () {
        const attr = AlignmentDirectionalAttribute(start: 0.5, y: 0.5);

        final alignment = attr.resolve(EmptyMixData);

        expect(alignment, const AlignmentDirectional(0.5, 0.5));
      },
    );

    test(
      'AlignmentDirectionalAttribute resolve uses default values if null',
      () {
        const attr = AlignmentDirectionalAttribute();

        final alignment = attr.resolve(EmptyMixData);

        expect(alignment, const AlignmentDirectional(0.0, 0.0));
      },
    );

    test(
        'AlignmentDirectionalAttribute equality holds when properties are the same',
        () {
      const attr1 = AlignmentDirectionalAttribute(start: 0.1, y: 0.2);
      const attr2 = AlignmentDirectionalAttribute(start: 0.1, y: 0.2);

      expect(attr1, attr2);
    });

    test(
        'AlignmentDirectionalAttribute equality fails when properties are different',
        () {
      const attr1 = AlignmentDirectionalAttribute(start: 0.1, y: 0.2);
      const attr2 = AlignmentDirectionalAttribute(start: 0.2, y: 0.2);

      expect(attr1, isNot(attr2));
    });
  });
}
