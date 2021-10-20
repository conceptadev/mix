import 'package:mix/src/attributes/base_attribute.dart';

import '../helpers/extensions.dart';

typedef TextDirective = AttributeDirective<String>;

/// Attribute that is able to modify text
class TextDirectiveAttribute extends TextMixAttribute<TextDirective> {
  const TextDirectiveAttribute(TextDirective directive)
      : _directive = directive;

  /// Function to execute the directive
  final AttributeDirective<String> _directive;

  @override
  AttributeDirective<String> get value => _directive;

  /// Short version for  [value.modify]
  String modify(String value) => _directive.modify(value);
}

class CapitalizeDirective extends AttributeDirective<String> {
  const CapitalizeDirective();
  @override
  String modify(String value) => value.capitalize;
}

class TitleCaseDirective extends AttributeDirective<String> {
  const TitleCaseDirective();
  @override
  String modify(String value) => value.titleCase;
}

class SentenceCaseDirective extends AttributeDirective<String> {
  const SentenceCaseDirective();
  @override
  String modify(String value) => value.sentenceCase;
}

class UpperCaseDirective extends AttributeDirective<String> {
  const UpperCaseDirective();
  @override
  String modify(String value) => value.toUpperCase();
}

class LowerCaseDirective extends AttributeDirective<String> {
  const LowerCaseDirective();
  @override
  String modify(String value) => value.toLowerCase();
}
