import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('BorderRadiusAttribute', () {
    test('borderRadius()', () {
      final attr = borderRadius(10);
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadius.all(
            Radius.circular(10),
          ));
    });

    test('borderRadius.vertical()', () {
      final attr = borderRadius.vertical(
        top: 10,
        bottom: 20,
      );
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadius.vertical(
            top: Radius.circular(10),
            bottom: Radius.circular(20),
          ));
    });

    test('borderRadius.horizontal()', () {
      final attr = borderRadius.horizontal(
        left: 10,
        right: 20,
      );
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadius.horizontal(
            left: Radius.circular(10),
            right: Radius.circular(20),
          ));
    });

    test('borderRadius.zero', () {
      final attr = borderRadius.zero();
      expect(
          attr.resolve(EmptyMixData),
          const BorderRadius.all(
            Radius.zero,
          ));
    });

    test('borderRadius.only()', () {
      final attr = borderRadius.only(
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
