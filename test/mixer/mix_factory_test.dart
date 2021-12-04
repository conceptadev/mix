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
  dark(margin(10)),
  animationDuration(1000),
  padding(0),
  margin(0),
  width(100),
  height(100),
  minWidth(100),
);

const firstMixLength = 12;

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
  hover(width(100)),
  focus(height(100)),
  iconColor(Colors.red),
);

const secondMixLength = 8;

final nestedMix = Mix(
  // Box attribute
  apply(firstMix),
  apply(secondMix),
);

const nextedMixLength = 2;

void main() {
  group("Mix Factory", () {
    test('Creates a Mix from positional Attributes', () async {
      final firstAttr = firstMix.attributes;
      final secondAttr = secondMix.attributes;
      final nestedAttr = nestedMix.attributes;

      expect(firstAttr.length, firstMixLength);
      expect(secondAttr.length, secondMixLength);
      expect(nestedAttr.length, 2);
    });

    test('Creates a Mix from Attributes List', () async {
      final mixFromList = Mix.fromAttributes(firstMix.attributes);
      final mixFromMaybeList =
          Mix.fromMaybeAttribute([null, ...firstMix.attributes]);

      expect(mixFromList.attributes.length, firstMixLength);
      expect(mixFromMaybeList.attributes.length, firstMixLength);
    });

    test('Adds Attributes to Mix', () async {
      final firstWithOneMore = firstMix.add(bgColor(Colors.yellow)).attributes;
      final firstWithTwoMoreAsList = firstMix.addAll([
        bgColor(Colors.yellow),
        bgColor(Colors.green),
      ]).attributes;

      expect(firstMix.attributes.length, firstMixLength);
      expect(firstWithOneMore.length, firstMixLength + 1);
      expect(firstWithTwoMoreAsList.length, firstMixLength + 2);
    });

    test('Combines Mixes', () async {
      final combined = Mix.combine(firstMix, secondMix).attributes;
      final combinedAsList = Mix.combineAll([firstMix, secondMix]).attributes;
      final combineAsMix = firstMix.mix(secondMix).attributes;
      final combinedMaybeMix = firstMix.maybeMix(secondMix);
      final combinedMaybeMixNull = firstMix.maybeMix(null);

      final secondCopy = firstMix.clone();
      final thirdCopy = firstMix.clone();
      final forthCopy = firstMix.clone();
      final fifthCopy = firstMix.clone();
      final sixthCopy = firstMix.clone();

      final combinedWithAllParams = Mix.combine(
        firstMix,
        secondCopy,
        thirdCopy,
        forthCopy,
        fifthCopy,
        sixthCopy,
      ).attributes;

      expect(combined.length, firstMixLength + secondMixLength);
      expect(combinedAsList.length, firstMixLength + secondMixLength);
      expect(combineAsMix.length, firstMixLength + secondMixLength);
      expect(combinedWithAllParams.length, firstMixLength * 6);
      expect(
        combinedMaybeMix.attributes.length,
        firstMixLength + secondMixLength,
      );
      expect(combinedMaybeMixNull.attributes.length, firstMixLength);
    });

    test('Equality of Mix', () async {
      final copyFirstMix = Mix.fromAttributes(firstMix.attributes);
      final copySecondMix = Mix.fromAttributes(secondMix.attributes);
      final combinedMixFirst = Mix.combine(firstMix, secondMix);
      final combinedMixSecond = firstMix.mix(secondMix);

      expect(copyFirstMix, firstMix);
      expect(copySecondMix, secondMix);
      expect(combinedMixFirst, combinedMixSecond);
      // Check hashCode
      expect(copyFirstMix.hashCode, firstMix.hashCode);
    });

    test('Chooses Mixes based on conditional', () async {
      final chooseFirstMix = Mix.chooser(
        condition: true,
        trueMix: firstMix,
        falseMix: secondMix,
      );

      final chooseSecondMix = Mix.chooser(
        condition: false,
        trueMix: firstMix,
        falseMix: secondMix,
      );

      expect(chooseFirstMix, firstMix);
      expect(chooseSecondMix, secondMix);
    });
  });
}
