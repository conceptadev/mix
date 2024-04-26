import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('ContextVariant', () {
    test('Equality holds when all properties are the same', () {
      bool contextFunction(BuildContext context) => true;
      final variant1 = ContextVariant(
        contextFunction,
        priority: VariantPriority.normal,
      );
      final variant2 = ContextVariant(
        contextFunction,
        priority: VariantPriority.normal,
      );
      expect(variant1, variant2);
    });
    test('Equality fails when properties are different', () {
      final variant1 = ContextVariant(
        (context) => true,
        priority: VariantPriority.normal,
      );
      final variant2 = ContextVariant(
        (context) => true,
        priority: VariantPriority.normal,
      );
      expect(variant1, isNot(variant2));
    });
  });

  group('Not Utils', () {
    testWidgets('reverts when of context variant', (tester) async {
      await tester.pumpWidget(createBrightnessTheme(Brightness.light));
      var context = tester.element(find.byType(Container));

      expect(onLight.when(context), true, reason: 'light');
      expect(onDark.when(context), false, reason: 'dark');

      final notLight = onNot(onLight);
      final notDark = onNot(onDark);

      expect(notLight.when(context), false, reason: 'not light');
      expect(notDark.when(context), true, reason: 'not dark');
    });
  });
}
