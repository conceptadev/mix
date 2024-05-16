// ignore_for_file: avoid-dynamic

import '../src/attributes/spacing/spacing_util.dart';
import '../src/factory/mix_provider_data.dart';
import '../src/specs/icon/icon_widget.dart';
import '../src/specs/text/text_widget.dart';
import '../src/variants/variant.dart';
import 'attributes/nested_style/nested_style_util.dart';
import 'attributes/scalars/scalar_util.dart';
import 'core/attribute.dart';
import 'core/styled_widget.dart';
import 'decorators/clip_widget_decorator.dart';
import 'factory/style_mix.dart';
import 'helpers/helper_util.dart';
import 'specs/box/box_widget.dart';
import 'specs/spec_util.dart';
import 'theme/tokens/token_util.dart';

const kShortAliasDeprecation =
    'Short aliases will be deprecated, you can create your own. Example: final p = padding;';

@Deprecated('Use Style instead')
typedef Mix = Style;

@Deprecated('Use Box instead')
typedef StyledContainer = Box;

@Deprecated('Use SpecBuilder instead')
typedef MixContextBuilder = SpecBuilder;

@Deprecated('StyleRecipe is now deprecated, create a custom Spec')
abstract class StyleRecipe<T extends StyleRecipe<T>> {
  const StyleRecipe();

  StyleRecipe<T> merge(covariant StyleRecipe<T>? other);

  StyleRecipe<T> applyVariants(List<Variant> variants);

  StyleRecipe<T> copyWith();
}

extension DeprecatedMixExtension on Style {
  @Deprecated('Use applyVariant(value) instead')
  Style withVariants(List<Variant> variants) => withManyVariants(variants);

  @Deprecated('Use applyVariants(value) instead')
  Style withManyVariants(List<Variant> variants) => applyVariants(variants);

  @Deprecated('Use merge()  instead')
  SpreadFunctionParams<Style, Style> get apply =>
      const SpreadFunctionParams(Style.combine);

  @Deprecated('Use applyVariant(value) instead')
  Style withVariant(Variant value) => applyVariant(value);

  @Deprecated('Use combine instead')
  Style combineAll(List<Style> mixes) => Style.combine(mixes);

