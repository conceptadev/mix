import 'dart:ui';

import 'package:flutter/material.dart';

import 'attributes/alignment_attribute.dart';
import 'attributes/attribute.dart';
import 'attributes/border/border_radius_attribute.dart';
import 'attributes/scalar_attribute.dart';
import 'attributes/style_mix_attribute.dart';
import 'attributes/text_style_attribute.dart';
import 'core/constants.dart';
import 'directives/text_directive.dart';
import 'factory/mix_provider_data.dart';
import 'factory/style_mix.dart';
import 'helpers/extensions/values_ext.dart';
import 'theme/tokens/space_token.dart';
import 'utils/alignment_util.dart';
import 'utils/border_radius_util.dart';
import 'utils/border_util.dart';
import 'utils/box_constraints_util.dart';
import 'utils/context_variant_util.dart';
import 'utils/decoration_util.dart';
import 'utils/decorators_util.dart';
import 'utils/helper_util.dart';
import 'utils/pressable_util.dart';
import 'utils/scalar_util.dart';
import 'utils/space_util.dart';
import 'utils/text_util.dart';
import 'variants/variant.dart';

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

extension WithSpaceTokensExt<T> on UtilityWithSpaceTokens<T> {
  @Deprecated('Use xsmall instead')
  T get xs => this.xsmall;
  @Deprecated('Use small instead')
  T get sm => this.small;
  @Deprecated('Use medium instead')
  T get md => this.medium;
  @Deprecated('Use large instead')
  T get lg => this.large;
  @Deprecated('Use xlarge instead')
  T get xl => xlarge;
  @Deprecated('Use xxlarge instead')
  T get xxl => xxlarge;
}

@Deprecated('Use mainAxisAlignment instead')
const mainAxis = mainAxisAlignment;

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

@Deprecated('Use flexible or expanded')
const flex = flexible;

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
final p = padding;

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
const pi = paddingFrom;

@Deprecated(kShortAliasDeprecation)
final m = margin;
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
const mi = marginFrom;

@Deprecated(kShortAliasDeprecation)
final marginX = marginHorizontal;

@Deprecated(kShortAliasDeprecation)
final marginY = marginVertical;

@Deprecated(kShortAliasDeprecation)
const r = rounded;

@Deprecated(kShortAliasDeprecation)
const roundedH = roundedHorizontal;

@Deprecated(kShortAliasDeprecation)
const roundedV = roundedVertical;

@Deprecated(kShortAliasDeprecation)
dynamic get roundedDH => UnimplementedError();

@Deprecated(kShortAliasDeprecation)
const roundedTL = roundedTopLeft;

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
  return alignment.toAttribute();
}

@Deprecated('Use stackFit instead')
StackFitAttribute zFit(StackFit fit) {
  return stackFit(fit);
}

@Deprecated('Use stack instead')
ClipAttribute zClip(Clip clip) {
  return ClipAttribute(clip);
}

// Create a FlexAttributes for the direction axis.
@Deprecated('Use axis() instead')
AxisAttribute direction(Axis direction) {
  return AxisAttribute(direction);
}

// Create a FlexAttributes for the cross axis.
@Deprecated('Use crossAxisAlignment() instead')
CrossAxisAlignmentAttribute crossAxis(CrossAxisAlignment crossAxisAlignment) {
  return CrossAxisAlignmentAttribute(crossAxisAlignment);
}

@Deprecated('Use textDirective(directive)')
TextDirectiveAttribute directives(List<TextDirective> directives) {
  return TextDirectiveAttribute(directives);
}

@Deprecated('Use textDirective(directive)')
TextDirectiveAttribute directive(TextDirective directive) {
  return TextDirectiveAttribute([directive]);
}

@Deprecated('Locale is now passed to StyledText widget')
TextStyleAttribute locale() {
  throw UnimplementedError();
}

@Deprecated('Use text(overflow: overflow)')
TextOverflowAttribute overflow(TextOverflow overflow) {
  return TextOverflowAttribute(overflow);
}
