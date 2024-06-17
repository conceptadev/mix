import 'package:mix_builder/src/helpers/field_info.dart';

String getterSelfBuilder({required String className}) {
  return '$className get ${ParameterInfo.internalRefPrefix} => this as $className;';
}
