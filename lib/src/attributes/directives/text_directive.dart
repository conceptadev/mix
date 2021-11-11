import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/helpers/utils.dart';

enum TextDirectiveModifier {
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
  final TextDirectiveModifier modifier;

  @override
  String modify(String value) {
    switch (modifier) {
      case TextDirectiveModifier.capitalize:
        return capitalize(value);
      case TextDirectiveModifier.titleCase:
        return titleCase(value);
      case TextDirectiveModifier.sentenceCase:
        return sentenceCase(value);
      case TextDirectiveModifier.lowerCase:
        return value.toLowerCase();
      case TextDirectiveModifier.upperCase:
        return value.toUpperCase();
    }
  }
}
