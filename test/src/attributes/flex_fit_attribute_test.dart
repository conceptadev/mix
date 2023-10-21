import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('FlexFitAttribute', () {
    test('merge returns merged object correctly', () {
      const attr1 = FlexFitAttribute(FlexFit.tight);
      const attr2 = FlexFitAttribute(FlexFit.loose);

      final merged = attr1.merge(attr2);

      expect(merged.fit, FlexFit.loose); // should take from attr2
    });

    test('merge returns itself if other is null', () {
      const attr1 = FlexFitAttribute(FlexFit.tight);
      final merged = attr1.merge(null);

      expect(merged, attr1);
    });

    testWidgets('resolve returns correct FlexFit', (WidgetTester tester) async {
      await pumpWithMixData(
        tester,
        builder: (mix) {
          const attr = FlexFitAttribute(FlexFit.tight);
          final fit = attr.resolve(mix);

          expect(fit, FlexFit.tight);
          return const Placeholder();
        },
      );
    });

    test('Equality holds when FlexFit is the same', () {
      const attr1 = FlexFitAttribute(FlexFit.tight);
      const attr2 = FlexFitAttribute(FlexFit.tight);

      expect(attr1, attr2);
    });

    test('Equality fails when FlexFit is different', () {
      const attr1 = FlexFitAttribute(FlexFit.tight);
      const attr2 = FlexFitAttribute(FlexFit.loose);

      expect(attr1, isNot(attr2));
    });
  });
}
