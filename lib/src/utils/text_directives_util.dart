

import '../directives/text_directive.dart';
import '../helpers/extensions/string_ext.dart';
import 'scalar_util.dart';

/// Directives.
TextDirectiveAttribute capitalize = TextDirectiveUtility((value) => value.,);
const upperCase = UppercaseDirective.new;
const lowerCase = LowercaseDirective.new;
const titleCase = TitleCaseDirective.new;
const sentenceCase = SentenceCaseDirective.new;

class TextDirectiveUtility extends ScalarUtility<TextDirective, TextDirectiveAttribute>{
  
  TextDirectiveUtility(super.builder);
}

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
  String modify(String value) =>  value.sentenceCase;
}

class TitleCaseDirective extends TextDirective {
  const TitleCaseDirective();
  @override
  String modify(String value) => value.titleCase;
}
