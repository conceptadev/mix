import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('Orientation Utils', () {
    const onPortrait = OnOrientationVariant(Orientation.portrait);
    const onLandscape = OnOrientationVariant(Orientation.landscape);
    testWidgets('onPortrait context variant', (tester) async {
      tester.view.physicalSize = const Size(400, 600);
      await tester.pumpMaterialApp(Container());
      var context = tester.element(find.byType(Container));

      expect(onPortrait.when(context), true, reason: 'portrait');
      expect(onLandscape.when(context), false, reason: 'landscape');

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('onLandscape context variant', (tester) async {
      tester.view.physicalSize = const Size(600, 400);
      await tester.pumpMaterialApp(Container());
      var context = tester.element(find.byType(Container));

      expect(onPortrait.when(context), false, reason: 'portrait');
      expect(onLandscape.when(context), true, reason: 'landscape');
      addTearDown(tester.view.resetPhysicalSize);
    });

    test('OnOrientation equality', () {
      const variantPortrait1 = OnOrientationVariant(Orientation.portrait);
      const variantPortrait2 = OnOrientationVariant(Orientation.portrait);
      const variantLandscape = OnOrientationVariant(Orientation.landscape);

      expect(variantPortrait1, equals(variantPortrait2));
      expect(variantPortrait1, isNot(equals(variantLandscape)));
    });
  });
}
