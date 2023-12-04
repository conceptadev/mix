import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('BoxBorderAttribute', () {
    const borderSide = BorderSide(
      width: 1.0,
      color: Colors.red,
      style: BorderStyle.solid,
    );

    const border = Border.fromBorderSide(borderSide);

    final border2 = Border.all(
      width: 2.0,
      color: Colors.blue,
      style: BorderStyle.none,
    );

    const borderDirectional = BorderDirectional(
      top: borderSide,
      start: borderSide,
      end: borderSide,
      bottom: borderSide,
    );

    test('resolve Border', () {
      final borderAttribute = BoxBorderAttribute(border.toDto());

      final resolvedBorder = borderAttribute.resolve(EmptyMixData) as Border;

      expect(resolvedBorder, isA<Border>());
      expect(resolvedBorder.top, border.top);
      expect(resolvedBorder.bottom, border.bottom);
      expect(resolvedBorder.left, border.left);
      expect(resolvedBorder.right, border.right);
    });

    test('resolve BorderDirectional', () {
      final borderAttribute = BoxBorderAttribute(borderDirectional.toDto());

      final resolvedBorder =
          borderAttribute.resolve(EmptyMixData) as BorderDirectional;

      expect(resolvedBorder, isA<BorderDirectional>());
      expect(resolvedBorder.top, border.top);
      expect(resolvedBorder.bottom, border.bottom);
      expect(resolvedBorder.start, border.left);
      expect(resolvedBorder.end, border.right);
    });

    test('merge', () {
      final borderAttribute1 = BoxBorderAttribute(border.toDto());

      final borderAttribute2 = BoxBorderAttribute(border2.toDto());

      final mergedAttribute = borderAttribute1.merge(borderAttribute2);

      final resolvedBorder = mergedAttribute.resolve(EmptyMixData) as Border;

      expect(mergedAttribute, isA<BoxBorderAttribute>());
      expect(mergedAttribute.value, isA<BoxBorderDto>());
      expect(resolvedBorder, isA<Border>());
      expect(resolvedBorder.top, border2.top);
      expect(resolvedBorder.bottom, border2.bottom);
      expect(resolvedBorder.left, border2.left);
      expect(resolvedBorder.right, border2.right);
    });
  });
}
