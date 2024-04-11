import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('FlexUtility', () {
    const flexUtility = FlexSpecUtility(selfBuilder);
    test('call() returns correct instance', () {
      final flex = flexUtility.call(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
      );

      expect(flex.direction, Axis.horizontal);
      expect(flex.mainAxisAlignment, MainAxisAlignment.center);
      expect(flex.crossAxisAlignment, CrossAxisAlignment.center);
      expect(flex.mainAxisSize, MainAxisSize.max);
    });

    // direction()
    test('direction() returns correct instance', () {
      final flex = flexUtility.direction(Axis.horizontal);

      expect(flex.direction, Axis.horizontal);
    });

    // mainAxisAlignment()
    test('mainAxisAlignment() returns correct instance', () {
      final flex = flexUtility.mainAxisAlignment(MainAxisAlignment.center);

      expect(flex.mainAxisAlignment, MainAxisAlignment.center);
    });

    // crossAxisAlignment()
    test('crossAxisAlignment() returns correct instance', () {
      final flex = flexUtility.crossAxisAlignment(CrossAxisAlignment.center);

      expect(flex.crossAxisAlignment, CrossAxisAlignment.center);
    });

    // mainAxisSize()
    test('mainAxisSize() returns correct instance', () {
      final flex = flexUtility.mainAxisSize(MainAxisSize.max);
      final helper = flexUtility.mainAxisSize.max();

      expect(flex.mainAxisSize, MainAxisSize.max);
      expect(helper.mainAxisSize, MainAxisSize.max);
    });

    // verticalDirection()
    test('verticalDirection() returns correct instance', () {
      final flex = flexUtility.verticalDirection(VerticalDirection.down);
      final helper = flexUtility.verticalDirection.down();

      expect(flex.verticalDirection, VerticalDirection.down);
      expect(helper.verticalDirection, VerticalDirection.down);
    });

    // textDirection()
    test('textDirection() returns correct instance', () {
      final flex = flexUtility.textDirection(TextDirection.ltr);
      final helper = flexUtility.textDirection.ltr();

      expect(flex.textDirection, TextDirection.ltr);
      expect(helper.textDirection, TextDirection.ltr);
    });

    // textBaseline()
    test('textBaseline() returns correct instance', () {
      final flex = flexUtility.textBaseline(TextBaseline.alphabetic);
      final helper = flexUtility.textBaseline.alphabetic();

      expect(flex.textBaseline, TextBaseline.alphabetic);
      expect(helper.textBaseline, TextBaseline.alphabetic);
    });

    // clipBehavior()
    test('clipBehavior() returns correct instance', () {
      final flex = flexUtility.clipBehavior(Clip.antiAlias);
      final helper = flexUtility.clipBehavior.antiAlias();

      expect(flex.clipBehavior, Clip.antiAlias);
      expect(helper.clipBehavior, Clip.antiAlias);
    });

    // gap()
    test('gap() returns correct instance', () {
      final flex = flexUtility.gap(10);

      expect(flex.gap, 10);
    });

    // row()
    test('row() returns correct instance', () {
      final flex = flexUtility.row();

      expect(flex.direction, Axis.horizontal);
    });

    // column()
    test('column() returns correct instance', () {
      final flex = flexUtility.column();

      expect(flex.direction, Axis.vertical);
    });
  });
}
