import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/nested_attribute.dart';
import 'package:mix/src/helpers/dto/edge_insets.dto.dart';
import 'package:mix/src/theme/material_extension.dart';

void main() {
  group("Nested Attributes", () {
    test('-> Apply Mixes', () async {
      final styleMargin = Mix(
        BoxAttributes(
          margin: MixProperty.value(const EdgeInsetsDto.all(20)),
        ),
      );
      final styleColor = Mix(
        BoxAttributes(color: MixProperty.value(Colors.red)),
      );
      final nestedStyle = Mix(
        NestedMixAttribute(
          Mix.combineAll([
            styleMargin,
            styleColor,
          ]),
        ),
      );

      final nestedStyleUtility = Mix(
        apply(styleColor, styleMargin),
      );

      final boxAttributes =
          nestedStyle.values.attributesOfType<BoxAttributes>();

      final boxAttributesUtility =
          nestedStyleUtility.values.attributesOfType<BoxAttributes>();

      expect(
        boxAttributes,
        BoxAttributes(
          color: MixProperty.value(Colors.red),
          margin: MixProperty.value(const EdgeInsetsDto.all(20)),
        ),
      );

      expect(
        boxAttributesUtility,
        BoxAttributes(
          color: MixProperty.value(Colors.red),
          margin: MixProperty.value(const EdgeInsetsDto.all(20)),
        ),
      );
    });
  });
}
