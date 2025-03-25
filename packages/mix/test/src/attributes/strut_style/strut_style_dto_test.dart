import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/strut_style/strut_style_dto.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('StrutStyleDto', () {
    test('from constructor sets all values correctly', () {
      const strutStyle = StrutStyleMix(
        fontFamily: 'Roboto',
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        height: 2.0,
        leading: 1.0,
        forceStrutHeight: true,
      );

      expect(strutStyle.fontFamily, 'Roboto');
      expect(strutStyle.fontSize, 24.0);
      expect(strutStyle.height, 2.0);
      expect(strutStyle.leading, 1.0);
      expect(strutStyle.fontWeight, FontWeight.bold);
      expect(strutStyle.fontStyle, FontStyle.italic);
      expect(strutStyle.forceStrutHeight, true);
    });

    // Test to check if the merge function returns a merged object correctly
    test('merge returns merged object correctly', () {
      const strutStyle1 = StrutStyleMix(fontFamily: 'Roboto', fontSize: 24.0);
      const strutStyle2 =
          StrutStyleMix(fontWeight: FontWeight.bold, height: 2.0, leading: 1.0);
      final merged = strutStyle1.merge(strutStyle2);

      expect(merged.fontFamily, 'Roboto');
      expect(merged.fontSize, 24.0);
      expect(merged.height, 2.0);
      expect(merged.leading, 1.0);
      expect(merged.fontWeight, FontWeight.bold);
    });

    // Test to check if the resolve function returns the correct StrutStyle
    test('resolve returns correct StrutStyle', () {
      const strutStyle = StrutStyleMix(
        fontFamily: 'Roboto',
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        height: 2.0,
        leading: 1.0,
      );
      final resolvedValue = strutStyle.resolve(EmptyMixData);

      expect(resolvedValue.fontFamily, 'Roboto');
      expect(resolvedValue.fontSize, 24.0);
      expect(resolvedValue.height, 2.0);
      expect(resolvedValue.leading, 1.0);
      expect(resolvedValue.fontWeight, FontWeight.bold);
      expect(resolvedValue.fontStyle, FontStyle.italic);
    });

    // Test to check if two StrutStyleDtos with the same properties are equal
    test('Equality holds when all properties are the same', () {
      const strutStyle1 = StrutStyleMix(fontFamily: 'Roboto', fontSize: 24.0);
      const strutStyle2 = StrutStyleMix(fontFamily: 'Roboto', fontSize: 24.0);

      expect(strutStyle1, strutStyle2);
    });

    // Test to check if two StrutStyleDtos with different properties are not equal
    test('Equality fails when properties are different', () {
      const strutStyle1 = StrutStyleMix(fontFamily: 'Roboto', fontSize: 24.0);
      const strutStyle2 = StrutStyleMix(fontFamily: 'Lato', fontSize: 24.0);

      expect(strutStyle1, isNot(strutStyle2));
    });
  });
}
