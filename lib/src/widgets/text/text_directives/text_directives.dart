import '../../../directives/directive_attribute.dart';
import 'text_directive_helpers.dart';

class UppercaseDirective extends TextDirective {
  const UppercaseDirective();

  @override
  String modify(String value) {
    return value.toUpperCase();
  }
}

class CapitalizeDirective extends TextDirective {
  const CapitalizeDirective();

  @override
  String modify(String value) {
    return capitalize(value);
  }
}

class LowercaseDirective extends TextDirective {
  const LowercaseDirective();

  @override
  String modify(String value) {
    return value.toLowerCase();
  }
}

class SentenceCaseDirective extends TextDirective {
  const SentenceCaseDirective();

  @override
  String modify(String value) {
    return sentenceCase(value);
  }
}

class TitleCaseDirective extends TextDirective {
  const TitleCaseDirective();
  @override
  String modify(String value) {
    return titleCase(value);
  }
}

/// Attribute that is able to modify text
/// {@category Attributes}
/// {@subCategory Directives}
abstract class TextDirective extends Directive<String> {
  const TextDirective();

  @override
  String modify(String value);
}
