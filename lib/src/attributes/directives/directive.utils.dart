import 'package:mix/src/attributes/directives/directive.attributes.dart';

class DirectivesUtility {
  const DirectivesUtility._();
  static const capitalize = TextDirectiveAttribute(TextModifier.capitalize);
  static const upperCase = TextDirectiveAttribute(TextModifier.upperCase);
  static const lowerCase = TextDirectiveAttribute(TextModifier.lowerCase);
  static const titleCase = TextDirectiveAttribute(TextModifier.titleCase);
  static const sentenceCase = TextDirectiveAttribute(TextModifier.sentenceCase);
}
