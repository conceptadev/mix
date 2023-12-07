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

extension WithSpaceTokensExt<T extends StyleAttribute>
    on SpacingSideUtility<T> {
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
FlexSpecAttribute mainAxis(MainAxisAlignment mainAxisAlignment) {
  return FlexSpecAttribute(mainAxisAlignment: mainAxisAlignment);
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
final font = text.style;

@Deprecated(
  'Use text.style(shadows: shadows) or text.style.shadows(shadows) instead',
)
TextSpecAttribute textShadow(List<Shadow> shadows) {
  return text.style(shadows: shadows);
}

@Deprecated('Use text.style(shadow: shadow) instead')
const fontWeight = LegacyTextStyleUtility.fontWeight;

@Deprecated('Use text.style(letterSpacing: letterSpacing) instead')
const letterSpacing = LegacyTextStyleUtility.letterSpacing;

@Deprecated('Use text.style(debugLabel: debugLabel) instead')
const debugLabel = LegacyTextStyleUtility.debugLabel;

@Deprecated('Use text.style(height: height) instead')
const textHeight = LegacyTextStyleUtility.textHeight;

@Deprecated('Use text.style(wordSpacing: wordSpacing) instead')
const wordSpacing = LegacyTextStyleUtility.wordSpacing;

@Deprecated('Use text.style(fontStyle: fontStyle) instead')
const fontStyle = LegacyTextStyleUtility.fontStyle;

@Deprecated('Use text.style(fontSize: fontSize) instead')
const fontSize = LegacyTextStyleUtility.fontSize;

@Deprecated('Use text.style(inherit: inherit) instead')
const inherit = LegacyTextStyleUtility.inherit;

@Deprecated('Use text.style(color: color) instead')
const textColor = LegacyTextStyleUtility.textColor;

@Deprecated('Use text.style(backgroundColor: backgroundColor) instead')
const textBgColor = LegacyTextStyleUtility.textBgColor;

@Deprecated('Use text.style(foreground: foreground) instead')
const textForeground = LegacyTextStyleUtility.textForeground;

@Deprecated('Use text.style(background: background) instead')
const textBackground = LegacyTextStyleUtility.textBackground;

@Deprecated('Use text.style(shadows: shadows) instead')
const textShadows = LegacyTextStyleUtility.textShadow;

@Deprecated('Use text.style(fontFeatures: fontFeatures) instead')
const fontFeatures = LegacyTextStyleUtility.fontFeatures;

@Deprecated('Use text.style(decoration: decoration) instead')
const textDecoration = LegacyTextStyleUtility.textDecoration;

@Deprecated('Use text.style(decorationColor: decorationColor) instead')
const textDecorationColor = LegacyTextStyleUtility.textDecorationColor;

@Deprecated('Use text.style(decorationStyle: decorationStyle) instead')
const textDecorationStyle = LegacyTextStyleUtility.textDecorationStyle;

@Deprecated('Use text.style(decorationThickness: decorationThickness) instead')
const textDecorationThickness = LegacyTextStyleUtility.textDecorationThickness;

@Deprecated('Use text.style(fontFamilyFallback: fontFamilyFallback) instead')
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
final p = box.padding;

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
final pi = box.padding.as;

@Deprecated(kShortAliasDeprecation)
final m = box.margin;
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

@Deprecated('Use box.border.radius instead')
final rounded = box.border.radius;

@Deprecated('Use box.border.radius instead')
final r = box.border.radius;

@Deprecated('Use box.border.radius.horizontal instead')
dynamic get roundedH => UnimplementedError();

@Deprecated('use box.border.radius.vertical instead')
dynamic get roundedV => UnimplementedError();

@Deprecated(kShortAliasDeprecation)
dynamic get roundedDH => UnimplementedError();

@Deprecated(kShortAliasDeprecation)
final roundedTL = box.border.radius.topLeft;

@Deprecated(kShortAliasDeprecation)
final roundedTR = box.border.radius.topRight;

@Deprecated(kShortAliasDeprecation)
final roundedBL = box.border.radius.bottomLeft;

@Deprecated(kShortAliasDeprecation)
final roundedBR = box.border.radius.bottomRight;

@Deprecated(kShortAliasDeprecation)
final roundedTS = box.border.radius.topStart;

@Deprecated(kShortAliasDeprecation)
final roundedTE = box.border.radius.topEnd;

@Deprecated(kShortAliasDeprecation)
final roundedBS = box.border.radius.bottomStart;

@Deprecated(kShortAliasDeprecation)
final roundedBE = box.border.radius.bottomEnd;

@Deprecated(kShortAliasDeprecation)
final h = box.height;

@Deprecated('Use box.height instead')
final height = box.height;

@Deprecated(kShortAliasDeprecation)
final w = box.width;

@Deprecated('Use box.width instead')
final width = box.width;

@Deprecated(kShortAliasDeprecation)
final maxH = box.maxWidth;

@Deprecated('Use box.maxHeight instead')
final maxHeight = box.maxHeight;

@Deprecated(kShortAliasDeprecation)
final maxW = maxWidth;

@Deprecated('Use box.maxWidth instead')
final maxWidth = box.maxWidth;

@Deprecated(kShortAliasDeprecation)
final minH = box.minHeight;

@Deprecated('Use box.minHeight instead')
final minHeight = box.minHeight;

@Deprecated(kShortAliasDeprecation)
final minW = box.minWidth;

@Deprecated('Use box.minWidth instead')
final minWidth = box.minWidth;

@Deprecated(kShortAliasDeprecation)
final bt = box.border.top;

@Deprecated(kShortAliasDeprecation)
final bb = box.border.bottom;

@Deprecated(kShortAliasDeprecation)
final bl = box.border.left;

@Deprecated(kShortAliasDeprecation)
final br = box.border.right;

@Deprecated(kShortAliasDeprecation)
final bs = box.border.start;

@Deprecated(kShortAliasDeprecation)
final be = box.border.end;

@Deprecated('Use box.alignment instead')
final align = box.alignment;

@Deprecated('Use box.alignment instead')
final alignment = box.alignment;

@Deprecated('Use stack instead')
ContainerSpecAttribute zAligmnent(Alignment alignment) {
  return box.alignment(alignment);
}

@Deprecated('Use stackFit instead')
StackSpecAttribute zFit(StackFit fit) {
  return StackSpecAttribute(fit: fit);
}

@Deprecated('Use stack instead')
StackSpecAttribute zClip(Clip clip) {
  return StackSpecAttribute(clipBehavior: clip);
}

// Create a FlexAttributes for the direction axis.
@Deprecated('Use axis() instead')
FlexSpecAttribute directionAxis(Axis axis) {
  return FlexSpecAttribute(direction: axis);
}

// Create a FlexAttributes for the cross axis.
@Deprecated('Use crossAxisAlignment() instead')
FlexSpecAttribute crossAxis(CrossAxisAlignment crossAxisAlignment) {
  return FlexSpecAttribute(crossAxisAlignment: crossAxisAlignment);
}

@Deprecated('Use textDirective(directive)')
TextSpecAttribute directives(List<TextDirective> directives) {
  return TextSpecAttribute(directives: directives);
}

@Deprecated('Use textDirective(directive)')
TextSpecAttribute directive(TextDirective directive) {
  return TextSpecAttribute(directives: [directive]);
}

@Deprecated('Locale is now passed to StyledText widget')
TextStyleAttribute locale() {
  throw UnimplementedError();
}

@Deprecated('Use text(overflow: overflow)')
TextSpecAttribute overflow(TextOverflow overflow) {
  return TextSpecAttribute(overflow: overflow);
}

@Deprecated('Use box.margin instead')
final margin = box.margin;

@Deprecated('use box.margin.only instead')
final marginOnly = box.margin.only;

@Deprecated('use box.margin.only instead')
final marginDirectionalOnly = box.margin.only;

@Deprecated('use box.margin.all instead')
final marginAll = box.margin.all;

@Deprecated('use box.margin.top instead')
final marginTop = box.margin.top;

@Deprecated('use box.margin.bottom instead')
final marginBottom = box.margin.bottom;

@Deprecated('use box.margin.left instead')
final marginLeft = box.margin.left;

@Deprecated('use box.margin.right instead')
final marginRight = box.margin.right;

@Deprecated('use box.margin.start instead')
final marginStart = box.margin.start;

@Deprecated('use box.margin.end instead')
final marginEnd = box.margin.end;

@Deprecated('use box.margin.horizontal instead')
final marginHorizontal = box.margin.horizontal;

@Deprecated('use box.margin.vertical instead')
final marginVertical = box.margin.vertical;

@Deprecated('use box.margin.as instead')
final marginFrom = box.margin.as;

@Deprecated('use box.padding instead')
final padding = box.padding;

@Deprecated('use box.padding.only instead')
final paddingOnly = box.padding.only;

@Deprecated('use box.padding.only instead')
final paddingDirectionalOnly = box.padding.only;

@Deprecated('use box.padding.all instead')
final paddingAll = box.padding.all;

@Deprecated('use box.padding.top instead')
final paddingTop = box.padding.top;

@Deprecated('use box.padding.bottom instead')
final paddingBottom = box.padding.bottom;

@Deprecated('use box.padding.left instead')
final paddingLeft = box.padding.left;

@Deprecated('use box.padding.right instead')
final paddingRight = box.padding.right;

@Deprecated('use box.padding.start instead')
final paddingStart = box.padding.start;

@Deprecated('use box.padding.end instead')
final paddingEnd = box.padding.end;

@Deprecated('use box.padding.horizontal instead')
final paddingHorizontal = box.padding.horizontal;

@Deprecated('use box.padding.vertical instead')
final paddingVertical = box.padding.vertical;

@Deprecated('use box.margin.as instead')
final paddingFrom = box.padding.as;

@Deprecated('Use box.border')
final border = box.border;

@Deprecated('use box.border.top instead')
final borderTop = box.border.top;

@Deprecated('use box.border.bottom instead')
final borderBottom = box.border.bottom;

@Deprecated('use box.border.left instead')
final borderLeft = box.border.left;

@Deprecated('use box.border.right instead')
final borderRight = box.border.right;

@Deprecated('use box.border.start instead')
final borderStart = box.border.start;

@Deprecated('use box.border.end instead')
final borderEnd = box.border.end;

@Deprecated('use box.border.horizontal instead')
final borderHorizontal = box.border.horizontal;

@Deprecated('use box.border.vertical instead')
final borderVertical = box.border.vertical;

@Deprecated('use box.border.all instead')
final borderAll = box.border.all;

@Deprecated('Use StyledText now')
typedef TextMix = StyledText;

@Deprecated('Use text.style instead')
final textStyle = text.style;

@Deprecated('Use text.style.shadow instead')
final shadow = text.style.shadow;

@Deprecated('use box.color instead')
final bgColor = box.decoration.box.color;

@Deprecated('use box.color instead')
final backgroundColor = box.decoration.box.color;

// do no tuse main axisaligmnet use flex.mainAxisAlignment instead
@Deprecated(
  'use flex(mainAxisAlignment:value) instead or flex.mainAxisAlignment',
)
FlexSpecAttribute mainAxisAlignment(MainAxisAlignment mainAxisAlignment) {
  return FlexSpecAttribute(mainAxisAlignment: mainAxisAlignment);
}

@Deprecated(
  'use flex(crossAxisAlignment:value) instead or flex.crossAxisAlignment',
)
FlexSpecAttribute crossAlignment(CrossAxisAlignment crossAxisAlignment) {
  return FlexSpecAttribute(crossAxisAlignment: crossAxisAlignment);
}

@Deprecated('use flex(mainAxisSize:value) instead or flex.mainAxisSize')
FlexSpecAttribute mainAxisSize(MainAxisSize mainAxisSize) {
  return flex(mainAxisSize: mainAxisSize);
}

@Deprecated('use text.style.bold() instead')
TextSpecAttribute bold() {
  return TextSpecAttribute(
    style: TextStyleDto.only(fontWeight: FontWeight.bold),
  );
}

@Deprecated('use box.border.radius')
final borderRadius = box.border.radius;

@Deprecated('use box.elevation instead')
final elevation = box.elevation;

@Deprecated('use box.clipBehavior instead')
final clipBehavior = box.clipBehavior;
