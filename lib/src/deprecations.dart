import 'dart:ui';

import 'package:flutter/material.dart';

import '../mix.dart';

const kShortAliasDeprecation =
    'Short aliases will be deprecated, you can create your own. Example: final p = padding;';

extension DeprecatedMixExtension<T extends Attribute> on StyleMix {
  /// Adds an Attribute to a Mix.
  @Deprecated('Simplifying the mix API to avoid confusion. Use apply instead')
  SpreadFunctionParams<T, StyleMix> get mix {
    return SpreadFunctionParams(addAttributes);
  }

  @Deprecated('Use selectVariants now')
  StyleMix withVariants(List<Variant> variants) {
    return withManyVariants(variants);
  }

  @Deprecated(
    'Use merge() or mergeMany() now. You might have to turn into a Mix first. firstMixFactory.merge(secondMix)',
  )
  StyleMix addAttributes(Iterable<Attribute> attributes) {
    return merge(StyleMix.create(attributes));
  }

  @Deprecated('Use selectVariants now')
  StyleMix withManyVariants(Iterable<Variant> variants) {
    return selectVariantList(variants);
  }

  @Deprecated('Use merge() or mergeMany() instead')
  SpreadFunctionParams<StyleMix, StyleMix> get apply =>
      const SpreadFunctionParams(StyleMix.combineList);

  @Deprecated('Use selectVariant now')
  StyleMix withVariant(Variant variant) {
    return selectVariant(variant);
  }

  @Deprecated('Use combine now')
  StyleMix combineAll(List<StyleMix> mixes) {
    return StyleMix.combineList(mixes);
  }

  @Deprecated('Use selectVariant now')
  StyleMix withMaybeVariant(Variant? variant) {
    if (variant == null) return this;

    return withVariant(variant);
  }

  @Deprecated('Use mergeNullable instead')
  StyleMix maybeApply(StyleMix? mix) {
    if (mix == null) return this;

    return apply(mix);
  }

  @Deprecated('Use applyNullable instead')
  StyleMix applyMaybe(StyleMix? mix) {
    return maybeApply(mix);
  }
}

/// This refers to the deprecated class MixData and it's here for the purpose of maintaining compatibility.
@Deprecated('Use MixData instead.')
typedef MixContext = MixData;

extension WithSpaceTokensExt<T> on SpacingSideUtility<T> {
  @Deprecated('Use xsmall instead')
  T get xs => this.xsmall();
  @Deprecated('Use small instead')
  T get sm => this.small();
  @Deprecated('Use medium instead')
  T get md => this.medium();
  @Deprecated('Use large instead')
  T get lg => this.large();
  @Deprecated('Use xlarge instead')
  T get xl => xlarge();
  @Deprecated('Use xxlarge instead')
  T get xxl => xxlarge();
}

@Deprecated('Use mainAxisAlignment instead')
FlexMixAttribute mainAxis(MainAxisAlignment mainAxisAlignment) {
  return FlexMixAttribute(mainAxisAlignment: mainAxisAlignment);
}

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
TextStyleAttribute textShadow(List<Shadow> textShadow) {
  return textStyle(shadows: textShadow);
}

@Deprecated('Use textStyle(textShadow: textShadow) instead')
const fontWeight = LegacyTextStyleUtility.fontWeight;

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
const apply = SpreadFunctionParams(_apply);

StyleMixAttribute _apply(Iterable<StyleMix> mixes) {
  return StyleMixAttribute(StyleMix.combineList(mixes));
}

@Deprecated(kShortAliasDeprecation)
const p = padding;

@Deprecated(kShortAliasDeprecation)
final pt = paddingTop;

@Deprecated(kShortAliasDeprecation)
final pb = paddingBottom;

@Deprecated(kShortAliasDeprecation)
final pr = paddingRight;

@Deprecated(kShortAliasDeprecation)
final pl = paddingLeft;

@Deprecated(kShortAliasDeprecation)
final ps = paddingStart;

