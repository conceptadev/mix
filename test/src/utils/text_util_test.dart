// Import necessary packages
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

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

      expect(textStyleAttribute.fontWeight, FontWeight.bold);
      expect(textStyleAttribute.fontStyle, FontStyle.italic);
      expect(textStyleAttribute.fontSize, 16.0);
      expect(textStyleAttribute.letterSpacing, 1.0);
      expect(textStyleAttribute.wordSpacing, 2.0);
      expect(textStyleAttribute.textBaseline, TextBaseline.ideographic);
      expect(textStyleAttribute.shadows?.length, 1);
      expect(textStyleAttribute.shadows?.first.blurRadius, 1.0);
      expect(textStyleAttribute.shadows?.first.color?.value, Colors.black);
      expect(textStyleAttribute.shadows?.first.offset, const Offset(1.0, 1.0));
      expect(textStyleAttribute.color?.value, Colors.red);
      expect(textStyleAttribute.backgroundColor?.value, Colors.blue);
      expect(textStyleAttribute.fontFeatures?.length, 1);
      expect(
        textStyleAttribute.fontFeatures?.first,
        const FontFeature.alternative(4),
      );
      expect(textStyleAttribute.decoration, TextDecoration.underline);
      expect(textStyleAttribute.decorationColor?.value, Colors.green);
      expect(textStyleAttribute.decorationStyle, TextDecorationStyle.dashed);
      expect(textStyleAttribute.foreground, yellowPaint);
      expect(textStyleAttribute.background, purplePaint);
      expect(textStyleAttribute.debugLabel, 'debugLabel');
      expect(textStyleAttribute.locale, const Locale('en', 'US'));
      expect(textStyleAttribute.height, 2.0);
    });

    test('color() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.color(Colors.red);

      expect(textStyleAttribute.color?.value, Colors.red);
    });

    test('backgroundColor() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.backgroundColor(Colors.blue);

      expect(textStyleAttribute.backgroundColor?.value, Colors.blue);
    });

    test('fontFamily() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.fontFamily('Roboto');

      expect(textStyleAttribute.fontFamily, 'Roboto');
    });

    test('fontSize() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.fontSize(16.0);

      expect(textStyleAttribute.fontSize, 16.0);
    });

    test('fontWeight() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.fontWeight(FontWeight.bold);

      expect(textStyleAttribute.fontWeight, FontWeight.bold);
    });

    test('fontStyle() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.fontStyle(FontStyle.italic);

      expect(textStyleAttribute.fontStyle, FontStyle.italic);
    });

    test('letterSpacing() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.letterSpacing(1.0);

      expect(textStyleAttribute.letterSpacing, 1.0);
    });

    test('wordSpacing() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.wordSpacing(2.0);

      expect(textStyleAttribute.wordSpacing, 2.0);
    });

    test('textBaseline() creates TextStyleAttribute correctly', () {
      final textStyleAttribute =
          textStyleUtility.textBaseline(TextBaseline.ideographic);

      expect(textStyleAttribute.textBaseline, TextBaseline.ideographic);
    });

    test('shadows() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.shadows([
        const Shadow(
          blurRadius: 1.0,
          color: Colors.black,
          offset: Offset(1.0, 1.0),
        ),
      ]);

      expect(textStyleAttribute.shadows?.length, 1);
      expect(textStyleAttribute.shadows?.first.blurRadius, 1.0);
      expect(textStyleAttribute.shadows?.first.color?.value, Colors.black);
      expect(textStyleAttribute.shadows?.first.offset, const Offset(1.0, 1.0));
    });

    test('fontFeatures() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.fontFeatures([
        const FontFeature.alternative(4),
      ]);

      expect(textStyleAttribute.fontFeatures?.length, 1);
      expect(
        textStyleAttribute.fontFeatures?.first,
        const FontFeature.alternative(4),
      );
    });

    test('decoration() creates TextStyleAttribute correctly', () {
      final textStyleAttribute =
          textStyleUtility.decoration(TextDecoration.underline);

      expect(textStyleAttribute.decoration, TextDecoration.underline);
    });

    test('decorationColor() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyleUtility.decorationColor(Colors.green);

      expect(textStyleAttribute.decorationColor?.value, Colors.green);
    });

    test('decorationStyle() creates TextStyleAttribute correctly', () {
      final textStyleAttribute =
          textStyleUtility.decorationStyle(TextDecorationStyle.dashed);

      expect(textStyleAttribute.decorationStyle, TextDecorationStyle.dashed);
    });

    test('foreground() creates TextStyleAttribute correctly', () {
      final yellowPaint = Paint()..color = Colors.yellow;
      final textStyleAttribute = textStyleUtility.foreground(yellowPaint);

      expect(textStyleAttribute.foreground, yellowPaint);
    });

    test('background() creates TextStyleAttribute correctly', () {
      final purplePaint = Paint()..color = Colors.purple;
      final textStyleAttribute = textStyleUtility.background(purplePaint);

      expect(textStyleAttribute.background, purplePaint);
    });
  });
}
