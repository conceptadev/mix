import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('Directionality Utils', () {
    const onRTL = OnDirectionalityVariant(TextDirection.rtl);
    const onLTR = OnDirectionalityVariant(TextDirection.ltr);
    testWidgets('onRTL context variant', (tester) async {
      await tester.pumpWidget(createDirectionality(TextDirection.rtl));
      var context = tester.element(find.byType(Container));

      expect(onRTL.when(context), true, reason: 'rtl');
      expect(onLTR.when(context), false, reason: 'ltr');
    });

    testWidgets('onLTR context variant', (tester) async {
      await tester.pumpWidget(createDirectionality(TextDirection.ltr));
      var context = tester.element(find.byType(Container));

      expect(onRTL.when(context), false, reason: 'rtl');
      expect(onLTR.when(context), true, reason: 'ltr');
    });

    test('OnDirectionality equality', () {
      const variantRTL1 = OnDirectionalityVariant(TextDirection.rtl);
      const variantRTL2 = OnDirectionalityVariant(TextDirection.rtl);
      const variantLTR = OnDirectionalityVariant(TextDirection.ltr);

      expect(variantRTL1, equals(variantRTL2));
      expect(variantRTL1, isNot(equals(variantLTR)));
    });
  });
}
