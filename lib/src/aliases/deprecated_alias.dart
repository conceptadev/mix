import '../../mix.dart';
import '../widgets/text/text_legacy.utilities.dart';

/// ALL ALIASES HERE HAVE BEEN DEPRECATED AND WILL BE REMOVED IN THE FUTURE
/// FEEL FREE TO BRING INTERNALLY TO YOUR OWN PROJECT
@Deprecated('Use animation instead')
const animated = CommonUtility.animation;

@Deprecated('Use mainAxisAlignment instead')
final mainAxis = mainAxisAlignment;

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
const textShadow = LegacyTextFriendlyUtility.textShadow;

@Deprecated('Use textStyle(textShadow: textShadow) instead')
const fontWeight = LegacyTextStyleUtility.fontWeight;

@Deprecated('Use textStyle(textBaseline: textBaseline) instead')
const textBaseline = LegacyTextStyleUtility.textBaseline;

@Deprecated('Use textStyle(letterSpacing: letterSpacing) instead')
const letterSpacing = LegacyTextStyleUtility.letterSpacing;

@Deprecated('Use textStyle(debugLabel: debugLabel) instead')
const debugLabel = LegacyTextStyleUtility.debugLabel;

@Deprecated('Use textStyle(height: height) instead')
const textHeight = LegacyTextStyleUtility.height;

@Deprecated('Use textStyle(wordSpacing: wordSpacing) instead')
const wordSpacing = LegacyTextStyleUtility.wordSpacing;

@Deprecated('Use textStyle(fontStyle: fontStyle) instead')
const fontStyle = LegacyTextStyleUtility.fontStyle;

@Deprecated('Use textStyle(fontSize: fontSize) instead')
const fontSize = LegacyTextStyleUtility.fontSize;

@Deprecated('Use textStyle(inherit: inherit) instead')
const inherit = LegacyTextStyleUtility.inherit;

@Deprecated('Use textStyle(color: color) instead')
const textColor = LegacyTextStyleUtility.color;

@Deprecated('Use textStyle(backgroundColor: backgroundColor) instead')
const textBgColor = LegacyTextStyleUtility.backgroundColor;

@Deprecated('Use textStyle(foreground: foreground) instead')
const textForeground = LegacyTextStyleUtility.foreground;

@Deprecated('Use textStyle(background: background) instead')
const textBackground = LegacyTextStyleUtility.background;

@Deprecated('Use textStyle(shadows: shadows) instead')
const textShadows = LegacyTextStyleUtility.shadows;

@Deprecated('Use textStyle(fontFeatures: fontFeatures) instead')
const fontFeatures = LegacyTextStyleUtility.fontFeatures;

@Deprecated('Use textStyle(decoration: decoration) instead')
const textDecoration = LegacyTextStyleUtility.decoration;

@Deprecated('Use textStyle(decorationColor: decorationColor) instead')
const textDecorationColor = LegacyTextStyleUtility.decorationColor;

@Deprecated('Use textStyle(decorationStyle: decorationStyle) instead')
const textDecorationStyle = LegacyTextStyleUtility.decorationStyle;

@Deprecated('Use textStyle(decorationThickness: decorationThickness) instead')
const textDecorationThickness = LegacyTextStyleUtility.decorationThickness;

@Deprecated('Use textStyle(fontFamilyFallback: fontFamilyFallback) instead')
const fontFamilyFallback = LegacyTextStyleUtility.fontFamilyFallback;

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
final r = const ContainerStyleUtilities().rounded;

@Deprecated(kShortAliasDeprecation)
final roundedH = const ContainerStyleUtilities().roundedHorizontal;

@Deprecated(kShortAliasDeprecation)
final roundedV = const ContainerStyleUtilities().roundedVertical;

@Deprecated(kShortAliasDeprecation)
final roundedDH = const ContainerStyleUtilities().roundedDirectionalHorizontal;

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedTL(double value) {
  return const ContainerStyleUtilities().roundedOnly(topLeft: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedTR(double value) {
  return const ContainerStyleUtilities().roundedOnly(topRight: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedBL(double value) {
  return const ContainerStyleUtilities().roundedOnly(bottomLeft: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedBR(double value) {
  return const ContainerStyleUtilities().roundedOnly(bottomRight: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedTS(double value) {
  return const ContainerStyleUtilities()
      .roundedDirectionalOnly(topStart: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedTE(double value) {
  return const ContainerStyleUtilities().roundedDirectionalOnly(topEnd: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedBS(double value) {
  return const ContainerStyleUtilities()
      .roundedDirectionalOnly(bottomStart: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedBE(double value) {
  return const ContainerStyleUtilities()
      .roundedDirectionalOnly(bottomEnd: value);
}

@Deprecated(kShortAliasDeprecation)
final bgColor = const ContainerStyleUtilities().backgroundColor;

@Deprecated(kShortAliasDeprecation)
final h = const ContainerStyleUtilities().height;

@Deprecated(kShortAliasDeprecation)
final w = const ContainerStyleUtilities().width;

@Deprecated(kShortAliasDeprecation)
const maxH = maxHeight;

@Deprecated(kShortAliasDeprecation)
const maxW = maxWidth;

@Deprecated(kShortAliasDeprecation)
const minH = minHeight;

@Deprecated(kShortAliasDeprecation)
const minW = minWidth;

@Deprecated(kShortAliasDeprecation)
final bt = const ContainerStyleUtilities().borderTop;

@Deprecated(kShortAliasDeprecation)
final bb = const ContainerStyleUtilities().borderBottom;

@Deprecated(kShortAliasDeprecation)
final bl = const ContainerStyleUtilities().borderLeft;

@Deprecated(kShortAliasDeprecation)
final br = const ContainerStyleUtilities().borderRight;

@Deprecated(kShortAliasDeprecation)
final bs = const ContainerStyleUtilities().borderStart;

@Deprecated(kShortAliasDeprecation)
final be = const ContainerStyleUtilities().borderEnd;

@Deprecated('Use borderDirectionalStart instead')
final borderStart = const ContainerStyleUtilities().borderStart;

@Deprecated('Use borderDirectionalEnd instead')
final borderEnd = const ContainerStyleUtilities().borderEnd;

@Deprecated('Use border(color:color) instead')
final borderColor = const ContainerStyleUtilities().borderColor;

@Deprecated('Use border(width:width) instead')
final borderWidth = const ContainerStyleUtilities().borderWidth;

@Deprecated('Use border(color:color) instead')
final borderStyle = const ContainerStyleUtilities().borderStyle;

@Deprecated('Use alignment instead')
final align = alignment;
