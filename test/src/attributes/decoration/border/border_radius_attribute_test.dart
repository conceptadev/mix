import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('BorderRadiusDto', () {
    test('BorderRadiusDto.all', () {
      const attr = BorderRadiusAttribute.all(Radius.circular(5.0));
      expect(attr.topLeft, const Radius.circular(5.0));
      expect(attr.topRight, const Radius.circular(5.0));
      expect(attr.bottomLeft, const Radius.circular(5.0));
      expect(attr.bottomRight, const Radius.circular(5.0));
    });

    test('BorderRadiusDto.horizontal', () {
      const attr = BorderRadiusAttribute.horizontal(
        left: Radius.circular(5.0),
        right: Radius.circular(10.0),
      );

      expect(attr.topLeft, const Radius.circular(5.0));
      expect(attr.topRight, const Radius.circular(10.0));
      expect(attr.bottomLeft, const Radius.circular(5.0));
      expect(attr.bottomRight, const Radius.circular(10.0));
    });

    test('BorderRadiusDto.vertical', () {
      const attr = BorderRadiusAttribute.vertical(
        top: Radius.circular(5.0),
        bottom: Radius.circular(10.0),
      );

      expect(attr.topLeft, const Radius.circular(5.0));
      expect(attr.topRight, const Radius.circular(5.0));
      expect(attr.bottomLeft, const Radius.circular(10.0));
      expect(attr.bottomRight, const Radius.circular(10.0));
    });

    test('merge returns merged object correctly', () {
      const attr1 = BorderRadiusAttribute.horizontal(
        left: Radius.circular(5.0),
        right: Radius.circular(10.0),
      );
      const attr2 = BorderRadiusAttribute.vertical(
        top: Radius.circular(5.0),
        bottom: Radius.circular(10.0),
      );

      final merged = attr1.merge(attr2);

      expect(merged.topLeft, attr2.topLeft);
      expect(merged.topRight, attr2.topRight);
      expect(merged.bottomLeft, attr2.bottomLeft);
      expect(merged.bottomRight, attr2.bottomRight);
    });

    test('merge should combine two BorderRadiusDtos correctly', () {
      const borderRadius1 = BorderRadiusAttribute(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(20),
        topLeft: Radius.circular(30),
        topRight: Radius.circular(40),
      );
      const borderRadius2 = BorderRadiusAttribute(
        topLeft: Radius.circular(20),
      );

      final mergedBorderRadius = borderRadius1.merge(borderRadius2);

      expect(mergedBorderRadius.topLeft, const Radius.circular(20));
      expect(mergedBorderRadius.topRight, const Radius.circular(40));
      expect(mergedBorderRadius.bottomLeft, const Radius.circular(10));
      expect(mergedBorderRadius.bottomRight, const Radius.circular(20));
    });

    test('resolve should create a BorderRadius with the correct values', () {
      const borderRadius = BorderRadiusAttribute(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(40),
      );

      final resolvedBorderRadius = borderRadius.resolve(EmptyMixData);

      expect(resolvedBorderRadius.topLeft, const Radius.circular(10));
      expect(resolvedBorderRadius.topRight, const Radius.circular(20));
      expect(resolvedBorderRadius.bottomLeft, const Radius.circular(30));
      expect(resolvedBorderRadius.bottomRight, const Radius.circular(40));
    });

    test('Equality holds when properties are the same', () {
      const attr1 = BorderRadiusAttribute(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(10.0),
        bottomLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(20.0),
      );
      const attr2 = BorderRadiusAttribute(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(10.0),
        bottomLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(20.0),
      );
      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      const attr1 = BorderRadiusAttribute(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(10.0),
        bottomLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(20.0),
      );

      const attr2 = BorderRadiusAttribute(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(10.0),
        bottomLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(25.0),
      );
      expect(attr1, isNot(attr2));
    });

    test('Matches BorderRadius contructors', () {
      const allAttr = BorderRadiusAttribute.all(Radius.circular(10.0));
      const allValue = BorderRadius.all(Radius.circular(10.0));

      final resolvedAllValue = allAttr.resolve(EmptyMixData);

      expect(resolvedAllValue, allValue);

      const horizontalAttr = BorderRadiusAttribute.horizontal(
        left: Radius.circular(5.0),
        right: Radius.circular(10.0),
      );

      const horizontalValue = BorderRadius.horizontal(
        left: Radius.circular(5.0),
        right: Radius.circular(10.0),
      );

      final resolvedHorizontalValue = horizontalAttr.resolve(EmptyMixData);

      expect(resolvedHorizontalValue, horizontalValue);

      const verticalAttr = BorderRadiusAttribute.vertical(
        top: Radius.circular(5.0),
        bottom: Radius.circular(10.0),
      );

      const verticalValue = BorderRadius.vertical(
        top: Radius.circular(5.0),
        bottom: Radius.circular(10.0),
      );

      final resolvedVerticalValue = verticalAttr.resolve(EmptyMixData);

      expect(resolvedVerticalValue, verticalValue);

      final circularAttr = BorderRadiusAttribute.circular(5.0);
      final circularValue = BorderRadius.circular(5.0);

      final resolvedCircularValue = circularAttr.resolve(EmptyMixData);

      expect(resolvedCircularValue, circularValue);

      const onlyAttr = BorderRadiusAttribute(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(10.0),
        bottomLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(20.0),
      );

      const onlyValue = BorderRadius.only(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(10.0),
        bottomLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(20.0),
      );

      final resolvedOnlyValue = onlyAttr.resolve(EmptyMixData);

      expect(resolvedOnlyValue, onlyValue);
    });
  });

  group('BorderRadiusDirectionalDto', () {
    test('BorderRadiusDirectionalDto.all', () {
      const attr = BorderRadiusDirectionalAttribute.all(Radius.circular(5.0));
      expect(attr.topStart, const Radius.circular(5.0));
      expect(attr.topEnd, const Radius.circular(5.0));
      expect(attr.bottomStart, const Radius.circular(5.0));
      expect(attr.bottomEnd, const Radius.circular(5.0));
    });

    test('BorderRadiusDirectionalDto.horizontal', () {
      const attr = BorderRadiusDirectionalAttribute.horizontal(
        start: Radius.circular(5.0),
        end: Radius.circular(10.0),
      );

      expect(attr.topStart, const Radius.circular(5.0));
      expect(attr.topEnd, const Radius.circular(10.0));
      expect(attr.bottomStart, const Radius.circular(5.0));
      expect(attr.bottomEnd, const Radius.circular(10.0));
    });

    test('BorderRadiusDirectionalDto.vertical', () {
      const attr = BorderRadiusDirectionalAttribute.vertical(
        top: Radius.circular(5.0),
        bottom: Radius.circular(10.0),
      );

      expect(attr.topStart, const Radius.circular(5.0));
      expect(attr.topEnd, const Radius.circular(5.0));
      expect(attr.bottomStart, const Radius.circular(10.0));
      expect(attr.bottomEnd, const Radius.circular(10.0));
    });

    test('BorderRadiusDirectionalDto.circular', () {
      final attr = BorderRadiusDirectionalAttribute.circular(5.0);
      expect(attr.topStart, const Radius.circular(5.0));
      expect(attr.topEnd, const Radius.circular(5.0));
      expect(attr.bottomStart, const Radius.circular(5.0));
      expect(attr.bottomEnd, const Radius.circular(5.0));
    });

    test('merge returns merged object correctly', () {
      const attr1 = BorderRadiusDirectionalAttribute.horizontal(
        start: Radius.circular(5.0),
        end: Radius.circular(10.0),
      );
      const attr2 = BorderRadiusDirectionalAttribute.vertical(
        top: Radius.circular(5.0),
        bottom: Radius.circular(10.0),
      );

      final merged = attr1.merge(attr2);

      expect(merged.topStart, attr2.topStart);
      expect(merged.topEnd, attr2.topEnd);
      expect(merged.bottomStart, attr2.bottomStart);
      expect(merged.bottomEnd, attr2.bottomEnd);
    });

    test('merge should combine two BorderRadiusDirectionalAttributes correctly',
        () {
      const borderRadius1 =
          BorderRadiusDirectionalAttribute.all(Radius.circular(10));
      const borderRadius2 = BorderRadiusDirectionalAttribute(
        topStart: Radius.circular(20),
      );

      final mergedBorderRadius = borderRadius1.merge(borderRadius2);

      expect(mergedBorderRadius.topStart, const Radius.circular(20));
      expect(mergedBorderRadius.topEnd, const Radius.circular(10));
      expect(mergedBorderRadius.bottomStart, const Radius.circular(10));
      expect(mergedBorderRadius.bottomEnd, const Radius.circular(10));
    });

    test('resolve should create a BorderRadius with the correct values', () {
      const borderRadius = BorderRadiusDirectionalAttribute(
        topStart: Radius.circular(10),
        topEnd: Radius.circular(20),
        bottomStart: Radius.circular(30),
        bottomEnd: Radius.circular(40),
      );

      final resolvedBorderRadius = borderRadius.resolve(EmptyMixData);

      expect(resolvedBorderRadius.topStart, const Radius.circular(10));
      expect(resolvedBorderRadius.topEnd, const Radius.circular(20));
      expect(resolvedBorderRadius.bottomStart, const Radius.circular(30));
      expect(resolvedBorderRadius.bottomEnd, const Radius.circular(40));
    });

    test('Equality holds when properties are the same', () {
      const attr1 = BorderRadiusDirectionalAttribute(
        topStart: Radius.circular(5.0),
        topEnd: Radius.circular(10.0),
        bottomStart: Radius.circular(15.0),
        bottomEnd: Radius.circular(20.0),
      );
      const attr2 = BorderRadiusDirectionalAttribute(
        topStart: Radius.circular(5.0),
        topEnd: Radius.circular(10.0),
        bottomStart: Radius.circular(15.0),
        bottomEnd: Radius.circular(20.0),
      );
      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      const attr1 = BorderRadiusDirectionalAttribute(
        topStart: Radius.circular(5.0),
        topEnd: Radius.circular(10.0),
        bottomStart: Radius.circular(15.0),
        bottomEnd: Radius.circular(20.0),
      );

      const attr2 = BorderRadiusDirectionalAttribute(
        topStart: Radius.circular(5.0),
        topEnd: Radius.circular(10.0),
        bottomStart: Radius.circular(15.0),
        bottomEnd: Radius.circular(25.0),
      );
      expect(attr1, isNot(attr2));
    });

    test('Matches BorderRadius contructors', () {
      const allAttr =
          BorderRadiusDirectionalAttribute.all(Radius.circular(10.0));
      const allValue = BorderRadiusDirectional.all(Radius.circular(10.0));

      final resolvedAllValue = allAttr.resolve(EmptyMixData);

      expect(resolvedAllValue, allValue);

      const horizontalAttr = BorderRadiusDirectionalAttribute.horizontal(
        start: Radius.circular(5.0),
        end: Radius.circular(10.0),
      );

      const horizontalValue = BorderRadiusDirectional.horizontal(
        start: Radius.circular(5.0),
        end: Radius.circular(10.0),
      );

      final resolvedHorizontalValue = horizontalAttr.resolve(EmptyMixData);

      expect(resolvedHorizontalValue, horizontalValue);

      const verticalAttr = BorderRadiusDirectionalAttribute.vertical(
        top: Radius.circular(5.0),
        bottom: Radius.circular(10.0),
      );

      const verticalValue = BorderRadiusDirectional.vertical(
        top: Radius.circular(5.0),
        bottom: Radius.circular(10.0),
      );

      final resolvedVerticalValue = verticalAttr.resolve(EmptyMixData);

      expect(resolvedVerticalValue, verticalValue);

      final circularAttr = BorderRadiusDirectionalAttribute.circular(5.0);
      final circularValue = BorderRadiusDirectional.circular(5.0);

      final resolvedCircularValue = circularAttr.resolve(EmptyMixData);

      expect(resolvedCircularValue, circularValue);

      const onlyAttr = BorderRadiusDirectionalAttribute(
        topStart: Radius.circular(5.0),
        topEnd: Radius.circular(10.0),
        bottomStart: Radius.circular(15.0),
        bottomEnd: Radius.circular(20.0),
      );

      const onlyValue = BorderRadiusDirectional.only(
        topStart: Radius.circular(5.0),
        topEnd: Radius.circular(10.0),
        bottomStart: Radius.circular(15.0),
        bottomEnd: Radius.circular(20.0),
      );

      final resolvedOnlyValue = onlyAttr.resolve(EmptyMixData);

      expect(resolvedOnlyValue, onlyValue);
    });
  });

  group('BorderSideDto', () {
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
}