  @Deprecated('not needed as record implementation is more elegant')
  Style variantSwitcher(List<SwitchCondition<Variant>> cases) {
    List<Variant> variantsToApply = [];

    for (SwitchCondition<Variant> conditionCase in cases) {
      if (conditionCase.condition) {
        variantsToApply.add(conditionCase.value);
      }
    }

    return applyVariants(variantsToApply);
  }

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

@Deprecated('Call the style directly instead')
const apply = NestedStyleUtility();

extension WithSpaceTokensExt<T extends StyledAttribute>
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

@Deprecated(r'use $flex.mainAxisAlignment instead')
final mainAxis = $flex.mainAxisAlignment;

@Deprecated(r'use $flex.direction instead')
final directionAxis = $flex.direction;

@Deprecated(r'use $flex.crossAxisAlignment instead')
final crossAxis = $flex.crossAxisAlignment;

@Deprecated(r'use $flex.mainAxisAlignment instead')
final mainAxisAlignment = $flex.mainAxisAlignment;

@Deprecated(r'use $flex.crossAxisAlignment instead')
final crossAxisAlignment = $flex.crossAxisAlignment;

@Deprecated(r'use $flex.mainAxisSize instead')
final mainAxisSize = $flex.mainAxisSize;

@Deprecated(r'use $flex.gap instead')
final gap = $flex.gap;

@Deprecated(r'use $with.flexible.expanded instead')
final expanded = $with.flexible.expanded;

@Deprecated(r'use $box.borderRadius instead')
final rounded = $box.borderRadius;

@Deprecated(r'use $box.border.width instead')
final borderWidth = $box.border.width;

@Deprecated(r'use $box.border.color instead')
final borderColor = $box.border.color;

// height
@Deprecated(r'use $box.height instead')
final h = $box.height;

@Deprecated(r'use $box.width instead')
final w = $box.width;

@Deprecated(r'use $box.maxHeight instead')
final maxH = $box.maxHeight;

@Deprecated(r'use $box.maxWidth instead')
final maxW = $box.maxWidth;

@Deprecated(r'use $box.minHeight instead')
final minH = $box.minHeight;

@Deprecated(r'use $box.minWidth instead')
final minW = $box.minWidth;

@Deprecated(r'Use $box.border.top instead')
final bt = $box.border.top;

@Deprecated(r'Use $box.border.bottom instead')
final bb = $box.border.bottom;

@Deprecated(r'Use $box.border.left instead')
final bl = $box.border.left;

@Deprecated(r'Use $box.border.right instead')
final br = $box.border.right;

@Deprecated(r'Use $box.borderDirectional.start instead')
final bs = $box.borderDirectional.start;

@Deprecated(r'Use $box.borderDirectional.end instead')
final be = $box.borderDirectional.end;

@Deprecated(r'Use $box.color instead')
final bgColor = $box.color;

@Deprecated(r'Use $text.style instead')
final font = $text.style;
@Deprecated(r'Use $text.style.fontWeight instead')
final fontWeight = $text.style.fontWeight;
@Deprecated(r'Use $text.style.letterSpacing instead')
final letterSpacing = $text.style.letterSpacing;
@Deprecated(r'Use $text.style.debugLabel instead')
final debugLabel = $text.style.debugLabel;
@Deprecated(r'Use $text.style.height instead')
final textHeight = $text.style.height;
@Deprecated(r'Use $text.style.wordSpacing instead')
final wordSpacing = $text.style.wordSpacing;
@Deprecated(r'Use $text.style.fontStyle instead')
final fontStyle = $text.style.fontStyle;
@Deprecated(r'Use $text.style.fontSize instead')
final fontSize = $text.style.fontSize;
@Deprecated(r'Use $text.style.color instead')
final textColor = $text.style.color;
@Deprecated(r'Use $text.style.backgroundColor instead')
final textBgColor = $text.style.backgroundColor;
@Deprecated(r'Use $text.style.foreground instead')
final textForeground = $text.style.foreground;
@Deprecated(r'Use $text.style.background instead')
final textBackground = $text.style.background;
@Deprecated(r'Use $text.style.shadows instead')
final textShadows = $text.style.shadows;
@Deprecated(r'Use $text.style.fontFeatures instead')
final fontFeatures = $text.style.fontFeatures;
@Deprecated(r'Use $text.style.decoration instead')
final textDecoration = $text.style.decoration;
@Deprecated(r'Use $text.style.decorationColor instead')
final textDecorationColor = $text.style.decorationColor;
@Deprecated(r'Use $text.style.decorationStyle instead')
final textDecorationStyle = $text.style.decorationStyle;
@Deprecated(r'Use $text.style.decorationThickness instead')
final textDecorationThickness = $text.style.decorationThickness;
@Deprecated(r'Use $text.style.fontFamilyFallback instead')
final fontFamilyFallback = $text.style.fontFamilyFallback;
@Deprecated(r'Use $text.style.shadows instead')
final textShadow = $text.style.shadows;
@Deprecated(r'Use $text.overflow instead')
final overflow = $text.overflow;
@Deprecated(r'Use $text.style.bold instead')
final bold = $text.style.bold;
@Deprecated(r'Use $text.overflow instead')
final textOverflow = $text.overflow;

@Deprecated(r'use $icon')
final icon = $icon;

@Deprecated(r'use $image')
final image = $image;

@Deprecated(r'use $stack instead')
final stack = $stack;

@Deprecated(r'use $text instead')
final text = $text;

@Deprecated(r'Use $icon.size instead')
final iconSize = $icon.size;
@Deprecated(r'Use $icon.color instead')
final iconColor = $icon.color;

@Deprecated(r'Use $box.padding instead')
final p = $box.padding;
@Deprecated(r'Use $box.padding.top instead')
final pt = $box.padding.top;
@Deprecated(r'Use $box.padding.bottom instead')
final pb = $box.padding.bottom;
@Deprecated(r'Use $box.padding.right instead')
final pr = $box.padding.right;
@Deprecated(r'Use $box.padding.left instead')
final pl = $box.padding.left;
@Deprecated(r'Use $box.padding.start instead')
final ps = $box.padding.start;
@Deprecated(r'Use $box.padding.end instead')
final pe = $box.padding.end;
@Deprecated(r'Use $box.padding.horizontal instead')
final px = $box.padding.horizontal;
@Deprecated(r'Use $box.padding.vertical instead')
final py = $box.padding.vertical;
@Deprecated(r'Use $box.padding.as instead')
final pi = $box.padding.as;

@Deprecated(r'Use $box.padding.as instead')
final paddingInsets = $box.padding.as;

@Deprecated(r'Use $box.margin instead')
final m = $box.margin;
@Deprecated(r'Use $box.margin.top instead')
final mt = $box.margin.top;
@Deprecated(r'Use $box.margin.bottom instead')
final mb = $box.margin.bottom;
@Deprecated(r'Use $box.margin.right instead')
final mr = $box.margin.right;
@Deprecated(r'Use $box.margin.left instead')
final ml = $box.margin.left;
@Deprecated(r'Use $box.margin.start instead')
final ms = $box.margin.start;
@Deprecated(r'Use $box.margin.end instead')
final me = $box.margin.end;
@Deprecated(r'Use $box.margin.horizontal instead')
final mx = $box.margin.horizontal;
@Deprecated(r'Use $box.margin.vertical instead')
final my = $box.margin.vertical;
@Deprecated(r'Use $box.margin.as instead')
final mi = $box.margin.as;

@Deprecated(r'Use $box.margin.top instead')
final marginTop = $box.margin.top;
@Deprecated(r'Use $box.margin.bottom instead')
final marginBottom = $box.margin.bottom;
@Deprecated(r'Use $box.margin.left instead')
final marginLeft = $box.margin.left;
@Deprecated(r'Use $box.margin.right instead')
final marginRight = $box.margin.right;
@Deprecated(r'Use $box.margin.start instead')
final marginStart = $box.margin.start;
@Deprecated(r'Use $box.margin.end instead')
final marginEnd = $box.margin.end;
@Deprecated(r'Use $box.margin.horizontal instead')
final marginHorizontal = $box.margin.horizontal;
@Deprecated(r'Use $box.margin.vertical instead')
final marginVertical = $box.margin.vertical;
@Deprecated(r'Use $box.margin.as instead')
final marginFrom = $box.margin.as;
@Deprecated(kShortAliasDeprecation)
final marginX = marginHorizontal;
@Deprecated(kShortAliasDeprecation)
final marginY = marginVertical;
@Deprecated(r'use $box.margin.only instead')
final marginOnly = $box.margin.only;
@Deprecated(r'use $box.margin.only instead')
final marginDirectionalOnly = $box.margin.only;
@Deprecated(r'use $box.margin.all instead')
final marginAll = $box.margin.all;

@Deprecated(r'Use $box.padding.top instead')
final paddingTop = $box.padding.top;
@Deprecated(r'Use $box.padding.bottom instead')
final paddingBottom = $box.padding.bottom;
@Deprecated(r'Use $box.padding.left instead')
final paddingLeft = $box.padding.left;
@Deprecated(r'Use $box.padding.right instead')
final paddingRight = $box.padding.right;
@Deprecated(r'Use $box.padding.start instead')
final paddingStart = $box.padding.start;
@Deprecated(r'Use $box.padding.end instead')
final paddingEnd = $box.padding.end;
@Deprecated(r'Use $box.padding.horizontal instead')
final paddingHorizontal = $box.padding.horizontal;
@Deprecated(r'Use $box.padding.vertical instead')
final paddingVertical = $box.padding.vertical;
@Deprecated(r'Use $box.padding.as instead')
final paddingFrom = $box.padding.as;
@Deprecated(r'Use $box.padding.horizontal instead')
final paddingX = $box.padding.horizontal;
@Deprecated(r'Use $box.padding.vertical instead')
final paddingY = $box.padding.vertical;
@Deprecated(r'use $box.padding.only instead')
final paddingOnly = $box.padding.only;
@Deprecated(r'use $box.padding.only instead')
final paddingDirectionalOnly = $box.padding.only;
@Deprecated(r'use $box.padding.all instead')
final paddingAll = $box.padding.all;
@Deprecated(r'Use $box.border.top instead')
final borderTop = $box.border.top;
@Deprecated(r'Use $box.border.bottom instead')
final borderBottom = $box.border.bottom;
@Deprecated(r'Use $box.border.left instead')
final borderLeft = $box.border.left;
@Deprecated(r'Use $box.border.right instead')
final borderRight = $box.border.right;
@Deprecated(r'Use $box.borderDirectional.start instead')
final borderStart = $box.borderDirectional.start;
@Deprecated(r'Use $box.borderDirectional.end instead')
final borderEnd = $box.borderDirectional.end;
@Deprecated(r'Use $box.border.horizontal instead')
final borderHorizontal = $box.border.horizontal;
@Deprecated(r'Use $box.border.vertical instead')
final borderVertical = $box.border.vertical;
@Deprecated(r'Use $box.border.all instead')
final borderAll = $box.border.all;

@Deprecated(r'Use $on.xsmall instead')
final xsmall = $on.xsmall;

@Deprecated(r'Use $on.small instead')
final small = $on.small;

@Deprecated(r'Use $on.medium instead')
final medium = $on.medium;

@Deprecated(r'Use $on.dark instead')
final dark = $on.dark;

@Deprecated(r'Use $on.light instead')
final light = $on.light;

@Deprecated(r'Use $on.large instead')
final large = $on.large;

@Deprecated(r'used $on.small instead')
final onSmall = $on.small;

@Deprecated(r'used $on.xsmall instead')
final onXSmall = $on.xsmall;

@Deprecated(r'used $on.medium instead')
final onMedium = $on.medium;

@Deprecated(r'used $on.large instead')
final onLarge = $on.large;

@Deprecated(r'Use $on.hover instead')
final hover = $on.hover;

@Deprecated(r'Use $on.focus instead')
final focus = $on.focus;

@Deprecated(r'Use $on.focus instead')
final onFocus = $on.focus;

@Deprecated(r'Use $on.portrait instead')
final portrait = $on.portrait;

@Deprecated(r'Use $on.landscape instead')
final landscape = $on.landscape;

@Deprecated(r'Use $on.disabled instead')
final disabled = $on.disabled;

@Deprecated(r'Use $on.enabled instead')
final enabled = $on.enabled;
@Deprecated(r'Use $on.portrait instead')
final onPortrait = $on.portrait;

@Deprecated(r'Use $on.landscape instead')
final onLandscape = $on.landscape;

@Deprecated(r'Use $on.press instead')
final onPressed = $on.press;

@Deprecated(r'Use $on.longPress instead')
final onLongPressed = $on.longPress;

@Deprecated(r'Use $on.hover instead')
final onHover = $on.hover;

@Deprecated(r'Use $on.enabled instead')
final onEnabled = $on.enabled;

@Deprecated(r'Use $on.disabled instead')
final onDisabled = $on.disabled;

@Deprecated(r'Use $on.focus instead')
final onfocus = $on.focus;

@Deprecated(r'Use $on.hover.event instead')
final onMouseHover = $on.hover.event;

@Deprecated(r'Use $on.dark instead')
final onDark = $on.dark;

@Deprecated(r'Use $on.light instead')
final onLight = $on.light;

@Deprecated('Use direct clip utility for example clip.rrect becomes clipRRect')
const clip = ClipDecoratorUtility();

@Deprecated(r'Use $on.Pressed instead')
final press = $on.press;

@Deprecated(r'Use $on.Pressed instead')
final onPress = $on.press;

@Deprecated(r'Use $on.rtl instead')
final onRTL = $on.rtl;

@Deprecated(r'Use $on ltr instead')
final onLTR = $on.ltr;

@Deprecated(r'Use $on.Not instead')
final not = $on.not;

@Deprecated(r'Use $text.directive')
final directives = $text.directive;

@Deprecated(r'Use $text.directive')
final directive = $text.directive;

@Deprecated('Locale is now passed to StyledText widget')
final locale = $text.style.locale;

@Deprecated(r'Use $text.maxLines instead')
final maxLines = $text.maxLines;

@Deprecated(r'Use $text.textAlign instead')
final textAlign = $text.textAlign;

@Deprecated(r'Use $text.style.shadow instead')
final shadow = $text.style.shadow;

// flexDirection
@Deprecated(r'Use $flex.direction; instead')
final flexDirection = $flex.direction;

@Deprecated(r'use $flex')
final flex = $flex;

@Deprecated(r'use $box.border instead')
final border = $box.border;

@Deprecated(r'use $box.borderDirectional instead')
final borderDirectional = $box.borderDirectional;

@Deprecated(r'use $box.borderRadius instead')
final borderRadius = $box.borderRadius;

@Deprecated(r'use $box.borderRadiusDirectional instead')
final borderRadiusDirectional = $box.borderRadiusDirectional;

@Deprecated(r'use $box.color instead')
final backgroundColor = $box.color;

@Deprecated(r'use $box.width instead')
final width = $box.width;

@Deprecated(r'use $box.height instead')
final height = $box.height;

@Deprecated(r'use $box.minHeight instead')
final minHeight = $box.minHeight;

@Deprecated(r'use $box.maxHeight instead')
final maxHeight = $box.maxHeight;

@Deprecated(r'use $box.minWidth instead')
final minWidth = $box.minWidth;

@Deprecated(r'use $box.maxWidth instead')
final maxWidth = $box.maxWidth;

@Deprecated(r'use $box.padding instead')
final padding = $box.padding;

@Deprecated(r'use $box.margin instead')
final margin = $box.margin;

@Deprecated(r'use $box.alignment instead')
final alignment = $box.alignment;

@Deprecated(r'use $box.clipBehavior instead')
final clipBehavior = $box.clipBehavior;

@Deprecated(r'use $box.elevation instead')
final elevation = $box.elevation;

@Deprecated(r'use $box.radialGradient instead')
final radialGradient = $box.radialGradient;

@Deprecated(r'use $box.linearGradient instead')
final linearGradient = $box.linearGradient;

@Deprecated(r'use $box instead')
final box = $box;

@Deprecated(r'use $with.intrinsicWidth instead')
final intrinsicWidth = $with.intrinsicWidth;

@Deprecated(r'use $with.intrinsicHeight instead')
final intrinsicHeight = $with.intrinsicHeight;

@Deprecated(r'use $with.scale instead')
final scale = $with.scale;

@Deprecated(r'use $with.opacity instead')
final opacity = $with.opacity;
@Deprecated(r'use $with.rotate instead')
final rotate = $with.rotate;
@Deprecated(r'use $with.clipPath instead')
final clipPath = $with.clipPath;
@Deprecated(r'use $with.clipRRect instead')
final clipRRect = $with.clipRRect;
@Deprecated(r'use $with.clipOval instead')
final clipOval = $with.clipOval;
@Deprecated(r'use $with.clipRect instead')
final clipRect = $with.clipRect;
@Deprecated(r'use $with.clipTriangle instead')
final clipTriangle = $with.clipTriangle;

@Deprecated(r'use $token.radii')
final $radius = $token.radius;

@Deprecated(r'use $token.space')
final $space = $token.space;

@Deprecated(r'use $token.color')
final $color = $token.color;

@Deprecated(r'use $token.breakpoint')
final $breakpoint = $token.breakpoint;

@Deprecated(r'use $token.textStyle')
final $textStyle = $token.textStyle;

@Deprecated(r'use $with.aspectRatio instead')
final aspectRatio = $with.aspectRatio;
@Deprecated(r'use $with.flexible instead')
final flexible = $with.flexible;
@Deprecated(r'use $with.transform instead')
final transform = $with.transform;
@Deprecated(r'use $with.align instead')
final align = $with.align;
@Deprecated(r'use $with.fractionallySizedBox instead')
final fractionallySizedBox = $with.fractionallySizedBox;
@Deprecated(r'use $with.sizedBox instead')
final sizedBox = $with.sizedBox;

@Deprecated(r'Use $box.borderRadius instead')
final r = $box.borderRadius;

@Deprecated(kShortAliasDeprecation)
final roundedTL = $box.borderRadius.topLeft;

@Deprecated(kShortAliasDeprecation)
final roundedTR = $box.borderRadius.topRight;

@Deprecated(kShortAliasDeprecation)
final roundedBL = $box.borderRadius.bottomLeft;

@Deprecated(kShortAliasDeprecation)
final roundedBR = $box.borderRadius.bottomRight;

@Deprecated(kShortAliasDeprecation)
final roundedTS = $box.borderRadiusDirectional.topStart;

@Deprecated(kShortAliasDeprecation)
final roundedTE = $box.borderRadiusDirectional.topEnd;

@Deprecated(kShortAliasDeprecation)
final roundedBS = $box.borderRadiusDirectional.bottomStart;

@Deprecated(kShortAliasDeprecation)
final roundedBE = $box.borderRadiusDirectional.bottomEnd;

@Deprecated(r'Use $stack.alignment instead')
final zAlignment = $stack.alignment;

@Deprecated(r'Use $stack.fit instead')
final zFit = $stack.fit;

@Deprecated(r'Use $stack.clipBehavior instead')
final zClip = $stack.clipBehavior;

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

@Deprecated(r'Use $text.style instead')
final textStyle = $text.style.as;

const _selfBuilder = MixUtility.selfBuilder;

@Deprecated('used temporarily for migration')
class ClipDecoratorUtility {
  final ClipPathUtility path = const ClipPathUtility(_selfBuilder);
  final ClipOvalUtility oval = const ClipOvalUtility(_selfBuilder);
  final ClipRectUtility rect = const ClipRectUtility(_selfBuilder);
  final ClipRRectUtility rrect = const ClipRRectUtility(_selfBuilder);
  final ClipTriangleUtility triangle = const ClipTriangleUtility(_selfBuilder);

