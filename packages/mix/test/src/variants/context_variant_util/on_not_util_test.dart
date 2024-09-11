import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('Not Utils', () {
    const onNot = OnNotVariant.new;
    const onLight = OnBrightnessVariant(Brightness.light);
    const onDark = OnBrightnessVariant(Brightness.dark);
    testWidgets('onNot reverses the result of a context variant',
        (tester) async {
      await tester.pumpWidget(createMediaQuery(brightness: Brightness.light));
      var context = tester.element(find.byType(Container));

      expect(onLight.when(context), true, reason: 'light');
      expect(onDark.when(context), false, reason: 'dark');

      final notLight = onNot(onLight);
      final notDark = onNot(onDark);

      expect(notLight.when(context), false, reason: 'not light');
      expect(notDark.when(context), true, reason: 'not dark');
    });

    test('OnNotVariant equality', () {
      const variantLight = OnBrightnessVariant(Brightness.light);
      const variantDark = OnBrightnessVariant(Brightness.dark);

      const notLight1 = OnNotVariant(variantLight);
      const notLight2 = OnNotVariant(variantLight);
      const notDark = OnNotVariant(variantDark);

      expect(notLight1, equals(notLight2));
      expect(notLight1, isNot(equals(notDark)));
    });

    test('OnNotVariant priority should match the wrapped variant', () {
      const variant = OnBrightnessVariant(Brightness.light);
      const notVariant = OnNotVariant(variant);

      expect(notVariant.priority, equals(variant.priority));
    });

    test(
        'OnNotVariant mergeKey should include runtime type and wrapped variant mergeKey',
        () {
      const variant = OnBrightnessVariant(Brightness.light);
      const notVariant = OnNotVariant(variant);

      expect(notVariant.mergeKey, equals('OnNotVariant.${variant.mergeKey}'));
    });
  });
}
