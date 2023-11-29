// Import necessary packages
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('TextStyleUtility', () {
    test('call() creates TextStyleAttribute correctly', () {
      final yellowPaint = Paint()..color = Colors.yellow;
      final purplePaint = Paint()..color = Colors.purple;
      final attr = textStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontSize: 16.0,
        letterSpacing: 1.0,
        wordSpacing: 2.0,
        debugLabel: 'debugLabel',
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
        locale: const Locale('en', 'US'),
        height: 2.0,
      );

      final attrWithPaint = textStyle(
        background: purplePaint,
        foreground: yellowPaint,
      );

      final resolvedValue = attr.resolve(EmptyMixData);
      final resolvedWithPaint = attrWithPaint.resolve(EmptyMixData);

      expect(resolvedValue.fontWeight, FontWeight.bold);
      expect(resolvedValue.fontStyle, FontStyle.italic);
      expect(resolvedValue.fontSize, 16.0);
      expect(resolvedValue.letterSpacing, 1.0);
      expect(resolvedValue.wordSpacing, 2.0);
      expect(resolvedValue.textBaseline, TextBaseline.ideographic);
      expect(resolvedValue.shadows?.length, 1);
      expect(resolvedValue.shadows?.first.blurRadius, 1.0);
      expect(
        resolvedValue.shadows?.first.color,
        Colors.black,
      );
      expect(resolvedValue.shadows?.first.offset, const Offset(1.0, 1.0));
      expect(resolvedValue.color, Colors.red);
      expect(resolvedValue.backgroundColor, Colors.blue);
      expect(resolvedValue.fontFeatures?.length, 1);
      expect(
        resolvedValue.fontFeatures?.first,
        const FontFeature.alternative(4),
      );
      expect(
        resolvedValue.decoration,
        TextDecoration.underline,
      );
      expect(
        resolvedValue.decorationColor,
        Colors.green,
      );
      expect(resolvedValue.decorationStyle, TextDecorationStyle.dashed);
      // expect(textStyleAttribute.resolve(EmptyMixData).foreground, yellowPaint);
      // expect(textStyleAttribute.resolve(EmptyMixData).background, purplePaint);
      expect(resolvedValue.debugLabel, 'debugLabel');
      expect(
        resolvedValue.locale,
        const Locale('en', 'US'),
      );
      expect(resolvedValue.height, 2.0);
      expect(resolvedWithPaint.foreground, yellowPaint);
      expect(resolvedWithPaint.background, purplePaint);
    });

    test('color() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.color(Colors.red);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.color, Colors.red);
    });

    test('backgroundColor() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.backgroundColor(Colors.blue);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.backgroundColor, Colors.blue);
    });

    test('fontFamily() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.fontFamily('Roboto');
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.fontFamily, 'Roboto');
    });

    test('fontSize() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.fontSize(16.0);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.fontSize, 16.0);
    });

    test('fontWeight() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.fontWeight.bold();
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.fontWeight, FontWeight.bold);
    });

    test('fontStyle() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.fontStyle.italic();
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.fontStyle, FontStyle.italic);
    });

    test('letterSpacing() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.letterSpacing(1.0);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.letterSpacing, 1.0);
    });

    test('wordSpacing() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.wordSpacing(2.0);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.wordSpacing, 2.0);
    });

    test('textBaseline() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.textBaseline.ideographic();
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.textBaseline, TextBaseline.ideographic);
    });

    test('shadows() creates TextStyleAttribute correctly', () {
      final blackShadow = shadow(
        blurRadius: 1.0,
        color: Colors.black,
        offset: const Offset(1.0, 1.0),
      );
      final textStyleAttribute = textStyle.shadow.as(blackShadow);

      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.shadows?.length, 1);
      expect(resolvedValue.shadows?.first.blurRadius, 1.0);
      expect(resolvedValue.shadows?.first.color, Colors.black);
      expect(resolvedValue.shadows?.first.offset, const Offset(1.0, 1.0));
    });

    test('fontFeatures() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.fontFeatures([
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
      final textStyleAttribute = textStyle.decoration.underline();

      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.decoration, TextDecoration.underline);
    });

    test('decorationColor() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.decorationColor(Colors.green);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.decorationColor, Colors.green);
    });

    test('decorationStyle() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.decorationStyle.dashed();

      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.decorationStyle, TextDecorationStyle.dashed);
    });

    test('foreground() creates TextStyleAttribute correctly', () {
      final yellowPaint = Paint()..color = Colors.yellow;
      final textStyleAttribute = textStyle.foreground(yellowPaint);

      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.foreground, yellowPaint);
    });

    test('background() creates TextStyleAttribute correctly', () {
      final purplePaint = Paint()..color = Colors.purple;
      final textStyleAttribute = textStyle.background(purplePaint);

      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.background, purplePaint);
    });
  });
}
