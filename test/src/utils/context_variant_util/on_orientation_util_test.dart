import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('Orientation Utils', () {
    testWidgets('onPortrait context variant', (tester) async {
      tester.view.physicalSize = const Size(400, 600);
      await tester.pumpWidget(Container());
      var context = tester.element(find.byType(Container));

      expect(onPortrait.when(context), true, reason: 'portrait');
      expect(onLandscape.when(context), false, reason: 'landscape');

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('onLandscape context variant', (tester) async {
      tester.view.physicalSize = const Size(600, 400);
      await tester.pumpWidget(Container());
      var context = tester.element(find.byType(Container));

      expect(onPortrait.when(context), false, reason: 'portrait');
      expect(onLandscape.when(context), true, reason: 'landscape');
      addTearDown(tester.view.resetPhysicalSize);
    });
    test('have correct variant names', () {
      expect(onPortrait.name, 'on-portrait');
      expect(onLandscape.name, 'on-landscape');
    });
  });
}
