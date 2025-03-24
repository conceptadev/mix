import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('BoxConstraintsUtility', () {
    final boxConstraints = BoxConstraintsMixUtility(UtilityTestAttribute.new);
    test('boxConstraints()', () {
      final result = boxConstraints(
        maxHeight: 200.0,
        maxWidth: 150.0,
        minHeight: 100.0,
        minWidth: 50.0,
      );

      expect(result.value, isA<BoxConstraintsMix>());
      expect(result.value.minWidth, 50.0);
      expect(result.value.maxWidth, 150.0);
      expect(result.value.minHeight, 100.0);
      expect(result.value.maxHeight, 200.0);
    });

    test('minWidth()', () {
      final result = boxConstraints.minWidth(50.0);
      expect(result.value.minWidth, 50.0);
      expect(result.value.maxWidth, isNull);
      expect(result.value.minHeight, isNull);
      expect(result.value.maxHeight, isNull);
    });

    test('maxWidth()', () {
      final result = boxConstraints.maxWidth(150.0);
      expect(result.value.minWidth, isNull);
      expect(result.value.maxWidth, 150.0);
      expect(result.value.minHeight, isNull);
      expect(result.value.maxHeight, isNull);
    });

    test('minHeight()', () {
      final result = boxConstraints.minHeight(100.0);
      expect(result.value.minWidth, isNull);
      expect(result.value.maxWidth, isNull);
      expect(result.value.minHeight, 100.0);
      expect(result.value.maxHeight, isNull);
    });

    test('maxHeight()', () {
      final result = boxConstraints.maxHeight(200.0);
      expect(result.value.minWidth, isNull);
      expect(result.value.maxWidth, isNull);
      expect(result.value.minHeight, isNull);
      expect(result.value.maxHeight, 200.0);
    });
  });
}
