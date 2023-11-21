import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('BoxConstraintsAttribute Utilities', () {
    test('boxConstraints()', () {
      final result = boxConstraints(
        minWidth: 50.0,
        maxWidth: 150.0,
        minHeight: 100.0,
        maxHeight: 200.0,
      );
      expect(result.value.minWidth, 50.0);
      expect(result.value.maxWidth, 150.0);
      expect(result.value.minHeight, 100.0);
      expect(result.value.maxHeight, 200.0);
    });

    test('minWidth()', () {
      final result = minWidth(50.0);
      expect(result.value.minWidth, 50.0);
      expect(result.value.maxWidth, isNull);
      expect(result.value.minHeight, isNull);
      expect(result.value.maxHeight, isNull);
    });

    test('maxWidth()', () {
      final result = maxWidth(150.0);
      expect(result.value.minWidth, isNull);
      expect(result.value.maxWidth, 150.0);
      expect(result.value.minHeight, isNull);
      expect(result.value.maxHeight, isNull);
    });

    test('minHeight()', () {
      final result = minHeight(100.0);
      expect(result.value.minWidth, isNull);
      expect(result.value.maxWidth, isNull);
      expect(result.value.minHeight, 100.0);
      expect(result.value.maxHeight, isNull);
    });

    test('maxHeight()', () {
      final result = maxHeight(200.0);
      expect(result.value.minWidth, isNull);
      expect(result.value.maxWidth, isNull);
      expect(result.value.minHeight, isNull);
      expect(result.value.maxHeight, 200.0);
    });

    // width
    test('width()', () {
      final result = width(50.0);

      expect(result.value.minWidth, isNull);
      expect(result.value.maxWidth, isNull);
      expect(result.value.width, 50.0);
      expect(result.value.minHeight, isNull);
      expect(result.value.maxHeight, isNull);
      expect(result.value.height, isNull);
    });

    // height
    test('height()', () {
      final result = height(50.0);
      expect(result.value.minWidth, isNull);
      expect(result.value.maxWidth, isNull);
      expect(result.value.height, 50.0);
      expect(result.value.minHeight, isNull);
      expect(result.value.maxHeight, isNull);
      expect(result.value.width, isNull);
    });
  });
}
