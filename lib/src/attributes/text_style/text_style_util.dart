import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/extensions/values_ext.dart';
import '../../theme/tokens/text_style_token.dart';
import '../color/color_dto.dart';
import '../color/color_util.dart';
import '../scalars/scalar_util.dart';
import '../shadow/shadow_dto.dart';
import '../shadow/shadow_util.dart';
import '../strut_style/strut_style_attribute.dart';
import 'text_style_attribute.dart';

/// A utility class for handling `TextStyle` for `Attribute`s.
///
/// This class is part of a larger system for styling UI components. It extends `MixUtility` to leverage the flexibility and reusability of mixed utilities in a type-safe manner, focusing specifically on `TextStyleAttribute`.
///
/// The `TextStyleUtility` provides methods for setting various text style attributes like color, font weight, font style, and more. These methods return the generic type `T`, allow to be used within multiple `Attribute` classes.
///
/// The utility also includes specialized getters (e.g., `color`, `fontWeight`) that return specific utility classes. These classes offer more focused methods for manipulating individual aspects of a text style.
///
/// Example:
/// ```dart
/// // Creating a TextStyleUtility instance for styling.
/// final textStyle = TextStyleUtility(builder);
///
/// // You can use the call method to set multiple values at once.
/// final styledText = textStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);
///
/// // You can also use the specialized getters to manipulate specific aspects of the text style.
/// final bold = textStyle.fontWeight.bold();
/// final italic = textStyle.fontStyle.italic();
/// ```
///
/// See also:
/// - [MixUtility]
/// - [TextStyleAttribute]
/// - [TextStyle]

class TextStyleUtility<T> extends MixUtility<T, TextStyleAttribute> {
  static const selfBuilder = TextStyleUtility(MixUtility.selfBuilder);

  const TextStyleUtility(super.builder);

  T _only({
    ColorDto? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    double? fontSize,
    double? letterSpacing,
    double? wordSpacing,
    ColorDto? backgroundColor,
    ColorDto? decorationColor,
    TextDecorationStyle? decorationStyle,
    TextBaseline? textBaseline,
    List<ShadowDto>? shadows,
    List<FontFeature>? fontFeatures,
    Paint? foreground,
    Paint? background,
    double? decorationThickness,
    List<String>? fontFamilyFallback,
    Locale? locale,
    String? debugLabel,
    double? height,
  }) {
    final textStyle = TextStyleAttribute.only(
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      color: color,
      backgroundColor: backgroundColor,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      locale: locale,
      debugLabel: debugLabel,
      height: height,
      foreground: foreground,
      background: background,
      decorationThickness: decorationThickness,
      fontFamilyFallback: fontFamilyFallback,
    );

    return builder(textStyle);
  }