  const ClipDecoratorUtility();
}

@Deprecated(r'Use $image.color instead')
final imageColor = $image.color;

@Deprecated(r'Use $image.blendMode instead')
final imageColorBlendMode = $image.blendMode;

@Deprecated(r'Use $image.fit instead')
final imageFit = $image.fit;

@Deprecated(r'Use $image.alignment instead')
final imageAlignment = $image.alignment;

@Deprecated(r'Use $image.repeat instead')
final imageRepeat = $image.repeat;

@Deprecated(r'Use $image.centerSlice instead')
final imageCenterSlice = $image.centerSlice;

// textDirection
@Deprecated(r'Use $text.textDirection instead')
final textDirection = $text.textDirection;

// textWidthBasis
@Deprecated(r'Use $text.widthBasis instead')
final textWidthBasis = $text.textWidthBasis;

// softWrap
@Deprecated(r'Use $text.softWrap instead')
final softWrap = $text.softWrap;

// textScaleFactor
@Deprecated(r'Use $text.scaleFactor instead')
final textScaleFactor = $text.textScaleFactor;

// strutStyle
@Deprecated(r'Use $text.strutStyle instead')
final strutStyle = $text.strutStyle;

// textBaseline
@Deprecated(r'Use $text.baseline instead')
final textBaseline = $text.style.textBaseline;

// squared
@Deprecated(r'Use $box.borderRadius.circular instead')
final squared = $box.borderRadius.zero;

// verticalDirection
@Deprecated('Use verticalDirection instead')
final verticalDirection = $flex.verticalDirection;

@Deprecated(r'use $with.visibility instead')
final visibility = $with.visibility;
// show
@Deprecated(r'Use $with.show instead')
final show = $with.show;

@Deprecated(r'use $material instead')
const $md = $material;

// hide
@Deprecated(r'Use $with.hide instead')
final hide = $with.hide;

class SwitchCondition<T> {
  final bool condition;
  final T value;

  // ignore: prefer-named-boolean-parameters
  const SwitchCondition(this.condition, this.value);
}
