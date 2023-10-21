import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('CrossAxisAlignmentAttribute', () {
    test('merge returns merged object correctly', () {
      const attr1 = CrossAxisAlignmentAttribute(CrossAxisAlignment.start);
      const attr2 = CrossAxisAlignmentAttribute(CrossAxisAlignment.end);

      final merged = attr1.merge(attr2);

      expect(
          merged.alignment, CrossAxisAlignment.end); // should take from attr2
    });

    test('merge returns itself if other is null', () {
      const attr1 = CrossAxisAlignmentAttribute(CrossAxisAlignment.start);
      final merged = attr1.merge(null);

      expect(merged, attr1);
    });

    testWidgets('resolve returns correct CrossAxisAlignment',
        (WidgetTester tester) async {
      await pumpWithMixData(
        tester,
        builder: (mix) {
          const attr = CrossAxisAlignmentAttribute(CrossAxisAlignment.center);
          final alignment = attr.resolve(mix);

          expect(alignment, CrossAxisAlignment.center);
          return const Placeholder();
        },
      );
    });

    test('Equality holds when CrossAxisAlignment is the same', () {
      const attr1 = CrossAxisAlignmentAttribute(CrossAxisAlignment.start);
      const attr2 = CrossAxisAlignmentAttribute(CrossAxisAlignment.start);

      expect(attr1, attr2);
    });

    test('Equality fails when CrossAxisAlignment is different', () {
      const attr1 = CrossAxisAlignmentAttribute(CrossAxisAlignment.start);
      const attr2 = CrossAxisAlignmentAttribute(CrossAxisAlignment.end);

      expect(attr1, isNot(attr2));
    });
  });
}
