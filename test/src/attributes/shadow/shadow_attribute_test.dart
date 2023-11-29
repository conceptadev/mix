import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/color/color_attribute.dart';
import 'package:mix/src/attributes/shadow/shadow_attribute.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('ShadowAttribute and BoxShadowAttribute', () {
    test('ShadowAttribute correctly resolves attributes', () {
      const shadowDto = ShadowAttribute(
        color: ColorDto(Colors.green),
        offset: Offset(1, 1),
        blurRadius: 2.0,
      );

      final resultShadow = shadowDto.resolve(EmptyMixData);

      expect(resultShadow.color, Colors.green);
      expect(resultShadow.offset, const Offset(1, 1));
      expect(resultShadow.blurRadius, 2.0);
    });

    test('ShadowAttribute correctly merges attributes', () {
      const shadowDto1 = ShadowAttribute(
        color: ColorDto(Colors.green),
        offset: Offset(1, 1),
        blurRadius: 2.0,
      );

      const shadowDto2 = ShadowAttribute(
        color: ColorDto(Colors.blue),
        offset: Offset(2, 2),
        blurRadius: 4.0,
      );

      final resultShadow = shadowDto1.merge(shadowDto2);

      expect(resultShadow.color?.value, Colors.blue);
      expect(resultShadow.offset, const Offset(2, 2));
      expect(resultShadow.blurRadius, 4.0);
    });

    test('BoxShadowAttribute correctly resolves attributes', () {
      const boxShadowAttribute = BoxShadowAttribute(
        color: ColorDto(Colors.green),
        offset: Offset(1, 1),
        blurRadius: 2.0,
        spreadRadius: 3.0,
      );

      final resultBoxShadow = boxShadowAttribute.resolve(EmptyMixData);

      expect(resultBoxShadow.color, Colors.green, reason: 'color');
      expect(resultBoxShadow.offset, const Offset(1, 1), reason: 'offset');
      expect(resultBoxShadow.blurRadius, 2.0, reason: 'blurRadius');
      expect(resultBoxShadow.spreadRadius, 3.0, reason: 'spreadRadius');
    });

    test('BoxShadowAttribute correctly merges attributes', () {
      const boxShadowAttribute1 = BoxShadowAttribute(
        color: ColorDto(Colors.green),
        offset: Offset(1, 1),
        blurRadius: 2.0,
        spreadRadius: 3.0,
      );

      const boxShadowAttribute2 = BoxShadowAttribute(
        color: ColorDto(Colors.blue),
        offset: Offset(2, 2),
        blurRadius: 4.0,
        spreadRadius: 5.0,
      );

      final resultBoxShadow = boxShadowAttribute1.merge(boxShadowAttribute2);

      expect(resultBoxShadow.color?.value, Colors.blue);
      expect(resultBoxShadow.offset, const Offset(2, 2));
      expect(resultBoxShadow.blurRadius, 4.0);
      expect(resultBoxShadow.spreadRadius, 5.0);
    });
  });
}
