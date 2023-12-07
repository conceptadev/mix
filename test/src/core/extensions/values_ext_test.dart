import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('Extensions', () {
    test('StrutStyle', () {
      const value = StrutStyle(
        fontFamily: 'Roboto',
        fontFamilyFallback: ['Arial', 'Helvetica'],
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        height: 1.2,
        leading: 5.0,
        forceStrutHeight: true,
      );

      final dto = StrutStyleDto.from(value);
      final attribute = StrutStyleAttribute(dto);

      expect(value.toAttribute(), isA<StrutStyleAttribute>());
      expect(value.toAttribute(), attribute);

      expect(attribute.value, dto);

      // Resolves correctly
      expect(attribute.resolve(EmptyMixData), value);
    });

    test('ShapeDecoration', () {
      final value = ShapeDecoration(
        shape: Border.all(),
        gradient: const RadialGradient(colors: [Colors.red, Colors.blue]),
        shadows: const [BoxShadow(blurRadius: 5.0)],
      );

      final dto = ShapeDecorationDto.from(value);

      expect(value.toDto(), isA<ShapeDecorationDto>());
      expect(value.toDto(), dto);
    });

    test('BoxConstraints toAttribute', () {
      const value = BoxConstraints(
        minWidth: 100.0,
        maxWidth: 200.0,
        minHeight: 150.0,
        maxHeight: 250.0,
      );

      final dto = BoxConstraintsDto.from(value);

      expect(value.toDto(), isA<BoxConstraintsDto>());
      expect(value.toDto(), dto);
    });

    test('BoxDecoration toAttribute', () {
      final value = BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
        borderRadius: BorderRadius.circular(10.0),
        gradient: const LinearGradient(colors: [Colors.red, Colors.blue]),
        boxShadow: const [BoxShadow(blurRadius: 5.0)],
      );

      final dto = BoxDecorationDto.from(value);

      expect(value.toDto(), isA<BoxDecorationDto>());
      expect(value.toDto(), dto);
    });

    test('BorderRadiusGeometry', () {
      final value = BorderRadius.circular(10.0);

      final dto = BorderRadiusGeometryDto.from(value);
      final attribute = BorderRadiusGeometryAttribute(dto);

      expect(value.toAttribute(), isA<BorderRadiusGeometryAttribute>());
      expect(value.toAttribute(), attribute);
      expect(value.toDto(), isA<BorderRadiusGeometryDto>());
      expect(value.toDto(), dto);

      expect(attribute.value, dto);

      // Resolves correctly
      expect(attribute.resolve(EmptyMixData), value);
    });

    test('BorderSide', () {
      const value = BorderSide(
        color: Colors.blue,
        width: 2.0,
        style: BorderStyle.solid,
      );

      final dto = BorderSideDto.from(value);

      expect(value.toDto(), dto);
      expect(dto.color, const ColorDto(Colors.blue));
      expect(dto.width, 2.0);
      expect(dto.style, BorderStyle.solid);

      // Resolves correctly
      expect(dto.resolve(EmptyMixData), value);
    });

    test('BoxBorder', () {
      //  Border
      const value = Border(
        top: BorderSide(color: Colors.red),
        bottom: BorderSide(color: Colors.blue),
      );

      final dto = BoxBorderDto.from(value);
      final attribute = BoxBorderAttribute(dto);

      expect(value.toAttribute(), isA<BoxBorderAttribute>());
      expect(value.toAttribute(), attribute);
      expect(value.toDto(), isA<BoxBorderDto>());

      expect(attribute.value, dto);

      // Resolves correctly
      expect(attribute.resolve(EmptyMixData), value);

      // BorderDirectional
      const value2 = BorderDirectional(
        top: BorderSide(color: Colors.red),
        bottom: BorderSide(color: Colors.blue),
      );

      final dto2 = BoxBorderDto.from(value2);
      final attribute2 = BoxBorderAttribute(dto2);

      expect(value2.toAttribute(), isA<BoxBorderAttribute>());
      expect(value2.toAttribute(), attribute2);
      expect(value2.toDto(), isA<BoxBorderDto>());

      expect(attribute2.value, dto2);

      // Resolves correctly
      expect(attribute2.resolve(EmptyMixData), value2);
    });

    test('Shadow', () {
      const value = BoxShadow(blurRadius: 10.0, color: Colors.black);

      final dto = BoxShadowDto.from(value);

      expect(value.toDto(), dto);

      expect(dto.blurRadius, 10.0);
      expect(dto.color, const ColorDto(Colors.black));

      // Resolves correctly
      expect(dto.resolve(EmptyMixData), value);
    });

    test('BoxShadow', () {
      const value = BoxShadow(blurRadius: 5.0, color: Colors.grey);

      final dto = BoxShadowDto.from(value);

      expect(value.toDto(), dto);
      expect(dto.blurRadius, 5.0);
      expect(dto.color, const ColorDto(Colors.grey));

      // Resolves correctly
      expect(dto.resolve(EmptyMixData), value);
    });

    test('TextStyle ', () {
      const value = TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      );

      final dto = TextStyleDto.as(value);
      final attribute = TextStyleAttribute(dto);

      expect(value.toAttribute(), isA<TextStyleAttribute>());
      expect(value.toAttribute(), attribute);
      expect(value.toDto(), isA<TextStyleDto>());
      expect(value.toDto(), dto);

      expect(attribute.value, dto);

      // Resolves correctly
      expect(attribute.resolve(EmptyMixData), value);
    });
  });
}
