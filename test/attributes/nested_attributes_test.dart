import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/dtos/color.dto.dart';
import 'package:mix/src/dtos/edge_insets/edge_insets.dto.dart';

void main() {
  group("Nested Attributes", () {
    test('-> Apply Mixes', () async {
      final styleMargin = StyleMix(
        const StyledContainerAttributes(
          margin: EdgeInsetsDto.all(20),
        ),
      );
      final styleColor = StyleMix(
        const StyledContainerAttributes(color: ColorDto(Colors.red)),
      );

      final nestedStyleUtility = StyleMix.combine([styleColor, styleMargin]);

      final boxAttributesUtility = nestedStyleUtility.values
          .attributesOfType<StyledContainerAttributes>();

      expect(
        boxAttributesUtility,
        const StyledContainerAttributes(
          color: ColorDto(Colors.red),
          margin: EdgeInsetsDto.all(20),
        ),
      );
    });
  });
}
