import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/text_style/text_style_attribute.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('TextStyleDto', () {
    test('from constructor sets all values correctly', () {
      final attr = TextStyleAttribute.only(color: Colors.red.toAttribute());
      final result = attr.resolve(EmptyMixData);
      expect(result.color, Colors.red);
    });
    test('merge returns merged object correctly', () {
      final attr1 = TextStyleAttribute.only(
        color: Colors.red.toAttribute(),
        fontSize: 24.0,
        decoration: TextDecoration.underline,
        decorationColor: Colors.blue.toAttribute(),
        decorationStyle: TextDecorationStyle.dashed,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        letterSpacing: 1.0,
        wordSpacing: 2.0,
        height: 2.0,
        locale: const Locale('en', 'US'),
        textBaseline: TextBaseline.ideographic,
      );

      final attr2 = TextStyleAttribute.only(
        color: Colors.blue.toAttribute(),
        fontSize: 30.0,
        decoration: TextDecoration.lineThrough,
        decorationColor: Colors.red.toAttribute(),
        decorationStyle: TextDecorationStyle.dotted,
        fontWeight: FontWeight.w100,
        fontStyle: FontStyle.normal,
        letterSpacing: 2.0,
        wordSpacing: 3.0,
        height: 3.0,
        locale: const Locale('en', 'US'),
        textBaseline: TextBaseline.alphabetic,
      );

      final merged = attr1.merge(attr2).resolve(EmptyMixData);

      expect(merged.color?.value, Colors.blue);
      expect(merged.fontSize, 30.0);
      expect(merged.decoration, TextDecoration.lineThrough);
      expect(merged.decorationColor?.value, Colors.red);
      expect(merged.decorationStyle, TextDecorationStyle.dotted);
      expect(merged.fontWeight, FontWeight.w100);
      expect(merged.fontStyle, FontStyle.normal);
      expect(merged.letterSpacing, 2.0);
      expect(merged.wordSpacing, 3.0);
      expect(merged.height, 3.0);
      expect(merged.locale, const Locale('en', 'US'));
      expect(merged.textBaseline, TextBaseline.alphabetic);
    });
    test('resolve returns correct TextStyle with specific values', () {
      final attr = TextStyleAttribute.only(
        color: Colors.red.toAttribute(),
        fontSize: 24.0,
        decoration: TextDecoration.underline,
        decorationColor: Colors.blue.toAttribute(),
        decorationStyle: TextDecorationStyle.dashed,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        letterSpacing: 1.0,
        wordSpacing: 2.0,
        height: 2.0,
        locale: const Locale('en', 'US'),
        textBaseline: TextBaseline.ideographic,
      );
      final textStyle = attr.resolve(EmptyMixData);
      expect(textStyle.color, Colors.red);
      expect(textStyle.fontSize, 24.0);
      expect(textStyle.decoration, TextDecoration.underline);
      expect(textStyle.decorationColor, Colors.blue);
      expect(textStyle.decorationStyle, TextDecorationStyle.dashed);
      expect(textStyle.fontWeight, FontWeight.bold);
      expect(textStyle.fontStyle, FontStyle.italic);
      expect(textStyle.letterSpacing, 1.0);
      expect(textStyle.wordSpacing, 2.0);
      expect(textStyle.height, 2.0);
      expect(
        textStyle.locale,
        const Locale('en', 'US'),
      );
      expect(textStyle.textBaseline, TextBaseline.ideographic);
      return const Placeholder();
    });
    test('Equality holds when all attributes are the same', () {
      final attr1 = TextStyleAttribute.only(color: Colors.red.toAttribute());
      final attr2 = TextStyleAttribute.only(color: Colors.red.toAttribute());
      expect(attr1, attr2);
    });
    test('Equality fails when attributes are different', () {
      final attr1 = TextStyleAttribute.only(color: Colors.red.toAttribute());
      final attr2 = TextStyleAttribute.only(color: Colors.blue.toAttribute());
      expect(attr1, isNot(attr2));
    });
  });
}
