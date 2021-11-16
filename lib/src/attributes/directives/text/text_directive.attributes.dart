import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/helpers/utils.dart';

enum TextModifier {
  capitalize,
  titleCase,
  sentenceCase,
  lowerCase,
  upperCase,
}

/// Attribute that is able to modify text
class TextDirectiveAttribute extends DirectiveAttribute<String> {
  const TextDirectiveAttribute(this.modifier);

  /// Function to execute the directive
  final TextModifier modifier;

  @override
  String modify(String value) {
    switch (modifier) {
      case TextModifier.capitalize:
        return capitalize(value);
      case TextModifier.titleCase:
        return titleCase(value);
      case TextModifier.sentenceCase:
        return sentenceCase(value);
      case TextModifier.lowerCase:
        return value.toLowerCase();
      case TextModifier.upperCase:
        return value.toUpperCase();
    }
  }
}
