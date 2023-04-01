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

@Deprecated('Use textStyle(fontFamily: fontFamily) instead')
const textHeight = LegacyTextStyleUtility.height;

@Deprecated('Use textStyle(fontFamily: fontFamily) instead')
const wordSpacing = LegacyTextStyleUtility.wordSpacing;

@Deprecated('Use textStyle(fontFamily: fontFamily) instead')
const fontStyle = LegacyTextStyleUtility.fontStyle;

@Deprecated('Use textStyle(fontFamily: fontFamily) instead')
const fontSize = LegacyTextStyleUtility.fontSize;

@Deprecated('Use textStyle(fontFamily: fontFamily) instead')
const inherit = LegacyTextStyleUtility.inherit;

@Deprecated('Use textStyle(fontFamily: fontFamily) instead')
const textColor = LegacyTextStyleUtility.color;

@Deprecated('Use textStyle(fontFamily: fontFamily) instead')
const textBgColor = LegacyTextStyleUtility.backgroundColor;

@Deprecated('Use textStyle(fontFamily: fontFamily) instead')
const textForeground = LegacyTextStyleUtility.foreground;

@Deprecated('Use textStyle(fontFamily: fontFamily) instead')
const textBackground = LegacyTextStyleUtility.background;

@Deprecated('Use textStyle(fontFamily: fontFamily) instead')
const textShadows = LegacyTextStyleUtility.shadows;

@Deprecated('Use textStyle(fontFamily: fontFamily) instead')
const fontFeatures = LegacyTextStyleUtility.fontFeatures;

@Deprecated('Use textStyle(fontFamily: fontFamily) instead')
const textDecoration = LegacyTextStyleUtility.decoration;

@Deprecated('Use textStyle(fontFamily: fontFamily) instead')
const textDecorationColor = LegacyTextStyleUtility.decorationColor;

@Deprecated('Use textStyle(fontFamily: fontFamily) instead')
const textDecorationStyle = LegacyTextStyleUtility.decorationStyle;

@Deprecated('Use textStyle(fontFamily: fontFamily) instead')
const textDecorationThickness = LegacyTextStyleUtility.decorationThickness;

@Deprecated('Use textStyle(fontFamilyFallback: fontFamilyFallback) instead')
const fontFamilyFallback = LegacyTextStyleUtility.fontFamilyFallback;
