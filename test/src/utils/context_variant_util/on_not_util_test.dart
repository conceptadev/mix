import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('Not Utils', () {
    testWidgets('onNot reverses the result of a context variant',
        (tester) async {
      await tester.pumpWidget(createBrightnessTheme(Brightness.light));
      var context = tester.element(find.byType(Container));

      expect(onLight.build(context), true, reason: 'light');
      expect(onDark.build(context), false, reason: 'dark');

      final notLight = onNot(onLight);
      final notDark = onNot(onDark);

      expect(notLight.build(context), false, reason: 'not light');
      expect(notDark.build(context), true, reason: 'not dark');
    });

    test('OnNotVariant equality', () {
      final variantLight = OnBrightnessVariant(Brightness.light);
      final variantDark = OnBrightnessVariant(Brightness.dark);

      final notLight1 = OnNotVariant(variantLight);
      final notLight2 = OnNotVariant(variantLight);
      final notDark = OnNotVariant(variantDark);

      expect(notLight1, equals(notLight2));
      expect(notLight1, isNot(equals(notDark)));
    });
  });
}
