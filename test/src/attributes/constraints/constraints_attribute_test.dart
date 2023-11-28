import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('BoxConstraintsAttribute', () {
    test('from constructor sets all values correctly', () {
      const constraints = BoxConstraints(
        minWidth: 50,
        maxWidth: 150,
        minHeight: 100,
        maxHeight: 200,
      );
      final attr = constraints.toAttribute();
      expect(attr.minWidth, 50);
      expect(attr.maxWidth, 150);
      expect(attr.minHeight, 100);
      expect(attr.maxHeight, 200);
    });
    test('merge returns merged object correctly', () {
      const attr1 = BoxConstraintsAttribute(minWidth: 50, minHeight: 100);
      const attr2 = BoxConstraintsAttribute(minWidth: 60, minHeight: 110);
      final merged = attr1.merge(attr2);
      expect(merged.minWidth, 60);
      expect(merged.minHeight, 110);
      expect(merged.maxWidth, isNull);
      expect(merged.maxHeight, isNull);
    });
    test('resolve returns correct BoxConstraints with default values', () {
      const attr = BoxConstraintsAttribute();
      final constraints = attr.resolve(EmptyMixData);
      expect(constraints.minWidth, 0);
      expect(constraints.maxWidth, double.infinity);
      expect(constraints.minHeight, 0);
      expect(constraints.maxHeight, double.infinity);
    });
    test('resolve returns correct BoxConstraints with specific values', () {
      const attr = BoxConstraintsAttribute(minWidth: 50, minHeight: 100);
      final constraints = attr.resolve(EmptyMixData);
      expect(constraints.minWidth, 50);
      expect(constraints.maxWidth, double.infinity);
      expect(constraints.minHeight, 100);
      expect(constraints.maxHeight, double.infinity);
      return const Placeholder();
    });
    test('Equality holds when all properties are the same', () {
      const attr1 = BoxConstraintsAttribute(minWidth: 50, minHeight: 100);
      const attr2 = BoxConstraintsAttribute(minWidth: 50, minHeight: 100);
      expect(attr1, attr2);
    });
    test('Equality fails when properties are different', () {
      const attr1 = BoxConstraintsAttribute(minWidth: 50, minHeight: 100);
      const attr2 = BoxConstraintsAttribute(minWidth: 60, minHeight: 100);
      expect(attr1, isNot(attr2));
    });
  });

  group('BoxConstraintsUtility', () {
    test('boxConstraints()', () {
      final result = boxConstraints(
        minWidth: 50.0,
        maxWidth: 150.0,
        minHeight: 100.0,
        maxHeight: 200.0,
      );
      expect(result.minWidth, 50.0);
      expect(result.maxWidth, 150.0);
      expect(result.minHeight, 100.0);
      expect(result.maxHeight, 200.0);
    });

    test('minWidth()', () {
      final result = minWidth(50.0);
      expect(result.minWidth, 50.0);
      expect(result.maxWidth, isNull);
      expect(result.minHeight, isNull);
      expect(result.maxHeight, isNull);
    });

    test('maxWidth()', () {
      final result = maxWidth(150.0);
      expect(result.minWidth, isNull);
      expect(result.maxWidth, 150.0);
      expect(result.minHeight, isNull);
      expect(result.maxHeight, isNull);
    });

    test('minHeight()', () {
      final result = minHeight(100.0);
      expect(result.minWidth, isNull);
      expect(result.maxWidth, isNull);
      expect(result.minHeight, 100.0);
      expect(result.maxHeight, isNull);
    });

    test('maxHeight()', () {
      final result = maxHeight(200.0);
      expect(result.minWidth, isNull);
      expect(result.maxWidth, isNull);
      expect(result.minHeight, isNull);
      expect(result.maxHeight, 200.0);
    });
  });
}
