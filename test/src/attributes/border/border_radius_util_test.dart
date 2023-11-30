import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  const borderRadius = BorderRadiusGeometryUtility.selfBuilder;
  group('BorderRadiusUtility', () {
    test('zero should return BorderRadiusAttribute with zero radius', () {
      final result = borderRadius.zero();
      expect(result.topLeft, Radius.zero);
      expect(result.topRight, Radius.zero);
      expect(result.bottomLeft, Radius.zero);
      expect(result.bottomRight, Radius.zero);
    });

    test('only should return BorderRadiusAttribute with specified radius', () {
      final result = borderRadius.only(
        topLeft: const Radius.circular(10),
        topRight: const Radius.circular(20),
        bottomLeft: const Radius.circular(30),
        bottomRight: const Radius.circular(40),
      );
      expect(result.topLeft, const Radius.circular(10));
      expect(result.topRight, const Radius.circular(20));
      expect(result.bottomLeft, const Radius.circular(30));
      expect(result.bottomRight, const Radius.circular(40));
    });

    test('all should return BorderRadiusAttribute with specified radius', () {
      final result = borderRadius.all.circular(10);
      expect(result.topLeft, const Radius.circular(10));
      expect(result.topRight, const Radius.circular(10));
      expect(result.bottomLeft, const Radius.circular(10));
      expect(result.bottomRight, const Radius.circular(10));
    });

    test(
        'vertical should return BorderRadiusAttribute with specified top and bottom radius',
        () {
      final resultTop = borderRadius.top.circular(10);
      final resultBottom = borderRadius.bottom.circular(20);
      expect(resultTop.topLeft, const Radius.circular(10));
      expect(resultTop.topRight, const Radius.circular(10));
      expect(resultBottom.bottomLeft, const Radius.circular(20));
      expect(resultBottom.bottomRight, const Radius.circular(20));
    });

    test(
        'horizontal should return BorderRadiusAttribute with specified left and right radius',
        () {
      final resultLeft = borderRadius.left.circular(10);
      final resultRight = borderRadius.right.circular(20);
      expect(resultLeft.topLeft, const Radius.circular(10));
      expect(resultLeft.bottomLeft, const Radius.circular(10));
      expect(resultRight.topRight, const Radius.circular(20));
      expect(resultRight.bottomRight, const Radius.circular(20));
    });

    test(
        'positional should return BorderRadiusAttribute with specified positional radius',
        () {
      final result = borderRadius(10, 20, 30, 40);
      expect(result.topLeft, const Radius.circular(10));
      expect(result.topRight, const Radius.circular(20));
      expect(result.bottomLeft, const Radius.circular(30));
      expect(result.bottomRight, const Radius.circular(40));
    });

    test('circular should return BorderRadiusAttribute with specified radius',
        () {
      final result = borderRadius(10);
      expect(result.topLeft, const Radius.circular(10));
      expect(result.topRight, const Radius.circular(10));
      expect(result.bottomLeft, const Radius.circular(10));
      expect(result.bottomRight, const Radius.circular(10));
    });

    // topLeft
    test('topLeft should return BorderRadiusAttribute with specified radius',
        () {
      final result = borderRadius.topLeft.circular(10);
      expect(result.topLeft, const Radius.circular(10));
      expect(result.topRight, isNull);
      expect(result.bottomLeft, isNull);
      expect(result.bottomRight, isNull);
    });

    // topRight
    test('topRight should return BorderRadiusAttribute with specified radius',
        () {
      final result = borderRadius.topRight.circular(10);
      expect(result.topLeft, isNull);
      expect(result.topRight, const Radius.circular(10));
      expect(result.bottomLeft, isNull);
      expect(result.bottomRight, isNull);
    });

    // bottomLeft
    test('bottomLeft should return BorderRadiusAttribute with specified radius',
        () {
      final result = borderRadius.bottomLeft.circular(10);
      expect(result.topLeft, isNull);
      expect(result.topRight, isNull);
      expect(result.bottomLeft, const Radius.circular(10));
      expect(result.bottomRight, isNull);
    });

    // bottomRight
    test(
        'bottomRight should return BorderRadiusAttribute with specified radius',
        () {
      final result = borderRadius.bottomRight.circular(10);
      expect(result.topLeft, isNull);
      expect(result.topRight, isNull);
      expect(result.bottomLeft, isNull);
      expect(result.bottomRight, const Radius.circular(10));
    });
  });

  group('BorderRadiusDirectionalUtility', () {
    test('zero should return BorderRadiusDirectionalAttribute with zero radius',
        () {
      final result = borderRadius.directional.zero();
      expect(result.topStart, Radius.zero);
      expect(result.topEnd, Radius.zero);
      expect(result.bottomStart, Radius.zero);
      expect(result.bottomEnd, Radius.zero);
    });

    test(
        'only should return BorderRadiusDirectionalAttribute with specified radius',
        () {
      final result = borderRadius.directional.only(
        topStart: const Radius.circular(10),
        topEnd: const Radius.circular(20),
        bottomStart: const Radius.circular(30),
        bottomEnd: const Radius.circular(40),
      );
      expect(result.topStart, const Radius.circular(10));
      expect(result.topEnd, const Radius.circular(20));
      expect(result.bottomStart, const Radius.circular(30));
      expect(result.bottomEnd, const Radius.circular(40));
    });

    test(
        'all should return BorderRadiusDirectionalAttribute with specified radius',
        () {
      final result = borderRadius.directional.all.circular(10);
      expect(result.topStart, const Radius.circular(10));
      expect(result.topEnd, const Radius.circular(10));
      expect(result.bottomStart, const Radius.circular(10));
      expect(result.bottomEnd, const Radius.circular(10));
    });

    test('zero should return BorderRadiusDirectionalAttribute with zero radius',
        () {
      final result = borderRadius.directional.zero();
      expect(result.topStart, Radius.zero);
      expect(result.topEnd, Radius.zero);
      expect(result.bottomStart, Radius.zero);
      expect(result.bottomEnd, Radius.zero);
    });

    // topStart
    test(
        'topStart should return BorderRadiusDirectionalAttribute with specified radius',
        () {
      final result = borderRadius.directional.topStart.circular(10);
      expect(result.topStart, const Radius.circular(10));
      expect(result.topEnd, isNull);
      expect(result.bottomStart, isNull);
      expect(result.bottomEnd, isNull);
    });

    // topEnd
    test(
        'topEnd should return BorderRadiusDirectionalAttribute with specified radius',
        () {
      final result = borderRadius.directional.topEnd.circular(10);
      expect(result.topStart, isNull);
      expect(result.topEnd, const Radius.circular(10));
      expect(result.bottomStart, isNull);
      expect(result.bottomEnd, isNull);
    });

    // bottomStart
    test(
        'bottomStart should return BorderRadiusDirectionalAttribute with specified radius',
        () {
      final result = borderRadius.directional.bottomStart.circular(10);
      expect(result.topStart, isNull);
      expect(result.topEnd, isNull);
      expect(result.bottomStart, const Radius.circular(10));
      expect(result.bottomEnd, isNull);
    });

    // bottomEnd
    test(
        'bottomEnd should return BorderRadiusDirectionalAttribute with specified radius',
        () {
      final result = borderRadius.directional.bottomEnd.circular(10);
      expect(result.topStart, isNull);
      expect(result.topEnd, isNull);
      expect(result.bottomStart, isNull);
      expect(result.bottomEnd, const Radius.circular(10));
    });
  });
}
