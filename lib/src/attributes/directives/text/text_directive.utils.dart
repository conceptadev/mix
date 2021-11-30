import 'package:mix/mix.dart';

class TextDirectiveUtils {
  const TextDirectiveUtils._();

  static TextDirectiveAttribute directive(TextModifier modifier) {
    return TextDirectiveAttribute(modifier);
  }

  static TextDirectiveAttribute upperCase() {
    return directive(TextModifier.upperCase);
  }

  static TextDirectiveAttribute lowerCase() {
    return directive(TextModifier.lowerCase);
  }

  static TextDirectiveAttribute capitalize() {
    return directive(TextModifier.capitalize);
  }

  static TextDirectiveAttribute sentenceCase() {
    return directive(TextModifier.sentenceCase);
  }

  static TextDirectiveAttribute titleCase() {
    return directive(TextModifier.titleCase);
  }
}
