import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/data_attributes.dart';
import 'package:mix/src/dtos/color.toDto.dart';

final firstMix = StyleMix(
  // Box attribute
  backgroundColor(Colors.blue),
  // Text attribute
  textStyle(color: Colors.red),
  // Shared attribute
  animation(),
  // Flex Attribute
  gap(10),
  // Icon Attribute
  iconColor(Colors.green),
  // Variant Attribute
  onDark(margin(10)),
  animationDuration(1000),
  padding(0),
  margin(0),
  width(100),
  height(100),
  minWidth(100),
);

final secondMix = StyleMix(
  // Box attribute
  padding(10),
  // Text attribute
  textStyle(fontSize: 10),
  // Shared attribute
  hide(),
  // Flex Attribute
  mainAxisAlignment(MainAxisAlignment.center),

  // Icon Attribute
  iconSize(10),
  // Variant Attribute
  onHover(width(100)),
  onFocus(height(100)),
  iconColor(Colors.red),
);

final nestedMix = StyleMix().mergeMany([
  firstMix,
  secondMix,
]);

void main() {
  group("Mix Factory", () {
    test('Creates a Mix from positional Attributes', () {
      final style = StyleMix(
        backgroundColor(Colors.red),
        margin(10),
      );

      final boxAttribute =
          style.values.stylesOfType<StyledContainerAttributes>()!;

      // Length is only 1 because margin and color are BoxAttributes
      expect(style.values.length, 1);

      expect(boxAttribute.color, const ColorData(Colors.red));
      expect(
          boxAttribute.margin,
          const MarginAttribute(
            SpacingGeometryData.all(10),
          ));
    });

    test('Creates a Mix from Attributes List', () {
      final mix = StyleMix.fromAttributes([
        backgroundColor(Colors.red),
        margin(10),
      ]);

      final boxAttribute =
          mix.values.stylesOfType<StyledContainerAttributes>()!;

      // Length is only 1 because margin and color are BoxAttributes
      expect(mix.values.length, 1);

      expect(boxAttribute.color, const ColorData(Colors.red));
      expect(boxAttribute.margin, const EdgeInsetsDto.all(10));
    });
  });

  test('Combines Mixes', () {
    const boxAttribute =
        StyledContainerAttributes(color: ColorDto(Colors.blue));

    const flexAttribute = FlexAttributes(direction: Axis.horizontal);

    final baseMix = StyleMix(boxAttribute);
    final appliedMix = baseMix.merge(StyleMix(flexAttribute));

    final modifiedBoxAttribute =
        appliedMix.values.stylesOfType<StyledContainerAttributes>();

    final modifiedFlexAttribute =
        appliedMix.values.stylesOfType<FlexAttributes>();

    expect(baseMix.values.length, 1);
    expect(appliedMix.values.length, 2);

    expect(modifiedBoxAttribute, equals(boxAttribute));
    expect(modifiedFlexAttribute, equals(flexAttribute));
  });

  test('Equality of Mix', () {
    final copyFirstMix = StyleMix.fromAttributes(firstMix.toAttributes());
    final copySecondMix = StyleMix.fromAttributes(secondMix.toAttributes());
    final combinedMixFirst = StyleMix.combine([firstMix, secondMix]);
    final combinedMixSecond = firstMix.merge(secondMix);

    expect(copyFirstMix, equals(firstMix));
    expect(copySecondMix, equals(secondMix));
    expect(combinedMixFirst, equals(combinedMixSecond));
  });

  test('Chooses Mixes based on conditional', () {
    final chooseFirstMix = StyleMix.chooser(
      condition: true,
      ifTrue: firstMix,
      ifFalse: secondMix,
    );

    final chooseSecondMix = StyleMix.chooser(
      condition: false,
      ifTrue: firstMix,
      ifFalse: secondMix,
    );

    expect(chooseFirstMix, firstMix);
    expect(chooseSecondMix, secondMix);
  });
}
