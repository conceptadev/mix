import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/strut_style/strut_style_attribute.dart';
import 'package:mix/src/attributes/strut_style/strut_style_dto.dart';

import '../../../helpers/attribute_generator.dart';
import '../../../helpers/testing_utils.dart';

void main() {
  group('StrutStyleAttribute', () {
    test('initializes correctly', () {
      final strutStyle = RandomGenerator.strutStyle();
      final strutStyleDto = StrutStyleDto.from(strutStyle);

      final attribute = StrutStyleAttribute(strutStyleDto);

      expect(attribute.value, equals(strutStyleDto));
      expect(attribute.value, isA<StrutStyleDto>());
      expect(attribute.value.fontFamily, equals(strutStyle.fontFamily));
      expect(attribute.value.fontFamilyFallback,
          equals(strutStyle.fontFamilyFallback));
      expect(attribute.value.fontSize, equals(strutStyle.fontSize));
      expect(attribute.value.fontWeight, equals(strutStyle.fontWeight));
      expect(attribute.value.fontStyle, equals(strutStyle.fontStyle));
      expect(attribute.value.height, equals(strutStyle.height));
      expect(attribute.value.leading, equals(strutStyle.leading));
      expect(attribute.value.forceStrutHeight,
          equals(strutStyle.forceStrutHeight));
    });

    test('merge returns the same attribute if other is null', () {
      final strutStyle = RandomGenerator.strutStyle();
      final strutStyleDto = StrutStyleDto.from(strutStyle);

      final attribute = StrutStyleAttribute(strutStyleDto);
      final mergedAttribute = attribute.merge(null);

      expect(mergedAttribute, equals(attribute));
    });

    test('merge returns the same attribute if value types are different', () {
      const strutStyle1 = StrutStyleDto(fontFamily: 'Roboto');
      const strutStyle2 = StrutStyleDto(fontFamily: 'Arial');
      const attribute1 = StrutStyleAttribute(strutStyle1);
      const attribute2 = StrutStyleAttribute(strutStyle2);
      final mergedAttribute = attribute1.merge(attribute2);

      expect(mergedAttribute, equals(attribute2));
    });

    test('merge returns a new attribute with merged value', () {
      final strutStyle1 = StrutStyleDto.from(RandomGenerator.strutStyle());
      final strutStyle2 = StrutStyleDto.from(RandomGenerator.strutStyle());

      final attribute1 = StrutStyleAttribute(strutStyle1);
      final attribute2 = StrutStyleAttribute(strutStyle2);
      final mergedAttribute = attribute1.merge(attribute2);

      expect(mergedAttribute.value, equals(strutStyle1.merge(strutStyle2)));
    });

    test('resolve returns the correct StrutStyle', () {
      final strutStyle = RandomGenerator.strutStyle();
      final strutStyleDto = StrutStyleDto.from(strutStyle);

      final attribute = StrutStyleAttribute(strutStyleDto);
      final resolvedStrutStyle = attribute.resolve(EmptyMixData);

      expect(resolvedStrutStyle, equals(strutStyle));
    });
  });
}
