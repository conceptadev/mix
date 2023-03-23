import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/helpers/dto/edge_insets.dto.dart';

final firstMix = MixFactory(
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

final secondMix = MixFactory(
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

final nestedMix = MixFactory(
  // Box attribute
  apply(firstMix),
  apply(secondMix),
);

void main() {
  group("Mix Factory", () {
    test('Creates a Mix from positional Attributes', () async {
      final style = MixFactory(
        bgColor(Colors.red),
        margin(10),
      );

      final boxAttribute = style.values.attributesOfType<BoxAttributes>()!;

      // Length is only 1 because margin and color are BoxAttributes
      expect(style.length, 1);

      expect(boxAttribute.color, Colors.red);
      expect(boxAttribute.margin, const EdgeInsetsDto.all(10));
    });

    test('Creates a Mix from Attributes List', () async {
      final mixFromList =
          MixFactory.fromAttributes(firstMix.toValues().toAttributes());

      expect(mixFromList.length, greaterThan(0));
      expect(mixFromList.values, firstMix.values);
    });

    test('Adds Attributes to an Existing Mix', () async {
      const boxAttribute = BoxAttributes(color: Colors.blue);

      const flexAttribute = FlexAttributes(direction: Axis.horizontal);

      final baseMix = MixFactory(boxAttribute);
      final modifiedMix = baseMix.mix(flexAttribute);

      final modifiedBoxAttribute =
          modifiedMix.values.attributesOfType<BoxAttributes>();
      final modifiedFlexAttribute =
          modifiedMix.values.attributesOfType<FlexAttributes>();

      expect(baseMix.length, 1);
      expect(modifiedMix.length, 2);

      expect(modifiedBoxAttribute, boxAttribute);
      expect(modifiedFlexAttribute, flexAttribute);
    });

    test('Combines Mixes', () async {
      const blueBackground = BoxAttributes(
        color: Colors.blue,
      );

      const yellowBackground = BoxAttributes(
        color: Colors.yellow,
      );
      final baseMix = MixFactory(blueBackground);
      final modifiedMix = baseMix.mix(yellowBackground);

      final modifiedBoxAttribute =
          modifiedMix.values.attributesOfType<BoxAttributes>();
      final baseBoxAttribute = baseMix.values.attributesOfType<BoxAttributes>();

      expect(yellowBackground, modifiedBoxAttribute);
      expect(blueBackground, baseBoxAttribute);
    });

    test('Equality of Mix', () async {
      final copyFirstMix = MixFactory.fromAttributes(firstMix.toAttributes());
      final copySecondMix = MixFactory.fromAttributes(secondMix.toAttributes());
      final combinedMixFirst = MixFactory.combine(firstMix, secondMix);
      final combinedMixSecond = firstMix.merge(secondMix);

      expect(copyFirstMix, firstMix);
      expect(copySecondMix, secondMix);
      expect(combinedMixFirst, combinedMixSecond);
    });

    test('Chooses Mixes based on conditional', () async {
      final chooseFirstMix = MixFactory.chooser(
        condition: true,
        ifTrue: firstMix,
        ifFalse: secondMix,
      );

      final chooseSecondMix = MixFactory.chooser(
        condition: false,
        ifTrue: firstMix,
        ifFalse: secondMix,
      );

      expect(chooseFirstMix, firstMix);
      expect(chooseSecondMix, secondMix);
    });
  });
}
