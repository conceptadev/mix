import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/border/border_attribute.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('BorderAttribute', () {
    test('merge should combine two BorderAttributes correctly', () {
      const borderAttr1 = BorderAttribute(
        top: BorderSideAttribute(width: 5.0),
        bottom: BorderSideAttribute(width: 10.0),
        left: BorderSideAttribute(width: 15.0),
        right: BorderSideAttribute(width: 20.0),
      );
      const borderAttr2 = BorderAttribute(
        left: BorderSideAttribute(width: 25.0),
      );

      final mergedBorderAttr = borderAttr1.merge(borderAttr2);

      expect(mergedBorderAttr.top, borderAttr1.top);
      expect(mergedBorderAttr.bottom, borderAttr1.bottom);
      expect(mergedBorderAttr.left, borderAttr2.left);
      expect(mergedBorderAttr.right, borderAttr1.right);
    });

    test('resolve should create a Border with the correct values', () {
      const borderAttr = BorderAttribute(
        top: BorderSideAttribute(width: 5.0),
        bottom: BorderSideAttribute(width: 10.0),
        left: BorderSideAttribute(width: 15.0),
        right: BorderSideAttribute(width: 20.0),
      );

      final resolvedBorder = borderAttr.resolve(EmptyMixData);

      expect(resolvedBorder.top, const BorderSide(width: 5.0));
      expect(resolvedBorder.bottom, const BorderSide(width: 10.0));
      expect(resolvedBorder.left, const BorderSide(width: 15.0));
      expect(resolvedBorder.right, const BorderSide(width: 20.0));
    });

    test('Equality holds when properties are the same', () {
      const attr1 = BorderAttribute(
        top: BorderSideAttribute(width: 5.0),
        bottom: BorderSideAttribute(width: 10.0),
        left: BorderSideAttribute(width: 15.0),
        right: BorderSideAttribute(width: 20.0),
      );
      const attr2 = BorderAttribute(
        top: BorderSideAttribute(width: 5.0),
        bottom: BorderSideAttribute(width: 10.0),
        left: BorderSideAttribute(width: 15.0),
        right: BorderSideAttribute(width: 20.0),
      );
      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      const attr1 = BorderAttribute(
        top: BorderSideAttribute(width: 5.0),
        bottom: BorderSideAttribute(width: 10.0),
        left: BorderSideAttribute(width: 15.0),
        right: BorderSideAttribute(width: 20.0),
      );

      const attr2 = BorderAttribute(
        top: BorderSideAttribute(width: 5.0),
        bottom: BorderSideAttribute(width: 10.0),
        left: BorderSideAttribute(width: 15.0),
        right: BorderSideAttribute(width: 25.0),
      );
      expect(attr1, isNot(attr2));
    });
  });

  test('Matches Border constructors', () {
    const allAttr = BorderAttribute.all(BorderSideAttribute(width: 10.0));
    final allValue = Border.all(width: 10.0);

    final resolvedAllValue = allAttr.resolve(EmptyMixData);

    expect(resolvedAllValue, allValue);

    const symmetricAttr = BorderAttribute.symmetric(
      vertical: BorderSideAttribute(width: 5.0),
      horizontal: BorderSideAttribute(width: 10.0),
    );

    const symmetricValue = Border.symmetric(
      vertical: BorderSide(width: 5.0),
      horizontal: BorderSide(width: 10.0),
    );

    final resolvedSymmetricValue = symmetricAttr.resolve(EmptyMixData);

    expect(resolvedSymmetricValue, symmetricValue);

    const onlyAttr = BorderAttribute(
      top: BorderSideAttribute(width: 5.0),
      right: BorderSideAttribute(width: 10.0),
      bottom: BorderSideAttribute(width: 15.0),
      left: BorderSideAttribute(width: 20.0),
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
      const borderAttr1 = BorderDirectionalAttribute(
        top: BorderSideAttribute(width: 5.0),
        bottom: BorderSideAttribute(width: 10.0),
        start: BorderSideAttribute(width: 15.0),
        end: BorderSideAttribute(width: 20.0),
      );
      const borderAttr2 = BorderDirectionalAttribute(
        start: BorderSideAttribute(width: 25.0),
      );

      final mergedBorderAttr = borderAttr1.merge(borderAttr2);

      expect(mergedBorderAttr.top, borderAttr1.top);
      expect(mergedBorderAttr.bottom, borderAttr1.bottom);
      expect(mergedBorderAttr.start, borderAttr2.start);
      expect(mergedBorderAttr.end, borderAttr1.end);
    });

    test('resolve should create a BorderDirectional with the correct values',
        () {
      const borderAttr = BorderDirectionalAttribute(
        top: BorderSideAttribute(width: 5.0),
        bottom: BorderSideAttribute(width: 10.0),
        start: BorderSideAttribute(width: 15.0),
        end: BorderSideAttribute(width: 20.0),
      );

      final resolvedBorder = borderAttr.resolve(EmptyMixData);

      expect(resolvedBorder.top, const BorderSide(width: 5.0));
      expect(resolvedBorder.bottom, const BorderSide(width: 10.0));
      expect(resolvedBorder.start, const BorderSide(width: 15.0));
      expect(resolvedBorder.end, const BorderSide(width: 20.0));
    });

    test('Equality holds when properties are the same', () {
      const attr1 = BorderDirectionalAttribute(
        top: BorderSideAttribute(width: 5.0),
        bottom: BorderSideAttribute(width: 10.0),
        start: BorderSideAttribute(width: 15.0),
        end: BorderSideAttribute(width: 20.0),
      );
      const attr2 = BorderDirectionalAttribute(
        top: BorderSideAttribute(width: 5.0),
        bottom: BorderSideAttribute(width: 10.0),
        start: BorderSideAttribute(width: 15.0),
        end: BorderSideAttribute(width: 20.0),
      );
      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      const attr1 = BorderDirectionalAttribute(
        top: BorderSideAttribute(width: 5.0),
        bottom: BorderSideAttribute(width: 10.0),
        start: BorderSideAttribute(width: 15.0),
        end: BorderSideAttribute(width: 20.0),
      );

      const attr2 = BorderDirectionalAttribute(
        top: BorderSideAttribute(width: 5.0),
        bottom: BorderSideAttribute(width: 10.0),
        start: BorderSideAttribute(width: 15.0),
        end: BorderSideAttribute(width: 25.0),
      );
      expect(attr1, isNot(attr2));
    });

    test('Matches Border constructors', () {
      const allAttr =
          BorderDirectionalAttribute.all(BorderSideAttribute(width: 10.0));
      const allValue = BorderDirectional(
        bottom: BorderSide(width: 10.0),
        end: BorderSide(width: 10.0),
        start: BorderSide(width: 10.0),
        top: BorderSide(width: 10.0),
      );

      final resolvedAllValue = allAttr.resolve(EmptyMixData);
      expect(resolvedAllValue, allValue);

      const onlyAttr = BorderDirectionalAttribute(
        top: BorderSideAttribute(width: 5.0),
        start: BorderSideAttribute(width: 10.0),
        end: BorderSideAttribute(width: 15.0),
        bottom: BorderSideAttribute(width: 20.0),
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
