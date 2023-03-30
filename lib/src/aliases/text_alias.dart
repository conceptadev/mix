import '../widgets/text/text.utilities.dart';
import '../widgets/text/text_directives/text_directives.dart';
import '../widgets/text/text_legacy.utilities.dart';

/// Text align
const textAlign = TextUtility.textAlign;

const textWidthBasis = TextUtility.textWidthBasis;
const locale = TextUtility.locale;
const maxLines = TextUtility.maxLines;
const textOverflow = TextUtility.overflow;
const textStyle = TextUtility.textStyle;
const softWrap = TextUtility.softWrap;
const textScaleFactor = TextUtility.textScaleFactor;
const strutStyle = TextUtility.strutStyle;

/// Friendly utilities

const bold = TextFriendlyUtility.bold;
const italic = TextFriendlyUtility.italic;

/// Directives

final capitalize = TextUtility.directive(const CapitalizeDirective());
final upperCase = TextUtility.directive(const UppercaseDirective());
final lowerCase = TextUtility.directive(const LowercaseDirective());
final titleCase = TextUtility.directive(const TitleCaseDirective());
final sentenceCase = TextUtility.directive(const SentenceCaseDirective());

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
