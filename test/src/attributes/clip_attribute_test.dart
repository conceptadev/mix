import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('ClipAttribute', () {
    test('merge returns merged object correctly', () {
      const attr1 = ClipAttribute(Clip.hardEdge);
      const attr2 = ClipAttribute(Clip.antiAlias);

      final merged = attr1.merge(attr2);

      expect(merged.clip, Clip.antiAlias); // should take from attr2
    });

    test('merge returns itself if other is null', () {
      const attr1 = ClipAttribute(Clip.hardEdge);
      final merged = attr1.merge(null);

      expect(merged, attr1);
    });

    testWidgets('resolve returns correct Clip', (WidgetTester tester) async {
      await pumpWithMixData(
        tester,
        builder: (mix) {
          const attr = ClipAttribute(Clip.hardEdge);
          final clip = attr.resolve(mix);

          expect(clip, Clip.hardEdge);
          return const Placeholder();
        },
      );
    });

    test('Equality holds when Clip is the same', () {
      const attr1 = ClipAttribute(Clip.hardEdge);
      const attr2 = ClipAttribute(Clip.hardEdge);

      expect(attr1, attr2);
    });

    test('Equality fails when Clip is different', () {
      const attr1 = ClipAttribute(Clip.hardEdge);
      const attr2 = ClipAttribute(Clip.antiAlias);

      expect(attr1, isNot(attr2));
    });
  });
}
