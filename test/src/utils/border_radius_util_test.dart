import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('BorderRadiusAttribute', () {
    test('borderRadius()', () {
      final attr = borderRadius(const Radius.circular(10));
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadius.all(
            Radius.circular(10),
          ));
    });

    test('borderRadiusVertical()', () {
      final attr = borderRadiusVertical(
        top: const Radius.circular(10),
        bottom: const Radius.circular(20),
      );
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadius.vertical(
            top: Radius.circular(10),
            bottom: Radius.circular(20),
          ));
    });

    test('borderRadiusHorizontal()', () {
      final attr = borderRadiusHorizontal(
        left: const Radius.circular(10),
        right: const Radius.circular(20),
      );
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadius.horizontal(
            left: Radius.circular(10),
            right: Radius.circular(20),
          ));
    });

    test('borderRadiusZero()', () {
      final attr = borderRadius(Radius.zero);
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadius.all(
            Radius.zero,
          ));
    });

    test('borderRadiusOnly()', () {
      final attr = borderRadiusOnly(
        topLeft: const Radius.circular(10),
        topRight: const Radius.circular(20),
        bottomLeft: const Radius.circular(30),
        bottomRight: const Radius.circular(40),
      );
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(40),
          ));
    });

    test('borderRadiusDirectional()', () {
      final attr = borderRadiusDirectional(const Radius.circular(10));
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadiusDirectional.all(
            Radius.circular(10),
          ));
    });
  });

  group('Rounded utilities', () {
    test('rounded()', () {
      final attr = rounded(10, 20, 30, 40);
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(40),
          ));
    });

    test('roundedDirectional()', () {
      final attr = roundedDirectional(10, 20, 30, 40);
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadiusDirectional.only(
            topStart: Radius.circular(10),
            topEnd: Radius.circular(20),
            bottomStart: Radius.circular(30),
            bottomEnd: Radius.circular(40),
          ));
    });

    test('roundedTopLeft()', () {
      final attr = roundedTopLeft(10);
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadius.only(
            topLeft: Radius.circular(10),
          ));
    });

    test('roundedTopRight()', () {
      final attr = roundedTopRight(10);
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadius.only(
            topRight: Radius.circular(10),
          ));
    });

    test('roundedBottomLeft()', () {
      final attr = roundedBottomLeft(10);
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadius.only(
            bottomLeft: Radius.circular(10),
          ));
    });

    test('roundedBottomRight()', () {
      final attr = roundedBottomRight(10);
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadius.only(
            bottomRight: Radius.circular(10),
          ));
    });

    test('roundedTopStart()', () {
      final attr = roundedTopStart(10);
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadiusDirectional.only(
            topStart: Radius.circular(10),
          ));
    });

    test('roundedTopEnd()', () {
      final attr = roundedTopEnd(10);
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadiusDirectional.only(
            topEnd: Radius.circular(10),
          ));
    });

    test('roundedBottomStart()', () {
      final attr = roundedBottomStart(10);
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadiusDirectional.only(
            bottomStart: Radius.circular(10),
          ));
    });

    test('roundedBottomEnd()', () {
      final attr = roundedBottomEnd(10);
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(10),
          ));
    });

    test('roundedHorizontal()', () {
      final attr = roundedHorizontal(left: 10, right: 20);
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadius.horizontal(
            left: Radius.circular(10),
            right: Radius.circular(20),
          ));
    });

    test('roundedVertical()', () {
      final attr = roundedVertical(top: 10, bottom: 20);
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadius.vertical(
            top: Radius.circular(10),
            bottom: Radius.circular(20),
          ));
    });
  });
}