  /// Returns a [ColorUtility] for manipulating the color of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  ColorUtility<T> get color {
    return ColorUtility((ColorDto color) => _only(color: color));
  }

  /// Returns a [FontWeightUtility] for manipulating the font weight of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final bold = textStyle.fontWeight.bold();
  /// ```
  ///
  /// See also:
  /// - [FontWeightUtility]
  FontWeightUtility<T> get fontWeight {
    return FontWeightUtility((weight) => _only(fontWeight: weight));
  }

  /// Returns a [FontStyleUtility] for manipulating the font style of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final italic = textStyle.fontStyle.italic();
  /// ```
  ///
  /// See also:
  /// - [FontStyleUtility]
  FontStyleUtility<T> get fontStyle {
    return FontStyleUtility((style) => _only(fontStyle: style));
  }

  /// Returns a [TextDecorationUtility] for manipulating the text decoration of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final underline = textStyle.decoration.underline();
  /// ```
  TextDecorationUtility<T> get decoration {
    return TextDecorationUtility(
      (decoration) => _only(decoration: decoration),
    );
  }

  /// Returns a [FontSizeUtility] for manipulating the font size of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final customFont = textStyle.fontSize(16);
  /// ```
  /// See also:
  /// - [FontSizeUtility]
  FontSizeUtility<T> get fontSize {
    return FontSizeUtility((size) => _only(fontSize: size));
  }

  /// Returns a [DoubleUtility] for manipulating the letter spacing of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final customLetterSpacing = textStyle.letterSpacing(1.5);
  /// ```
  ///
  /// See also:
  /// - [DoubleUtility]
  DoubleUtility<T> get letterSpacing {
    return DoubleUtility((spacing) => _only(letterSpacing: spacing));
  }

  /// Returns a [DoubleUtility] for manipulating the word spacing of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final customWordSpacing = textStyle.wordSpacing(1.5);
  /// ```
  ///
  /// See also:
  /// - [DoubleUtility]
  DoubleUtility<T> get wordSpacing {
    return DoubleUtility((spacing) => _only(wordSpacing: spacing));
  }

  /// Returns a [ColorUtility] for manipulating the background color of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final customBackgroundColor = textStyle.backgroundColor(Colors.red);
  /// ```
  ///
  /// See also:
  /// - [ColorUtility]
  ColorUtility<T> get backgroundColor {
    return ColorUtility((color) => _only(backgroundColor: color));
  }

  /// Returns a [ColorUtility] for manipulating the decoration color of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final decorationColor = textStyle.decorationColor(Colors.red);
  /// ```
  ///
  /// See also:
  /// - [ColorUtility]
  ColorUtility<T> get decorationColor {
    return ColorUtility((color) => _only(decorationColor: color));
  }

  /// Returns a [ShadowUtility] for manipulating the shadow of the text style.
  ///
  /// This utility allows you to modify the color, offset, and blur radius
  /// of the shadow. It uses the [ShadowUtility] class which provides
  /// an interface to build upon the [ShadowDto] object.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final shadowed = textStyle.shadow(color: Colors.red, offset: Offset(1, 1), blurRadius: 1);
  /// final offset = textStyle.shadow.offset(1, 1);
  ///
  /// ```
  ///
  /// See also:
  /// - [ColorUtility]
  /// - [OffsetUtility]
  /// - [DoubleUtility]
  ShadowUtility<T> get shadow {
    return ShadowUtility((shadow) => _only(shadows: [shadow]));
  }

  TextDecorationStyleUtility<T> get decorationStyle {
    return TextDecorationStyleUtility(
      (style) => _only(decorationStyle: style),
    );
  }

  TextBaselineUtility<T> get textBaseline {
    return TextBaselineUtility((baseline) => _only(textBaseline: baseline));
  }

  FontFamilyUtility<T> get fontFamily {
    return FontFamilyUtility((fontFamily) => call(fontFamily: fontFamily));
  }

  DoubleUtility<T> get height {
    return DoubleUtility((height) => call(height: height));
  }

  T shadows(List<Shadow> shadows) {
    return _only(shadows: shadows.map((e) => e.toDto()).toList());
  }

  T as(TextStyle style) => builder(TextStyleAttribute.from(style));

  T italic() => fontStyle.italic();

  T bold() => fontWeight.bold();

  T foreground(Paint foreground) => call(foreground: foreground);

  T background(Paint background) => call(background: background);

  T fontFeatures(List<FontFeature> fontFeatures) =>
      call(fontFeatures: fontFeatures);

  T locale(Locale locale) => call(locale: locale);

  T debugLabel(String label) => call(debugLabel: label);

  T decorationThickness(double thickness) =>
      call(decorationThickness: thickness);

  T fontFamilyFallback(List<String> fallback) =>
      call(fontFamilyFallback: fallback);

  T token(TextStyleToken token) => builder(TextStyleAttribute.token(token));

  T call({
    String? fontFamily,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? fontSize,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    List<Shadow>? shadows,
    Color? color,
    Color? backgroundColor,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    TextDecorationStyle? decorationStyle,
    Locale? locale,
    String? debugLabel,
    List<String>? fontFamilyFallback,
    Paint? foreground,
    Paint? background,
    double? decorationThickness,
    Color? decorationColor,
    double? height,
  }) {
    final textStyle = TextStyleAttribute.only(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      color: color?.toDto(),
      backgroundColor: backgroundColor?.toDto(),
      shadows: shadows?.map((e) => e.toDto()).toList(),
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor?.toDto(),
      decorationStyle: decorationStyle,
      locale: locale,
      debugLabel: debugLabel,
      height: height,
      foreground: foreground,
      background: background,
      decorationThickness: decorationThickness,
      fontFamilyFallback: fontFamilyFallback,
    );

    return builder(textStyle);
  }
}

class StrutStyleUtility<T> extends MixUtility<T, StrutStyleAttribute> {
  const StrutStyleUtility(super.builder);

  FontFamilyUtility<T> get fontFamily {
    return FontFamilyUtility((fontFamily) => call(fontFamily: fontFamily));
  }

  DoubleUtility<T> get fontSize {
    return DoubleUtility((fontSize) => call(fontSize: fontSize));
  }

  FontWeightUtility<T> get fontWeight {
    return FontWeightUtility((fontWeight) => call(fontWeight: fontWeight));
  }

  FontStyleUtility<T> get fontStyle {
    return FontStyleUtility((fontStyle) => call(fontStyle: fontStyle));
  }

  DoubleUtility<T> get height {
    return DoubleUtility((height) => call(height: height));
  }

  DoubleUtility<T> get leading {
    return DoubleUtility((leading) => call(leading: leading));
  }

  BoolUtility<T> get forceStrutHeight {
    return BoolUtility(
      (forceStrutHeight) => call(forceStrutHeight: forceStrutHeight),
    );
  }

  T fontFamilyFallback(List<String> fontFamilyFallback) =>
      call(fontFamilyFallback: fontFamilyFallback);

  T call({
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? height,
    double? leading,
    bool? forceStrutHeight,
  }) {
    final strutStyle = StrutStyleAttribute(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: height,
      leading: leading,
      forceStrutHeight: forceStrutHeight,
    );

    return builder(strutStyle);
  }
}
