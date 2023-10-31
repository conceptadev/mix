// @exportRequired

import 'dart:ui';

import 'package:flutter/material.dart';

import 'attributes/visual_attributes.dart';
import 'core/dto/text_style_dto.dart';
import 'helpers/constants.dart';
import 'helpers/extensions/values_ext.dart';
import 'utils/alignment_util.dart';
import 'utils/border_radius_util.dart';
import 'utils/border_util.dart';
import 'utils/box_constraints_util.dart';
import 'utils/container_util.dart';
import 'utils/context_variant_util.dart';
import 'utils/flex_util.dart';
import 'utils/helper_util.dart';
import 'utils/pressable_util.dart';
import 'utils/size_util.dart';
import 'utils/space_util.dart';
import 'utils/text_style_util.dart';

/// ALL ALIASES HERE HAVE BEEN DEPRECATED AND WILL BE REMOVED IN THE FUTURE
/// FEEL FREE TO BRING INTERNALLY TO YOUR OWN PROJECT

@Deprecated('Use mainAxisAlignment instead')
const mainAxis = mainAxisAlignment;

@Deprecated('use Mix.chooser instead')
void when(bool _) => throw UnimplementedError();

@Deprecated('Use onXSmall instead')
final xsmall = onXSmall;

@Deprecated('Use onSmall instead')
final small = onSmall;

@Deprecated('Use onMedium instead')
final medium = onMedium;

@Deprecated('Use onDark instead')
final dark = onDark;

@Deprecated('Use onLight instead')
final light = onLight;

@Deprecated('Use onLarge instead')
final large = onLarge;

@Deprecated('Use onHover instead')
final hover = onHover;

@Deprecated('Use onFocus instead')
final focus = onFocus;

@Deprecated('Use onPortrait instead')
final portrait = onPortrait;

@Deprecated('Use onLandscape instead')
final landscape = onLandscape;

@Deprecated('Use onDisabled instead')
final disabled = onDisabled;

@Deprecated('Use onEnabled instead')
final enabled = onEnabled;

@Deprecated('Use onPress instead')
final press = onPress;

@Deprecated('Use onNot instead')
const not = onNot;

@Deprecated('Use textStyle instead')
const font = textStyle;

@Deprecated('Use textStyle(textShadow: textShadow) instead')
TextStyleData textShadow(List<Shadow> textShadow) {
  return textStyle(shadows: textShadow);
}

@Deprecated('Use textStyle(textShadow: textShadow) instead')
const fontWeight = LegacyTextStyleUtility.fontWeight;

@Deprecated('Use textStyle(textBaseline: textBaseline) instead')
const textBaseline = LegacyTextStyleUtility.textBaseline;

@Deprecated('Use textStyle(letterSpacing: letterSpacing) instead')
const letterSpacing = LegacyTextStyleUtility.letterSpacing;

@Deprecated('Use textStyle(debugLabel: debugLabel) instead')
const debugLabel = LegacyTextStyleUtility.debugLabel;

@Deprecated('Use textStyle(height: height) instead')
const textHeight = LegacyTextStyleUtility.textHeight;

@Deprecated('Use textStyle(wordSpacing: wordSpacing) instead')
const wordSpacing = LegacyTextStyleUtility.wordSpacing;

@Deprecated('Use textStyle(fontStyle: fontStyle) instead')
const fontStyle = LegacyTextStyleUtility.fontStyle;

@Deprecated('Use textStyle(fontSize: fontSize) instead')
const fontSize = LegacyTextStyleUtility.fontSize;

@Deprecated('Use textStyle(inherit: inherit) instead')
const inherit = LegacyTextStyleUtility.inherit;

@Deprecated('Use textStyle(color: color) instead')
const textColor = LegacyTextStyleUtility.textColor;

@Deprecated('Use textStyle(backgroundColor: backgroundColor) instead')
const textBgColor = LegacyTextStyleUtility.textBgColor;

@Deprecated('Use textStyle(foreground: foreground) instead')
const textForeground = LegacyTextStyleUtility.textForeground;

