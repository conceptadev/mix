import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  const onNot = OnNotVariant.new;
  group('ContextVariant', () {
    test('Equality holds when all properties are the same', () {
      final variant1 = MockContextVariantCondition(true);
      final variant2 = MockContextVariantCondition(true);
      expect(variant1, variant2);
    });
    test('Equality fails when properties are different', () {
      final variant1 = MockContextVariantCondition(true);
      final variant2 = MockContextVariantCondition(false);
      expect(variant1, isNot(variant2));
    });
  });

  group('Not Utils', () {
    final onLight = OnBrightnessVariant(Brightness.light);
    final onDark = OnBrightnessVariant(Brightness.dark);
    testWidgets('reverts when of context variant', (tester) async {
      await tester.pumpWidget(createBrightnessTheme(Brightness.light));
      var context = tester.element(find.byType(Container));

      expect(onLight.build(context), true, reason: 'light');
      expect(onDark.build(context), false, reason: 'dark');

      final notLight = onNot(onLight);
      final notDark = onNot(onDark);

      expect(notLight.build(context), false, reason: 'not light');
      expect(notDark.build(context), true, reason: 'not dark');
    });
  });
}
