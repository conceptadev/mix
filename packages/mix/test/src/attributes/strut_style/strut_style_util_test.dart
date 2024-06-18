import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/attribute_generator.dart';
import '../../../helpers/testing_utils.dart';

void main() {
  group('StrutStyleUtility', () {
    final strutStyleUtility = StrutStyleUtility(UtilityTestAttribute.new);
    test('callable', () {
      final strutStyle = strutStyleUtility(
        fontFamily: 'Roboto',
        fontSize: 24.0,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        forceStrutHeight: true,
        height: 2.0,
        leading: 1.0,
      );

      expect(strutStyleUtility(), isA<UtilityTestAttribute>());
      expect(strutStyle.value, isA<StrutStyleDto>());
      expect(strutStyle.value.fontFamily, 'Roboto');
      expect(strutStyle.value.fontSize, 24.0);
      expect(strutStyle.value.height, 2.0);
      expect(strutStyle.value.leading, 1.0);
      expect(strutStyle.value.fontWeight, FontWeight.bold);
      expect(strutStyle.value.fontStyle, FontStyle.italic);
      expect(strutStyle.value.forceStrutHeight, true);
    });

    test('fontFamily', () {
      final strutStyle = strutStyleUtility.fontFamily('Roboto');

      expect(strutStyle.value.fontFamily, 'Roboto');
    });

    test('fontSize', () {
      final strutStyle = strutStyleUtility.fontSize(24.0);

      expect(strutStyle.value.fontSize, 24.0);
    });

    test('height', () {
      final strutStyle = strutStyleUtility.height(2.0);

      expect(strutStyle.value.height, 2.0);
    });

    test('leading', () {
      final strutStyle = strutStyleUtility.leading(1.0);

      expect(strutStyle.value.leading, 1.0);
    });

    test('fontWeight', () {
      final strutStyle = strutStyleUtility.fontWeight(FontWeight.bold);

      expect(strutStyle.value.fontWeight, FontWeight.bold);
    });

    test('fontStyle', () {
      final strutStyle = strutStyleUtility.fontStyle(FontStyle.italic);

      expect(strutStyle.value.fontStyle, FontStyle.italic);
    });

    test('forceStrutHeight', () {
      final strutStyle = strutStyleUtility.forceStrutHeight(true);

      expect(strutStyle.value.forceStrutHeight, true);
    });

    test('as', () {
      final strutStyle = RandomGenerator.strutStyle();
      final attribute = strutStyleUtility.as(strutStyle);

      expect(attribute.value, isA<StrutStyleDto>());
      expect(attribute.value, equals(strutStyle.toDto()));
      expect(attribute.value.resolve(EmptyMixData), equals(strutStyle));
    });
  });
}
