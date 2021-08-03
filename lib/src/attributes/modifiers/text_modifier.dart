import 'package:mix/mix.dart';

import '../base_attribute.dart';

typedef TextModifier = AttributeModifier<String>;

/// Attribute that is able to modify text
class TextModifierAttribute extends TextMixAttribute<TextModifier> {
  const TextModifierAttribute(TextModifier modifier) : _modifier = modifier;

  /// Function to execute the modifier
  final AttributeModifier<String> _modifier;

  @override
  AttributeModifier<String> get value => _modifier;

  /// Short version for  [value.modify]
  String modify(String value) => _modifier.modify(value);
}

class CapitalizeModifier extends AttributeModifier<String> {
  const CapitalizeModifier();
  @override
  String modify(String value) => value.capitalize;
}

class TitleCaseModifier extends AttributeModifier<String> {
  const TitleCaseModifier();
  @override
  String modify(String value) => value.titleCase;
}

class SentenceCaseModifier extends AttributeModifier<String> {
  const SentenceCaseModifier();
  @override
  String modify(String value) => value.sentenceCase;
}

class UpperCaseModifier extends AttributeModifier<String> {
  const UpperCaseModifier();
  @override
  String modify(String value) => value.toUpperCase();
}

class LowerCaseModifier extends AttributeModifier<String> {
  const LowerCaseModifier();
  @override
  String modify(String value) => value.toLowerCase();
}
