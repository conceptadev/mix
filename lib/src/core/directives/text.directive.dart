import '../../helpers/extensions/string_ext.dart';
import 'directive.attribute.dart';

class UppercaseDirective extends TextDirective {
  const UppercaseDirective();

  @override
  String modify(String value) => value.toUpperCase();
}

class CapitalizeDirective extends TextDirective {
  const CapitalizeDirective();

  @override
  String modify(String value) => value.capitalize;
}

class LowercaseDirective extends TextDirective {
  const LowercaseDirective();

  @override
  String modify(String value) => value.toLowerCase();
}

class SentenceCaseDirective extends TextDirective {
  const SentenceCaseDirective();

  @override
  String modify(String value) => value.sentenceCase;
}

class TitleCaseDirective extends TextDirective {
  const TitleCaseDirective();
  @override
  String modify(String value) => value.titleCase;
}

abstract class TextDirective extends Directive<String> {
  const TextDirective();

  @override
  String modify(String value);
}
