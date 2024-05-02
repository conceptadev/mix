import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('Orientation Utils', () {
    testWidgets('onPortrait context variant', (tester) async {
      tester.view.physicalSize = const Size(400, 600);
      await tester.pumpMaterialApp(Container());
      var context = tester.element(find.byType(Container));

      expect(onPortrait.build(context), true, reason: 'portrait');
      expect(onLandscape.build(context), false, reason: 'landscape');

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('onLandscape context variant', (tester) async {
      tester.view.physicalSize = const Size(600, 400);
      await tester.pumpMaterialApp(Container());
      var context = tester.element(find.byType(Container));

      expect(onPortrait.build(context), false, reason: 'portrait');
      expect(onLandscape.build(context), true, reason: 'landscape');
      addTearDown(tester.view.resetPhysicalSize);
    });

    test('OnOrientation equality', () {
      final variantPortrait1 = OnOrientationVariant(Orientation.portrait);
      final variantPortrait2 = OnOrientationVariant(Orientation.portrait);
      final variantLandscape = OnOrientationVariant(Orientation.landscape);

      expect(variantPortrait1, equals(variantPortrait2));
      expect(variantPortrait1, isNot(equals(variantLandscape)));
    });
  });
}
