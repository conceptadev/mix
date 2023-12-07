import '../core/attribute.dart';
import '../core/directive.dart';
import '../helpers/string_ext.dart';
import '../specs/text/text_attribute.dart';
import 'scalars/scalar_util.dart';

final capitalize = _textDirective(TextModifiers.capitalize);
final uppercase = _textDirective(TextModifiers.uppercase);
final lowercase = _textDirective(TextModifiers.lowercase);
final titleCase = _textDirective(TextModifiers.titleCase);
final sentenceCase = _textDirective(TextModifiers.sentenceCase);

TextSpecAttribute Function() _textDirective(Modifier<String> modifier) =>
    () => TextSpecAttribute(directives: [TextDirective(modifier)]);

class TextDirectiveUtility<T extends StyleAttribute>
    extends ScalarUtility<T, TextDirective> {
  const TextDirectiveUtility(super.builder);
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
