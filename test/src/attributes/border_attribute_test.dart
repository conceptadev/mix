import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('BorderRadiusGeometryAttribute', () {
    test('from factory returns BorderRadiusAttribute for BorderRadius', () {
      const borderRadius = BorderRadius.all(Radius.circular(10.0));
      final result = borderRadius.toAttribute();

      final resolvedValue = result.resolve(EmptyMixData) as BorderRadius;

      expect(result, isA<BorderRadiusGeometryAttribute>());
      expect(resolvedValue, isA<BorderRadius>());
      expect(resolvedValue.topLeft.y, 10.0);
      expect(resolvedValue.topRight.y, 10.0);
      expect(resolvedValue.bottomLeft.y, 10.0);
      expect(resolvedValue.bottomRight.y, 10.0);
    });

    test(
        'from factory returns BorderRadiusDirectionalAttribute for BorderRadiusDirectional',
        () {
      final result = BorderRadiusGeometryAttribute.circular(
        10.0,
      ).toDirectional();

      final resolvedValue =
          result.resolve(EmptyMixData) as BorderRadiusDirectional;

      expect(result, isA<BorderRadiusGeometryAttribute>());
      expect(resolvedValue, isA<BorderRadiusDirectional>());
      expect(resolvedValue.topStart.y, 10.0);
      expect(resolvedValue.topEnd.y, 10.0);
      expect(resolvedValue.bottomStart.y, 10.0);
      expect(resolvedValue.bottomEnd.y, 10.0);
    });

    test('merge returns merged object correctly', () {
      final attr1 = BorderRadiusGeometryAttribute.circular(10.0);
      const attr2 =
          BorderRadiusGeometryAttribute(topLeft: Radius.elliptical(20.0, 20.0));

      final merged = attr1.merge(attr2);

      final resolvedValue = merged.resolve(EmptyMixData) as BorderRadius;

      expect(resolvedValue.topLeft.x, 20.0);
      expect(resolvedValue.topLeft.y, 20.0);
      expect(resolvedValue.topRight.x, 10.0);
      expect(resolvedValue.topRight.y, 10.0);
      expect(resolvedValue.bottomLeft.x, 10.0);
      expect(resolvedValue.bottomLeft.y, 10.0);
      expect(resolvedValue.bottomRight.x, 10.0);
      expect(resolvedValue.bottomRight.y, 10.0);
    });

    test('resolve returns correct BorderRadius', () {
      final attr = BorderRadiusGeometryAttribute.circular(10.0);
      final borderRadius = attr.resolve(EmptyMixData) as BorderRadius;

      expect(borderRadius.topLeft, const Radius.circular(10.0));
      expect(borderRadius.topRight, const Radius.circular(10.0));
      expect(borderRadius.bottomLeft, const Radius.circular(10.0));
      expect(borderRadius.bottomRight, const Radius.circular(10.0));
    });

    test('Equality holds when all attributes are the same', () {
      final attr1 = BorderRadiusGeometryAttribute.circular(15.0);
      final attr2 = BorderRadiusGeometryAttribute.circular(15.0);

      expect(attr1, attr2);
    });

    test('Equality fails when attributes are different', () {
      final attr1 = BorderRadiusGeometryAttribute.circular(10.0);
      const attr2 = BorderRadiusGeometryAttribute(
        topLeft: Radius.elliptical(
          10.0,
          30.0,
        ),
      );

      expect(attr1, isNot(attr2));
    });
  });

  group('BorderSideAttribute', () {
    test('from constructor sets all values correctly', () {
      final attr = BorderSideAttribute(
          color: Colors.red.toAttribute(),
          width: 1.0,
          style: BorderStyle.solid);
      expect(attr.color?.value, Colors.red);
      expect(attr.width, 1.0);
      expect(attr.style, BorderStyle.solid);
    });
    test('resolve returns correct BorderSide', () {
      final attr = BorderSideAttribute(
          color: Colors.red.toAttribute(),
          width: 1.0,
          style: BorderStyle.solid);
      final borderSide = attr.resolve(EmptyMixData);
      expect(borderSide.color, Colors.red);
      expect(borderSide.width, 1.0);
      expect(borderSide.style, BorderStyle.solid);
    });
    test('Equality holds when all attributes are the same', () {
      final attr1 = BorderSideAttribute(
          color: Colors.red.toAttribute(),
          width: 1.0,
          style: BorderStyle.solid);
      final attr2 = BorderSideAttribute(
          color: Colors.red.toAttribute(),
          width: 1.0,
          style: BorderStyle.solid);
      expect(attr1, attr2);
    });
    test('Equality fails when attributes are different', () {
      final attr1 = BorderSideAttribute(
          color: Colors.red.toAttribute(),
          width: 1.0,
          style: BorderStyle.solid);
      final attr2 = BorderSideAttribute(
          color: Colors.blue.toAttribute(),
          width: 1.0,
          style: BorderStyle.solid);
      expect(attr1, isNot(attr2));
    });
  });

  group('BoxBorderAttribute', () {
    test('from constructor sets all values correctly', () {
      const attr = BoxBorderAttribute(
          top: BorderSideAttribute(width: 1.0),
          left: BorderSideAttribute(width: 2.0),
          right: BorderSideAttribute(width: 3.0),
          bottom: BorderSideAttribute(width: 4.0));
      expect(attr.top?.width, 1.0);
      expect(attr.left?.width, 2.0);
      expect(attr.right?.width, 3.0);
      expect(attr.bottom?.width, 4.0);
    });
    test('merge returns merged object correctly', () {
      const attr1 = BoxBorderAttribute(
          top: BorderSideAttribute(width: 1.0),
          left: BorderSideAttribute(width: 2.0),
          right: BorderSideAttribute(width: 3.0),
          bottom: BorderSideAttribute(width: 4.0));
      const attr2 = BoxBorderAttribute(
          top: BorderSideAttribute(width: 5.0),
          left: BorderSideAttribute(width: 6.0),
          right: BorderSideAttribute(width: 7.0),
          bottom: BorderSideAttribute(width: 8.0));
      final merged = attr1.merge(attr2);
      expect(merged.top?.width, 5.0);
      expect(merged.left?.width, 6.0);
      expect(merged.right?.width, 7.0);
      expect(merged.bottom?.width, 8.0);
    });
    test('resolve returns correct Border', () {
      const attr = BoxBorderAttribute(
          top: BorderSideAttribute(width: 1.0),
          left: BorderSideAttribute(width: 2.0),
          right: BorderSideAttribute(width: 3.0),
          bottom: BorderSideAttribute(width: 4.0));
      final border = attr.resolve(EmptyMixData) as Border;
      expect(border.top.width, 1.0);
      expect(border.left.width, 2.0);
      expect(border.right.width, 3.0);
      expect(border.bottom.width, 4.0);
    });

    test('resolve returns correct BorderDirectional', () {
      const attr = BoxBorderAttribute(
          top: BorderSideAttribute(width: 1.0),
          start: BorderSideAttribute(width: 2.0),
          end: BorderSideAttribute(width: 3.0),
          bottom: BorderSideAttribute(width: 4.0));
      final border = attr.resolve(EmptyMixData) as BorderDirectional;
      expect(border.top.width, 1.0);
      expect(border.start.width, 2.0);
      expect(border.end.width, 3.0);
      expect(border.bottom.width, 4.0);
    });
    test('Equality holds when all attributes are the same', () {
      const attr1 = BoxBorderAttribute(
          top: BorderSideAttribute(width: 1.0),
          left: BorderSideAttribute(width: 2.0),
          right: BorderSideAttribute(width: 3.0),
          bottom: BorderSideAttribute(width: 4.0));
      const attr2 = BoxBorderAttribute(
          top: BorderSideAttribute(width: 1.0),
          left: BorderSideAttribute(width: 2.0),
          right: BorderSideAttribute(width: 3.0),
          bottom: BorderSideAttribute(width: 4.0));
      expect(attr1, attr2);
    });
    test('Equality fails when attributes are different', () {
      const attr1 = BoxBorderAttribute(
          top: BorderSideAttribute(width: 1.0),
          left: BorderSideAttribute(width: 2.0),
          right: BorderSideAttribute(width: 3.0),
          bottom: BorderSideAttribute(width: 4.0));
      const attr2 = BoxBorderAttribute(
          top: BorderSideAttribute(width: 5.0),
          left: BorderSideAttribute(width: 6.0),
          right: BorderSideAttribute(width: 7.0),
          bottom: BorderSideAttribute(width: 8.0));
      expect(attr1, isNot(attr2));
    });
  });
}
