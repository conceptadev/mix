import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

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
      final mergedValues = firstMix.values.merge(secondMix.values);

      expect(nestedMix.length, mergedValues.source.length);
      expect(nestedMix.values, mergedValues);
    });

    test('Creates a Mix from Attributes List', () async {
      final mixFromList = Mix.fromList(firstMix.source.toList());
      final mixFromMaybeList =
          Mix.fromMaybeList([null, ...firstMix.source.toList()]);

      expect(mixFromList.length, greaterThan(0));
      expect(mixFromList.values, firstMix.values);
      expect(mixFromMaybeList.length, firstMix.length);
    });

    test('Adds Attributes to an Existing Mix', () async {
      const boxAttribute = BoxAttributes(color: Colors.blue);

      const flexAttribute = FlexAttributes(direction: Axis.horizontal);

      final baseMix = Mix(boxAttribute);
      final modifiedMix = baseMix.mix(flexAttribute);

      final modifiedBoxAttribute =
          modifiedMix.values.attributes.attributesOfType<BoxAttributes>();
      final modifiedFlexAttribute =
          modifiedMix.values.attributes.attributesOfType<FlexAttributes>();

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
      final baseMix = Mix(blueBackground);
      final modifiedMix = baseMix.mix(yellowBackground);

      final modifiedBoxAttribute =
          modifiedMix.values.attributes.attributesOfType<BoxAttributes>();
      final baseBoxAttribute =
          baseMix.values.attributes.attributesOfType<BoxAttributes>();

      expect(yellowBackground, modifiedBoxAttribute);
      expect(blueBackground, baseBoxAttribute);
    });

    test('Equality of Mix', () async {
      final copyFirstMix = Mix.fromList(firstMix.source);
      final copySecondMix = Mix.fromList(secondMix.source);
      final combinedMixFirst = Mix.combine(firstMix, secondMix);
      final combinedMixSecond = firstMix.apply(secondMix);

      expect(copyFirstMix, firstMix);
      expect(copySecondMix, secondMix);
      expect(combinedMixFirst, combinedMixSecond);
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
  });
}