@Deprecated(kShortAliasDeprecation)
final pe = paddingEnd;

@Deprecated(kShortAliasDeprecation)
final px = paddingHorizontal;

@Deprecated(kShortAliasDeprecation)
final py = paddingVertical;

@Deprecated(kShortAliasDeprecation)
final pi = padding.as;

@Deprecated(kShortAliasDeprecation)
const m = margin;
@Deprecated(kShortAliasDeprecation)
final mt = marginTop;
@Deprecated(kShortAliasDeprecation)
final mb = marginBottom;
@Deprecated(kShortAliasDeprecation)
final mr = marginRight;
@Deprecated(kShortAliasDeprecation)
final ml = marginLeft;
@Deprecated(kShortAliasDeprecation)
final ms = marginStart;
@Deprecated(kShortAliasDeprecation)
final me = marginEnd;
@Deprecated(kShortAliasDeprecation)
final mx = marginHorizontal;
@Deprecated(kShortAliasDeprecation)
final my = marginVertical;
@Deprecated(kShortAliasDeprecation)
final mi = margin.as;

@Deprecated(kShortAliasDeprecation)
final marginX = marginHorizontal;

@Deprecated(kShortAliasDeprecation)
final marginY = marginVertical;

@Deprecated('Use borderRadius instead')
const rounded = borderRadius;

@Deprecated('Use borderRadius instead')
const r = borderRadius;

@Deprecated('Use borderRadius.horizontal instead')
dynamic get roundedH => UnimplementedError();

@Deprecated('use borderRadius.vertical instead')
dynamic get roundedV => UnimplementedError();

@Deprecated(kShortAliasDeprecation)
dynamic get roundedDH => UnimplementedError();

@Deprecated(kShortAliasDeprecation)
final roundedTL = borderRadius.topLeft;

@Deprecated(kShortAliasDeprecation)
BorderRadiusGeometryAttribute roundedTR() {
  throw UnimplementedError();
}

@Deprecated(kShortAliasDeprecation)
BorderRadiusAttribute roundedBL() {
  throw UnimplementedError();
}

@Deprecated(kShortAliasDeprecation)
BorderRadiusAttribute roundedBR() {
  throw UnimplementedError();
}

@Deprecated(kShortAliasDeprecation)
BorderRadiusDirectionalAttribute roundedTS() {
  throw UnimplementedError();
}

@Deprecated(kShortAliasDeprecation)
BorderRadiusDirectionalAttribute roundedTE() {
  throw UnimplementedError();
}

@Deprecated(kShortAliasDeprecation)
BorderRadiusDirectionalAttribute roundedBS() {
  throw UnimplementedError();
}

@Deprecated(kShortAliasDeprecation)
BorderRadiusDirectionalAttribute roundedBE() {
  throw UnimplementedError();
}

@Deprecated(kShortAliasDeprecation)
final h = height;

@Deprecated(kShortAliasDeprecation)
final w = width;

@Deprecated(kShortAliasDeprecation)
final maxH = maxHeight;

@Deprecated(kShortAliasDeprecation)
final maxW = maxWidth;

@Deprecated(kShortAliasDeprecation)
final minH = minHeight;

@Deprecated(kShortAliasDeprecation)
final minW = minWidth;

@Deprecated(kShortAliasDeprecation)
final bt = border.top;

@Deprecated(kShortAliasDeprecation)
final bb = border.bottom;

@Deprecated(kShortAliasDeprecation)
final bl = border.left;

@Deprecated(kShortAliasDeprecation)
final br = border.right;

@Deprecated(kShortAliasDeprecation)
final bs = border.start;

@Deprecated(kShortAliasDeprecation)
final be = border.end;

@Deprecated('Use alignment instead')
const align = alignment;

@Deprecated('Use stack instead')
AlignmentGeometryAttribute zAligmnent(Alignment alignment) {
  return alignment.toAttribute();
}

