import 'dart:ui';

import 'package:flutter/material.dart';

import '../../dtos/text_style.dto.dart';
import 'text.attributes.dart';
import 'text_directives/text_directives.dart';

const kDeprecationMessage = 'Will be removed in the future';

@Deprecated('Use TextUtility instead')
class LegacyTextUtility {
  const LegacyTextUtility._();

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes style(TextStyle? style) {
    if (style == null) return const StyledTextAttributes();

    return StyledTextAttributes(style: TextStyleDto.from(style));
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes strutStyle(StrutStyle strutStyle) {
    return StyledTextAttributes(strutStyle: strutStyle);
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes textAlign(TextAlign textAlign) {
    return StyledTextAttributes(textAlign: textAlign);
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes locale(Locale locale) {
    return StyledTextAttributes(locale: locale);
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes softWrap(bool softWrap) {
    return StyledTextAttributes(softWrap: softWrap);
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes overflow(TextOverflow overflow) {
    return StyledTextAttributes(overflow: overflow);
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes textScaleFactor(double textScaleFactor) {
    return StyledTextAttributes(textScaleFactor: textScaleFactor);
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes maxLines(int maxLines) {
    return StyledTextAttributes(maxLines: maxLines);
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes textWidthBasis(TextWidthBasis textWidthBasis) {
    return StyledTextAttributes(textWidthBasis: textWidthBasis);
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes directives(List<TextDirective> directives) {
    return StyledTextAttributes(directives: directives);
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes directive(TextDirective directive) {
    return StyledTextAttributes(directives: [directive]);
  }
}

@Deprecated(kDeprecationMessage)
class LegacyTextStyleUtility {
  const LegacyTextStyleUtility._();

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes background(Paint? background) {
    return LegacyTextUtility.style(
      TextStyle(background: background),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes backgroundColor(Color? backgroundColor) {
    return LegacyTextUtility.style(
      TextStyle(backgroundColor: backgroundColor),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes color(Color? color) {
    return LegacyTextUtility.style(
      TextStyle(color: color),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes debugLabel(String? debugLabel) {
    return LegacyTextUtility.style(
      TextStyle(debugLabel: debugLabel),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes decoration(TextDecoration? decoration) {
    return LegacyTextUtility.style(
      TextStyle(decoration: decoration),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes decorationColor(Color? decorationColor) {
    return LegacyTextUtility.style(
      TextStyle(decorationColor: decorationColor),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes decorationStyle(
    TextDecorationStyle? decorationStyle,
  ) {
    return LegacyTextUtility.style(
      TextStyle(decorationStyle: decorationStyle),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes decorationThickness(double? decorationThickness) {
    return LegacyTextUtility.style(
      TextStyle(decorationThickness: decorationThickness),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes fontFamily(String? fontFamily) {
    return LegacyTextUtility.style(
      TextStyle(fontFamily: fontFamily),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes fontFamilyFallback(
    List<String>? fontFamilyFallback,
  ) {
    return LegacyTextUtility.style(
      TextStyle(fontFamilyFallback: fontFamilyFallback),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes fontFeatures(List<FontFeature>? fontFeatures) {
    return LegacyTextUtility.style(
      TextStyle(fontFeatures: fontFeatures),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes fontSize(double? fontSize) {
    return LegacyTextUtility.style(
      TextStyle(fontSize: fontSize),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes fontStyle(FontStyle? fontStyle) {
    return LegacyTextUtility.style(
      TextStyle(fontStyle: fontStyle),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes fontWeight(FontWeight? fontWeight) {
    return LegacyTextUtility.style(
      TextStyle(fontWeight: fontWeight),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes foreground(Paint? foreground) {
    return LegacyTextUtility.style(
      TextStyle(foreground: foreground),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes height(double? height) {
    return LegacyTextUtility.style(
      TextStyle(height: height),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes inherit({inherit = true}) {
    return LegacyTextUtility.style(
      TextStyle(inherit: inherit),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes letterSpacing(double? letterSpacing) {
    return LegacyTextUtility.style(
      TextStyle(letterSpacing: letterSpacing),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes locale(Locale? locale) {
    return LegacyTextUtility.style(
      TextStyle(locale: locale),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes shadows(List<Shadow> shadows) {
    return LegacyTextUtility.style(
      TextStyle(shadows: shadows),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes textBaseline(TextBaseline? textBaseline) {
    return LegacyTextUtility.style(
      TextStyle(textBaseline: textBaseline),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes wordSpacing(double? wordSpacing) {
    return LegacyTextUtility.style(
      TextStyle(wordSpacing: wordSpacing),
    );
  }
}

@Deprecated(kDeprecationMessage)
class LegacyTextFriendlyUtility {
  const LegacyTextFriendlyUtility._();

  @Deprecated(kDeprecationMessage)
  // ignore: long-parameter-list
  static StyledTextAttributes textStyle({
    Color? color,
    Paint? background,
    Color? backgroundColor,
    String? debugLabel,
    FontWeight? weight,
    double? size,
    String? family,
    FontStyle? style,
    double? letterSpacing,
    double? wordSpacing,
    List<String>? fontFamilyFallback,
    Paint? foreground,
    double? height,
    bool inherit = true,
    Locale? locale,
    Shadow? shadow,
    List<Shadow>? shadows,
    double? decorationThickness,
    TextDecorationStyle? decorationStyle,
    TextBaseline? textBaseline,
    Color? decorationColor,
  }) {
    combineShadows() {
      final s = shadows ?? [];
      if (shadow != null) s.add(shadow);

      return s;
    }

    return LegacyTextUtility.style(
      TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
        fontFamily: family,
        fontStyle: style,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        fontFamilyFallback: fontFamilyFallback,
        foreground: foreground,
        height: height,
        inherit: inherit,
        locale: locale,
        shadows: combineShadows(),
        textBaseline: textBaseline,
        decorationThickness: decorationThickness,
        decorationStyle: decorationStyle,
        decorationColor: decorationColor,
        debugLabel: debugLabel,
        background: background,
        backgroundColor: backgroundColor,
      ),
    );
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes bold() {
    return LegacyTextStyleUtility.fontWeight(FontWeight.bold);
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes italic() {
    return LegacyTextStyleUtility.fontStyle(FontStyle.italic);
  }

  @Deprecated(kDeprecationMessage)
  static StyledTextAttributes textShadow({
    Color color = const Color(0x33000000),
    double blurRadius = 0.0,
    Offset offset = Offset.zero,
  }) {
    return LegacyTextStyleUtility.shadows([
      Shadow(
        color: color,
        blurRadius: blurRadius,
        offset: offset,
      ),
    ]);
  }
}
