import '../../core/directive.dart';
import '../../core/element.dart';
import '../../core/utility.dart';
import '../../internal/string_ext.dart';

final class TextDirectiveMixUtility<T extends Attribute>
    extends MixUtility<T, TextDirectiveMix> {
  const TextDirectiveMixUtility(super.builder);
  T _wrap(Modifier<String> modifier) => builder(TextDirectiveMix([modifier]));

  T capitalize() => _wrap(_capitalize);
  T uppercase() => _wrap(_uppercase);
  T lowercase() => _wrap(_lowercase);
  T titleCase() => _wrap(_titleCase);
  T sentenceCase() => _wrap(_sentenceCase);

  T call(Modifier<String> modifier) => builder(TextDirectiveMix([modifier]));
}

String _capitalize(String value) => value.capitalize;
String _uppercase(String value) => value.toUpperCase();
String _lowercase(String value) => value.toLowerCase();
String _titleCase(String value) => value.titleCase;
String _sentenceCase(String value) => value.sentenceCase;
