import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('ContextVariant', () {
    test('Equality holds when all properties are the same', () {
      bool contextFunction(BuildContext context) => true;
      final variant1 = ContextVariant('variant1', when: contextFunction);
      final variant2 = ContextVariant('variant1', when: contextFunction);
      expect(variant1, variant2);
    });
    test('Equality fails when properties are different', () {
      final variant1 = ContextVariant('variant1', when: (context) => true);
      final variant2 = ContextVariant('variant2', when: (context) => true);
      expect(variant1, isNot(variant2));
    });
  });
  group('Breakpoint Utils', () {
    const xSmallScreenWidth = Size(320, 480);
    const smallScreenWidth = Size(640, 480);
    const mediumScreenWidth = Size(1240, 768);
    const largeScreenWidth = Size(1440, 900);
    testWidgets('xSmall screen context variant', (tester) async {
      await tester.pumpWidget(createMediaQuery(xSmallScreenWidth));
      var context = tester.element(find.byType(Container));

      expect(onXSmall.when(context), true, reason: 'xsmall');
      expect(onSmall.when(context), true, reason: 'small');
      expect(onMedium.when(context), true, reason: 'medium');
      expect(onLarge.when(context), true, reason: 'large');
    });

    testWidgets('small screen context variant', (tester) async {
      await tester.pumpWidget(createMediaQuery(smallScreenWidth));
      var context = tester.element(find.byType(Container));

      expect(onXSmall.when(context), false, reason: 'xsmall');
      expect(onSmall.when(context), true, reason: 'small');
      expect(onMedium.when(context), true, reason: 'medium');
      expect(onLarge.when(context), true, reason: 'large');
    });

    testWidgets('medium screen context variant', (tester) async {
      await tester.pumpWidget(createMediaQuery(mediumScreenWidth));
      var context = tester.element(find.byType(Container));

      expect(onXSmall.when(context), false, reason: 'xsmall');
      expect(onSmall.when(context), false, reason: 'small');
      expect(onMedium.when(context), true, reason: 'medium');
      expect(onLarge.when(context), true, reason: 'large');
    });

    testWidgets('large screen context variant', (tester) async {
      await tester.pumpWidget(createMediaQuery(largeScreenWidth));
      var context = tester.element(find.byType(Container));

      expect(onXSmall.when(context), false, reason: 'xsmall');
      expect(onSmall.when(context), false, reason: 'small');
      expect(onMedium.when(context), false, reason: 'medium');
      expect(onLarge.when(context), true, reason: 'large');
    });

    test('have correct variant names', () {
      expect(onXSmall.name, 'on-xsmall');
      expect(onSmall.name, 'on-small');
      expect(onMedium.name, 'on-medium');
      expect(onLarge.name, 'on-large');
    });
  });

  group('Brightness Utils', () {
    testWidgets('onLight context variant', (tester) async {
      await tester.pumpWidget(createBrightnessTheme(Brightness.light));
      var context = tester.element(find.byType(Container));

      expect(onLight.when(context), true, reason: 'light');
      expect(onDark.when(context), false, reason: 'dark');
    });

    testWidgets('onDark context variant', (widgetTester) async {
      await widgetTester.pumpWidget(createBrightnessTheme(Brightness.dark));
      var context = widgetTester.element(find.byType(Container));

      expect(onLight.when(context), false, reason: 'light');
      expect(onDark.when(context), true, reason: 'dark');
    });
    test('have correct variant names', () {
      expect(onLight.name, 'on-light');
      expect(onDark.name, 'on-dark');
    });
  });

  group('Directionality Utils', () {
    testWidgets('onRTL context variant', (tester) async {
      await tester.pumpWidget(createDirectionality(TextDirection.rtl));
      var context = tester.element(find.byType(Container));

      expect(onRTL.when(context), true, reason: 'rtl');
      expect(onLTR.when(context), false, reason: 'ltr');
    });

    testWidgets('onLTR context variant', (tester) async {
      await tester.pumpWidget(createDirectionality(TextDirection.ltr));
      var context = tester.element(find.byType(Container));

      expect(onRTL.when(context), false, reason: 'rtl');
      expect(onLTR.when(context), true, reason: 'ltr');
    });
    test('have correct variant names', () {
      expect(onRTL.name, 'on-rtl');
      expect(onLTR.name, 'on-ltr');
    });
  });

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
