import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

// Act as an expert in dart and someone with deep understanding of effective dart documentation guidelines. You have been tasked to create comments in the code that help document it for other developers and users when they look at the code. Your comments should be detailed complete, but still concise.
void main() {
  group('OnBreakpointToken Utils', () {
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

    test('Check equality', () {
      final xsmall1 = OnBreakpointTokenVariant(BreakpointToken.xsmall);
      final xsmall2 = OnBreakpointTokenVariant(BreakpointToken.xsmall);
      final small1 = OnBreakpointTokenVariant(BreakpointToken.small);
      final small2 = OnBreakpointTokenVariant(BreakpointToken.small);
      final medium1 = OnBreakpointTokenVariant(BreakpointToken.medium);
      final medium2 = OnBreakpointTokenVariant(BreakpointToken.medium);
      final large1 = OnBreakpointTokenVariant(BreakpointToken.large);
      final large2 = OnBreakpointTokenVariant(BreakpointToken.large);

      expect(xsmall1, equals(xsmall2));
      expect(xsmall1, isNot(equals(small1)));
      expect(xsmall1, isNot(equals(medium1)));
      expect(xsmall1, isNot(equals(large1)));

      expect(small1, equals(small2));
      expect(small1, isNot(equals(xsmall1)));
      expect(small1, isNot(equals(medium1)));
      expect(small1, isNot(equals(large1)));

      expect(medium1, equals(medium2));
      expect(medium1, isNot(equals(xsmall1)));
      expect(medium1, isNot(equals(small1)));
      expect(medium1, isNot(equals(large1)));

      expect(large1, equals(large2));
      expect(large1, isNot(equals(xsmall1)));
      expect(large1, isNot(equals(small1)));
      expect(large1, isNot(equals(medium1)));
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
  group('OnBreakpoint Variant', () {
    testWidgets('OnBreakPointVariant', (tester) async {
      const size1 = Size(50, 100);
      const size2 = Size(150, 200);
      const size3 = Size(250, 300);
      const size4 = Size(400, 400);
      tester.view.physicalSize = size1;

      await tester.pumpWidget(createMediaQuery(size1));
      var context = tester.element(find.byType(Container));
      final breakpoint1 = OnBreakPointVariant(
        breakpoint: const Breakpoint(maxWidth: 100, minWidth: 50),
      );
      final breakpoint2 = OnBreakPointVariant(
        breakpoint: const Breakpoint(maxWidth: 200, minWidth: 50),
      );
      final breakpoint3 = OnBreakPointVariant(
        breakpoint: const Breakpoint(maxWidth: 300, minWidth: 50),
      );

      expect(breakpoint1.build(context), true, reason: 'size1 breakpoint1');
      expect(breakpoint2.build(context), true, reason: 'size1 breakpoint2');
      expect(breakpoint3.build(context), true, reason: 'size1 breakpoint3');

      tester.view.resetPhysicalSize();

      tester.view.physicalSize = size2;

      await tester.pumpWidget(createMediaQuery(size2));

      context = tester.element(find.byType(Container));

      expect(breakpoint1.build(context), false, reason: 'size2 breakpoint1');
      expect(breakpoint2.build(context), true, reason: 'size2 breakpoint2');
      expect(breakpoint3.build(context), true, reason: 'size2 breakpoint3');

      tester.view.resetPhysicalSize();

      tester.view.physicalSize = size3;

      await tester.pumpWidget(createMediaQuery(size3));
      context = tester.element(find.byType(Container));

      expect(breakpoint1.build(context), false, reason: 'size3 breakpoint1');
      expect(breakpoint2.build(context), false, reason: 'size3 breakpoint2');
      expect(breakpoint3.build(context), true, reason: 'size3 breakpoint3');

      tester.view.resetPhysicalSize();

      tester.view.physicalSize = size4;

      await tester.pumpWidget(createMediaQuery(size4));

      context = tester.element(find.byType(Container));

      expect(breakpoint1.build(context), false, reason: 'size4 breakpoint1');
      expect(breakpoint2.build(context), false, reason: 'size4 breakpoint2');
      expect(breakpoint3.build(context), false, reason: 'size4 breakpoint3');
      addTearDown(tester.view.resetPhysicalSize);
    });

    test('OnBreakPoint equality', () {
      final breakpoint1 = OnBreakPointVariant(
        breakpoint: const Breakpoint(maxWidth: 100, minWidth: 50),
      );
      final breakpoint2 = OnBreakPointVariant(
        breakpoint: const Breakpoint(maxWidth: 100, minWidth: 50),
      );
      final breakpoint3 = OnBreakPointVariant(
        breakpoint: const Breakpoint(maxWidth: 200, minWidth: 50),
      );
      final breakpoint4 = OnBreakPointVariant(
        breakpoint: const Breakpoint(maxWidth: 200, minWidth: 50),
      );

      expect(breakpoint1, equals(breakpoint2));
      expect(breakpoint1, isNot(equals(breakpoint3)));
      expect(breakpoint1, isNot(equals(breakpoint4)));
    });
  });
}
