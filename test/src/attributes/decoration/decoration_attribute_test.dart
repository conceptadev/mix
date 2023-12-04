import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/decoration/decoration_dto.dart';

import '../../../helpers/attribute_generator.dart';
import '../../../helpers/testing_utils.dart';

void main() {
  group('DecorationAttribute', () {
    final border = RandomGenerator.border();
    final boxDecorationDto = BoxDecorationDto(
      color: const ColorDto(Colors.red),
      shape: BoxShape.circle,
      border: BoxBorderDto.from(border),
    );
    test('constructor should set the value correctly', () {
      final attribute = DecorationAttribute(boxDecorationDto);

      expect(attribute.value, isA<BoxDecorationDto>());
      expect(attribute.value, equals(boxDecorationDto));
    });

    test('merge should return the same attribute if other is null', () {
      final attribute = DecorationAttribute(boxDecorationDto);
      final mergedAttribute = attribute.merge(null);

      expect(mergedAttribute, equals(attribute));
    });

    test('merge should return the same attribute if value types are different',
        () {
      const decoration1 = BoxDecorationDto(color: ColorDto(Colors.red));
      const decoration2 = BoxDecorationDto(color: ColorDto(Colors.blue));
      const attribute1 = DecorationAttribute(decoration1);
      const attribute2 = DecorationAttribute(decoration2);
      final mergedAttribute = attribute1.merge(attribute2);

      expect(mergedAttribute, equals(attribute2));
    });

    test('merge should return a new attribute with merged value', () {
      final decoration1 =
          BoxDecorationDto.from(RandomGenerator.boxDecoration());
      final decoration2 =
          BoxDecorationDto.from(RandomGenerator.boxDecoration());

      final attribute1 = DecorationAttribute(decoration1);
      final attribute2 = DecorationAttribute(decoration2);
      final mergedAttribute = attribute1.merge(attribute2);

      expect(mergedAttribute.value, equals(decoration1.merge(decoration2)));
    });

    test('resolve should return the decoration value', () {
      const decoration = BoxDecorationDto(color: ColorDto(Colors.red));
      const attribute = DecorationAttribute(decoration);
      final resolvedDecoration = attribute.resolve(EmptyMixData);

      expect(
          resolvedDecoration,
          equals(
            const BoxDecoration(color: Colors.red),
          ));
    });

    testWidgets('build', (widgetTester) async {
      const decoration = BoxDecorationDto(color: ColorDto(Colors.red));
      const attribute = DecorationAttribute(decoration);
      final widget = attribute.build(EmptyMixData, Container());

      await widgetTester.pumpWidget(widget);
      final decorationBox =
          widgetTester.widget<DecoratedBox>(find.byType(DecoratedBox));
      expect(
          decorationBox.decoration, equals(decoration.resolve(EmptyMixData)));
    });
  });
}
