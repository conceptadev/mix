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
final fontWeight = text.style.fontWeight;

@Deprecated('Use text.style(letterSpacing: letterSpacing) instead')
final letterSpacing = text.style.letterSpacing;

@Deprecated('Use text.style(debugLabel: debugLabel) instead')
final debugLabel = text.style.debugLabel;

@Deprecated('Use text.style(height: height) instead')
final textHeight = text.style.height;

@Deprecated('Use text.style(wordSpacing: wordSpacing) instead')
final wordSpacing = text.style.wordSpacing;

@Deprecated('Use text.style(fontStyle: fontStyle) instead')
final fontStyle = text.style.fontStyle;

@Deprecated('Use text.style(fontSize: fontSize) instead')
final fontSize = text.style.fontSize;

@Deprecated('Use text.style(color: color) instead')
final textColor = text.style.color;

@Deprecated('Use text.style(backgroundColor: backgroundColor) instead')
final textBgColor = text.style.backgroundColor;

@Deprecated('Use text.style(foreground: foreground) instead')
final textForeground = text.style.foreground;

@Deprecated('Use text.style(background: background) instead')
final textBackground = text.style.background;

@Deprecated('Use text.style(shadows: shadows) instead')
final textShadows = text.style.shadows;

@Deprecated('Use text.style(fontFeatures: fontFeatures) instead')
final fontFeatures = text.style.fontFeatures;

@Deprecated('Use text.style(decoration: decoration) instead')
final textDecoration = text.style.decoration;

@Deprecated('Use text.style(decorationColor: decorationColor) instead')
final textDecorationColor = text.style.decorationColor;

@Deprecated('Use text.style(decorationStyle: decorationStyle) instead')
final textDecorationStyle = text.style.decorationStyle;

@Deprecated('Use text.style(decorationThickness: decorationThickness) instead')
final textDecorationThickness = text.style.decorationThickness;

@Deprecated('Use text.style(fontFamilyFallback: fontFamilyFallback) instead')
final fontFamilyFallback = text.style.fontFamilyFallback;

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

@Deprecated(kShortAliasDeprecation)
final w = box.width;

@Deprecated(kShortAliasDeprecation)
final maxH = box.maxWidth;

@Deprecated(kShortAliasDeprecation)
final maxW = maxWidth;

@Deprecated(kShortAliasDeprecation)
final minH = box.minHeight;

@Deprecated(kShortAliasDeprecation)
final minW = box.minWidth;

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

@Deprecated('Use stack instead')
final zAlignment = stack.alignment;

@Deprecated('Use stackFit instead')
final zFit = stack.fit;

@Deprecated('Use stac.clipBehavior instead')
final zClip = stack.clipBehavior;

// Create a FlexAttributes for the direction axis.
@Deprecated('Use flex.direction instead')
final directionAxis = flex.direction;

// Create a FlexAttributes for the cross axis.
@Deprecated('Use flex.crossAxisAlignment instead')
final crossAxis = flex.crossAxisAlignment;

@Deprecated('Use text.directive')
final directives = text.directive;

@Deprecated('Use text.directive')
final directive = text.directive;

@Deprecated('Locale is now passed to StyledText widget')
final locale = text.style.locale;

@Deprecated('Use text(overflow: overflow)')
final overflow = text.overflow;

@Deprecated('use box.margin.only instead')
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

@Deprecated('use margin.as instead')
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

@Deprecated('use padding.as instead')
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

@Deprecated('Use text.style instead')
final textStyle = text.style;

@Deprecated('Use text.style.shadow instead')
final shadow = text.style.shadow;

@Deprecated('use box.color instead')
final bgColor = box.decoration.color;

// do no tuse main axisaligmnet use flex.mainAxisAlignment instead
@Deprecated(
  'use flex(mainAxisAlignment:value) instead or flex.mainAxisAlignment',
)
final mainAxisAlignment = flex.mainAxisAlignment;

@Deprecated(
  'use flex(crossAxisAlignment:value) instead or flex.crossAxisAlignment',
)
final crossAxisAlignment = flex.crossAxisAlignment;

@Deprecated('use flex(mainAxisSize:value) instead or flex.mainAxisSize')
final mainAxisSize = flex.mainAxisSize;

@Deprecated('use text.style.bold() instead')
final bold = text.style.bold;

// @Deprecated('Use box.maxHeight instead')
// final maxHeight = box.maxHeight;

// @Deprecated('use box.padding instead')
// final padding = box.padding;

// @Deprecated('Use box.margin instead')
// final margin = box.margin;

// @Deprecated('Use box.border')
// final border = box.border;

// @Deprecated('use box.border.radius')
// final borderRadius = box.border.radius;

// @Deprecated('use box.elevation instead')
// final elevation = box.elevation;

// @Deprecated('use box.clipBehavior instead')
// final clipBehavior = box.clipBehavior;

// @Deprecated('Use box.height instead')
// final height = box.height;

// @Deprecated('Use box.width instead')
// final width = box.width;

// @Deprecated('Use box.maxWidth instead')
// final maxWidth = box.maxWidth;
// @Deprecated('Use box.minHeight instead')
// final minHeight = box.minHeight;
// @Deprecated('Use box.minWidth instead')
// final minWidth = box.minWidth;
// @Deprecated('Use box.alignment instead')
// final alignment = box.alignment;

// @Deprecated('use box.color instead')
// final backgroundColor = box.decoration.color;