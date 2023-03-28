import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/dtos/color.dto.dart';
import 'package:mix/src/dtos/edge_insets/edge_insets.dto.dart';

final firstMix = Mix(
  // Box attribute
  bgColor(Colors.blue),
  // Text attribute
  textColor(
    Colors.red,
  ),
  // Shared attribute
  animated(),
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

final secondMix = Mix(
  // Box attribute
  padding(10),
  // Text attribute
  fontSize(10),
  // Shared attribute
  hide(),
  // Flex Attribute
  mainAxis(MainAxisAlignment.center),

  // Icon Attribute
  iconSize(10),
  // Variant Attribute
  onHover(width(100)),
  onFocus(height(100)),
  iconColor(Colors.red),
);

final nestedMix = Mix(
  // Box attribute
  apply(firstMix),
  apply(secondMix),
);

void main() {
  group("Mix Factory", () {
    test('Creates a Mix from positional Attributes', () async {
      final style = Mix(
        bgColor(Colors.red),
        margin(10),
      );

      final boxAttribute = style.values.attributesOfType<BoxAttributes>()!;

      // Length is only 1 because margin and color are BoxAttributes
      expect(style.values.length, 1);

      expect(boxAttribute.color, const ColorDto(Colors.red));
      expect(boxAttribute.margin, const EdgeInsetsDto.all(10));
    });

    test('Creates a Mix from Attributes List', () async {
      final mix = Mix.fromAttributes([
        bgColor(Colors.red),
        margin(10),
      ]);

      final boxAttribute = mix.values.attributesOfType<BoxAttributes>()!;

      // Length is only 1 because margin and color are BoxAttributes
      expect(mix.values.length, 1);

      expect(boxAttribute.color, const ColorDto(Colors.red));
      expect(boxAttribute.margin, const EdgeInsetsDto.all(10));
    });
  });

  test('Combines Mixes', () async {
    const boxAttribute = BoxAttributes(color: ColorDto(Colors.blue));

    const flexAttribute = FlexAttributes(direction: Axis.horizontal);

    final baseMix = Mix(boxAttribute);
    final appliedMix = baseMix.merge(Mix(flexAttribute));

    final modifiedBoxAttribute =
        appliedMix.values.attributesOfType<BoxAttributes>();

    final modifiedFlexAttribute =
        appliedMix.values.attributesOfType<FlexAttributes>();

    expect(baseMix.values.length, 1);
    expect(appliedMix.values.length, 2);

    expect(modifiedBoxAttribute, equals(boxAttribute));
    expect(modifiedFlexAttribute, equals(flexAttribute));
  });

  test('Equality of Mix', () async {
    final copyFirstMix = Mix.fromAttributes(firstMix.toAttributes());
    final copySecondMix = Mix.fromAttributes(secondMix.toAttributes());
    final combinedMixFirst = Mix.combine([firstMix, secondMix]);
    final combinedMixSecond = firstMix.merge(secondMix);

    expect(copyFirstMix, equals(firstMix));
    expect(copySecondMix, equals(secondMix));
    expect(combinedMixFirst, equals(combinedMixSecond));
  });

  test('Chooses Mixes based on conditional', () async {
    final chooseFirstMix = Mix.chooser(
      condition: true,
      ifTrue: firstMix,
      ifFalse: secondMix,
    );

    final chooseSecondMix = Mix.chooser(
      condition: false,
      ifTrue: firstMix,
      ifFalse: secondMix,
    );

    expect(chooseFirstMix, firstMix);
    expect(chooseSecondMix, secondMix);
  });
}
