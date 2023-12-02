import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/border/border_attribute.dart';
import 'package:mix/src/attributes/border/border_dto.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('BoxBorderAttribute', () {
    test('merge should combine two BoxBorderAttributes correctly', () {
      const borderAttr1 = BoxBorderAttribute(
        BoxBorderDto(
          top: BorderSideDto(width: 5.0),
          bottom: BorderSideDto(width: 10.0),
          left: BorderSideDto(width: 15.0),
          right: BorderSideDto(width: 20.0),
        ),
      );
      const borderAttr2 = BoxBorderAttribute(
        BoxBorderDto(
          left: BorderSideDto(width: 25.0),
        ),
      );

      final mergedBorderAttr = borderAttr1.merge(borderAttr2);

      expect(mergedBorderAttr.value.top, borderAttr1.value.top);
      expect(mergedBorderAttr.top, borderAttr1.top);
      expect(mergedBorderAttr.bottom, borderAttr1.bottom);
      expect(mergedBorderAttr.value.left, borderAttr2.value.left);
      expect(mergedBorderAttr.value.right, borderAttr1.value.right);
    });

    test('resolve should create a BoxBorder with the correct values', () {
      const borderAttr = BoxBorderAttribute(
        BoxBorderDto(
          top: BorderSideDto(width: 5.0),
          bottom: BorderSideDto(width: 10.0),
          left: BorderSideDto(width: 15.0),
          right: BorderSideDto(width: 20.0),
        ),
      );

      final resolvedBorder = borderAttr.resolve(EmptyMixData) as Border;

      expect(resolvedBorder.top, const BorderSide(width: 5.0));
      expect(resolvedBorder.bottom, const BorderSide(width: 10.0));
      expect(resolvedBorder.left, const BorderSide(width: 15.0));
      expect(resolvedBorder.right, const BorderSide(width: 20.0));
    });

    test('Equality holds when properties are the same', () {
      const attr1 = BoxBorderAttribute(
        BoxBorderDto(
          top: BorderSideDto(width: 5.0),
          bottom: BorderSideDto(width: 10.0),
          left: BorderSideDto(width: 15.0),
          right: BorderSideDto(width: 20.0),
        ),
      );
      const attr2 = BoxBorderAttribute(
        BoxBorderDto(
          top: BorderSideDto(width: 5.0),
          bottom: BorderSideDto(width: 10.0),
          left: BorderSideDto(width: 15.0),
          right: BorderSideDto(width: 20.0),
        ),
      );
      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      const attr1 = BoxBorderAttribute(
        BoxBorderDto(
          top: BorderSideDto(width: 5.0),
          bottom: BorderSideDto(width: 10.0),
          left: BorderSideDto(width: 15.0),
          right: BorderSideDto(width: 20.0),
        ),
      );

      const attr2 = BoxBorderAttribute(
        BoxBorderDto(
          top: BorderSideDto(width: 5.0),
          bottom: BorderSideDto(width: 10.0),
          left: BorderSideDto(width: 15.0),
          right: BorderSideDto(width: 25.0),
        ),
      );
      expect(attr1, isNot(attr2));
    });
  });

  test('Matches Border constructors', () {
    const allAttr = BoxBorderAttribute(
      BoxBorderDto(
        top: BorderSideDto(width: 10.0),
        bottom: BorderSideDto(width: 10.0),
        left: BorderSideDto(width: 10.0),
        right: BorderSideDto(width: 10.0),
      ),
    )
    final allValue = Border.all(width: 10.0);

    final resolvedAllValue = allAttr.resolve(EmptyMixData);

    expect(resolvedAllValue, allValue);

    final symmetricAttr = BoxBorderAttribute.symmetric(
      vertical: const BorderSideDto(width: 5.0),
      horizontal: const BorderSideDto(width: 10.0),
    );

    const symmetricValue = Border.symmetric(
      vertical: BorderSide(width: 5.0),
      horizontal: BorderSide(width: 10.0),
    );

    final resolvedSymmetricValue = symmetricAttr.resolve(EmptyMixData);

    expect(resolvedSymmetricValue, symmetricValue);

    final onlyAttr = BoxBorderAttribute.only(
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

  group('BoxBorderAttribute', () {
    test('merge should combine two BoxBorderAttributes correctly', () {
      const borderAttr1 = BoxBorderAttribute(
        BoxBorderDto(
          top: BorderSideDto(width: 5.0),
          bottom: BorderSideDto(width: 10.0),
          start: BorderSideDto(width: 15.0),
          end: BorderSideDto(width: 20.0),
        ),
      );
      const borderAttr2 = BoxBorderAttribute(
        BoxBorderDto(
          start: BorderSideDto(width: 25.0),
        ),
      );

      final mergedBorderAttr = borderAttr1.merge(borderAttr2);

      expect(mergedBorderAttr.top, borderAttr1.top);
      expect(mergedBorderAttr.bottom, borderAttr1.bottom);
      expect(mergedBorderAttr.start, borderAttr2.start);
      expect(mergedBorderAttr.end, borderAttr1.end);
    });

    test('resolve should create a BorderDirectional with the correct values',
        () {
      const borderAttr = BoxBorderAttribute(
        BoxBorderDto(
          top: BorderSideDto(width: 5.0),
          bottom: BorderSideDto(width: 10.0),
          start: BorderSideDto(width: 15.0),
          end: BorderSideDto(width: 20.0),
        ),
      );

      final resolvedBorder =
          borderAttr.resolve(EmptyMixData) as BorderDirectional;

      expect(resolvedBorder.top, const BorderSide(width: 5.0));
      expect(resolvedBorder.bottom, const BorderSide(width: 10.0));
      expect(resolvedBorder.start, const BorderSide(width: 15.0));
      expect(resolvedBorder.end, const BorderSide(width: 20.0));
    });

    test('Equality holds when properties are the same', () {
      const attr1 = BoxBorderAttribute(
        BoxBorderDto(
          top: BorderSideDto(width: 5.0),
          bottom: BorderSideDto(width: 10.0),
          start: BorderSideDto(width: 15.0),
          end: BorderSideDto(width: 20.0),
        ),
      );
      const attr2 = BoxBorderAttribute(
        BoxBorderDto(
          top: BorderSideDto(width: 5.0),
          bottom: BorderSideDto(width: 10.0),
          start: BorderSideDto(width: 15.0),
          end: BorderSideDto(width: 20.0),
        ),
      );
      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      const attr1 = BoxBorderAttribute(
        BoxBorderDto(
          top: BorderSideDto(width: 5.0),
          bottom: BorderSideDto(width: 10.0),
          start: BorderSideDto(width: 15.0),
          end: BorderSideDto(width: 20.0),
        ),
      );

      const attr2 = BoxBorderAttribute(
        BoxBorderDto(
          top: BorderSideDto(width: 5.0),
          bottom: BorderSideDto(width: 10.0),
          start: BorderSideDto(width: 15.0),
          end: BorderSideDto(width: 25.0),
        ),
      );
      expect(attr1, isNot(attr2));
    });

    test('Matches Border constructors', () {
      const allAttr = BoxBorderDto(
        bottom: BorderSideDto(width: 10.0),
        end: BorderSideDto(width: 10.0),
        start: BorderSideDto(width: 10.0),
        top: BorderSideDto(width: 10.0),
      );
      const allValue = BorderDirectional(
        bottom: BorderSide(width: 10.0),
        end: BorderSide(width: 10.0),
        start: BorderSide(width: 10.0),
        top: BorderSide(width: 10.0),
      );

      final resolvedAllValue = allAttr.resolve(EmptyMixData);
      expect(resolvedAllValue, allValue);

      const onlyAttr = BoxBorderAttribute(
        BoxBorderDto(
          top: BorderSideDto(width: 5.0),
          start: BorderSideDto(width: 10.0),
          end: BorderSideDto(width: 15.0),
          bottom: BorderSideDto(width: 20.0),
        ),
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
