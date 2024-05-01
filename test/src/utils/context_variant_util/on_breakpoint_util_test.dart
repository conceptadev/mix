import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('Breakpoint Utils', () {
    const xSmallScreenWidth = Size(320, 480);
    const smallScreenWidth = Size(640, 480);
    const mediumScreenWidth = Size(1240, 768);
    const largeScreenWidth = Size(1440, 900);
    testWidgets('xSmall screen context variant', (tester) async {
      await tester.pumpWidget(createMediaQuery(xSmallScreenWidth));
      var context = tester.element(find.byType(Container));

      expect(onXSmall.build(context), true, reason: 'xsmall');
      expect(onSmall.build(context), false, reason: 'small');
      expect(onMedium.build(context), false, reason: 'medium');
      expect(onLarge.build(context), false, reason: 'large');
    });

    testWidgets('small screen context variant', (tester) async {
      tester.view.physicalSize = smallScreenWidth;
      await tester.pumpWidget(createMediaQuery(smallScreenWidth));
      var context = tester.element(find.byType(Container));

      expect(onXSmall.build(context), false, reason: 'xsmall');
      expect(onSmall.build(context), true, reason: 'small');
      expect(onMedium.build(context), false, reason: 'medium');
      expect(onLarge.build(context), false, reason: 'large');

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('medium screen context variant', (tester) async {
      tester.view.physicalSize = mediumScreenWidth;
      await tester.pumpWidget(createMediaQuery(mediumScreenWidth));
      var context = tester.element(find.byType(Container));

      expect(onXSmall.build(context), false, reason: 'xsmall');
      expect(onSmall.build(context), false, reason: 'small');
      expect(onMedium.build(context), true, reason: 'medium');
      expect(onLarge.build(context), false, reason: 'large');
    });

    testWidgets('large screen context variant', (tester) async {
      tester.view.physicalSize = largeScreenWidth;
      await tester.pumpWidget(createMediaQuery(largeScreenWidth));
      var context = tester.element(find.byType(Container));

      expect(onXSmall.build(context), false, reason: 'xsmall');
      expect(onSmall.build(context), false, reason: 'small');
      expect(onMedium.build(context), false, reason: 'medium');
      expect(onLarge.build(context), true, reason: 'large');

      addTearDown(tester.view.resetPhysicalSize);
    });
  });
}
