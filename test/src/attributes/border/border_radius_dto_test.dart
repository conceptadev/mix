import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/core/extensions/color_ext.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('BorderRadiusGeometryDto', () {
    test('merge returns merged object correctly', () {
      const attr1 = BorderRadiusGeometryDto(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(10.0),
        bottomLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(20.0),
      );

      const attr2 = BorderRadiusGeometryDto(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(10.0),
        bottomLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(20.0),
      );

      final merged = attr1.merge(attr2);

      expect(merged.topLeft, attr2.topLeft);
      expect(merged.topRight, attr2.topRight);
      expect(merged.bottomLeft, attr2.bottomLeft);
      expect(merged.bottomRight, attr2.bottomRight);
    });

    test('merge should combine two BorderRadiusGeometryDtos correctly', () {
      const borderRadius1 = BorderRadiusGeometryDto(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(40),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(20),
      );
      const borderRadius2 = BorderRadiusGeometryDto(
        topLeft: Radius.circular(20),
      );

      final mergedBorderRadius = borderRadius1.merge(borderRadius2);

      expect(mergedBorderRadius.topLeft, const Radius.circular(20));
      expect(mergedBorderRadius.topRight, const Radius.circular(40));
      expect(mergedBorderRadius.bottomLeft, const Radius.circular(10));
      expect(mergedBorderRadius.bottomRight, const Radius.circular(20));
    });

    test('resolve should create a BorderRadius with the correct values', () {
      const borderRadius = BorderRadiusGeometryDto(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(40),
      );

      final resolvedBorderRadius = borderRadius.resolve(EmptyMixData) as BorderRadius;

      expect(resolvedBorderRadius.topLeft, const Radius.circular(10));
      expect(resolvedBorderRadius.topRight, const Radius.circular(20));
      expect(resolvedBorderRadius.bottomLeft, const Radius.circular(30));
      expect(resolvedBorderRadius.bottomRight, const Radius.circular(40));
    });

    test('Equality holds when properties are the same', () {
      const attr1 = BorderRadiusGeometryDto(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(10.0),
        bottomLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(20.0),
      );
      const attr2 = BorderRadiusGeometryDto(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(10.0),
        bottomLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(20.0),
      );
      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      const attr1 = BorderRadiusGeometryDto(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(10.0),
        bottomLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(20.0),
      );

      const attr2 = BorderRadiusGeometryDto(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(10.0),
        bottomLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(25.0),
      );
      expect(attr1, isNot(attr2));
    });
  });

  group('BorderRadiusGeometryDto', () {
    test('merge returns merged object correctly', () {
      const attr1 = BorderRadiusGeometryDto(
        topStart: Radius.circular(5.0),
        topEnd: Radius.circular(10.0),
        bottomStart: Radius.circular(15.0),
        bottomEnd: Radius.circular(20.0),
      );

      const attr2 = BorderRadiusGeometryDto(
        topStart: Radius.circular(5.0),
        topEnd: Radius.circular(10.0),
        bottomStart: Radius.circular(15.0),
        bottomEnd: Radius.circular(20.0),
      );

      final merged = attr1.merge(attr2);

      expect(merged.topStart, attr2.topStart);
      expect(merged.topEnd, attr2.topEnd);
      expect(merged.bottomStart, attr2.bottomStart);
      expect(merged.bottomEnd, attr2.bottomEnd);
    });

    test('merge should combine two BorderRadiusGeometryDtos correctly', () {
      const borderRadius1 = BorderRadiusGeometryDto(
        topStart: Radius.circular(10),
        topEnd: Radius.circular(10),
        bottomStart: Radius.circular(10),
        bottomEnd: Radius.circular(10),
      );
      const borderRadius2 = BorderRadiusGeometryDto(
        topStart: Radius.circular(20),
      );

      final mergedBorderRadius = borderRadius1.merge(borderRadius2);

      expect(mergedBorderRadius.topStart, const Radius.circular(20));
      expect(mergedBorderRadius.topEnd, const Radius.circular(10));
      expect(mergedBorderRadius.bottomStart, const Radius.circular(10));
      expect(mergedBorderRadius.bottomEnd, const Radius.circular(10));
    });

    test('resolve should create a BorderRadius with the correct values', () {
      const borderRadius = BorderRadiusGeometryDto(
        topStart: Radius.circular(10),
        topEnd: Radius.circular(20),
        bottomStart: Radius.circular(30),
        bottomEnd: Radius.circular(40),
      );

      final resolvedBorderRadius = borderRadius.resolve(EmptyMixData) as BorderRadiusDirectional;

      expect(resolvedBorderRadius.topStart, const Radius.circular(10));
      expect(resolvedBorderRadius.topEnd, const Radius.circular(20));
      expect(resolvedBorderRadius.bottomStart, const Radius.circular(30));
      expect(resolvedBorderRadius.bottomEnd, const Radius.circular(40));
    });

    test('Equality holds when properties are the same', () {
      const attr1 = BorderRadiusGeometryDto(
        topStart: Radius.circular(5.0),
        topEnd: Radius.circular(10.0),
        bottomStart: Radius.circular(15.0),
        bottomEnd: Radius.circular(20.0),
      );
      const attr2 = BorderRadiusGeometryDto(
        topStart: Radius.circular(5.0),
        topEnd: Radius.circular(10.0),
        bottomStart: Radius.circular(15.0),
        bottomEnd: Radius.circular(20.0),
      );
      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      const attr1 = BorderRadiusGeometryDto(
        topStart: Radius.circular(5.0),
        topEnd: Radius.circular(10.0),
        bottomStart: Radius.circular(15.0),
        bottomEnd: Radius.circular(20.0),
      );

      const attr2 = BorderRadiusGeometryDto(
        topStart: Radius.circular(5.0),
        topEnd: Radius.circular(10.0),
        bottomStart: Radius.circular(15.0),
        bottomEnd: Radius.circular(25.0),
      );
      expect(attr1, isNot(attr2));
    });
  });

  group('BorderSideDto', () {
    test('from constructor sets all values correctly', () {
      final attr = BorderSideDto(color: Colors.red.toDto(), style: BorderStyle.solid, width: 1.0);
      expect(attr.color?.value, Colors.red);
      expect(attr.width, 1.0);
      expect(attr.style, BorderStyle.solid);
    });
    test('resolve returns correct BorderSide', () {
      final attr = BorderSideDto(color: Colors.red.toDto(), style: BorderStyle.solid, width: 1.0);
      final borderSide = attr.resolve(EmptyMixData);
      expect(borderSide.color, Colors.red);
      expect(borderSide.width, 1.0);
      expect(borderSide.style, BorderStyle.solid);
    });
    test('Equality holds when all attributes are the same', () {
      final attr1 = BorderSideDto(color: Colors.red.toDto(), style: BorderStyle.solid, width: 1.0);
      final attr2 = BorderSideDto(color: Colors.red.toDto(), style: BorderStyle.solid, width: 1.0);
      expect(attr1, attr2);
    });
    test('Equality fails when attributes are different', () {
      final attr1 = BorderSideDto(color: Colors.red.toDto(), style: BorderStyle.solid, width: 1.0);
      final attr2 = BorderSideDto(color: Colors.blue.toDto(), style: BorderStyle.solid, width: 1.0);
      expect(attr1, isNot(attr2));
    });
  });
}
