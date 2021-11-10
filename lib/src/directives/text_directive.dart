import 'package:mix/src/attributes/base_attribute.dart';

enum TextDirectiveModifier {
  capitalize,
  titleCase,
  sentenceCase,
  lowerCase,
  upperCase,
}

/// Attribute that is able to modify text
class TextDirectiveAttribute extends Directive<String> {
  const TextDirectiveAttribute(this.modifier);

  /// Function to execute the directive
  final TextDirectiveModifier modifier;

  @override
  String modify(String value) {
    switch (modifier) {
      case TextDirectiveModifier.capitalize:
        return value.capitalize;
      case TextDirectiveModifier.titleCase:
        return value.titleCase;
      case TextDirectiveModifier.sentenceCase:
        return value.sentenceCase;
      case TextDirectiveModifier.lowerCase:
        return value.toLowerCase();
      case TextDirectiveModifier.upperCase:
        return value.toUpperCase();
    }
  }
}

extension StringExtensions on String {
  String get capitalize {
    final current = this;
    if (current.isEmpty) {
      return this;
    }

    return current[0].toUpperCase() + current.substring(1);
  }

  String get titleCase {
    const separator = ' ';
    final current = this;
    List<String> words =
        current.split(separator).map((word) => word.capitalize).toList();

    return words.join(separator);
  }

  String get sentenceCase {
    const separator = ' ';
    final current = this;
    List<String> words = current.split(separator);

    if (words.isNotEmpty) {
      words[0].capitalize;
    }

    return words.join(separator);
  }
}
