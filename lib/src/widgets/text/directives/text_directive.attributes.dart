import 'package:mix/src/directives/directive.dart';
import 'package:mix/src/widgets/text/text_helpers.dart';

enum TextModifier {
  capitalize,
  titleCase,
  sentenceCase,
  lowerCase,
  upperCase,
}

/// Attribute that is able to modify text
/// {@category Attributes}
/// {@subCategory Directives}
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
