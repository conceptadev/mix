import '../widgets/text/text.utils.dart';
import '../widgets/text/text_directives/text_directives.dart';

/// Text align
const textAlign = TextUtility.textAlign;

const textWidthBasis = TextUtility.textWidthBasis;
const locale = TextUtility.locale;
const maxLines = TextUtility.maxLines;
const textOverflow = TextUtility.overflow;
const textStyle = TextUtility.style;
const softWrap = TextUtility.softWrap;
const textScaleFactor = TextUtility.textScaleFactor;
const strutStyle = TextUtility.strutStyle;

const fontWeight = TextStyleUtility.fontWeight;
const textBaseline = TextStyleUtility.textBaseline;
const letterSpacing = TextStyleUtility.letterSpacing;
const debugLabel = TextStyleUtility.debugLabel;
const textHeight = TextStyleUtility.height;
const wordSpacing = TextStyleUtility.wordSpacing;
const fontStyle = TextStyleUtility.fontStyle;

const fontSize = TextStyleUtility.fontSize;
const inherit = TextStyleUtility.inherit;
const textColor = TextStyleUtility.color;
const textBgColor = TextStyleUtility.backgroundColor;

const textForeground = TextStyleUtility.foreground;
const textBackground = TextStyleUtility.background;

const textShadows = TextStyleUtility.shadows;
const fontFeatures = TextStyleUtility.fontFeatures;
const textDecoration = TextStyleUtility.decoration;
const textDecorationColor = TextStyleUtility.decorationColor;
const textDecorationStyle = TextStyleUtility.decorationStyle;
const textDecorationThickness = TextStyleUtility.decorationThickness;
const fontFamilyFallback = TextStyleUtility.fontFamilyFallback;

/// Friendly utilities
const font = TextFriendlyUtility.textStyle;
const bold = TextFriendlyUtility.bold;
const italic = TextFriendlyUtility.italic;
const textShadow = TextFriendlyUtility.textShadow;

/// Directives

final capitalize = TextUtility.directive(const CapitalizeDirective());
final upperCase = TextUtility.directive(const UppercaseDirective());
final lowerCase = TextUtility.directive(const LowercaseDirective());
final titleCase = TextUtility.directive(const TitleCaseDirective());
final sentenceCase = TextUtility.directive(const SentenceCaseDirective());
