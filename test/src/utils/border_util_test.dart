import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('Border Util Tests', () {
    test('borderTop()', () {
      final result = borderTop(
          color: Colors.red,
          width: 10.0,
          style: BorderStyle.solid,
          strokeAlign: 0.5);
      expect(result.top?.color?.value, Colors.red);
      expect(result.top?.width, 10.0);
      expect(result.top?.style, BorderStyle.solid);
      expect(result.top?.strokeAlign, 0.5);
      expect(result.right, null);
      expect(result.bottom, null);
      expect(result.left, null);
    });

    test('borderBottom()', () {
      final result = borderBottom(
          color: Colors.red,
          width: 10.0,
          style: BorderStyle.solid,
          strokeAlign: 0.5);
      expect(result.bottom?.color?.value, Colors.red);
      expect(result.bottom?.width, 10.0);
      expect(result.bottom?.style, BorderStyle.solid);
      expect(result.bottom?.strokeAlign, 0.5);
      expect(result.right, null);
      expect(result.top, null);
      expect(result.left, null);
    });

    test('borderLeft()', () {
      final result = borderLeft(
          color: Colors.red,
          width: 10.0,
          style: BorderStyle.solid,
          strokeAlign: 0.5);
      expect(result.left?.color?.value, Colors.red);
      expect(result.left?.width, 10.0);
      expect(result.left?.style, BorderStyle.solid);
      expect(result.left?.strokeAlign, 0.5);
      expect(result.right, null);
      expect(result.top, null);
      expect(result.bottom, null);
    });

    test('borderRight()', () {
      final result = borderRight(
          color: Colors.red,
          width: 10.0,
          style: BorderStyle.solid,
          strokeAlign: 0.5);
      expect(result.right?.color?.value, Colors.red);
      expect(result.right?.width, 10.0);
      expect(result.right?.style, BorderStyle.solid);
      expect(result.right?.strokeAlign, 0.5);
      expect(result.left, null);
      expect(result.top, null);
      expect(result.bottom, null);
    });

    test('borderHorizontal()', () {
      final result = borderHorizontal(
          color: Colors.blue,
          width: 5.0,
          style: BorderStyle.solid,
          strokeAlign: 0.3);
      expect(result.top?.color?.value, Colors.blue);
      expect(result.top?.width, 5.0);
      expect(result.top?.style, BorderStyle.solid);
      expect(result.top?.strokeAlign, 0.3);
      expect(result.bottom?.color?.value, Colors.blue);
      expect(result.bottom?.width, 5.0);
      expect(result.bottom?.style, BorderStyle.solid);
      expect(result.bottom?.strokeAlign, 0.3);
      expect(result.left, null);
      expect(result.right, null);
    });

    test('borderVertical()', () {
      final result = borderVertical(
          color: Colors.green,
          width: 7.0,
          style: BorderStyle.solid,
          strokeAlign: 0.2);
      expect(result.left?.color?.value, Colors.green);
      expect(result.left?.width, 7.0);
      expect(result.left?.style, BorderStyle.solid);
      expect(result.left?.strokeAlign, 0.2);
      expect(result.right?.color?.value, Colors.green);
      expect(result.right?.width, 7.0);
      expect(result.right?.style, BorderStyle.solid);
      expect(result.right?.strokeAlign, 0.2);
      expect(result.top, null);
      expect(result.bottom, null);
    });

    test('borderSymetric()', () {
      final verticalSide = borderVertical(
        color: Colors.purple,
        width: 4.0,
        style: BorderStyle.none,
        strokeAlign: 1.0,
      );
      final horizontalSide = borderHorizontal(
        color: Colors.orange,
        width: 2.0,
        style: BorderStyle.none,
        strokeAlign: 0.0,
      );

      final result = verticalSide.merge(horizontalSide);

      expect(result.left, verticalSide.left);
      expect(result.right, verticalSide.right);
      expect(result.top, horizontalSide.top);
      expect(result.bottom, horizontalSide.bottom);
      expect(result, isA<BorderAttribute>());
    });
  });
}
