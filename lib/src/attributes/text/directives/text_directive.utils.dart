import 'package:mix/mix.dart';

///
/// ## Widget
/// - [TextMix](TextMix-class.html)
///
/// Utility functions and short utils are listed in [Static Methods](#static-methods)
///
/// {@category Utilities}
/// {@subCategory Directives}
class TextDirectiveUtils {
  const TextDirectiveUtils._();

  /// Short Util: (none)
  static TextDirectiveAttribute directive(TextModifier modifier) {
    return TextDirectiveAttribute(modifier);
  }

  /// Short Util: upperCase
  static TextDirectiveAttribute upperCase() {
    return directive(TextModifier.upperCase);
  }

  /// Short Util: lowerCase
  static TextDirectiveAttribute lowerCase() {
    return directive(TextModifier.lowerCase);
  }

  /// Short Util: capitalize
  static TextDirectiveAttribute capitalize() {
    return directive(TextModifier.capitalize);
  }

  /// Short Util: sentenceCase
  static TextDirectiveAttribute sentenceCase() {
    return directive(TextModifier.sentenceCase);
  }

  /// Short Util: titleCase
  static TextDirectiveAttribute titleCase() {
    return directive(TextModifier.titleCase);
  }
}
