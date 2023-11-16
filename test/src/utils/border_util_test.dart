import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('Border Util Tests', () {
    test('border.top()', () {
      final result = border.top(
        color: Colors.red,
        width: 10.0,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
      );

      expect(result.top?.color?.value, Colors.red);
      expect(result.top?.width, 10.0);
      expect(result.top?.style, BorderStyle.solid);
      expect(result.top?.strokeAlign, 0.5);
      expect(result.right, null);
      expect(result.bottom, null);
      expect(result.left, null);

      final resultColor = border.top.color(Colors.yellow);
      final resultWidth = border.top.width(20.0);
      final resultStyle = border.top.style(BorderStyle.solid);
      final resultStrokeAlign = border.top.strokeAlign(0.2);

      expect(resultColor.top?.color?.value, Colors.yellow);
      expect(resultWidth.top?.width, 20.0);
      expect(resultStyle.top?.style, BorderStyle.solid);
      expect(resultStrokeAlign.top?.strokeAlign, 0.2);
    });

    test('border.bottom()', () {
      final result = border.bottom(
        color: Colors.red,
        width: 10.0,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
      );

      expect(result.bottom?.color?.value, Colors.red);
      expect(result.bottom?.width, 10.0);
      expect(result.bottom?.style, BorderStyle.solid);
      expect(result.bottom?.strokeAlign, 0.5);
      expect(result.right, null);
      expect(result.top, null);
      expect(result.left, null);

      final resultColor = border.bottom.color(Colors.yellow);
      final resultWidth = border.bottom.width(20.0);
      final resultStyle = border.bottom.style(BorderStyle.solid);
      final resultStrokeAlign = border.bottom.strokeAlign(0.2);

      expect(resultColor.bottom?.color?.value, Colors.yellow);
      expect(resultWidth.bottom?.width, 20.0);
      expect(resultStyle.bottom?.style, BorderStyle.solid);
      expect(resultStrokeAlign.bottom?.strokeAlign, 0.2);
    });

    test('border.left()', () {
      final result = border.left(
        color: Colors.red,
        width: 10.0,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
      );
      expect(result.left?.color?.value, Colors.red);
      expect(result.left?.width, 10.0);
      expect(result.left?.style, BorderStyle.solid);
      expect(result.left?.strokeAlign, 0.5);
      expect(result.right, null);
      expect(result.top, null);
      expect(result.bottom, null);

      final resultColor = border.left.color(Colors.yellow);
      final resultWidth = border.left.width(20.0);
      final resultStyle = border.left.style(BorderStyle.solid);
      final resultStrokeAlign = border.left.strokeAlign(0.2);

      expect(resultColor.left?.color?.value, Colors.yellow);
      expect(resultWidth.left?.width, 20.0);
      expect(resultStyle.left?.style, BorderStyle.solid);
      expect(resultStrokeAlign.left?.strokeAlign, 0.2);
    });

    test('border.right()', () {
      final result = border.right(
        color: Colors.red,
        width: 10.0,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
      );
      expect(result.right?.color?.value, Colors.red);
      expect(result.right?.width, 10.0);
      expect(result.right?.style, BorderStyle.solid);
      expect(result.right?.strokeAlign, 0.5);
      expect(result.left, null);
      expect(result.top, null);
      expect(result.bottom, null);

      final resultColor = border.right.color(Colors.yellow);
      final resultWidth = border.right.width(20.0);
      final resultStyle = border.right.style(BorderStyle.solid);
      final resultStrokeAlign = border.right.strokeAlign(0.2);

      expect(resultColor.right?.color?.value, Colors.yellow);
      expect(resultWidth.right?.width, 20.0);
      expect(resultStyle.right?.style, BorderStyle.solid);
      expect(resultStrokeAlign.right?.strokeAlign, 0.2);
    });

    test('border.horizontal()', () {
      final result = border.horizontal(
        color: Colors.blue,
        width: 5.0,
        style: BorderStyle.solid,
        strokeAlign: 0.3,
      );
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

      final resultColor = border.horizontal.color(Colors.yellow);
      final resultWidth = border.horizontal.width(20.0);
      final resultStyle = border.horizontal.style(BorderStyle.solid);
      final resultStrokeAlign = border.horizontal.strokeAlign(0.2);

      expect(resultColor.top?.color?.value, Colors.yellow);
      expect(resultWidth.top?.width, 20.0);
      expect(resultStyle.top?.style, BorderStyle.solid);
      expect(resultStrokeAlign.top?.strokeAlign, 0.2);

      expect(resultColor.bottom?.color?.value, Colors.yellow);
      expect(resultWidth.bottom?.width, 20.0);
      expect(resultStyle.bottom?.style, BorderStyle.solid);
      expect(resultStrokeAlign.bottom?.strokeAlign, 0.2);
    });

    test('border.vertical()', () {
      final result = border.vertical(
        color: Colors.green,
        width: 7.0,
        style: BorderStyle.solid,
        strokeAlign: 0.2,
      );
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

      final resultColor = border.vertical.color(Colors.yellow);
      final resultWidth = border.vertical.width(20.0);
      final resultStyle = border.vertical.style(BorderStyle.solid);
      final resultStrokeAlign = border.vertical.strokeAlign(0.2);

      expect(resultColor.left?.color?.value, Colors.yellow);
      expect(resultWidth.left?.width, 20.0);
      expect(resultStyle.left?.style, BorderStyle.solid);
      expect(resultStrokeAlign.left?.strokeAlign, 0.2);

      expect(resultColor.right?.color?.value, Colors.yellow);
      expect(resultWidth.right?.width, 20.0);
      expect(resultStyle.right?.style, BorderStyle.solid);
      expect(resultStrokeAlign.right?.strokeAlign, 0.2);
    });

    // border.start
    test('border.start', () {
      final result = border.start(
        color: Colors.purple,
        width: 4.0,
        style: BorderStyle.none,
        strokeAlign: 1.0,
      );

      expect(result.start?.color?.value, Colors.purple);
      expect(result.start?.width, 4.0);
      expect(result.start?.style, BorderStyle.none);
      expect(result.start?.strokeAlign, 1.0);

      final resultColor = border.top.color(Colors.yellow);
      final resultWidth = border.top.width(20.0);
      final resultStyle = border.top.style(BorderStyle.solid);
      final resultStrokeAlign = border.top.strokeAlign(0.2);

      expect(resultColor.top?.color?.value, Colors.yellow);
      expect(resultWidth.top?.width, 20.0);
      expect(resultStyle.top?.style, BorderStyle.solid);
      expect(resultStrokeAlign.top?.strokeAlign, 0.2);
    });

    // border.end
    test('border.end', () {
      final result = border.end(
        color: Colors.purple,
        width: 4.0,
        style: BorderStyle.none,
        strokeAlign: 1.0,
      );

      expect(result.end?.color?.value, Colors.purple);
      expect(result.end?.width, 4.0);
      expect(result.end?.style, BorderStyle.none);
      expect(result.end?.strokeAlign, 1.0);

      final resultColor = border.top.color(Colors.yellow);
      final resultWidth = border.top.width(20.0);
      final resultStyle = border.top.style(BorderStyle.solid);
      final resultStrokeAlign = border.top.strokeAlign(0.2);

      expect(resultColor.top?.color?.value, Colors.yellow);
      expect(resultWidth.top?.width, 20.0);
      expect(resultStyle.top?.style, BorderStyle.solid);
      expect(resultStrokeAlign.top?.strokeAlign, 0.2);
    });
  });
}
