// Import necessary packages
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('TextStyleUtility', () {
    const textStyleUtility = TextStyleUtility();
    test('call() creates TextStyleAttribute correctly', () {
      final yellowPaint = Paint()..color = Colors.yellow;
      final purplePaint = Paint()..color = Colors.purple;
      final textStyleAttribute = textStyleUtility(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontSize: 16.0,
        letterSpacing: 1.0,
        wordSpacing: 2.0,
        textBaseline: TextBaseline.ideographic,
        shadows: [
          const Shadow(
            blurRadius: 1.0,
            color: Colors.black,
            offset: Offset(1.0, 1.0),
          ),
        ],
        color: Colors.red,
        backgroundColor: Colors.blue,
        fontFeatures: [const FontFeature.alternative(4)],
        decoration: TextDecoration.underline,
        decorationColor: Colors.green,
        decorationStyle: TextDecorationStyle.dashed,
        foreground: yellowPaint,
        background: purplePaint,
        height: 2.0,
      );

      expect(
          textStyleAttribute.resolve(EmptyMixData).fontWeight, FontWeight.bold);
      expect(
          textStyleAttribute.resolve(EmptyMixData).fontStyle, FontStyle.italic);
      expect(textStyleAttribute.resolve(EmptyMixData).fontSize, 16.0);
      expect(textStyleAttribute.resolve(EmptyMixData).letterSpacing, 1.0);
      expect(textStyleAttribute.resolve(EmptyMixData).wordSpacing, 2.0);
      expect(textStyleAttribute.resolve(EmptyMixData).textBaseline,
          TextBaseline.ideographic);
      expect(textStyleAttribute.resolve(EmptyMixData).shadows?.length, 1);
      expect(textStyleAttribute.resolve(EmptyMixData).shadows?.first.blurRadius,
          1.0);
      expect(
          textStyleAttribute.resolve(EmptyMixData).shadows?.first.color.value,
          Colors.black);
      expect(textStyleAttribute.resolve(EmptyMixData).shadows?.first.offset,
          const Offset(1.0, 1.0));
      expect(textStyleAttribute.resolve(EmptyMixData).color?.value, Colors.red);
      expect(textStyleAttribute.resolve(EmptyMixData).backgroundColor?.value,
          Colors.blue);
      expect(textStyleAttribute.resolve(EmptyMixData).fontFeatures?.length, 1);
      expect(
        textStyleAttribute.resolve(EmptyMixData).fontFeatures?.first,
        const FontFeature.alternative(4),
      );
      expect(textStyleAttribute.resolve(EmptyMixData).decoration,
          TextDecoration.underline);
      expect(textStyleAttribute.resolve(EmptyMixData).decorationColor?.value,
          Colors.green);
      expect(textStyleAttribute.resolve(EmptyMixData).decorationStyle,
          TextDecorationStyle.dashed);
      expect(textStyleAttribute.resolve(EmptyMixData).foreground, yellowPaint);
      expect(textStyleAttribute.resolve(EmptyMixData).background, purplePaint);
      expect(textStyleAttribute.resolve(EmptyMixData).debugLabel, 'debugLabel');
      expect(textStyleAttribute.resolve(EmptyMixData).locale,
          const Locale('en', 'US'));
      expect(textStyleAttribute.resolve(EmptyMixData).height, 2.0);
    });

    test('color() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.color(Colors.red);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.color?.value, Colors.red);
    });

    test('backgroundColor() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.backgroundColor(Colors.blue);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.backgroundColor?.value, Colors.blue);
    });

    test('fontFamily() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.fontFamily('Roboto');
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.fontFamily, 'Roboto');
    });

    test('fontSize() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.fontSize(16.0);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.fontSize, 16.0);
    });

    test('fontWeight() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.fontWeight(FontWeight.bold);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.fontWeight, FontWeight.bold);
    });

    test('fontStyle() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.fontStyle(FontStyle.italic);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.fontStyle, FontStyle.italic);
    });

    test('letterSpacing() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.letterSpacing(1.0);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.letterSpacing, 1.0);
    });

    test('wordSpacing() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.wordSpacing(2.0);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.wordSpacing, 2.0);
    });

    test('textBaseline() creates TextStyleAttribute correctly', () {
      final textStyleAttribute =
          textStyleUtility.textBaseline(TextBaseline.ideographic);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.textBaseline, TextBaseline.ideographic);
    });

    test('shadows() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.shadows([
        const Shadow(
          blurRadius: 1.0,
          color: Colors.black,
          offset: Offset(1.0, 1.0),
        ),
      ]);

      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.shadows?.length, 1);
      expect(resolvedValue.shadows?.first.blurRadius, 1.0);
      expect(resolvedValue.shadows?.first.color.value, Colors.black);
      expect(resolvedValue.shadows?.first.offset, const Offset(1.0, 1.0));
    });

    test('fontFeatures() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.fontFeatures([
        const FontFeature.alternative(4),
      ]);

      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.fontFeatures?.length, 1);
      expect(
        resolvedValue.fontFeatures?.first,
        const FontFeature.alternative(4),
      );
    });

    test('decoration() creates TextStyleAttribute correctly', () {
      final textStyleAttribute =
          textStyleUtility.decoration(TextDecoration.underline);

      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.decoration, TextDecoration.underline);
    });

    test('decorationColor() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.decorationColor(Colors.green);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.decorationColor?.value, Colors.green);
    });

    test('decorationStyle() creates TextStyleAttribute correctly', () {
      final textStyleAttribute =
          textStyleUtility.decorationStyle(TextDecorationStyle.dashed);

      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.decorationStyle, TextDecorationStyle.dashed);
    });

    test('foreground() creates TextStyleAttribute correctly', () {
      final yellowPaint = Paint()..color = Colors.yellow;
      final textStyleAttribute = textStyleUtility.foreground(yellowPaint);

      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.foreground, yellowPaint);
    });

    test('background() creates TextStyleAttribute correctly', () {
      final purplePaint = Paint()..color = Colors.purple;
      final textStyleAttribute = textStyleUtility.background(purplePaint);

      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.background, purplePaint);
    });
  });
}
