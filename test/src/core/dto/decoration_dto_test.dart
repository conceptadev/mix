import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/data_attributes.dart';
import 'package:mix/src/attributes/scalar_attribute.dart';
import 'package:mix/src/core/dto/border_dto.dart';
import 'package:mix/src/core/dto/color_dto.dart';
import 'package:mix/src/core/dto/decoration_dto.dart';
import 'package:mix/src/core/dto/shadow_dto.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('BoxDecorationData merge', () {
    test('should merge non-null values correctly', () {
      final data1 = BoxDecorationData(
        color: const ColorData(Color(0xFF000000)),
        border:
            const BoxBorderData.all(BorderSideData(width: 2.0)).toAttribute(),
        borderRadius: BorderRadiusGeometryData.circular(4.0).toAttribute(),
        gradient: const GradientAttribute(LinearGradient(
          colors: [Color(0xFF000000), Color(0xFFFFFFFF)],
        )),
        boxShadow: [
          const BoxShadowData(
              color: ColorData(Color(0xFF000000)), blurRadius: 4.0)
        ],
        shape: const BoxShapeAttribute(BoxShape.circle),
      );

      final data2 = BoxDecorationData(
        color: const ColorData(Color(0xFFFFFFFF)),
        border: const BoxBorderData.all(BorderSideData(
          width: 4.0,
        )).toAttribute(),
        borderRadius: BorderRadiusGeometryData.circular(8.0).toAttribute(),
        gradient: const GradientAttribute(LinearGradient(
          colors: [Color(0xFF0000FF), Color(0xFFFF0000)],
        )),
        boxShadow: [
          const BoxShadowData(
              color: ColorData(Color(0xFFFFFFFF)), blurRadius: 8.0)
        ],
        shape: const BoxShapeAttribute(BoxShape.rectangle),
      );

      final result = data1.merge(data2);

      expect(result.color?.value, const Color(0xFFFFFFFF));
      expect(result.border?.value.top?.width, 4.0);
      expect(result.border?.value.bottom?.width, 4.0);
      expect(result.border?.value.left?.width, 4.0);
      expect(result.border?.value.right?.width, 4.0);
      expect(result.border?.value.end?.width, 4.0);
      expect(result.border?.value.start?.width, 4.0);

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
