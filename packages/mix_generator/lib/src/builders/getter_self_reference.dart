import 'package:mix_generator/src/helpers/field_info.dart';

String getterSelfBuilder({required String className}) {
  return '$className get ${ParameterInfo.internalRefPrefix} => this as $className;';
}
