import '../core/attribute.dart';
import '../core/directive.dart';
import '../helpers/string_ext.dart';
import '../specs/text/text_attribute.dart';
import 'scalars/scalar_util.dart';

mixin TextDirectiveUtilityMixin<T extends Attribute>
    on SpecUtility<TextSpecAttribute> {
  TextSpecAttribute capitalize() => _add(_capitalize);
  TextSpecAttribute uppercase() => _add(_uppercase);
  TextSpecAttribute lowercase() => _add(_lowercase);
  TextSpecAttribute titleCase() => _add(_titleCase);
  TextSpecAttribute sentenceCase() => _add(_sentenceCase);

  TextSpecAttribute _add(Modifier<String> modifier) =>
      TextSpecAttribute(directives: [
        ModifyTextDataDirective([modifier]),
      ]);
}

String _capitalize(String value) => value.capitalize();
String _uppercase(String value) => value.toUpperCase();
String _lowercase(String value) => value.toLowerCase();
String _titleCase(String value) => value.titleCase();
String _sentenceCase(String value) => value.sentenceCase();
