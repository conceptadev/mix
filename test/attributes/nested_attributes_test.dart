import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/nested_attribute.dart';
import 'package:mix/src/helpers/dto/edge_insets.dto.dart';

void main() {
  group("Nested Attributes", () {
    test('-> Apply Mixes', () async {
      final styleMargin = MixFactory(
        const BoxAttributes(
          margin: EdgeInsetsDto.all(20),
        ),
      );
      final styleColor = MixFactory(
        const BoxAttributes(color: Colors.red),
      );
      final nestedStyle = MixFactory(
        NestedMixAttribute(
          MixFactory.combineAll([
            styleMargin,
            styleColor,
          ]),
        ),
      );

      final nestedStyleUtility = MixFactory(
        apply(styleColor, styleMargin),
      );

      final boxAttributes =
          nestedStyle.values.attributesOfType<BoxAttributes>();

      final boxAttributesUtility =
          nestedStyleUtility.values.attributesOfType<BoxAttributes>();

      expect(
        boxAttributes,
        const BoxAttributes(
          color: Colors.red,
          margin: EdgeInsetsDto.all(20),
        ),
      );

      expect(
        boxAttributesUtility,
        const BoxAttributes(
          color: Colors.red,
          margin: EdgeInsetsDto.all(20),
        ),
      );
    });
  });
}
