import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('Border Util Tests', () {
    test('borderWidth()', () {
      final result = borderWidth(10.0);
      expect(result.top?.width, 10.0);
      expect(result.right?.width, 10.0);
      expect(result.bottom?.width, 10.0);
      expect(result.left?.width, 10.0);
    });

    test('borderDirectionalWidth()', () {
      final result = borderDirectionalWidth(10.0);
      expect(result.start?.width, 10.0);
      expect(result.end?.width, 10.0);
      expect(result.top?.width, 10.0);
      expect(result.bottom?.width, 10.0);
    });

    test('borderStyle()', () {
      final result = borderStyle(BorderStyle.solid);
      expect(result.top?.style, BorderStyle.solid);
      expect(result.right?.style, BorderStyle.solid);
      expect(result.bottom?.style, BorderStyle.solid);
      expect(result.left?.style, BorderStyle.solid);
    });

    test('borderDirectionalStyle()', () {
      final result = borderDirectionalStyle(BorderStyle.solid);
      expect(result.start?.style, BorderStyle.solid);
      expect(result.end?.style, BorderStyle.solid);
      expect(result.top?.style, BorderStyle.solid);
      expect(result.bottom?.style, BorderStyle.solid);
    });

    test('borderStrokeAlign()', () {
      final result = borderStrokeAlign(0.5);
      expect(result.top?.strokeAlign, 0.5);
      expect(result.right?.strokeAlign, 0.5);
      expect(result.bottom?.strokeAlign, 0.5);
      expect(result.left?.strokeAlign, 0.5);
    });

    test('borderDirectionalStrokeAlign()', () {
      final result = borderDirectionalStrokeAlign(0.5);
      expect(result.start?.strokeAlign, 0.5);
      expect(result.end?.strokeAlign, 0.5);
      expect(result.top?.strokeAlign, 0.5);
      expect(result.bottom?.strokeAlign, 0.5);
    });

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

    test('borderTopColor()', () {
      final result = borderTopColor(Colors.red);
      expect(result.top?.color?.value, Colors.red);
      expect(result.right?.color, null);
      expect(result.bottom?.color, null);
      expect(result.left?.color, null);
    });

    test('borderTopWidth()', () {
      final result = borderTopWidth(10.0);
      expect(result.top?.width, 10.0);
      expect(result.right?.width, null);
      expect(result.bottom?.width, null);
      expect(result.left?.width, null);
    });

    test('borderTopStyle()', () {
      final result = borderTopStyle(BorderStyle.solid);
      expect(result.top?.style, BorderStyle.solid);
      expect(result.right?.style, null);
      expect(result.bottom?.style, null);
      expect(result.left?.style, null);
    });

    test('borderTopStrokeAlign()', () {
      final result = borderTopStrokeAlign(0.5);
      expect(result.top?.strokeAlign, 0.5);
      expect(result.right?.strokeAlign, null);
      expect(result.bottom?.strokeAlign, null);
      expect(result.left?.strokeAlign, null);
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

    test('borderBottomColor()', () {
      final result = borderBottomColor(Colors.red);
      expect(result.bottom?.color?.value, Colors.red);
      expect(result.right?.color, null);
      expect(result.top?.color, null);
      expect(result.left?.color, null);
    });

    test('borderBottomWidth()', () {
      final result = borderBottomWidth(10.0);
      expect(result.bottom?.width, 10.0);
      expect(result.right?.width, null);
      expect(result.top?.width, null);
      expect(result.left?.width, null);
    });

    test('borderBottomStyle()', () {
      final result = borderBottomStyle(BorderStyle.solid);
      expect(result.bottom?.style, BorderStyle.solid);
      expect(result.right?.style, null);
      expect(result.top?.style, null);
      expect(result.left?.style, null);
    });

    test('borderBottomStrokeAlign()', () {
      final result = borderBottomStrokeAlign(0.5);
      expect(result.bottom?.strokeAlign, 0.5);
      expect(result.right?.strokeAlign, null);
      expect(result.top?.strokeAlign, null);
      expect(result.left?.strokeAlign, null);
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

    test('borderLeftColor()', () {
      final result = borderLeftColor(Colors.red);
      expect(result.left?.color?.value, Colors.red);
      expect(result.right?.color, null);
      expect(result.top?.color, null);
      expect(result.bottom?.color, null);
    });

    test('borderLeftWidth()', () {
      final result = borderLeftWidth(10.0);
      expect(result.left?.width, 10.0);
      expect(result.right?.width, null);
      expect(result.top?.width, null);
      expect(result.bottom?.width, null);
    });

    test('borderLeftStyle()', () {
      final result = borderLeftStyle(BorderStyle.solid);
      expect(result.left?.style, BorderStyle.solid);
      expect(result.right?.style, null);
      expect(result.top?.style, null);
      expect(result.bottom?.style, null);
    });

    test('borderLeftStrokeAlign()', () {
      final result = borderLeftStrokeAlign(0.5);
      expect(result.left?.strokeAlign, 0.5);
      expect(result.right?.strokeAlign, null);
      expect(result.top?.strokeAlign, null);
      expect(result.bottom?.strokeAlign, null);
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

    test('borderRightColor()', () {
      final result = borderRightColor(Colors.red);
      expect(result.right?.color?.value, Colors.red);
      expect(result.left?.color, null);
      expect(result.top?.color, null);
      expect(result.bottom?.color, null);
    });

    test('borderRightWidth()', () {
      final result = borderRightWidth(10.0);
      expect(result.right?.width, 10.0);
      expect(result.left?.width, null);
      expect(result.top?.width, null);
      expect(result.bottom?.width, null);
    });

    test('borderRightStyle()', () {
      final result = borderRightStyle(BorderStyle.solid);
      expect(result.right?.style, BorderStyle.solid);
      expect(result.left?.style, null);
      expect(result.top?.style, null);
      expect(result.bottom?.style, null);
    });

    test('borderRightStrokeAlign()', () {
      final result = borderRightStrokeAlign(0.5);
      expect(result.right?.strokeAlign, 0.5);
      expect(result.left?.strokeAlign, null);
      expect(result.top?.strokeAlign, null);
      expect(result.bottom?.strokeAlign, null);
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

    test('borderHorizontalColor()', () {
      final result = borderHorizontalColor(Colors.blue);
      expect(result.top?.color?.value, Colors.blue);
      expect(result.bottom?.color?.value, Colors.blue);
      expect(result.left, null);
      expect(result.right, null);
    });

    test('borderHorizontalWidth()', () {
      final result = borderHorizontalWidth(5.0);
      expect(result.top?.width, 5.0);
      expect(result.bottom?.width, 5.0);
      expect(result.left, null);
      expect(result.right, null);
    });

    test('borderHorizontalStyle()', () {
      final result = borderHorizontalStyle(BorderStyle.solid);
      expect(result.top?.style, BorderStyle.solid);
      expect(result.bottom?.style, BorderStyle.solid);
      expect(result.left, null);
      expect(result.right, null);
    });

    test('borderHorizontalStrokeAlign()', () {
      final result = borderHorizontalStrokeAlign(0.3);
      expect(result.top?.strokeAlign, 0.3);
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

    test('borderVerticalColor()', () {
      final result = borderVerticalColor(Colors.green);
      expect(result.left?.color?.value, Colors.green);
      expect(result.right?.color?.value, Colors.green);
      expect(result.top, null);
      expect(result.bottom, null);
    });

    test('borderVerticalWidth()', () {
      final result = borderVerticalWidth(7.0);
      expect(result.left?.width, 7.0);
      expect(result.right?.width, 7.0);
      expect(result.top, null);
      expect(result.bottom, null);
    });

    test('borderVerticalStyle()', () {
      final result = borderVerticalStyle(BorderStyle.solid);
      expect(result.left?.style, BorderStyle.solid);
      expect(result.right?.style, BorderStyle.solid);
      expect(result.top, null);
      expect(result.bottom, null);
    });

    test('borderVerticalStrokeAlign()', () {
      final result = borderVerticalStrokeAlign(0.2);
      expect(result.left?.strokeAlign, 0.2);
      expect(result.right?.strokeAlign, 0.2);
      expect(result.top, null);
      expect(result.bottom, null);
    });

    test('borderSymetric()', () {
      final verticalSide = BorderSideAttribute(
          color: Colors.purple.toAttribute(),
          width: 4.0,
          style: BorderStyle.none,
          strokeAlign: 1.0);
      final horizontalSide = BorderSideAttribute(
          color: Colors.orange.toAttribute(),
          width: 2.0,
          style: BorderStyle.none,
          strokeAlign: 0.0);
      final result =
          borderSymetric(vertical: verticalSide, horizontal: horizontalSide);
      expect(result.left, verticalSide);
      expect(result.right, verticalSide);
      expect(result.top, horizontalSide);
      expect(result.bottom, horizontalSide);
    });

    test('borderDirectionalSymetric()', () {
      final verticalSide = BorderSideAttribute(
          color: Colors.purple.toAttribute(),
          width: 4.0,
          style: BorderStyle.none,
          strokeAlign: 1.0);
      final horizontalSide = BorderSideAttribute(
          color: Colors.orange.toAttribute(),
          width: 2.0,
          style: BorderStyle.none,
          strokeAlign: 0.0);
      final result = borderDirectionalSymetric(
          vertical: verticalSide, horizontal: horizontalSide);
      expect(result.start, verticalSide);
      expect(result.end, verticalSide);
      expect(result.top, horizontalSide);
      expect(result.bottom, horizontalSide);
    });
  });
}
