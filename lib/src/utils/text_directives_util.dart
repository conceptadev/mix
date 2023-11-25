import '../core/directive.dart';
import '../helpers/string_ext.dart';

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

  static String capitalize(String value) => value.capitalize;
  static String uppercase(String value) => value.toUpperCase();
  static String lowercase(String value) => value.toLowerCase();
  static String titleCase(String value) => value.titleCase;
  static String sentenceCase(String value) => value.sentenceCase;
}