@Deprecated('Use textStyle(background: background) instead')
const textBackground = LegacyTextStyleUtility.textBackground;

@Deprecated('Use textStyle(shadows: shadows) instead')
const textShadows = LegacyTextStyleUtility.textShadow;

@Deprecated('Use textStyle(fontFeatures: fontFeatures) instead')
const fontFeatures = LegacyTextStyleUtility.fontFeatures;

@Deprecated('Use textStyle(decoration: decoration) instead')
const textDecoration = LegacyTextStyleUtility.textDecoration;

@Deprecated('Use textStyle(decorationColor: decorationColor) instead')
const textDecorationColor = LegacyTextStyleUtility.textDecorationColor;

@Deprecated('Use textStyle(decorationStyle: decorationStyle) instead')
const textDecorationStyle = LegacyTextStyleUtility.textDecorationStyle;

@Deprecated('Use textStyle(decorationThickness: decorationThickness) instead')
const textDecorationThickness = LegacyTextStyleUtility.textDecorationThickness;

@Deprecated('Use textStyle(fontFamilyFallback: fontFamilyFallback) instead')
const fontFamilyFallback = LegacyTextStyleUtility.fontFamilyFallback;

class LegacyTextStyleUtility {
  static TextStyle textShadow(List<Shadow> shadows) {
    return TextStyle(shadows: shadows);
  }

  static TextStyle fontWeight(FontWeight weight) {
    return TextStyle(fontWeight: weight);
  }

  static TextStyle textBaseline(TextBaseline baseline) {
    return TextStyle(textBaseline: baseline);
  }

  static TextStyle letterSpacing(double spacing) {
    return TextStyle(letterSpacing: spacing);
  }

  static TextStyle debugLabel(String label) {
    return TextStyle(debugLabel: label);
  }

  static TextStyle textHeight(double height) {
    return TextStyle(height: height);
  }

  static TextStyle wordSpacing(double spacing) {
    return TextStyle(wordSpacing: spacing);
  }

  static TextStyle fontStyle(FontStyle style) {
    return TextStyle(fontStyle: style);
  }

  static TextStyle fontSize(double size) {
    return TextStyle(fontSize: size);
  }

  static TextStyle inherit(bool value) {
    return TextStyle(inherit: value);
  }

  static TextStyle textColor(Color color) {
    return TextStyle(color: color);
  }

  static TextStyle textBgColor(Color backgroundColor) {
    return TextStyle(backgroundColor: backgroundColor);
  }

  static TextStyle textForeground(Paint foreground) {
    return TextStyle(foreground: foreground);
  }

  static TextStyle textBackground(Paint background) {
    return TextStyle(background: background);
  }

  static TextStyle fontFeatures(List<FontFeature> features) {
    return TextStyle(fontFeatures: features);
  }

  static TextStyle textDecoration(TextDecoration decoration) {
    return TextStyle(decoration: decoration);
  }

  static TextStyle textDecorationColor(Color decorationColor) {
    return TextStyle(decorationColor: decorationColor);
  }

  static TextStyle textDecorationStyle(TextDecorationStyle decorationStyle) {
    return TextStyle(decorationStyle: decorationStyle);
  }

  static TextStyle textDecorationThickness(double decorationThickness) {
    return TextStyle(decorationThickness: decorationThickness);
  }

  static TextStyle fontFamilyFallback(List<String> fontFamilyFallback) {
    return TextStyle(fontFamilyFallback: fontFamilyFallback);
  }
}

@Deprecated('Use style.merge(otherStyle), instead')
const apply = SpreadPositionalParams(HelperUtility.apply);

@Deprecated(kShortAliasDeprecation)
const p = padding;

@Deprecated(kShortAliasDeprecation)
const pt = paddingTop;

@Deprecated(kShortAliasDeprecation)
const pb = paddingBottom;

@Deprecated(kShortAliasDeprecation)
const pr = paddingRight;

@Deprecated(kShortAliasDeprecation)
const pl = paddingLeft;

@Deprecated(kShortAliasDeprecation)
const ps = paddingStart;

@Deprecated(kShortAliasDeprecation)
const pe = paddingEnd;

