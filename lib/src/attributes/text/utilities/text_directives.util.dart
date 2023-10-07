import '../directives/text.directive.dart';
import 'text.util.dart';

/// Directives.
final capitalize = text(directive: const CapitalizeDirective());
final upperCase = text(directive: const UppercaseDirective());
final lowerCase = text(directive: const LowercaseDirective());
final titleCase = text(directive: const TitleCaseDirective());
final sentenceCase = text(directive: const SentenceCaseDirective());
