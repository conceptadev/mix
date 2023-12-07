import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('BorderUtility', () {
    const border = BoxBorderUtility(UtilityTestAttribute.new);

    test('border.top()', () {
      final result = border.top(
        color: Colors.red,
        width: 10.0,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
      );

      expect(result.value.top?.color?.value, Colors.red);
      expect(result.value.top?.width, 10.0);
      expect(result.value.top?.style, BorderStyle.solid);
      expect(result.value.top?.strokeAlign, 0.5);
      expect(result.value.right, null);
      expect(result.value.bottom, null);
      expect(result.value.left, null);

      final resultColor = border.top.color(Colors.yellow);
      final resultWidth = border.top.width(20.0);
      final resultStyle = border.top.style(BorderStyle.solid);
      final resultStrokeAlign = border.top.strokeAlign(0.2);

      expect(resultColor.value.top?.color?.value, Colors.yellow);
      expect(resultWidth.value.top?.width, 20.0);
      expect(resultStyle.value.top?.style, BorderStyle.solid);
      expect(resultStrokeAlign.value.top?.strokeAlign, 0.2);
    });

    test('border.bottom()', () {
      final result = border.bottom(
        color: Colors.red,
        width: 10.0,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
      );

      expect(result.value.bottom?.color?.value, Colors.red);
      expect(result.value.bottom?.width, 10.0);
      expect(result.value.bottom?.style, BorderStyle.solid);
      expect(result.value.bottom?.strokeAlign, 0.5);
      expect(result.value.right, null);
      expect(result.value.top, null);
      expect(result.value.left, null);

      final resultColor = border.bottom.color(Colors.yellow);
      final resultWidth = border.bottom.width(20.0);
      final resultStyle = border.bottom.style(BorderStyle.solid);
      final resultStrokeAlign = border.bottom.strokeAlign(0.2);

      expect(resultColor.value.bottom?.color?.value, Colors.yellow);
      expect(resultWidth.value.bottom?.width, 20.0);
      expect(resultStyle.value.bottom?.style, BorderStyle.solid);
      expect(resultStrokeAlign.value.bottom?.strokeAlign, 0.2);
    });

    test('border.left()', () {
      final result = border.left(
        color: Colors.red,
        width: 10.0,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
      );
      expect(result.value.left?.color?.value, Colors.red);
      expect(result.value.left?.width, 10.0);
      expect(result.value.left?.style, BorderStyle.solid);
      expect(result.value.left?.strokeAlign, 0.5);
      expect(result.value.right, null);
      expect(result.value.top, null);
      expect(result.value.bottom, null);

      final resultColor = border.left.color(Colors.yellow);
      final resultWidth = border.left.width(20.0);
      final resultStyle = border.left.style(BorderStyle.solid);
      final resultStrokeAlign = border.left.strokeAlign(0.2);

      expect(resultColor.value.left?.color?.value, Colors.yellow);
      expect(resultWidth.value.left?.width, 20.0);
      expect(resultStyle.value.left?.style, BorderStyle.solid);
      expect(resultStrokeAlign.value.left?.strokeAlign, 0.2);
    });

    test('border.right()', () {
      final result = border.right(
        color: Colors.red,
        width: 10.0,
        style: BorderStyle.solid,
        strokeAlign: 0.5,
      );
      expect(result.value.right?.color?.value, Colors.red);
      expect(result.value.right?.width, 10.0);
      expect(result.value.right?.style, BorderStyle.solid);
      expect(result.value.right?.strokeAlign, 0.5);
      expect(result.value.left, null);
      expect(result.value.top, null);
      expect(result.value.bottom, null);

      final resultColor = border.right.color(Colors.yellow);
      final resultWidth = border.right.width(20.0);
      final resultStyle = border.right.style(BorderStyle.solid);
      final resultStrokeAlign = border.right.strokeAlign(0.2);

      expect(resultColor.value.right?.color?.value, Colors.yellow);
      expect(resultWidth.value.right?.width, 20.0);
      expect(resultStyle.value.right?.style, BorderStyle.solid);
      expect(resultStrokeAlign.value.right?.strokeAlign, 0.2);
    });

    test('border.horizontal()', () {
      final result = border.horizontal(
        color: Colors.blue,
        width: 5.0,
        style: BorderStyle.solid,
        strokeAlign: 0.3,
      );
      expect(result.value.top?.color?.value, Colors.blue);
      expect(result.value.top?.width, 5.0);
      expect(result.value.top?.style, BorderStyle.solid);
      expect(result.value.top?.strokeAlign, 0.3);
      expect(result.value.bottom?.color?.value, Colors.blue);
      expect(result.value.bottom?.width, 5.0);
      expect(result.value.bottom?.style, BorderStyle.solid);
      expect(result.value.bottom?.strokeAlign, 0.3);
      expect(result.value.left, null);
      expect(result.value.right, null);

      final resultColor = border.horizontal.color(Colors.yellow);
      final resultWidth = border.horizontal.width(20.0);
      final resultStyle = border.horizontal.style(BorderStyle.solid);
      final resultStrokeAlign = border.horizontal.strokeAlign(0.2);

      expect(resultColor.value.top?.color?.value, Colors.yellow);
      expect(resultWidth.value.top?.width, 20.0);
      expect(resultStyle.value.top?.style, BorderStyle.solid);
      expect(resultStrokeAlign.value.top?.strokeAlign, 0.2);

      expect(resultColor.value.bottom?.color?.value, Colors.yellow);
      expect(resultWidth.value.bottom?.width, 20.0);
      expect(resultStyle.value.bottom?.style, BorderStyle.solid);
      expect(resultStrokeAlign.value.bottom?.strokeAlign, 0.2);
    });

    test('border.vertical()', () {
      final result = border.vertical(
        color: Colors.green,
        width: 7.0,
        style: BorderStyle.solid,
        strokeAlign: 0.2,
      );
      expect(result.value.left?.color?.value, Colors.green);
      expect(result.value.left?.width, 7.0);
      expect(result.value.left?.style, BorderStyle.solid);
      expect(result.value.left?.strokeAlign, 0.2);
      expect(result.value.right?.color?.value, Colors.green);
      expect(result.value.right?.width, 7.0);
      expect(result.value.right?.style, BorderStyle.solid);
      expect(result.value.right?.strokeAlign, 0.2);
      expect(result.value.top, null);
      expect(result.value.bottom, null);

      final resultColor = border.vertical.color(Colors.yellow);
      final resultWidth = border.vertical.width(20.0);
      final resultStyle = border.vertical.style(BorderStyle.solid);
      final resultStrokeAlign = border.vertical.strokeAlign(0.2);

      expect(resultColor.value.left?.color?.value, Colors.yellow);
      expect(resultWidth.value.left?.width, 20.0);
      expect(resultStyle.value.left?.style, BorderStyle.solid);
      expect(resultStrokeAlign.value.left?.strokeAlign, 0.2);

      expect(resultColor.value.right?.color?.value, Colors.yellow);
      expect(resultWidth.value.right?.width, 20.0);
      expect(resultStyle.value.right?.style, BorderStyle.solid);
      expect(resultStrokeAlign.value.right?.strokeAlign, 0.2);
    });

    test('border.all()', () {
      final result = border.all(
        color: Colors.purple,
        width: 3.0,
        style: BorderStyle.solid,
        strokeAlign: 0.1,
      );
      expect(result.value.top?.color?.value, Colors.purple);
      expect(result.value.top?.width, 3.0);
      expect(result.value.top?.style, BorderStyle.solid);
      expect(result.value.top?.strokeAlign, 0.1);
      expect(result.value.bottom?.color?.value, Colors.purple);
      expect(result.value.bottom?.width, 3.0);
      expect(result.value.bottom?.style, BorderStyle.solid);
      expect(result.value.bottom?.strokeAlign, 0.1);
      expect(result.value.left?.color?.value, Colors.purple);
      expect(result.value.left?.width, 3.0);
      expect(result.value.left?.style, BorderStyle.solid);
      expect(result.value.left?.strokeAlign, 0.1);
      expect(result.value.right?.color?.value, Colors.purple);
      expect(result.value.right?.width, 3.0);
      expect(result.value.right?.style, BorderStyle.solid);
      expect(result.value.right?.strokeAlign, 0.1);

      final resultColor = border.all.color(Colors.yellow);
      final resultWidth = border.all.width(20.0);
      final resultStyle = border.all.style(BorderStyle.solid);
      final resultStrokeAlign = border.all.strokeAlign(0.2);

      expect(resultColor.value.top?.color?.value, Colors.yellow);
      expect(resultWidth.value.top?.width, 20.0);
      expect(resultStyle.value.top?.style, BorderStyle.solid);
      expect(resultStrokeAlign.value.top?.strokeAlign, 0.2);

      expect(resultColor.value.bottom?.color?.value, Colors.yellow);
      expect(resultWidth.value.bottom?.width, 20.0);
      expect(resultStyle.value.bottom?.style, BorderStyle.solid);
      expect(resultStrokeAlign.value.bottom?.strokeAlign, 0.2);

      expect(resultColor.value.left?.color?.value, Colors.yellow);
      expect(resultWidth.value.left?.width, 20.0);
      expect(resultStyle.value.left?.style, BorderStyle.solid);
      expect(resultStrokeAlign.value.left?.strokeAlign, 0.2);

      expect(resultColor.value.right?.color?.value, Colors.yellow);
      expect(resultWidth.value.right?.width, 20.0);
      expect(resultStyle.value.right?.style, BorderStyle.solid);
      expect(resultStrokeAlign.value.right?.strokeAlign, 0.2);
    });
  });
}