@Deprecated(kShortAliasDeprecation)
const px = paddingHorizontal;

@Deprecated(kShortAliasDeprecation)
const py = paddingVertical;

@Deprecated(kShortAliasDeprecation)
const pi = paddingInsets;

@Deprecated(kShortAliasDeprecation)
const m = margin;
@Deprecated(kShortAliasDeprecation)
const mt = marginTop;
@Deprecated(kShortAliasDeprecation)
const mb = marginBottom;
@Deprecated(kShortAliasDeprecation)
const mr = marginRight;
@Deprecated(kShortAliasDeprecation)
const ml = marginLeft;
@Deprecated(kShortAliasDeprecation)
const ms = marginStart;
@Deprecated(kShortAliasDeprecation)
const me = marginEnd;
@Deprecated(kShortAliasDeprecation)
const mx = marginHorizontal;
@Deprecated(kShortAliasDeprecation)
const my = marginVertical;
@Deprecated(kShortAliasDeprecation)
const mi = marginInsets;

@Deprecated(kShortAliasDeprecation)
const marginX = marginHorizontal;

@Deprecated(kShortAliasDeprecation)
const marginY = marginVertical;

@Deprecated(kShortAliasDeprecation)
const r = rounded;

@Deprecated(kShortAliasDeprecation)
const roundedH = roundedHorizontal;

@Deprecated(kShortAliasDeprecation)
const roundedV = roundedVertical;

@Deprecated(kShortAliasDeprecation)
dynamic get roundedDH => UnimplementedError();

@Deprecated(kShortAliasDeprecation)
final roundedTL = roundedTopLeft;

@Deprecated(kShortAliasDeprecation)
BorderRadiusGeometryAttribute roundedTR() {
  throw UnimplementedError();
}

@Deprecated(kShortAliasDeprecation)
BorderRadiusGeometryAttribute roundedBL() {
  throw UnimplementedError();
}

@Deprecated(kShortAliasDeprecation)
BorderRadiusGeometryAttribute roundedBR() {
  throw UnimplementedError();
}

@Deprecated(kShortAliasDeprecation)
BorderRadiusGeometryAttribute roundedTS() {
  throw UnimplementedError();
}

@Deprecated(kShortAliasDeprecation)
BorderRadiusGeometryAttribute roundedTE() {
  throw UnimplementedError();
}

@Deprecated(kShortAliasDeprecation)
BorderRadiusGeometryAttribute roundedBS() {
  throw UnimplementedError();
}

@Deprecated(kShortAliasDeprecation)
BorderRadiusGeometryAttribute roundedBE() {
  throw UnimplementedError();
}

@Deprecated(kShortAliasDeprecation)
const bgColor = backgroundColor;

@Deprecated(kShortAliasDeprecation)
const h = height;

@Deprecated(kShortAliasDeprecation)
const w = width;

@Deprecated(kShortAliasDeprecation)
const maxH = maxHeight;

@Deprecated(kShortAliasDeprecation)
const maxW = maxWidth;

@Deprecated(kShortAliasDeprecation)
const minH = minHeight;

@Deprecated(kShortAliasDeprecation)
const minW = minWidth;

@Deprecated(kShortAliasDeprecation)
const bt = borderTop;

@Deprecated(kShortAliasDeprecation)
const bb = borderBottom;

@Deprecated(kShortAliasDeprecation)
const bl = borderLeft;

@Deprecated(kShortAliasDeprecation)
const br = borderRight;

@Deprecated(kShortAliasDeprecation)
const bs = borderStart;

@Deprecated(kShortAliasDeprecation)
const be = borderEnd;

@Deprecated('Use alignment instead')
const align = alignment;

@Deprecated('Use stack instead')
AlignmentGeometryAttribute zAligmnent(Alignment alignment) {
  return AlignmentGeometryAttribute(alignment.toDto);
}

@Deprecated('Use stack instead')
StackFitAttribute zFit(StackFit fit) {
  return StackFitAttribute(fit);
}

@Deprecated('Use stack instead')
ClipAttribute zClip(Clip clip) {
  return ClipAttribute(clip);
}
