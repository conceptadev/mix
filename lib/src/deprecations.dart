// ignore_for_file: avoid-dynamic

import '../src/attributes/spacing/spacing_util.dart';
import '../src/factory/mix_provider_data.dart';
import '../src/specs/flex/flex_util.dart';
import '../src/specs/icon/icon_util.dart';
import '../src/specs/icon/icon_widget.dart';
import '../src/specs/stack/stack_util.dart';
import '../src/specs/text/text_util.dart';
import '../src/specs/text/text_widget.dart';
import '../src/utils/context_variant_util/on_breakpoint_util.dart';
import '../src/utils/context_variant_util/on_brightness_util.dart';
import '../src/utils/context_variant_util/on_helper_util.dart';
import '../src/utils/context_variant_util/on_orientation_util.dart';
import '../src/utils/helper_util.dart';
import '../src/variants/variant.dart';
import 'core/attribute.dart';
import 'decorators/clip_widget_decorator.dart';
import 'decorators/widget_decorators_util.dart';
import 'factory/style_mix.dart';
import 'specs/box/box_util.dart';
import 'specs/box/box_widget.dart';
import 'specs/image/image_util.dart';
import 'widgets/pressable/pressable_util.dart';

const kShortAliasDeprecation =
    'Short aliases will be deprecated, you can create your own. Example: final p = padding;';

@Deprecated('Use Style instead')
typedef Mix = Style;

@Deprecated('Use Box instead')
typedef StyledContainer = Box;

extension DeprecatedMixExtension on Style {
  @Deprecated('Use applyVariant(value) instead')
  Style withVariants(List<Variant> variants) => withManyVariants(variants);

  @Deprecated('Use applyVariants(value) instead')
  Style withManyVariants(Iterable<Variant> variants) => applyVariants(variants);

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
  @Deprecated('Use 4.0 instead')
  T get xs => call(4.0);
  @Deprecated('Use 8.0 instead')
  T get sm => call(8.0);
  @Deprecated('Use 16.0 instead')
  T get md => call(16.0);
  @Deprecated('Use 24.0 instead')
  T get lg => call(24.0);
  @Deprecated('Use 32.0 instead')
  T get xl => call(32.0);
  @Deprecated('Use 40.0 instead')
  T get xxl => call(40.0);

  @Deprecated(
    'If are you using a custom theme, so you need to use the method [of], otherwise use the method .call(4.0)',
  )
  T xsmall() => call(4.0);
  @Deprecated(
    'If are you using a custom theme, so you need to use the method [of], otherwise use the method .call(8.0)',
  )
  T small() => call(8.0);
  @Deprecated(
    'If are you using a custom theme, so you need to use the method [of], otherwise use the method .call(16.0)',
  )
  T medium() => call(16.0);
  @Deprecated(
    'If are you using a custom theme, so you need to use the method [of], otherwise use the method .call(24.0)',
  )
  T large() => call(24.0);
  @Deprecated(
    'If are you using a custom theme, so you need to use the method [of], otherwise use the method .call(32.0)',
  )
  T xlarge() => call(32.0);
  @Deprecated(
    'If are you using a custom theme, so you need to use the method [of], otherwise use the method .call(40.0)',
  )
  T xxlarge() => call(40.0);
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

@Deprecated('use flexible.expanded instead')
final expanded = flexible.expanded;

@Deprecated('use borderRadius instead')
final rounded = borderRadius;

@Deprecated('use border.width instead')
final borderWidth = border.width;

@Deprecated('use border.color instead')
final borderColor = border.color;

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
@Deprecated('Use text.overflow instead')
final textOverflow = text.overflow;

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

@Deprecated('Use padding.as instead')
final paddingInsets = padding.as;

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
const hover = onHover;

@Deprecated('Use onFocused instead')
const focus = onFocused;

@Deprecated('Use onFocused instead')
const onFocus = onFocused;

@Deprecated('Use onPortrait instead')
final portrait = onPortrait;

@Deprecated('Use onLandscape instead')
final landscape = onLandscape;

@Deprecated('Use onDisabled instead')
const disabled = onDisabled;

@Deprecated('Use onEnabled instead')
const enabled = onEnabled;

@Deprecated('Use direct clip utility for example clip.rrect becomes clipRRect')
const clip = ClipDecoratorUtility();

@Deprecated('Use onPressed instead')
const press = onPressed;

@Deprecated('Use onPressed instead')
const onPress = onPressed;

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
final textStyle = text.style.as;

@Deprecated('Use text.maxLines instead')
final maxLines = text.maxLines;

@Deprecated('Use text.textAlign instead')
final textAlign = text.textAlign;

@Deprecated('Use text.style.shadow instead')
final shadow = text.style.shadow;

/// A utility class for creating [ClipDecorator]s.
class ClipDecoratorUtility {
  final ClipPathUtility path = const ClipPathUtility(selfBuilder);
  final ClipOvalUtility oval = const ClipOvalUtility(selfBuilder);
  final ClipRectUtility rect = const ClipRectUtility(selfBuilder);
  final ClipRRectUtility rrect = const ClipRRectUtility(selfBuilder);
  final ClipTriangleUtility triangle = const ClipTriangleUtility(selfBuilder);

  const ClipDecoratorUtility();
}

@Deprecated('Use image.color instead')
final imageColor = image.color;

@Deprecated('Use image.blendMode instead')
final imageColorBlendMode = image.blendMode;

@Deprecated('Use image.fit instead')
final imageFit = image.fit;

@Deprecated('Use image.alignment instead')
final imageAlignment = image.alignment;

@Deprecated('Use image.repeat instead')
final imageRepeat = image.repeat;

@Deprecated('Use image.centerSlice instead')
final imageCenterSlice = image.centerSlice;

// show
@Deprecated('Use visibility.on instead')
final show = visibility.on;

// hide
@Deprecated('Use visibility.off instead')
final hide = visibility.off;

// TODO: Need to update these
// // animated
// @Deprecated('Use animated instead')
// final animated = animation.animated;

// // animationDuration
// @Deprecated('Use animation.duration instead')
// final animationDuration = animation.duration;

// // animationCurve
// @Deprecated('Use animation.curve instead')
// final animationCurve = animation.curve;

// textDirection
@Deprecated('Use text.textDirection instead')
final textDirection = text.textDirection;

// textWidthBasis
@Deprecated('Use text.widthBasis instead')
final textWidthBasis = text.textWidthBasis;

// softWrap
@Deprecated('Use text.softWrap instead')
final softWrap = text.softWrap;

// textScaleFactor
@Deprecated('Use text.scaleFactor instead')
final textScaleFactor = text.textScaleFactor;

// strutStyle
@Deprecated('Use text.strutStyle instead')
final strutStyle = text.strutStyle;

// textBaseline
@Deprecated('Use text.baseline instead')
final textBaseline = text.style.textBaseline;

// squared
@Deprecated('Use borderRadius.circular instead')
final squared = borderRadius.zero;

// flexDirection
@Deprecated('Use flexDirection instead')
final flexDirection = flex.direction;

// verticalDirection
@Deprecated('Use verticalDirection instead')
final verticalDirection = flex.verticalDirection;

// @Deprecated('Use image.scale instead')
// final imageScale = image.scale;

// // inherit
// @Deprecated('Use text.inherit instead')
// final inherit = text.style.inherit;
