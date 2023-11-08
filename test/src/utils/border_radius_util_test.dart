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
}
