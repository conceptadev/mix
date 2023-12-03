import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/decoration/decoration_dto.dart';
import 'package:mix/src/attributes/gradient/gradient_dto.dart';

import '../../../helpers/attribute_generator.dart';
import '../../../helpers/testing_utils.dart';

void main() {
  const boxDecoration = BoxDecorationUtility(UtilityTestAttribute.new);

  group('BoxDecorationUtility', () {
    test('call', () {
      final refBoxDecoration = RandomGenerator.boxDecoration();

      final result = boxDecoration(
        border: refBoxDecoration.border,
        borderRadius: refBoxDecoration.borderRadius,
        boxShadow: refBoxDecoration.boxShadow,
        color: refBoxDecoration.color,
        gradient: refBoxDecoration.gradient,
        shape: refBoxDecoration.shape,
      );

      expect(result.value, equals(BoxDecorationDto.from(refBoxDecoration)));

      expect(result.value, isA<BoxDecorationDto>());
      expect(result.value.border, isA<BoxBorderDto>());
      expect(result.value.borderRadius, isA<BorderRadiusGeometryDto>());
      expect(result.value.boxShadow, isA<List<BoxShadowDto>>());
      expect(result.value.color, isA<ColorDto>());
      expect(result.value.gradient, isA<GradientDto>());
      expect(result.value.shape, isA<BoxShape>());

      expect(result.value.border,
          equals(BoxBorderDto.from(refBoxDecoration.border!)));
      expect(result.value.borderRadius,
          equals(BorderRadiusGeometryDto.from(refBoxDecoration.borderRadius!)));
      expect(result.value.boxShadow,
          equals(refBoxDecoration.boxShadow?.map((e) => BoxShadowDto.from(e))));
      expect(result.value.color, equals(ColorDto(refBoxDecoration.color!)));
      expect(result.value.gradient,
          equals(GradientDto.from(refBoxDecoration.gradient!)));
      expect(result.value.shape, equals(refBoxDecoration.shape));
    });
    test('color setting', () {
      final result = boxDecoration(color: Colors.red);
      expect(result.value.color, equals(Colors.red.toDto()));
    });

    test('shape setting', () {
      final result = boxDecoration.shape.circle();
      expect(result.value.shape, equals(BoxShape.circle));
    });

    test('border setting', () {
      final result = boxDecoration.border.all(color: Colors.red, width: 2.0);
      expect(result.value.border?.resolve(EmptyMixData),
          equals(Border.all(color: Colors.red, width: 2.0)));
    });

    test('borderRadius setting', () {
      final result = boxDecoration.borderRadius(10.0);
      expect(result.value.borderRadius?.resolve(EmptyMixData),
          equals(BorderRadius.circular(10.0)));
    });

    test('gradient setting', () {
      const gradient = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.red, Colors.blue],
      );
      final result = boxDecoration.gradient.as(gradient);
      expect(result.value.gradient, equals(gradient.toDto()));
    });

    test('boxShadow setting', () {
      final boxShadow = [
        const BoxShadow(
          color: Colors.black,
          blurRadius: 10.0,
          offset: Offset(5.0, 5.0),
        )
      ];
      final result = boxDecoration.boxShadow(boxShadow);
      expect(result.value.boxShadow, equals(boxShadow.toDto()));
    });

    test('elevation setting', () {
      final result = boxDecoration.elevation(9);
      final boxShadows =
          result.value.boxShadow?.map((e) => e.resolve(EmptyMixData));
      expect(boxShadows, equals(kElevationToShadow[9]!));
    });
  });
}
