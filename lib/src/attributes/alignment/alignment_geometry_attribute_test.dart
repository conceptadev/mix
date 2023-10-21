import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mix.dart';

void main() {
  group('AlignmentGeometryAttribute', () {
    test('maybeFrom returns null for null alignment', () {
      expect(AlignmentGeometryAttribute.maybeFrom(), isNull);
    });

    test('maybeFrom returns AlignmentAttribute for Alignment', () {
      final result =
          AlignmentGeometryAttribute.maybeFrom(const Alignment(0.5, 0.5));
      expect(result, isA<AlignmentAttribute>());
      expect((result as AlignmentAttribute).x, 0.5);
      expect((result).y, 0.5);
    });

    test(
      'from returns AlignmentAttribute with correct properties for Alignment',
      () {
        const alignment = Alignment(0.5, 0.5);
        final result = AlignmentGeometryAttribute.from(alignment);

        expect(result, isA<AlignmentAttribute>());
        expect((result as AlignmentAttribute).x, 0.5);
        expect((result).y, 0.5);
      },
    );

    test('from throws UnsupportedError for unsupported types', () {
      expect(
        () => AlignmentGeometryAttribute.from(const Offset(1, 1)),
        throwsA(isA<UnsupportedError>()),
      );
    });
  });

  group('AlignmentAttribute', () {
    test('merge combines x and y correctly', () {
      const original = AlignmentAttribute(x: 0, y: 1);
      const other = AlignmentAttribute(x: 1);
      final result = original.merge(other);

      expect(result.x, 1);
      expect(result.y, 1);
    });

    test('resolve returns correct Alignment', () {
      const alignmentAttribute = AlignmentAttribute(x: 0.5, y: 0.5);
      final mixData =
          MixData(); // Assuming this class exists in your implementation
      final result = alignmentAttribute.resolve(mixData);

      expect(result, const Alignment(0.5, 0.5));
    });
  });

  group('AlignmentDirectionalAttribute', () {
    test('merge combines start and y correctly', () {
      const original = AlignmentDirectionalAttribute(start: 0, y: 1);
      const other = AlignmentDirectionalAttribute(start: 1);
      final result = original.merge(other);

      expect(result.start, 1);
      expect(result.y, 1);
    });

    test('resolve returns correct AlignmentDirectional', () {
      const alignmentAttribute =
          AlignmentDirectionalAttribute(start: 0.5, y: 0.5);
      final mixData =
          MixData(); // Assuming this class exists in your implementation
      final result = alignmentAttribute.resolve(mixData);

      expect(result, const AlignmentDirectional(0.5, 0.5));
    });
  });
}
