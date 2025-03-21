import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/text_height_behavior/text_height_behavior_dto.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('TextHeightBehaviorDto', () {
    test('creates with default values', () {
      const dto = TextHeightBehaviorDto();
      expect(dto.applyHeightToFirstAscent, isNull);
      expect(dto.applyHeightToLastDescent, isNull);
      expect(dto.leadingDistribution, isNull);
    });

    test('creates with custom values', () {
      const dto = TextHeightBehaviorDto(
        applyHeightToFirstAscent: true,
        applyHeightToLastDescent: false,
        leadingDistribution: TextLeadingDistribution.even,
      );
      expect(dto.applyHeightToFirstAscent, isTrue);
      expect(dto.applyHeightToLastDescent, isFalse);
      expect(dto.leadingDistribution, TextLeadingDistribution.even);
    });
  });

  group('TextHeightBehaviorUtility', () {
    late TextHeightBehaviorUtility utility;

    setUp(() {
      utility = TextHeightBehaviorUtility(UtilityTestAttribute.new);
    });

    test('heightToFirstAscent sets applyHeightToFirstAscent', () {
      final result = utility.heightToFirstAscent(true)
          as UtilityTestAttribute<TextHeightBehaviorDto>;
      expect(result.value.applyHeightToFirstAscent, isTrue);
      expect(result.value.applyHeightToLastDescent, isNull);
      expect(result.value.leadingDistribution, isNull);
    });

    test('heightToLastDescent sets applyHeightToLastDescent', () {
      final result = utility.heightToLastDescent(false)
          as UtilityTestAttribute<TextHeightBehaviorDto>;
      expect(result.value.applyHeightToFirstAscent, isNull);
      expect(result.value.applyHeightToLastDescent, isFalse);
      expect(result.value.leadingDistribution, isNull);
    });

    test('leadingDistribution sets leadingDistribution', () {
      final result =
          utility.leadingDistribution(TextLeadingDistribution.proportional)
              as UtilityTestAttribute<TextHeightBehaviorDto>;
      expect(result.value.applyHeightToFirstAscent, isNull);
      expect(result.value.applyHeightToLastDescent, isNull);
      expect(result.value.leadingDistribution,
          TextLeadingDistribution.proportional);
    });

    test('only sets multiple properties', () {
      final result = utility.only(
        applyHeightToFirstAscent: true,
        applyHeightToLastDescent: false,
        leadingDistribution: TextLeadingDistribution.even,
      ) as UtilityTestAttribute<TextHeightBehaviorDto>;
      expect(result.value.applyHeightToFirstAscent, isTrue);
      expect(result.value.applyHeightToLastDescent, isFalse);
      expect(result.value.leadingDistribution, TextLeadingDistribution.even);
    });
  });
}
