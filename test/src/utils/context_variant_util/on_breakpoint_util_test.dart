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

      expect(onXSmall.when(context), true, reason: 'xsmall');
      expect(onSmall.when(context), false, reason: 'small');
      expect(onMedium.when(context), false, reason: 'medium');
      expect(onLarge.when(context), false, reason: 'large');
    });

    testWidgets('small screen context variant', (tester) async {
      tester.binding.window.physicalSizeTestValue = smallScreenWidth;
      await tester.pumpWidget(createMediaQuery(smallScreenWidth));
      var context = tester.element(find.byType(Container));

      expect(onXSmall.when(context), false, reason: 'xsmall');
      expect(onSmall.when(context), true, reason: 'small');
      expect(onMedium.when(context), false, reason: 'medium');
      expect(onLarge.when(context), false, reason: 'large');

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    testWidgets('medium screen context variant', (tester) async {
      tester.binding.window.physicalSizeTestValue = mediumScreenWidth;
      await tester.pumpWidget(createMediaQuery(mediumScreenWidth));
      var context = tester.element(find.byType(Container));

      expect(onXSmall.when(context), false, reason: 'xsmall');
      expect(onSmall.when(context), false, reason: 'small');
      expect(onMedium.when(context), true, reason: 'medium');
      expect(onLarge.when(context), false, reason: 'large');
    });

    testWidgets('large screen context variant', (tester) async {
      tester.binding.window.physicalSizeTestValue = largeScreenWidth;
      await tester.pumpWidget(createMediaQuery(largeScreenWidth));
      var context = tester.element(find.byType(Container));

      expect(onXSmall.when(context), false, reason: 'xsmall');
      expect(onSmall.when(context), false, reason: 'small');
      expect(onMedium.when(context), false, reason: 'medium');
      expect(onLarge.when(context), true, reason: 'large');

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
