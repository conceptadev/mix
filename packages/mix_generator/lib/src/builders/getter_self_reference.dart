import '../helpers/field_info.dart';

String getterSelfBuilder(ClassInfo instance) {
  final className = instance.name;
  return '$className get ${ParameterInfo.internalRefPrefix} => this as $className;';
}
