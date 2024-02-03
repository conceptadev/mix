import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/values_ext.dart';
import '../../theme/tokens/text_style_token.dart';
import '../color/color_dto.dart';
import '../color/color_util.dart';
import '../scalars/scalar_util.dart';
import '../shadow/shadow_dto.dart';
import '../shadow/shadow_util.dart';
import 'text_style_dto.dart';

/// A utility class for handling `TextStyle` for `Attribute`s.
///
/// This class is part of a larger system for styling UI components. It extends `MixUtility` to leverage the flexibility and reusability of mixed utilities in a type-safe manner, focusing specifically on `TextStyleDto`.
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
/// - [TextStyleDto]
/// - [TextStyle]

class TextStyleUtility<T extends StyleAttribute> extends DtoUtility<T, TextStyleDto, TextStyle> {
  const TextStyleUtility(super.builder) : super(valueToDto: TextStyleDto.as);

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
    final textStyle = TextStyleDto(
      TextStyleData(
        background: background,
        backgroundColor: backgroundColor,
        color: color,
        debugLabel: debugLabel,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontFamilyFallback: fontFamilyFallback,
        fontFeatures: fontFeatures,
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        foreground: foreground,
        height: height,
        letterSpacing: letterSpacing,
        locale: locale,
        shadows: shadows,
        textBaseline: textBaseline,
        wordSpacing: wordSpacing,
      ),
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

  /// Returns a [ColorUtility] for manipulating the background color of the text style.
  ColorUtility<T> get backgroundColor {
    return ColorUtility((color) => _only(backgroundColor: color));
  }

  /// Returns a [ColorUtility] for manipulating the decoration color of the text style.
  ColorUtility<T> get decorationColor {
    return ColorUtility((color) => _only(decorationColor: color));
  }

  /// Returns a [ShadowUtility] for manipulating the shadow of the text style.
  ShadowUtility<T> get shadow {
    return ShadowUtility((shadow) => _only(shadows: [shadow]));
  }

  /// Returns a [TextDecorationStyleUtility] for manipulating the decoration style of the text style.
  TextDecorationStyleUtility<T> get decorationStyle {
    return TextDecorationStyleUtility(
      (style) => _only(decorationStyle: style),
    );
  }

  /// Returns a [TextBaselineUtility] for manipulating the text baseline of the text style.
  TextBaselineUtility<T> get textBaseline {
    return TextBaselineUtility((baseline) => _only(textBaseline: baseline));
  }

  /// Returns a [FontFamilyUtility] for manipulating the font family of the text style.
  FontFamilyUtility<T> get fontFamily {
    return FontFamilyUtility((fontFamily) => call(fontFamily: fontFamily));
  }

  /// Sets the height of the text style.
  T height(double height) => _only(height: height);

  /// Sets the text scale factor of the text style.
  T wordSpacing(double wordSpacing) {
    return _only(wordSpacing: wordSpacing);
  }

  /// Sets the text scale factor of the text style.
  T letterSpacing(double letterSpacing) {
    return _only(letterSpacing: letterSpacing);
  }

  /// Sets the shadows of the text style.
  T shadows(List<Shadow> shadows) {
    return _only(shadows: shadows.map((e) => e.toDto()).toList());
  }

  /// Alias shortcut for [FontStyle.italic].
  T italic() => fontStyle.italic();

  /// Alias shortcut for [FontStyle.normal].
  T bold() => fontWeight.bold();

  /// Sets the foreground of the text style.
  T foreground(Paint foreground) => call(foreground: foreground);

  /// Sets the background of the text style.
  T background(Paint background) => call(background: background);

  /// Sets the fontFeatures of the text style.
  T fontFeatures(List<FontFeature> fontFeatures) => call(fontFeatures: fontFeatures);

  /// Sets the locale of the text style.
  T locale(Locale locale) => call(locale: locale);

  /// Sets the debug label of the text style.
  T debugLabel(String label) => call(debugLabel: label);

  /// Sets the decorationThickness of the text style.
  T decorationThickness(double thickness) => call(decorationThickness: thickness);

  /// Sets the fontFamilyFallback of the text style.
  T fontFamilyFallback(List<String> fallback) => call(fontFamilyFallback: fallback);

  /// Allows to pass a [TextStyleToken] to the utility directly.
  T of(TextStyleToken token) => builder(TextStyleDto.of(token));

  /// Callable method for setting multiple values at once.
  ///
  /// Example:
  ///
  /// ```dart
  // final textStyle = TextStyleUtility(builder);
  // final attribute = textStyle(
  //   fontWeight: FontWeight.bold,
  //   fontStyle: FontStyle.italic,
  //   fontFamily: 'Roboto',
  //   fontSize: 16,
  //   color: Colors.red,
  //   backgroundColor: Colors.blue,
  //   letterSpacing: 1.5,
  //   wordSpacing: 1.5,
  //   textBaseline: TextBaseline.alphabetic,
  // );
  /// ```
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
    final textStyle = TextStyleDto.only(
      color: ColorDto.maybeFrom(color),
      backgroundColor: ColorDto.maybeFrom(backgroundColor),
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      debugLabel: debugLabel,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      shadows: shadows?.map((e) => e.toDto()).toList(),
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: ColorDto.maybeFrom(decorationColor),
      decorationStyle: decorationStyle,
      locale: locale,
      height: height,
      foreground: foreground,
      background: background,
      decorationThickness: decorationThickness,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
    );

    return builder(textStyle);
  }
}
