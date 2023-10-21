import '../directives/text.directive.dart';
import 'text.util.dart';

/// Directives.
final capitalize = text(directives: [const CapitalizeDirective()]);
final upperCase = text(directives: [const UppercaseDirective()]);
final lowerCase = text(directives: [const LowercaseDirective()]);
final titleCase = text(directives: [const TitleCaseDirective()]);
final sentenceCase = text(directives: [const SentenceCaseDirective()]);
