import '../core/directive.dart';

const capitalize = TextDirectiveUtility(TextModifiers.capitalize);
const uppercase = TextDirectiveUtility(TextModifiers.uppercase);
const lowercase = TextDirectiveUtility(TextModifiers.lowercase);
const titleCase = TextDirectiveUtility(TextModifiers.titleCase);
const sentenceCase = TextDirectiveUtility(TextModifiers.sentenceCase);

class TextDirectiveUtility {
  final Modifier<String> value;
  const TextDirectiveUtility(this.value);

  TextDirectiveAttribute call() {
    return TextDirectiveAttribute(TextDirective(value));
  }
}

//  This is mostly used for testing, and easy reference of the modifier itself.
class TextModifiers {
  const TextModifiers._();

  static String capitalize(value) => value.capitalize;
  static String uppercase(value) => value.toUpperCase();
  static String lowercase(value) => value.toLowerCase();
  static String titleCase(value) => value.titleCase;
  static String sentenceCase(value) => value.sentenceCase;
}
