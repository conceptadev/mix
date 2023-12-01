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
      final attr = text.style(
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

      final attrWithPaint = text.style(
        background: purplePaint,
        foreground: yellowPaint,
      );

      final resolvedValue = attr.resolve(EmptyMixData);
      final resolvedWithPaint = attrWithPaint.resolve(EmptyMixData);

      expect(resolvedValue.style?.fontWeight, FontWeight.bold);
      expect(resolvedValue.style?.fontStyle, FontStyle.italic);
      expect(resolvedValue.style?.fontSize, 16.0);
      expect(resolvedValue.style?.letterSpacing, 1.0);
      expect(resolvedValue.style?.wordSpacing, 2.0);
      expect(resolvedValue.style?.textBaseline, TextBaseline.ideographic);
      expect(resolvedValue.style?.shadows?.length, 1);
      expect(resolvedValue.style?.shadows?.first.blurRadius, 1.0);
      expect(
        resolvedValue.style?.shadows?.first.color,
        Colors.black,
      );
      expect(
          resolvedValue.style?.shadows?.first.offset, const Offset(1.0, 1.0));
      expect(resolvedValue.style?.color, Colors.red);
      expect(resolvedValue.style?.backgroundColor, Colors.blue);
      expect(resolvedValue.style?.fontFeatures?.length, 1);
      expect(
        resolvedValue.style?.fontFeatures?.first,
        const FontFeature.alternative(4),
      );
      expect(
        resolvedValue.style?.decoration,
        TextDecoration.underline,
      );
      expect(
        resolvedValue.style?.decorationColor,
        Colors.green,
      );
      expect(resolvedValue.style?.decorationStyle, TextDecorationStyle.dashed);
      // expect(textStyleAttribute.resolve(EmptyMixData).foreground, yellowPaint);
      // expect(textStyleAttribute.resolve(EmptyMixData).background, purplePaint);
      expect(resolvedValue.style?.debugLabel, 'debugLabel');
      expect(
        resolvedValue.style?.locale,
        const Locale('en', 'US'),
      );
      expect(resolvedValue.style?.height, 2.0);
      expect(resolvedWithPaint.style?.foreground, yellowPaint);
      expect(resolvedWithPaint.style?.background, purplePaint);
    });

    test('color() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = text.style(color: Colors.red);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.style?.color, Colors.red);
    });

    test('backgroundColor() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = text.style(backgroundColor: Colors.blue);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.style?.backgroundColor, Colors.blue);
    });

    test('fontFamily() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = text.style(fontFamily: 'Roboto');
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.style?.fontFamily, 'Roboto');
    });

    test('fontSize() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = text.style(fontSize: 16.0);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.style?.fontSize, 16.0);
    });

    test('fontWeight() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = text.style.fontWeight.bold();
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.style?.fontWeight, FontWeight.bold);
    });

    test('fontStyle() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = text.style.fontStyle.italic();
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.style?.fontStyle, FontStyle.italic);
    });

    test('letterSpacing() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = text.style(letterSpacing: 1.0);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.style?.letterSpacing, 1.0);
    });

    test('wordSpacing() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = text.style(wordSpacing: 2.0);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.style?.wordSpacing, 2.0);
    });

    test('textBaseline() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = text.style.textBaseline.ideographic();
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.style?.textBaseline, TextBaseline.ideographic);
    });

    test('shadows() creates TextStyleAttribute correctly', () {
      const shadow = Shadow(
        blurRadius: 1.0,
        color: Colors.black,
        offset: Offset(1.0, 1.0),
      );
      final attribute = text.style.shadow(
        blurRadius: 1.0,
        color: Colors.black,
        offset: const Offset(1.0, 1.0),
      );

      final resolved = attribute.resolve(EmptyMixData);

      expect(resolved.style?.shadows?.length, 1);
      expect(resolved.style?.shadows?.first.blurRadius, 1.0);
      expect(resolved.style?.shadows?.first.color, Colors.black);
      expect(resolved.style?.shadows?.first.offset, const Offset(1.0, 1.0));
      expect(resolved.style?.shadows?.first, shadow);
    });

    test('fontFeatures() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = text.style.fontFeatures([
        const FontFeature.alternative(4),
      ]);

      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.style?.fontFeatures?.length, 1);
      expect(
        resolvedValue.style?.fontFeatures?.first,
        const FontFeature.alternative(4),
      );
    });

    test('decoration() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = text.style.decoration.underline();

      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.style?.decoration, TextDecoration.underline);
    });

    test('decorationColor() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = text.style(decorationColor: Colors.green);
      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.style?.decorationColor, Colors.green);
    });

    test('decorationStyle() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = text.style.decorationStyle.dashed();

      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.style?.decorationStyle, TextDecorationStyle.dashed);
    });

    test('foreground() creates TextStyleAttribute correctly', () {
      final yellowPaint = Paint()..color = Colors.yellow;
      final textStyleAttribute = text.style.foreground(yellowPaint);

      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.style?.foreground, yellowPaint);
    });

    test('background() creates TextStyleAttribute correctly', () {
      final purplePaint = Paint()..color = Colors.purple;
      final textStyleAttribute = text.style.background(purplePaint);

      final resolvedValue = textStyleAttribute.resolve(EmptyMixData);

      expect(resolvedValue.style?.background, purplePaint);
    });
  });
}
