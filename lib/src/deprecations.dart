// ignore_for_file: avoid-dynamic

import '../mix.dart';

const kShortAliasDeprecation =
    'Short aliases will be deprecated, you can create your own. Example: final p = padding;';

@Deprecated('Use Style instead')
typedef Mix = Style;

extension DeprecatedMixExtension<T extends Attribute> on Style {
  @Deprecated('Use applyVariant(value) instead')
  Style withVariants(List<Variant> variants) => withManyVariants(variants);

  @Deprecated('Use applyVariants(value) instead')
  Style withManyVariants(Iterable<Variant> variants) => applyVariants(variants);

  @Deprecated(
    'Use merge() instead. You might have to turn into a Mix first. firstMixFactory.merge(secondMix)',
  )
  Style addAttributes(Iterable<Attribute> attributes) =>
      merge(Style.create(attributes));

  @Deprecated('Use merge()  instead')
  SpreadFunctionParams<Style, Style> get apply =>
      const SpreadFunctionParams(Style.combine);

  @Deprecated('Use applyVariant(value) instead')
  Style withVariant(Variant value) => applyVariant(value);

  @Deprecated('Use combine instead')
  Style combineAll(List<Style> mixes) => Style.combine(mixes);

  @Deprecated('Use applyVariant(value) instead')
  Style withMaybeVariant(Variant? variant) {
    if (variant == null) return this;

    return applyVariant(variant);
  }

  @Deprecated('Use merge instead')
  Style maybeApply(Style? mix) {
    if (mix == null) return this;

    return Style.combine([mix]);
  }

