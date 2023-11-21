import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/strut_style_attribute.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('StrutStyleAttribute', () {
    test('from constructor sets all values correctly', () {
      const attr = StrutStyleDto(
        fontFamily: 'Roboto',
        fontSize: 24.0,
        height: 2.0,
        leading: 1.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        forceStrutHeight: true,
      );

      expect(attr.fontFamily, 'Roboto');
      expect(attr.fontSize, 24.0);
      expect(attr.height, 2.0);
      expect(attr.leading, 1.0);
      expect(attr.fontWeight, FontWeight.bold);
      expect(attr.fontStyle, FontStyle.italic);
      expect(attr.forceStrutHeight, true);
    });

    // Test to check if the merge function returns a merged object correctly
    test('merge returns merged object correctly', () {
      const attr1 = StrutStyleDto(fontFamily: 'Roboto', fontSize: 24.0);
      const attr2 =
          StrutStyleDto(height: 2.0, leading: 1.0, fontWeight: FontWeight.bold);
      final merged = attr1.merge(attr2);

      expect(merged.fontFamily, 'Roboto');
      expect(merged.fontSize, 24.0);
      expect(merged.height, 2.0);
      expect(merged.leading, 1.0);
      expect(merged.fontWeight, FontWeight.bold);
    });

    // Test to check if the resolve function returns the correct StrutStyle
    test('resolve returns correct StrutStyle', () {
      const attr = StrutStyleDto(
        fontFamily: 'Roboto',
        fontSize: 24.0,
        height: 2.0,
        leading: 1.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      );
      final strutStyle = attr.resolve(EmptyMixData);

      expect(strutStyle.fontFamily, 'Roboto');
      expect(strutStyle.fontSize, 24.0);
      expect(strutStyle.height, 2.0);
      expect(strutStyle.leading, 1.0);
      expect(strutStyle.fontWeight, FontWeight.bold);
      expect(strutStyle.fontStyle, FontStyle.italic);
    });

    // Test to check if two StrutStyleAttributes with the same properties are equal
    test('Equality holds when all properties are the same', () {
      const attr1 = StrutStyleDto(fontFamily: 'Roboto', fontSize: 24.0);
      const attr2 = StrutStyleDto(fontFamily: 'Roboto', fontSize: 24.0);

      expect(attr1, attr2);
    });

    // Test to check if two StrutStyleAttributes with different properties are not equal
    test('Equality fails when properties are different', () {
      const attr1 = StrutStyleDto(fontFamily: 'Roboto', fontSize: 24.0);
      const attr2 = StrutStyleDto(fontFamily: 'Lato', fontSize: 24.0);

      expect(attr1, isNot(attr2));
    });
  });
}
