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
      expect(result.minWidth, 50.0);
      expect(result.maxWidth, 150.0);
      expect(result.minHeight, 100.0);
      expect(result.maxHeight, 200.0);
    });

    test('minWidth()', () {
      final result = minWidth(50.0);
      expect(result.minWidth, 50.0);
      expect(result.maxWidth, isNull);
      expect(result.minHeight, isNull);
      expect(result.maxHeight, isNull);
    });

    test('maxWidth()', () {
      final result = maxWidth(150.0);
      expect(result.minWidth, isNull);
      expect(result.maxWidth, 150.0);
      expect(result.minHeight, isNull);
      expect(result.maxHeight, isNull);
    });

    test('minHeight()', () {
      final result = minHeight(100.0);
      expect(result.minWidth, isNull);
      expect(result.maxWidth, isNull);
      expect(result.minHeight, 100.0);
      expect(result.maxHeight, isNull);
    });

    test('maxHeight()', () {
      final result = maxHeight(200.0);
      expect(result.minWidth, isNull);
      expect(result.maxWidth, isNull);
      expect(result.minHeight, isNull);
      expect(result.maxHeight, 200.0);
    });
  });
}