  @Deprecated('Use merge instead')
  Style applyMaybe(Style? mix) => maybeApply(mix);
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

@Deprecated('use flex.mainAxisAlignment instead')
final mainAxis = flex.mainAxisAlignment;

@Deprecated('use flex.direction instead')
final directionAxis = flex.direction;

@Deprecated('use flex.crossAxisAlignment instead')
final crossAxis = flex.crossAxisAlignment;

@Deprecated('use flex.mainAxisAlignment instead')
final mainAxisAlignment = flex.mainAxisAlignment;

@Deprecated('use flex.crossAxisAlignment instead')
final crossAxisAlignment = flex.crossAxisAlignment;

@Deprecated('use flex.mainAxisSize instead')
final mainAxisSize = flex.mainAxisSize;

@Deprecated('use flex.gap instead')
final gap = flex.gap;

@Deprecated('use borderRadius instead')
final rounded = borderRadius;

// height
@Deprecated('use height instead')
final h = height;

@Deprecated('use width instead')
final w = width;

@Deprecated('use maxHeight instead')
final maxH = maxHeight;

@Deprecated('use maxWidth instead')
final maxW = maxWidth;

@Deprecated('use minHeight instead')
final minH = minHeight;

@Deprecated('use minWidth instead')
final minW = minWidth;

@Deprecated('Use border.top instead')
final bt = border.top;

@Deprecated('Use border.bottom instead')
final bb = border.bottom;

@Deprecated('Use border.left instead')
final bl = border.left;

@Deprecated('Use border.right instead')
final br = border.right;

@Deprecated('Use borderDirectional.start instead')
final bs = borderDirectional.start;

@Deprecated('Use borderDirectional.end instead')
final be = borderDirectional.end;

@Deprecated('Use alignment instead')
final align = alignment;

@Deprecated('Use backgroundColor instead')
final bgColor = backgroundColor;

@Deprecated('Use text.style instead')
final font = text.style;
@Deprecated('Use text.style.fontWeight instead')
final fontWeight = text.style.fontWeight;
@Deprecated('Use text.style.letterSpacing instead')
final letterSpacing = text.style.letterSpacing;
@Deprecated('Use text.style.debugLabel instead')
final debugLabel = text.style.debugLabel;
@Deprecated('Use text.style.height instead')
final textHeight = text.style.height;
@Deprecated('Use text.style.wordSpacing instead')
final wordSpacing = text.style.wordSpacing;
@Deprecated('Use text.style.fontStyle instead')
final fontStyle = text.style.fontStyle;
@Deprecated('Use text.style.fontSize instead')
final fontSize = text.style.fontSize;
@Deprecated('Use text.style.color instead')
final textColor = text.style.color;
@Deprecated('Use text.style.backgroundColor instead')
final textBgColor = text.style.backgroundColor;
@Deprecated('Use text.style.foreground instead')
final textForeground = text.style.foreground;
@Deprecated('Use text.style.background instead')
final textBackground = text.style.background;
@Deprecated('Use text.style.shadows instead')
final textShadows = text.style.shadows;
@Deprecated('Use text.style.fontFeatures instead')
final fontFeatures = text.style.fontFeatures;
@Deprecated('Use text.style.decoration instead')
final textDecoration = text.style.decoration;
@Deprecated('Use text.style.decorationColor instead')
final textDecorationColor = text.style.decorationColor;
@Deprecated('Use text.style.decorationStyle instead')
final textDecorationStyle = text.style.decorationStyle;
@Deprecated('Use text.style.decorationThickness instead')
final textDecorationThickness = text.style.decorationThickness;
@Deprecated('Use text.style.fontFamilyFallback instead')
final fontFamilyFallback = text.style.fontFamilyFallback;
@Deprecated('Use text.style.shadows instead')
final textShadow = text.style.shadows;
@Deprecated('Use text.overflow instead')
final overflow = text.overflow;
@Deprecated('Use text.style.bold instead')
final bold = text.style.bold;

@Deprecated('Use icon.size instead')
final iconSize = icon.size;
@Deprecated('Use icon.color instead')
final iconColor = icon.color;

@Deprecated('Use padding instead')
final p = padding;
@Deprecated('Use padding.top instead')
final pt = padding.top;
@Deprecated('Use padding.bottom instead')
final pb = padding.bottom;
@Deprecated('Use padding.right instead')
final pr = padding.right;
@Deprecated('Use padding.left instead')
final pl = padding.left;
@Deprecated('Use padding.start instead')
final ps = padding.start;
@Deprecated('Use padding.end instead')
final pe = padding.end;
@Deprecated('Use padding.horizontal instead')
final px = padding.horizontal;
@Deprecated('Use padding.vertical instead')
final py = padding.vertical;
@Deprecated('Use padding.as instead')
final pi = padding.as;

@Deprecated('Use margin instead')
final m = margin;
@Deprecated('Use margin.top instead')
final mt = margin.top;
@Deprecated('Use margin.bottom instead')
final mb = margin.bottom;
@Deprecated('Use margin.right instead')
final mr = margin.right;
@Deprecated('Use margin.left instead')
final ml = margin.left;
@Deprecated('Use margin.start instead')
final ms = margin.start;
@Deprecated('Use margin.end instead')
final me = margin.end;
@Deprecated('Use margin.horizontal instead')
final mx = margin.horizontal;
@Deprecated('Use margin.vertical instead')
final my = margin.vertical;
@Deprecated('Use margin.as instead')
final mi = margin.as;

@Deprecated('Use margin.top instead')
final marginTop = margin.top;
@Deprecated('Use margin.bottom instead')
final marginBottom = margin.bottom;
@Deprecated('Use margin.left instead')
final marginLeft = margin.left;
@Deprecated('Use margin.right instead')
final marginRight = margin.right;
@Deprecated('Use margin.start instead')
final marginStart = margin.start;
@Deprecated('Use margin.end instead')
final marginEnd = margin.end;
@Deprecated('Use margin.horizontal instead')
final marginHorizontal = margin.horizontal;
@Deprecated('Use margin.vertical instead')
final marginVertical = margin.vertical;
@Deprecated('Use margin.as instead')
final marginFrom = margin.as;
@Deprecated(kShortAliasDeprecation)
final marginX = marginHorizontal;
@Deprecated(kShortAliasDeprecation)
final marginY = marginVertical;
@Deprecated('use margin.only instead')
final marginOnly = margin.only;
@Deprecated('use margin.only instead')
final marginDirectionalOnly = margin.only;
@Deprecated('use margin.all instead')
final marginAll = margin.all;

@Deprecated('Use padding.top instead')
final paddingTop = padding.top;
@Deprecated('Use padding.bottom instead')
final paddingBottom = padding.bottom;
@Deprecated('Use padding.left instead')
final paddingLeft = padding.left;
@Deprecated('Use padding.right instead')
final paddingRight = padding.right;
@Deprecated('Use padding.start instead')
final paddingStart = padding.start;
@Deprecated('Use padding.end instead')
final paddingEnd = padding.end;
@Deprecated('Use padding.horizontal instead')
final paddingHorizontal = padding.horizontal;
@Deprecated('Use padding.vertical instead')
final paddingVertical = padding.vertical;
@Deprecated('Use padding.as instead')
final paddingFrom = padding.as;
@Deprecated('Use padding.horizontal instead')
final paddingX = padding.horizontal;
@Deprecated('Use padding.vertical instead')
final paddingY = padding.vertical;
@Deprecated('use padding.only instead')
final paddingOnly = padding.only;
@Deprecated('use padding.only instead')
final paddingDirectionalOnly = padding.only;
@Deprecated('use padding.all instead')
final paddingAll = padding.all;

@Deprecated('Use border.top instead')
final borderTop = border.top;
@Deprecated('Use border.bottom instead')
final borderBottom = border.bottom;
@Deprecated('Use border.left instead')
final borderLeft = border.left;
@Deprecated('Use border.right instead')
final borderRight = border.right;
@Deprecated('Use borderDirectional.start instead')
final borderStart = borderDirectional.start;
@Deprecated('Use borderDirectional.end instead')
final borderEnd = borderDirectional.end;
@Deprecated('Use border.horizontal instead')
final borderHorizontal = border.horizontal;
@Deprecated('Use border.vertical instead')
final borderVertical = border.vertical;
@Deprecated('Use border.all instead')
final borderAll = border.all;

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

@Deprecated('Use onFocused instead')
final focus = onFocused;

@Deprecated('Use onFocused instead')
final onFocus = onFocused;

@Deprecated('Use onPortrait instead')
final portrait = onPortrait;

@Deprecated('Use onLandscape instead')
final landscape = onLandscape;

@Deprecated('Use onDisabled instead')
final disabled = onDisabled;

@Deprecated('Use onEnabled instead')
final enabled = onEnabled;

@Deprecated('Use onPressed instead')
final press = onPressed;

@Deprecated('Use onPressed instead')
final onPress = onPressed;

@Deprecated('Use onNot instead')
const not = onNot;

@Deprecated('Use borderRadius instead')
final r = borderRadius;

@Deprecated('Use borderRadius.horizontal instead')
dynamic get roundedH => UnimplementedError();

@Deprecated('use borderRadius.vertical instead')
dynamic get roundedV => UnimplementedError();

@Deprecated(kShortAliasDeprecation)
dynamic get roundedDH => UnimplementedError();

@Deprecated(kShortAliasDeprecation)
final roundedTL = borderRadius.topLeft;

@Deprecated(kShortAliasDeprecation)
final roundedTR = borderRadius.topRight;

@Deprecated(kShortAliasDeprecation)
final roundedBL = borderRadius.bottomLeft;

@Deprecated(kShortAliasDeprecation)
final roundedBR = borderRadius.bottomRight;

@Deprecated(kShortAliasDeprecation)
final roundedTS = borderRadiusDirectional.topStart;

@Deprecated(kShortAliasDeprecation)
final roundedTE = borderRadiusDirectional.topEnd;

@Deprecated(kShortAliasDeprecation)
final roundedBS = borderRadiusDirectional.bottomStart;

@Deprecated(kShortAliasDeprecation)
final roundedBE = borderRadiusDirectional.bottomEnd;

@Deprecated('Use stack.alignment instead')
final zAlignment = stack.alignment;

@Deprecated('Use stack.fit instead')
final zFit = stack.fit;

@Deprecated('Use stack.clipBehavior instead')
final zClip = stack.clipBehavior;

@Deprecated('Use text.directive')
final directives = text.directive;

@Deprecated('Use text.directive')
final directive = text.directive;

@Deprecated('Locale is now passed to StyledText widget')
final locale = text.style.locale;

@Deprecated('Use StyledText instead')
class TextMix extends StyledText {
  const TextMix(
    super.text, {
    super.semanticsLabel,
    Mix? mix,
    super.key,
    super.inherit = true,
    super.locale,
  }) : super(style: mix);
}

@Deprecated('Use StyledIcon instead')
class IconMix extends StyledIcon {
  const IconMix(
    super.icon, {
    super.semanticLabel,
    required Mix mix,
    super.key,
    super.inherit = true,
    super.textDirection,
  }) : super(style: mix);
}

@Deprecated('Use text.style instead')
final textStyle = text.style;

@Deprecated('Use text.style.shadow instead')
final shadow = text.style.shadow;
