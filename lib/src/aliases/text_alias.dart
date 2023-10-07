import '../widgets/text/text.utilities.dart';
import '../widgets/text/text_directives/text_directives.dart';

/// Directives.
final capitalize = TextUtility.directive(const CapitalizeDirective());
final upperCase = TextUtility.directive(const UppercaseDirective());
final lowerCase = TextUtility.directive(const LowercaseDirective());
final titleCase = TextUtility.directive(const TitleCaseDirective());
final sentenceCase = TextUtility.directive(const SentenceCaseDirective());
