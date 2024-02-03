import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  const borderRadius = BorderRadiusGeometryUtility(UtilityTestAttribute.new);
  const borderRadiusDirectional = BorderRadiusDirectionalUtility(UtilityTestAttribute.new);
  group('BorderRadiusUtility', () {
    test('zero should return BorderRadiusAttribute with zero radius', () {
      final result = borderRadius.zero();
      expect(result.value.topLeft, Radius.zero);
      expect(result.value.topRight, Radius.zero);
      expect(result.value.bottomLeft, Radius.zero);
      expect(result.value.bottomRight, Radius.zero);
    });

    test('only should return BorderRadiusAttribute with specified radius', () {
      final result = borderRadius.only(
        topLeft: const Radius.circular(10),
        topRight: const Radius.circular(20),
        bottomLeft: const Radius.circular(30),
        bottomRight: const Radius.circular(40),
      );
      expect(result.value.topLeft, const Radius.circular(10));
      expect(result.value.topRight, const Radius.circular(20));
      expect(result.value.bottomLeft, const Radius.circular(30));
      expect(result.value.bottomRight, const Radius.circular(40));
    });

    test('all should return BorderRadiusAttribute with specified radius', () {
      final result = borderRadius.all.circular(10);
      expect(result.value.topLeft, const Radius.circular(10));
      expect(result.value.topRight, const Radius.circular(10));
      expect(result.value.bottomLeft, const Radius.circular(10));
      expect(result.value.bottomRight, const Radius.circular(10));
    });

    test('vertical should return BorderRadiusAttribute with specified top and bottom radius', () {
      final resultTop = borderRadius.top.circular(10);
      final resultBottom = borderRadius.bottom.circular(20);
      expect(resultTop.value.topLeft, const Radius.circular(10));
      expect(resultTop.value.topRight, const Radius.circular(10));
      expect(resultBottom.value.bottomLeft, const Radius.circular(20));
      expect(resultBottom.value.bottomRight, const Radius.circular(20));
    });

    test('horizontal should return BorderRadiusAttribute with specified left and right radius', () {
      final resultLeft = borderRadius.left.circular(10);
      final resultRight = borderRadius.right.circular(20);
      expect(resultLeft.value.topLeft, const Radius.circular(10));
      expect(resultLeft.value.bottomLeft, const Radius.circular(10));
      expect(resultRight.value.topRight, const Radius.circular(20));
      expect(resultRight.value.bottomRight, const Radius.circular(20));
    });

    test('positional should return BorderRadiusAttribute with specified positional radius', () {
      final result = borderRadius(10, 20, 30, 40);
      expect(result.value.topLeft, const Radius.circular(10));
      expect(result.value.topRight, const Radius.circular(20));
      expect(result.value.bottomLeft, const Radius.circular(30));
      expect(result.value.bottomRight, const Radius.circular(40));
    });

    test('circular should return BorderRadiusAttribute with specified radius', () {
      final result = borderRadius(10);
      expect(result.value.topLeft, const Radius.circular(10));
      expect(result.value.topRight, const Radius.circular(10));
      expect(result.value.bottomLeft, const Radius.circular(10));
      expect(result.value.bottomRight, const Radius.circular(10));
    });

    // topLeft
    test('topLeft should return BorderRadiusAttribute with specified radius', () {
      final result = borderRadius.topLeft.circular(10);
      expect(result.value.topLeft, const Radius.circular(10));
      expect(result.value.topRight, isNull);
      expect(result.value.bottomLeft, isNull);
      expect(result.value.bottomRight, isNull);
    });

    // topRight
    test('topRight should return BorderRadiusAttribute with specified radius', () {
      final result = borderRadius.topRight.circular(10);
      expect(result.value.topLeft, isNull);
      expect(result.value.topRight, const Radius.circular(10));
      expect(result.value.bottomLeft, isNull);
      expect(result.value.bottomRight, isNull);
    });

    // bottomLeft
    test('bottomLeft should return BorderRadiusAttribute with specified radius', () {
      final result = borderRadius.bottomLeft.circular(10);
      expect(result.value.topLeft, isNull);
      expect(result.value.topRight, isNull);
      expect(result.value.bottomLeft, const Radius.circular(10));
      expect(result.value.bottomRight, isNull);
    });

    // bottomRight
    test('bottomRight should return BorderRadiusAttribute with specified radius', () {
      final result = borderRadius.bottomRight.circular(10);
      expect(result.value.topLeft, isNull);
      expect(result.value.topRight, isNull);
      expect(result.value.bottomLeft, isNull);
      expect(result.value.bottomRight, const Radius.circular(10));
    });
  });

  group('BorderRadiusDirectionalUtility', () {
    test('zero should return BorderRadiusDirectionalAttribute with zero radius', () {
      final result = borderRadiusDirectional.zero();
      expect(result.value.topStart, Radius.zero);
      expect(result.value.topEnd, Radius.zero);
      expect(result.value.bottomStart, Radius.zero);
      expect(result.value.bottomEnd, Radius.zero);
    });

    test('only should return BorderRadiusDirectionalAttribute with specified radius', () {
      final result = borderRadiusDirectional.only(
        topStart: const Radius.circular(10),
        topEnd: const Radius.circular(20),
        bottomStart: const Radius.circular(30),
        bottomEnd: const Radius.circular(40),
      );
      expect(result.value.topStart, const Radius.circular(10));
      expect(result.value.topEnd, const Radius.circular(20));
      expect(result.value.bottomStart, const Radius.circular(30));
      expect(result.value.bottomEnd, const Radius.circular(40));
    });

    test('all should return BorderRadiusDirectionalAttribute with specified radius', () {
      final result = borderRadiusDirectional.all.circular(10);
      expect(result.value.topStart, const Radius.circular(10));
      expect(result.value.topEnd, const Radius.circular(10));
      expect(result.value.bottomStart, const Radius.circular(10));
      expect(result.value.bottomEnd, const Radius.circular(10));
    });

    test('zero should return BorderRadiusDirectionalAttribute with zero radius', () {
      final result = borderRadiusDirectional.zero();
      expect(result.value.topStart, Radius.zero);
      expect(result.value.topEnd, Radius.zero);
      expect(result.value.bottomStart, Radius.zero);
      expect(result.value.bottomEnd, Radius.zero);
    });

    // topStart
    test('topStart should return BorderRadiusDirectionalAttribute with specified radius', () {
      final result = borderRadiusDirectional.topStart.circular(10);
      expect(result.value.topStart, const Radius.circular(10));
      expect(result.value.topEnd, isNull);
      expect(result.value.bottomStart, isNull);
      expect(result.value.bottomEnd, isNull);
    });

    // topEnd
    test('topEnd should return BorderRadiusDirectionalAttribute with specified radius', () {
      final result = borderRadiusDirectional.topEnd.circular(10);
      expect(result.value.topStart, isNull);
      expect(result.value.topEnd, const Radius.circular(10));
      expect(result.value.bottomStart, isNull);
      expect(result.value.bottomEnd, isNull);
    });

    // bottomStart
    test('bottomStart should return BorderRadiusDirectionalAttribute with specified radius', () {
      final result = borderRadiusDirectional.bottomStart.circular(10);
      expect(result.value.topStart, isNull);
      expect(result.value.topEnd, isNull);
      expect(result.value.bottomStart, const Radius.circular(10));
      expect(result.value.bottomEnd, isNull);
    });

    // bottomEnd
    test('bottomEnd should return BorderRadiusDirectionalAttribute with specified radius', () {
      final result = borderRadiusDirectional.bottomEnd.circular(10);
      expect(result.value.topStart, isNull);
      expect(result.value.topEnd, isNull);
      expect(result.value.bottomStart, isNull);
      expect(result.value.bottomEnd, const Radius.circular(10));
    });
  });
}
