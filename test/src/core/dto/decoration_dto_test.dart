import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/border_attribute.dart';
import 'package:mix/src/attributes/color_attribute.dart';
import 'package:mix/src/attributes/decoration_attribute.dart';
import 'package:mix/src/attributes/scalar_attribute.dart';
import 'package:mix/src/attributes/shadow_attribute.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('BoxDecorationData merge', () {
    test('should merge non-null values correctly', () {
      final data1 = BoxDecorationAttribute(
        color: const ColorAttribute(Color(0xFF000000)),
        border: const BoxBorderData.all(BorderSideAttribute(width: 2.0)),
        borderRadius: BorderRadiusGeometryAttribute.circular(4.0),
        gradient: const GradientAttribute(LinearGradient(
          colors: [Color(0xFF000000), Color(0xFFFFFFFF)],
        )),
        boxShadow: const [
          BoxShadowAttribute(
              color: ColorAttribute(Color(0xFF000000)), blurRadius: 4.0)
        ],
        shape: const BoxShapeAttribute(BoxShape.circle),
      );

      final data2 = BoxDecorationAttribute(
        color: const ColorAttribute(Color(0xFFFFFFFF)),
        border: const BoxBorderData.all(BorderSideAttribute(
          width: 4.0,
        )),
        borderRadius: BorderRadiusGeometryAttribute.circular(8.0),
        gradient: const GradientAttribute(LinearGradient(
          colors: [Color(0xFF0000FF), Color(0xFFFF0000)],
        )),
        boxShadow: const [
          BoxShadowAttribute(
              color: ColorAttribute(Color(0xFFFFFFFF)), blurRadius: 8.0)
        ],
        shape: const BoxShapeAttribute(BoxShape.rectangle),
      );

      final result = data1.merge(data2);

      expect(result.color?.value, const Color(0xFFFFFFFF));
      expect(result.border?.top?.width, 4.0);
      expect(result.border?.bottom?.width, 4.0);
      expect(result.border?.left?.width, 4.0);
      expect(result.border?.right?.width, 4.0);
      expect(result.border?.end?.width, 4.0);
      expect(result.border?.start?.width, 4.0);

      expect(result.borderRadius?.resolve(EmptyMixData),
          BorderRadius.circular(8.0));
      expect(
        (result.gradient?.value as LinearGradient).colors,
        [const Color(0xFF0000FF), const Color(0xFFFF0000)],
      );
      expect(result.boxShadow?[0].color?.value, const Color(0xFFFFFFFF));
      expect(result.boxShadow?[0].blurRadius, 8.0);
      expect(result.shape?.value, BoxShape.rectangle);
    });
  });
}
