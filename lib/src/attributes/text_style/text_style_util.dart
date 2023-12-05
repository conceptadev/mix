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

class TextStyleUtility<T extends StyleAttribute>
    extends DtoUtility<T, TextStyleDto, TextStyle> {
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
      TextStyleDataDto(
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

  /// Returns a [TextDecorationStyleUtility] for manipulating the decoration style of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final dashed = textStyle.decorationStyle.dashed();
  /// ```
  ///
  /// See also:
  /// - [TextDecorationStyleUtility]
  /// - [TextDecorationStyle]
  TextDecorationStyleUtility<T> get decorationStyle {
    return TextDecorationStyleUtility(
      (style) => _only(decorationStyle: style),
    );
  }

  /// Returns a [TextBaselineUtility] for manipulating the text baseline of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final alphabetic = textStyle.textBaseline.alphabetic();
  /// ```
  ///
  /// See also:
  /// - [TextBaselineUtility]
  /// - [TextBaseline]
  TextBaselineUtility<T> get textBaseline {
    return TextBaselineUtility((baseline) => _only(textBaseline: baseline));
  }

  /// Returns a [FontFamilyUtility] for manipulating the font family of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final customFontFamily = textStyle.fontFamily('Roboto');
  /// ```
  ///
  /// See also:
  /// - [FontFamilyUtility]
  FontFamilyUtility<T> get fontFamily {
    return FontFamilyUtility((fontFamily) => call(fontFamily: fontFamily));
  }

  /// Method for setting the height of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final customHeight = textStyle.height(1.5);
  /// ```
  T height(double height) => _only(height: height);

  /// Method for setting the word spacing of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final customWordSpacing = textStyle.wordSpacing(1.5);
  /// ```
  T wordSpacing(double wordSpacing) {
    return _only(wordSpacing: wordSpacing);
  }

  /// Method for setting the letter spacing of the text style.
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
  T letterSpacing(double letterSpacing) {
    return _only(letterSpacing: letterSpacing);
  }

  /// Method for setting the shadows of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  // final textStyle = TextStyleUtility(builder);
  // final customShadows = textStyle.shadows([
  //   Shadow(color: Colors.red, offset: Offset(1, 1), blurRadius: 1),
  // ]);
  /// ```
  T shadows(List<Shadow> shadows) {
    return _only(shadows: shadows.map((e) => e.toDto()).toList());
  }

  /// Method alias for [FontStyle.italic].
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final italic = textStyle.italic();
  /// ```
  ///
  /// See also:
  /// * [FontStyle.italic]
  T italic() => fontStyle.italic();

  /// Method alias for [FontStyle.normal].
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final normal = textStyle.normal();
  /// ```
  ///
  /// See also:
  /// * [FontStyle.normal]
  T bold() => fontWeight.bold();

  /// Method for settings the foreground of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final foreground = textStyle.foreground(Paint()..color = Colors.red);
  /// ```
  ///
  /// See also:
  /// * [Paint]
  T foreground(Paint foreground) => call(foreground: foreground);

  /// Method for settings the background of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final background = textStyle.background(Paint()..color = Colors.red);
  /// ```
  T background(Paint background) => call(background: background);

  /// Method for settings font features of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final fontFeatures = textStyle.fontFeatures([FontFeature.enable('smcp')]);
  /// ```
  ///
  /// See also:
  /// * [FontFeature]
  T fontFeatures(List<FontFeature> fontFeatures) =>
      call(fontFeatures: fontFeatures);

  /// Method for setting the locale of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final locale = textStyle.locale(Locale('en'));
  /// ```
  ///
  /// See also:
  /// * [Locale]
  T locale(Locale locale) => call(locale: locale);

  /// Method for setting the debug label of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final debugLabel = textStyle.debugLabel('debug label');
  /// ```
  T debugLabel(String label) => call(debugLabel: label);

  /// Method for setting the decoration thickness of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final decorationThickness = textStyle.decorationThickness(1.0);
  /// ```
  T decorationThickness(double thickness) =>
      call(decorationThickness: thickness);

  /// Method for setting the font family fallback of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final fontFamilyFallback = textStyle.fontFamilyFallback(['Roboto']);
  /// ```
  T fontFamilyFallback(List<String> fallback) =>
      call(fontFamilyFallback: fallback);

  /// Method for setting the `TextStyleToken` of the text style.
  ///
  /// Example:
  ///
  /// ```dart
  /// final textStyle = TextStyleUtility(builder);
  /// final token = textStyle.token(token);
  /// ```
  ///
  /// See also:
  /// * [TextStyleToken]
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
      color: color?.toDto(),
      backgroundColor: backgroundColor?.toDto(),
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
      decorationColor: decorationColor?.toDto(),
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
