import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/color_attribute.dart';
import 'package:mix/src/attributes/shadow_attribute.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('ShadowDto and BoxShadowDto', () {
    test('ShadowDto correctly resolves attributes', () {
      const shadowDto = ShadowDto(
        color: ColorDto(Colors.green),
        offset: Offset(1, 1),
        blurRadius: 2.0,
      );

      final resultShadow = shadowDto.resolve(EmptyMixData);

      expect(resultShadow.color, Colors.green);
      expect(resultShadow.offset, const Offset(1, 1));
      expect(resultShadow.blurRadius, 2.0);
    });

    test('ShadowDto correctly merges attributes', () {
      const shadowDto1 = ShadowDto(
        color: ColorDto(Colors.green),
        offset: Offset(1, 1),
        blurRadius: 2.0,
      );

      const shadowDto2 = ShadowDto(
        color: ColorDto(Colors.blue),
        offset: Offset(2, 2),
        blurRadius: 4.0,
      );

      final resultShadow = shadowDto1.merge(shadowDto2);

      expect(resultShadow.color?.value, Colors.blue);
      expect(resultShadow.offset, const Offset(2, 2));
      expect(resultShadow.blurRadius, 4.0);
    });

    test('BoxShadowDto correctly resolves attributes', () {
      const boxShadowDto = BoxShadowDto(
        color: ColorDto(Colors.green),
        offset: Offset(1, 1),
        blurRadius: 2.0,
        spreadRadius: 3.0,
      );

      final resultBoxShadow = boxShadowDto.resolve(EmptyMixData);

      expect(resultBoxShadow.color, Colors.green, reason: 'color');
      expect(resultBoxShadow.offset, const Offset(1, 1), reason: 'offset');
      expect(resultBoxShadow.blurRadius, 2.0, reason: 'blurRadius');
      expect(resultBoxShadow.spreadRadius, 3.0, reason: 'spreadRadius');
    });

    test('BoxShadowDto correctly merges attributes', () {
      const boxShadowDto1 = BoxShadowDto(
        color: ColorDto(Colors.green),
        offset: Offset(1, 1),
        blurRadius: 2.0,
        spreadRadius: 3.0,
      );

      const boxShadowDto2 = BoxShadowDto(
        color: ColorDto(Colors.blue),
        offset: Offset(2, 2),
        blurRadius: 4.0,
        spreadRadius: 5.0,
      );

      final resultBoxShadow = boxShadowDto1.merge(boxShadowDto2);

      expect(resultBoxShadow.color?.value, Colors.blue);
      expect(resultBoxShadow.offset, const Offset(2, 2));
      expect(resultBoxShadow.blurRadius, 4.0);
      expect(resultBoxShadow.spreadRadius, 5.0);
    });
  });
}
