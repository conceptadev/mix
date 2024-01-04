import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('FlexUtility', () {
    const flexUtility = FlexSpecUtility(UtilityTestAttribute.new);
    test('call() returns correct instance', () {
      final flex = flexUtility.only(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
      );

      expect(flex.value.direction, Axis.horizontal);
      expect(flex.value.mainAxisAlignment, MainAxisAlignment.center);
      expect(flex.value.crossAxisAlignment, CrossAxisAlignment.center);
      expect(flex.value.mainAxisSize, MainAxisSize.max);
    });

    // direction()
    test('direction() returns correct instance', () {
      final flex = flexUtility.direction(Axis.horizontal);

      expect(flex.value.direction, Axis.horizontal);
    });

    // mainAxisAlignment()
    test('mainAxisAlignment() returns correct instance', () {
      final flex = flexUtility.mainAxisAlignment(MainAxisAlignment.center);

      expect(flex.value.mainAxisAlignment, MainAxisAlignment.center);
    });

    // crossAxisAlignment()
    test('crossAxisAlignment() returns correct instance', () {
      final flex = flexUtility.crossAxisAlignment(CrossAxisAlignment.center);

      expect(flex.value.crossAxisAlignment, CrossAxisAlignment.center);
    });

    // mainAxisSize()
    test('mainAxisSize() returns correct instance', () {
      final flex = flexUtility.mainAxisSize(MainAxisSize.max);
      final helper = flexUtility.mainAxisSize.max();

      expect(flex.value.mainAxisSize, MainAxisSize.max);
      expect(helper.value.mainAxisSize, MainAxisSize.max);
    });

    // verticalDirection()
    test('verticalDirection() returns correct instance', () {
      final flex = flexUtility.verticalDirection(VerticalDirection.down);
      final helper = flexUtility.verticalDirection.down();

      expect(flex.value.verticalDirection, VerticalDirection.down);
      expect(helper.value.verticalDirection, VerticalDirection.down);
    });

    // textDirection()
    test('textDirection() returns correct instance', () {
      final flex = flexUtility.textDirection(TextDirection.ltr);
      final helper = flexUtility.textDirection.ltr();

      expect(flex.value.textDirection, TextDirection.ltr);
      expect(helper.value.textDirection, TextDirection.ltr);
    });

    // textBaseline()
    test('textBaseline() returns correct instance', () {
      final flex = flexUtility.textBaseline(TextBaseline.alphabetic);
      final helper = flexUtility.textBaseline.alphabetic();

      expect(flex.value.textBaseline, TextBaseline.alphabetic);
      expect(helper.value.textBaseline, TextBaseline.alphabetic);
    });

    // clipBehavior()
    test('clipBehavior() returns correct instance', () {
      final flex = flexUtility.clipBehavior(Clip.antiAlias);
      final helper = flexUtility.clipBehavior.antiAlias();

      expect(flex.value.clipBehavior, Clip.antiAlias);
      expect(helper.value.clipBehavior, Clip.antiAlias);
    });

    // gap()
    test('gap() returns correct instance', () {
      final flex = flexUtility.gap(10);

      expect(flex.value.gap, 10);
    });

    // row()
    test('row() returns correct instance', () {
      final flex = flexUtility.row();

      expect(flex.value.direction, Axis.horizontal);
    });

    // column()
    test('column() returns correct instance', () {
      final flex = flexUtility.column();

      expect(flex.value.direction, Axis.vertical);
    });
  });
}
