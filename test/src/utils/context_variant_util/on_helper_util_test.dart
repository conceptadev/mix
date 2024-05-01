import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('Not Utils', () {
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
