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
  onHover(width(100)),
  onFocus(height(100)),
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
      final firstAttr = firstMix;
      final secondAttr = secondMix;
      final nestedAttr = nestedMix;

      expect(firstAttr.length, firstMixLength);
      expect(secondAttr.length, secondMixLength);
      expect(nestedAttr.length, 2);
    });

    test('Creates a Mix from Attributes List', () async {
      final mixFromList = Mix.fromList(firstMix.source.toList());
      final mixFromMaybeList =
          Mix.fromMaybeList([null, ...firstMix.source.toList()]);

      expect(mixFromList.length, firstMixLength);
      expect(mixFromMaybeList.length, firstMixLength);
    });

    test('Adds Attributes to Mix', () async {
      final firstWithOneMore = firstMix.mix(bgColor(Colors.yellow)).attributes;
      final firstWithTwoMoreAsList = firstMix.addAttributes([
        bgColor(Colors.yellow),
        bgColor(Colors.green),
      ]).attributes;

      expect(firstMix.source.length, firstMixLength);
      expect(firstWithOneMore.source.length, firstMixLength + 1);
      expect(firstWithTwoMoreAsList.source.length, firstMixLength + 2);
    });

    test('Combines Mixes', () async {
      final combined = Mix.combine(firstMix, secondMix).source;
      final combinedAsList = Mix.combineAll([firstMix, secondMix]).source;
      final combineAsMix = firstMix.apply(secondMix).source;
      final combinedMaybeMix = firstMix.applyMaybe(secondMix);
      final combinedMaybeMixNull = firstMix.applyMaybe(null);

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
      ).source;

      expect(combined.length, firstMixLength + secondMixLength);
      expect(combinedAsList.length, firstMixLength + secondMixLength);
      expect(combineAsMix.length, firstMixLength + secondMixLength);
      expect(combinedWithAllParams.length, firstMixLength * 6);
      expect(
        combinedMaybeMix.length,
        firstMixLength + secondMixLength,
      );
      expect(combinedMaybeMixNull.length, firstMixLength);
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
