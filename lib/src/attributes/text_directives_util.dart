import '../core/directive.dart';
import '../helpers/string_ext.dart';

class TextDataDirectiveUtility {
  const TextDataDirectiveUtility();
  TextDataDirective _wrap(Modifier<String> modifier) => TextDataDirective([modifier]);

  TextDataDirective capitalize() => _wrap(_capitalize);
  TextDataDirective uppercase() => _wrap(_uppercase);
  TextDataDirective lowercase() => _wrap(_lowercase);
  TextDataDirective titleCase() => _wrap(_titleCase);
  TextDataDirective sentenceCase() => _wrap(_sentenceCase);

  TextDataDirective call(Modifier<String> modifier) {
    return TextDataDirective([modifier]);
  }
}

String _capitalize(String value) => value.capitalize;
String _uppercase(String value) => value.toUpperCase();
String _lowercase(String value) => value.toLowerCase();
String _titleCase(String value) => value.titleCase;
String _sentenceCase(String value) => value.sentenceCase;
