import '../core/extensions/string_ext.dart';
import '../directives/directive.dart';

final capitalize = TextDirectiveUtility((value) => value.capitalize);
final uppercase = TextDirectiveUtility((value) => value.toUpperCase());
final lowercase = TextDirectiveUtility((value) => value.toLowerCase());
final titleCase = TextDirectiveUtility((value) => value.titleCase);
final sentenceCase = TextDirectiveUtility((value) => value.sentenceCase);

class TextDirectiveUtility {
  final Modifier<String> value;
  const TextDirectiveUtility(this.value);

  TextDirectiveAttribute call() {
    return TextDirectiveAttribute([TextDirective(value)]);
  }
}