@Deprecated('Use stackFit instead')
StackMixAttribute zFit(StackFit fit) {
  return StackMixAttribute(fit: fit.toAttribute());
}

@Deprecated('Use stack instead')
StackMixAttribute zClip(Clip clip) {
  return StackMixAttribute(clipBehavior: clip.toAttribute());
}

// Create a FlexAttributes for the direction axis.
@Deprecated('Use axis() instead')
AxisAttribute direction(Axis direction) {
  return AxisAttribute(direction);
}

// Create a FlexAttributes for the cross axis.
@Deprecated('Use crossAxisAlignment() instead')
FlexMixAttribute crossAxis(CrossAxisAlignment crossAxisAlignment) {
  return FlexMixAttribute(crossAxisAlignment: crossAxisAlignment);
}

@Deprecated('Use textDirective(directive)')
TextMixAttribute directives(List<TextDirective> directives) {
  return TextMixAttribute(directives: directives);
}

@Deprecated('Use textDirective(directive)')
TextMixAttribute directive(TextDirective directive) {
  return TextMixAttribute(directives: [directive]);
}

@Deprecated('Locale is now passed to StyledText widget')
TextStyleAttribute locale() {
  throw UnimplementedError();
}

@Deprecated('Use text(overflow: overflow)')
TextMixAttribute overflow(TextOverflow overflow) {
  return TextMixAttribute(overflow: overflow);
}

@Deprecated('use margin.only instead')
final marginOnly = margin.only;

@Deprecated('use margin.only instead')
final marginDirectionalOnly = margin.only;

@Deprecated('use margin.all instead')
final marginAll = margin.all;

@Deprecated('use margin.top instead')
final marginTop = margin.top;

@Deprecated('use margin.bottom instead')
final marginBottom = margin.bottom;

@Deprecated('use margin.left instead')
final marginLeft = margin.left;

@Deprecated('use margin.right instead')
final marginRight = margin.right;

@Deprecated('use margin.start instead')
final marginStart = margin.start;

@Deprecated('use margin.end instead')
final marginEnd = margin.end;

@Deprecated('use margin.horizontal instead')
final marginHorizontal = margin.horizontal;

@Deprecated('use margin.vertical instead')
final marginVertical = margin.vertical;

@Deprecated('use marginFrom instead')
final marginFrom = margin.as;

@Deprecated('use padding.only instead')
final paddingOnly = padding.only;

@Deprecated('use padding.only instead')
final paddingDirectionalOnly = padding.only;

@Deprecated('use padding.all instead')
final paddingAll = padding.all;

@Deprecated('use padding.top instead')
final paddingTop = padding.top;

@Deprecated('use padding.bottom instead')
final paddingBottom = padding.bottom;

@Deprecated('use padding.left instead')
final paddingLeft = padding.left;

@Deprecated('use padding.right instead')
final paddingRight = padding.right;

@Deprecated('use padding.start instead')
final paddingStart = padding.start;

@Deprecated('use padding.end instead')
final paddingEnd = padding.end;

@Deprecated('use padding.horizontal instead')
final paddingHorizontal = padding.horizontal;

@Deprecated('use padding.vertical instead')
final paddingVertical = padding.vertical;

@Deprecated('use paddingFrom instead')
final paddingFrom = padding.as;

@Deprecated('use border.top instead')
final borderTop = border.top;

@Deprecated('use border.bottom instead')
final borderBottom = border.bottom;

@Deprecated('use border.left instead')
final borderLeft = border.left;

@Deprecated('use border.right instead')
final borderRight = border.right;

@Deprecated('use border.start instead')
final borderStart = border.start;

@Deprecated('use border.end instead')
final borderEnd = border.end;

@Deprecated('use border.horizontal instead')
final borderHorizontal = border.horizontal;

@Deprecated('use border.vertical instead')
final borderVertical = border.vertical;

@Deprecated('use border.all instead')
final borderAll = border.all;

@Deprecated('Use StyledText now')
typedef TextMix = StyledText;
