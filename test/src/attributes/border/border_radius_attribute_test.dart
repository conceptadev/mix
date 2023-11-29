import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('BorderRadiusAttribute', () {
    test('BorderRadiusAttribute.all', () {
      final attr = BorderRadiusAttribute.all(const Radius.circular(5.0));
      expect(attr.topLeft, const Radius.circular(5.0));
      expect(attr.topRight, const Radius.circular(5.0));
      expect(attr.bottomLeft, const Radius.circular(5.0));
      expect(attr.bottomRight, const Radius.circular(5.0));
    });

    test('BorderRadiusAttribute.horizontal', () {
      final attr = BorderRadiusAttribute.horizontal(
        left: const Radius.circular(5.0),
        right: const Radius.circular(10.0),
      );

      expect(attr.topLeft, const Radius.circular(5.0));
      expect(attr.topRight, const Radius.circular(10.0));
      expect(attr.bottomLeft, const Radius.circular(5.0));
      expect(attr.bottomRight, const Radius.circular(10.0));
    });

    test('BorderRadiusAttribute.vertical', () {
      final attr = BorderRadiusAttribute.vertical(
        top: const Radius.circular(5.0),
        bottom: const Radius.circular(10.0),
      );

      expect(attr.topLeft, const Radius.circular(5.0));
      expect(attr.topRight, const Radius.circular(5.0));
      expect(attr.bottomLeft, const Radius.circular(10.0));
      expect(attr.bottomRight, const Radius.circular(10.0));
    });

    test('merge returns merged object correctly', () {
      final attr1 = BorderRadiusAttribute.horizontal(
        left: const Radius.circular(5.0),
        right: const Radius.circular(10.0),
      );
      final attr2 = BorderRadiusAttribute.vertical(
        top: const Radius.circular(5.0),
        bottom: const Radius.circular(10.0),
      );

      final merged = attr1.merge(attr2) as BorderRadiusAttribute;

      expect(merged.topLeft, attr2.topLeft);
      expect(merged.topRight, attr2.topRight);
      expect(merged.bottomLeft, attr2.bottomLeft);
      expect(merged.bottomRight, attr2.bottomRight);
    });

    test('merge should combine two BorderRadiusAttributes correctly', () {
      final borderRadius1 = BorderRadiusAttribute.only(
        bottomLeft: const Radius.circular(10),
        bottomRight: const Radius.circular(20),
        topLeft: const Radius.circular(30),
        topRight: const Radius.circular(40),
      );
      final borderRadius2 = BorderRadiusAttribute.only(
        topLeft: const Radius.circular(20),
      );

      final mergedBorderRadius =
          borderRadius1.merge(borderRadius2) as BorderRadiusAttribute;

      expect(mergedBorderRadius.topLeft, const Radius.circular(20));
      expect(mergedBorderRadius.topRight, const Radius.circular(40));
      expect(mergedBorderRadius.bottomLeft, const Radius.circular(10));
      expect(mergedBorderRadius.bottomRight, const Radius.circular(20));
    });

    test('resolve should create a BorderRadius with the correct values', () {
      final borderRadius = BorderRadiusAttribute.only(
        topLeft: const Radius.circular(10),
        topRight: const Radius.circular(20),
        bottomLeft: const Radius.circular(30),
        bottomRight: const Radius.circular(40),
      );

      final resolvedBorderRadius =
          borderRadius.resolve(EmptyMixData) as BorderRadius;

      expect(resolvedBorderRadius.topLeft, const Radius.circular(10));
      expect(resolvedBorderRadius.topRight, const Radius.circular(20));
      expect(resolvedBorderRadius.bottomLeft, const Radius.circular(30));
      expect(resolvedBorderRadius.bottomRight, const Radius.circular(40));
    });

    test('Equality holds when properties are the same', () {
      final attr1 = BorderRadiusAttribute.only(
        topLeft: const Radius.circular(5.0),
        topRight: const Radius.circular(10.0),
        bottomLeft: const Radius.circular(15.0),
        bottomRight: const Radius.circular(20.0),
      );
      final attr2 = BorderRadiusAttribute.only(
        topLeft: const Radius.circular(5.0),
        topRight: const Radius.circular(10.0),
        bottomLeft: const Radius.circular(15.0),
        bottomRight: const Radius.circular(20.0),
      );
      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      final attr1 = BorderRadiusAttribute.only(
        topLeft: const Radius.circular(5.0),
        topRight: const Radius.circular(10.0),
        bottomLeft: const Radius.circular(15.0),
        bottomRight: const Radius.circular(20.0),
      );

      final attr2 = BorderRadiusAttribute.only(
        topLeft: const Radius.circular(5.0),
        topRight: const Radius.circular(10.0),
        bottomLeft: const Radius.circular(15.0),
        bottomRight: const Radius.circular(25.0),
      );
      expect(attr1, isNot(attr2));
    });

    test('Matches BorderRadius contructors', () {
      final allAttr = BorderRadiusAttribute.all(const Radius.circular(10.0));
      const allValue = BorderRadius.all(Radius.circular(10.0));

      final resolvedAllValue = allAttr.resolve(EmptyMixData);

      expect(resolvedAllValue, allValue);

      final horizontalAttr = BorderRadiusAttribute.horizontal(
        left: const Radius.circular(5.0),
        right: const Radius.circular(10.0),
      );

      const horizontalValue = BorderRadius.horizontal(
        left: Radius.circular(5.0),
        right: Radius.circular(10.0),
      );

      final resolvedHorizontalValue = horizontalAttr.resolve(EmptyMixData);

      expect(resolvedHorizontalValue, horizontalValue);

      final verticalAttr = BorderRadiusAttribute.vertical(
        top: const Radius.circular(5.0),
        bottom: const Radius.circular(10.0),
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

      final onlyAttr = BorderRadiusAttribute.only(
        topLeft: const Radius.circular(5.0),
        topRight: const Radius.circular(10.0),
        bottomLeft: const Radius.circular(15.0),
        bottomRight: const Radius.circular(20.0),
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
      final attr =
          BorderRadiusDirectionalAttribute.all(const Radius.circular(5.0));
      expect(attr.topStart, const Radius.circular(5.0));
      expect(attr.topEnd, const Radius.circular(5.0));
      expect(attr.bottomStart, const Radius.circular(5.0));
      expect(attr.bottomEnd, const Radius.circular(5.0));
    });

    test('BorderRadiusDirectionalDto.horizontal', () {
      final attr = BorderRadiusDirectionalAttribute.horizontal(
        start: const Radius.circular(5.0),
        end: const Radius.circular(10.0),
      );

      expect(attr.topStart, const Radius.circular(5.0));
      expect(attr.topEnd, const Radius.circular(10.0));
      expect(attr.bottomStart, const Radius.circular(5.0));
      expect(attr.bottomEnd, const Radius.circular(10.0));
    });

    test('BorderRadiusDirectionalDto.vertical', () {
      final attr = BorderRadiusDirectionalAttribute.vertical(
        top: const Radius.circular(5.0),
        bottom: const Radius.circular(10.0),
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
      final attr1 = BorderRadiusDirectionalAttribute.horizontal(
        start: const Radius.circular(5.0),
        end: const Radius.circular(10.0),
      );
      final attr2 = BorderRadiusDirectionalAttribute.vertical(
        top: const Radius.circular(5.0),
        bottom: const Radius.circular(10.0),
      );

      final merged = attr1.merge(attr2) as BorderRadiusDirectionalAttribute;

      expect(merged.topStart, attr2.topStart);
      expect(merged.topEnd, attr2.topEnd);
      expect(merged.bottomStart, attr2.bottomStart);
      expect(merged.bottomEnd, attr2.bottomEnd);
    });

    test('merge should combine two BorderRadiusDirectionalAttributes correctly',
        () {
      final borderRadius1 =
          BorderRadiusDirectionalAttribute.all(const Radius.circular(10));
      final borderRadius2 = BorderRadiusDirectionalAttribute.only(
        topStart: const Radius.circular(20),
      );

      final mergedBorderRadius = borderRadius1.merge(borderRadius2)
          as BorderRadiusDirectionalAttribute;

      expect(mergedBorderRadius.topStart, const Radius.circular(20));
      expect(mergedBorderRadius.topEnd, const Radius.circular(10));
      expect(mergedBorderRadius.bottomStart, const Radius.circular(10));
      expect(mergedBorderRadius.bottomEnd, const Radius.circular(10));
    });

    test('resolve should create a BorderRadius with the correct values', () {
      final borderRadius = BorderRadiusDirectionalAttribute.only(
        topStart: const Radius.circular(10),
        topEnd: const Radius.circular(20),
        bottomStart: const Radius.circular(30),
        bottomEnd: const Radius.circular(40),
      );

      final resolvedBorderRadius =
          borderRadius.resolve(EmptyMixData) as BorderRadiusDirectional;

      expect(resolvedBorderRadius.topStart, const Radius.circular(10));
      expect(resolvedBorderRadius.topEnd, const Radius.circular(20));
      expect(resolvedBorderRadius.bottomStart, const Radius.circular(30));
      expect(resolvedBorderRadius.bottomEnd, const Radius.circular(40));
    });

    test('Equality holds when properties are the same', () {
      final attr1 = BorderRadiusDirectionalAttribute.only(
        topStart: const Radius.circular(5.0),
        topEnd: const Radius.circular(10.0),
        bottomStart: const Radius.circular(15.0),
        bottomEnd: const Radius.circular(20.0),
      );
      final attr2 = BorderRadiusDirectionalAttribute.only(
        topStart: const Radius.circular(5.0),
        topEnd: const Radius.circular(10.0),
        bottomStart: const Radius.circular(15.0),
        bottomEnd: const Radius.circular(20.0),
      );
      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      final attr1 = BorderRadiusDirectionalAttribute.only(
        topStart: const Radius.circular(5.0),
        topEnd: const Radius.circular(10.0),
        bottomStart: const Radius.circular(15.0),
        bottomEnd: const Radius.circular(20.0),
      );

      final attr2 = BorderRadiusDirectionalAttribute.only(
        topStart: const Radius.circular(5.0),
        topEnd: const Radius.circular(10.0),
        bottomStart: const Radius.circular(15.0),
        bottomEnd: const Radius.circular(25.0),
      );
      expect(attr1, isNot(attr2));
    });

    test('Matches BorderRadius contructors', () {
      final allAttr =
          BorderRadiusDirectionalAttribute.all(const Radius.circular(10.0));
      const allValue = BorderRadiusDirectional.all(Radius.circular(10.0));

      final resolvedAllValue = allAttr.resolve(EmptyMixData);

      expect(resolvedAllValue, allValue);

      final horizontalAttr = BorderRadiusDirectionalAttribute.horizontal(
        start: const Radius.circular(5.0),
        end: const Radius.circular(10.0),
      );

      const horizontalValue = BorderRadiusDirectional.horizontal(
        start: Radius.circular(5.0),
        end: Radius.circular(10.0),
      );

      final resolvedHorizontalValue = horizontalAttr.resolve(EmptyMixData);

      expect(resolvedHorizontalValue, horizontalValue);

      final verticalAttr = BorderRadiusDirectionalAttribute.vertical(
        top: const Radius.circular(5.0),
        bottom: const Radius.circular(10.0),
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

      final onlyAttr = BorderRadiusDirectionalAttribute.only(
        topStart: const Radius.circular(5.0),
        topEnd: const Radius.circular(10.0),
        bottomStart: const Radius.circular(15.0),
        bottomEnd: const Radius.circular(20.0),
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
      final attr = BorderSideDto(
          color: Colors.red.toDto(), width: 1.0, style: BorderStyle.solid);
      expect(attr.color?.value, Colors.red);
      expect(attr.width, 1.0);
      expect(attr.style, BorderStyle.solid);
    });
    test('resolve returns correct BorderSide', () {
      final attr = BorderSideDto(
          color: Colors.red.toDto(), width: 1.0, style: BorderStyle.solid);
      final borderSide = attr.resolve(EmptyMixData);
      expect(borderSide.color, Colors.red);
      expect(borderSide.width, 1.0);
      expect(borderSide.style, BorderStyle.solid);
    });
    test('Equality holds when all attributes are the same', () {
      final attr1 = BorderSideDto(
          color: Colors.red.toDto(), width: 1.0, style: BorderStyle.solid);
      final attr2 = BorderSideDto(
          color: Colors.red.toDto(), width: 1.0, style: BorderStyle.solid);
      expect(attr1, attr2);
    });
    test('Equality fails when attributes are different', () {
      final attr1 = BorderSideDto(
          color: Colors.red.toDto(), width: 1.0, style: BorderStyle.solid);
      final attr2 = BorderSideDto(
          color: Colors.blue.toDto(), width: 1.0, style: BorderStyle.solid);
      expect(attr1, isNot(attr2));
    });
  });
}
