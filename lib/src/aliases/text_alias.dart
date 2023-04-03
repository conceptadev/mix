import '../widgets/text/text.utilities.dart';
import '../widgets/text/text_directives/text_directives.dart';

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
