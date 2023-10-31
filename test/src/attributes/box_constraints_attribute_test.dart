import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/data_attributes.dart';
import 'package:mix/src/core/dto/constraints_dto.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('BoxConstraintsAttribute', () {
    test('from constructor sets all values correctly', () {
      const constraints = BoxConstraints(
        minWidth: 50,
        maxWidth: 150,
        minHeight: 100,
        maxHeight: 200,
      );
      final attr = BoxConstraintsAttribute(constraints.toDto);

      expect(attr.value.minWidth, 50);
      expect(attr.value.maxWidth, 150);
      expect(attr.value.minHeight, 100);
      expect(attr.value.maxHeight, 200);
    });

    test('merge returns merged object correctly', () {
      final attr1 =
          const BoxConstraintsData(minWidth: 50, minHeight: 100).toAttribute();
      final attr2 =
          const BoxConstraintsData(minWidth: 60, minHeight: 110).toAttribute();

      final merged = attr1.merge(attr2);

      expect(merged.value.minWidth, 60); // should take from attr2
      expect(merged.value.minHeight, 110); // should take from attr2
      expect(merged.value.maxWidth, isNull);
      expect(merged.value.maxHeight, isNull);
    });

    test('resolve returns correct BoxConstraints with default values', () {
      final attr = const BoxConstraintsData().toAttribute();
      final constraints = attr.resolve(EmptyMixData);

      expect(constraints.minWidth, 0);
      expect(constraints.maxWidth, double.infinity);
      expect(constraints.minHeight, 0);
      expect(constraints.maxHeight, double.infinity);
      return const Placeholder();
    });

    test('resolve returns correct BoxConstraints with specific values', () {
      final attr =
          const BoxConstraintsData(minWidth: 50, minHeight: 100).toAttribute();
      final constraints = attr.resolve(EmptyMixData);

      expect(constraints.minWidth, 50);
      expect(constraints.maxWidth, double.infinity);
      expect(constraints.minHeight, 100);
      expect(constraints.maxHeight, double.infinity);
      return const Placeholder();
    });

    test('Equality holds when all properties are the same', () {
      final attr1 =
          const BoxConstraintsData(minWidth: 50, minHeight: 100).toAttribute();
      final attr2 =
          const BoxConstraintsData(minWidth: 50, minHeight: 100).toAttribute();

      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      final attr1 =
          const BoxConstraintsData(minWidth: 50, minHeight: 100).toAttribute();
      final attr2 =
          const BoxConstraintsData(minWidth: 60, minHeight: 100).toAttribute();

      expect(attr1, isNot(attr2));
    });
  });
}
