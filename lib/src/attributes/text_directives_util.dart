import '../core/attribute.dart';
import '../core/directive.dart';
import '../helpers/string_ext.dart';
import 'scalars/scalar_util.dart';

class TextDirectiveUtility<T extends StyleAttribute>
    extends MixUtility<T, TextDirective> {
  const TextDirectiveUtility(super.builder);
  T _wrap(Modifier<String> modifier) => builder(TextDirective([modifier]));

  T capitalize() => _wrap(_capitalize);
  T uppercase() => _wrap(_uppercase);
  T lowercase() => _wrap(_lowercase);
  T titleCase() => _wrap(_titleCase);
  T sentenceCase() => _wrap(_sentenceCase);

  T call(Modifier<String> modifier) => builder(TextDirective([modifier]));
}

String _capitalize(String value) => value.capitalize;
String _uppercase(String value) => value.toUpperCase();
String _lowercase(String value) => value.toLowerCase();
String _titleCase(String value) => value.titleCase;
String _sentenceCase(String value) => value.sentenceCase;
