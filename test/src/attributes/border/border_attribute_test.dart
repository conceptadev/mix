import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/border/border_attribute.dart';
import 'package:mix/src/attributes/border/border_dto.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('BorderAttribute', () {
    test('merge should combine two BorderAttributes correctly', () {
      final borderAttr1 = BorderAttribute.only(
        top: const BorderSideDto(width: 5.0),
        bottom: const BorderSideDto(width: 10.0),
        left: const BorderSideDto(width: 15.0),
        right: const BorderSideDto(width: 20.0),
      );
      final borderAttr2 = BorderAttribute.only(
        left: const BorderSideDto(width: 25.0),
      );

      final mergedBorderAttr =
          borderAttr1.merge(borderAttr2) as BorderAttribute;

      expect(mergedBorderAttr.top, borderAttr1.top);
      expect(mergedBorderAttr.bottom, borderAttr1.bottom);
      expect(mergedBorderAttr.left, borderAttr2.left);
      expect(mergedBorderAttr.right, borderAttr1.right);
    });

    test('resolve should create a Border with the correct values', () {
      final borderAttr = BorderAttribute.only(
        top: const BorderSideDto(width: 5.0),
        bottom: const BorderSideDto(width: 10.0),
        left: const BorderSideDto(width: 15.0),
        right: const BorderSideDto(width: 20.0),
      );

      final resolvedBorder = borderAttr.resolve(EmptyMixData) as Border;

      expect(resolvedBorder.top, const BorderSide(width: 5.0));
      expect(resolvedBorder.bottom, const BorderSide(width: 10.0));
      expect(resolvedBorder.left, const BorderSide(width: 15.0));
      expect(resolvedBorder.right, const BorderSide(width: 20.0));
    });

    test('Equality holds when properties are the same', () {
      final attr1 = BorderAttribute.only(
        top: const BorderSideDto(width: 5.0),
        bottom: const BorderSideDto(width: 10.0),
        left: const BorderSideDto(width: 15.0),
        right: const BorderSideDto(width: 20.0),
      );
      final attr2 = BorderAttribute.only(
        top: const BorderSideDto(width: 5.0),
        bottom: const BorderSideDto(width: 10.0),
        left: const BorderSideDto(width: 15.0),
        right: const BorderSideDto(width: 20.0),
      );
      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      final attr1 = BorderAttribute.only(
        top: const BorderSideDto(width: 5.0),
        bottom: const BorderSideDto(width: 10.0),
        left: const BorderSideDto(width: 15.0),
        right: const BorderSideDto(width: 20.0),
      );

      final attr2 = BorderAttribute.only(
        top: const BorderSideDto(width: 5.0),
        bottom: const BorderSideDto(width: 10.0),
        left: const BorderSideDto(width: 15.0),
        right: const BorderSideDto(width: 25.0),
      );
      expect(attr1, isNot(attr2));
    });
  });

  test('Matches Border constructors', () {
    final allAttr = BorderAttribute.all(width: 10.0);
    final allValue = Border.all(width: 10.0);

    final resolvedAllValue = allAttr.resolve(EmptyMixData);

    expect(resolvedAllValue, allValue);

    final symmetricAttr = BorderAttribute.symmetric(
      vertical: const BorderSideDto(width: 5.0),
      horizontal: const BorderSideDto(width: 10.0),
    );

    const symmetricValue = Border.symmetric(
      vertical: BorderSide(width: 5.0),
      horizontal: BorderSide(width: 10.0),
    );

    final resolvedSymmetricValue = symmetricAttr.resolve(EmptyMixData);

    expect(resolvedSymmetricValue, symmetricValue);

    final onlyAttr = BorderAttribute.only(
      top: const BorderSideDto(width: 5.0),
      right: const BorderSideDto(width: 10.0),
      bottom: const BorderSideDto(width: 15.0),
      left: const BorderSideDto(width: 20.0),
    );

    const onlyValue = Border(
      top: BorderSide(width: 5.0),
      right: BorderSide(width: 10.0),
      bottom: BorderSide(width: 15.0),
      left: BorderSide(width: 20.0),
    );

    final resolvedOnlyValue = onlyAttr.resolve(EmptyMixData);

    expect(resolvedOnlyValue, onlyValue);
  });

  group('BorderDirectionalAttribute', () {
    test('merge should combine two BorderDirectionalAttributes correctly', () {
      final borderAttr1 = BorderDirectionalAttribute.only(
        top: const BorderSideDto(width: 5.0),
        bottom: const BorderSideDto(width: 10.0),
        start: const BorderSideDto(width: 15.0),
        end: const BorderSideDto(width: 20.0),
      );
      final borderAttr2 = BorderDirectionalAttribute.only(
        start: const BorderSideDto(width: 25.0),
      );

      final mergedBorderAttr =
          borderAttr1.merge(borderAttr2) as BorderDirectionalAttribute;

      expect(mergedBorderAttr.top, borderAttr1.top);
      expect(mergedBorderAttr.bottom, borderAttr1.bottom);
      expect(mergedBorderAttr.start, borderAttr2.start);
      expect(mergedBorderAttr.end, borderAttr1.end);
    });

    test('resolve should create a BorderDirectional with the correct values',
        () {
      final borderAttr = BorderDirectionalAttribute.only(
        top: const BorderSideDto(width: 5.0),
        bottom: const BorderSideDto(width: 10.0),
        start: const BorderSideDto(width: 15.0),
        end: const BorderSideDto(width: 20.0),
      );

      final resolvedBorder =
          borderAttr.resolve(EmptyMixData) as BorderDirectional;

      expect(resolvedBorder.top, const BorderSide(width: 5.0));
      expect(resolvedBorder.bottom, const BorderSide(width: 10.0));
      expect(resolvedBorder.start, const BorderSide(width: 15.0));
      expect(resolvedBorder.end, const BorderSide(width: 20.0));
    });

    test('Equality holds when properties are the same', () {
      final attr1 = BorderDirectionalAttribute.only(
        top: const BorderSideDto(width: 5.0),
        bottom: const BorderSideDto(width: 10.0),
        start: const BorderSideDto(width: 15.0),
        end: const BorderSideDto(width: 20.0),
      );
      final attr2 = BorderDirectionalAttribute.only(
        top: const BorderSideDto(width: 5.0),
        bottom: const BorderSideDto(width: 10.0),
        start: const BorderSideDto(width: 15.0),
        end: const BorderSideDto(width: 20.0),
      );
      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      final attr1 = BorderDirectionalAttribute.only(
        top: const BorderSideDto(width: 5.0),
        bottom: const BorderSideDto(width: 10.0),
        start: const BorderSideDto(width: 15.0),
        end: const BorderSideDto(width: 20.0),
      );

      final attr2 = BorderDirectionalAttribute.only(
        top: const BorderSideDto(width: 5.0),
        bottom: const BorderSideDto(width: 10.0),
        start: const BorderSideDto(width: 15.0),
        end: const BorderSideDto(width: 25.0),
      );
      expect(attr1, isNot(attr2));
    });

    test('Matches Border constructors', () {
      final allAttr = BorderDirectionalAttribute.all(width: 10.0);
      const allValue = BorderDirectional(
        bottom: BorderSide(width: 10.0),
        end: BorderSide(width: 10.0),
        start: BorderSide(width: 10.0),
        top: BorderSide(width: 10.0),
      );

      final resolvedAllValue = allAttr.resolve(EmptyMixData);
      expect(resolvedAllValue, allValue);

      final onlyAttr = BorderDirectionalAttribute.only(
        top: const BorderSideDto(width: 5.0),
        start: const BorderSideDto(width: 10.0),
        end: const BorderSideDto(width: 15.0),
        bottom: const BorderSideDto(width: 20.0),
      );

      const onlyValue = BorderDirectional(
        top: BorderSide(width: 5.0),
        start: BorderSide(width: 10.0),
        end: BorderSide(width: 15.0),
        bottom: BorderSide(width: 20.0),
      );

      final resolvedOnlyValue = onlyAttr.resolve(EmptyMixData);

      expect(resolvedOnlyValue, onlyValue);
    });
  });
}
