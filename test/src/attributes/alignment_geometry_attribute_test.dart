import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('AlignmentGeometryAttribute', () {
    test('maybeFrom returns null for null alignment', () {
      expect(AlignmentGeometryAttribute.maybeFrom(null), isNull);
    });

    test('maybeFrom returns AlignmentAttribute for Alignment', () {
      final result =
          AlignmentGeometryAttribute.maybeFrom(const Alignment(0.5, 0.5));
      expect(result, isA<AlignmentAttribute>());
      expect((result as AlignmentAttribute).x, 0.5);
      expect((result).y, 0.5);
    });

    test('from returns AlignmentAttribute for Alignment', () {
      const alignment = Alignment(0.5, 0.5);
      final result = AlignmentGeometryAttribute.from(alignment);

      expect(result, isA<AlignmentAttribute>());
      expect((result as AlignmentAttribute).x, 0.5);
      expect((result).y, 0.5);
    });

    test('from returns AlignmentDirectionalAttribute for AlignmentDirectional',
        () {
      const alignment = AlignmentDirectional(0.5, 0.5);
      final result = AlignmentGeometryAttribute.from(alignment);

      expect(result, isA<AlignmentDirectionalAttribute>());
      expect((result as AlignmentDirectionalAttribute).start, 0.5);
      expect((result).y, 0.5);
    });
  });

  group('AlignmentAttribute', () {
    test('merge returns merged object correctly', () {
      const attr1 = AlignmentAttribute(x: 0.1, y: 0.2);
      const attr2 = AlignmentAttribute(x: 0.3);

      final merged = attr1.merge(attr2);

      expect(merged.x, 0.3); // should take from attr2
      expect(merged.y, 0.2); // should take from attr1
    });

    test('merge returns itself if other is null', () {
      const attr1 = AlignmentAttribute(x: 0.1, y: 0.2);
      final merged = attr1.merge(null);

      expect(merged, attr1);
    });

    test(
      'resolve returns correct Alignment',
      () {
        const attr = AlignmentAttribute(x: 0.5, y: 0.5);
        final alignment = attr.resolve(EmptyMixData);

        expect(alignment, const Alignment(0.5, 0.5));
        return const Placeholder();
      },
    );

    test(
      'resolve uses default values if null',
      () {
        const attr = AlignmentAttribute();
        final alignment = attr.resolve(EmptyMixData);

        expect(alignment, const Alignment(0.0, 0.0));
        return const Placeholder();
      },
    );

    test('Equality holds when properties are the same', () {
      const attr1 = AlignmentAttribute(x: 0.1, y: 0.2);
      const attr2 = AlignmentAttribute(x: 0.1, y: 0.2);

      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      const attr1 = AlignmentAttribute(x: 0.1, y: 0.2);
      const attr2 = AlignmentAttribute(x: 0.2, y: 0.2);

      expect(attr1, isNot(attr2));
    });
  });

  group('AlignmentDirectionalAttribute', () {
    test('merge returns merged object correctly', () {
      const attr1 = AlignmentDirectionalAttribute(start: 0.1, y: 0.2);
      const attr2 = AlignmentDirectionalAttribute(start: 0.3);

      final merged = attr1.merge(attr2);

      expect(merged.start, 0.3); // should take from attr2
      expect(merged.y, 0.2); // should take from attr1
    });

    test('merge returns itself if other is null', () {
      const attr1 = AlignmentDirectionalAttribute(start: 0.1, y: 0.2);
      final merged = attr1.merge(null);

      expect(merged, attr1);
    });

    test(
      'resolve returns correct AlignmentDirectional',
      () {
        const attr = AlignmentDirectionalAttribute(start: 0.5, y: 0.5);
        final alignment = attr.resolve(EmptyMixData);

        expect(alignment, const AlignmentDirectional(0.5, 0.5));
        return const Placeholder();
      },
    );

    test(
      'resolve uses default values if null',
      () {
        const attr = AlignmentDirectionalAttribute();
        final alignment = attr.resolve(EmptyMixData);

        expect(alignment, const AlignmentDirectional(0.0, 0.0));
        return const Placeholder();
      },
    );

    test('Equality holds when properties are the same', () {
      const attr1 = AlignmentDirectionalAttribute(start: 0.1, y: 0.2);
      const attr2 = AlignmentDirectionalAttribute(start: 0.1, y: 0.2);

      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      const attr1 = AlignmentDirectionalAttribute(start: 0.1, y: 0.2);
      const attr2 = AlignmentDirectionalAttribute(start: 0.2, y: 0.2);

      expect(attr1, isNot(attr2));
    });
  });
}
