import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/nested_attribute.dart';
import 'package:mix/src/dtos/color.dto.dart';
import 'package:mix/src/dtos/edge_insets/edge_insets.dto.dart';

void main() {
  group("Nested Attributes", () {
    test('-> Apply Mixes', () async {
      final styleMargin = Mix(
        const BoxAttributes(
          margin: EdgeInsetsDto.all(20),
        ),
      );
      final styleColor = Mix(
        const BoxAttributes(color: ColorDto(Colors.red)),
      );
      final nestedStyle = Mix(
        NestedStyleAttribute(
          Mix.combine([
            styleMargin,
            styleColor,
          ]),
        ),
      );

      final nestedStyleUtility = Mix.combine([styleColor, styleMargin]);

      final boxAttributes =
          nestedStyle.values.attributesOfType<BoxAttributes>();

      final boxAttributesUtility =
          nestedStyleUtility.values.attributesOfType<BoxAttributes>();

      expect(
        boxAttributes,
        const BoxAttributes(
          color: ColorDto(Colors.red),
          margin: EdgeInsetsDto.all(20),
        ),
      );

      expect(
        boxAttributesUtility,
        const BoxAttributes(
          color: ColorDto(Colors.red),
          margin: EdgeInsetsDto.all(20),
        ),
      );
    });
  });
}
