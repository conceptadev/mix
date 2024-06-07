import 'package:code_builder/code_builder.dart';
import 'package:mix_builder/src/helpers/field_info.dart';

extension ListFieldInfoExt on List<ParameterInfo> {
  List<ParameterInfo> get nonSuper {
    return where((f) => !f.isSuper).toList();
  }

  List<Field> get classFields {
    return nonSuper.map(_fieldInfoFieldBuilder).toList();
  }

  List<Field> get classDtoFields {
    return nonSuper.map(_fieldInfoDtoFieldBuilder).toList();
  }

  List<Parameter> get constructorParams {
    return map(_fieldAsNamedConstructorParamBuilder).toList();
  }

  List<Parameter> get methodParams {
    return map(_fieldAsNamedMethodParamBuilder).toList();
  }

  List<Parameter> get methodDtoParams {
    return map(__fieldAsNamedMethodDtoParamBuilder).toList();
  }
}

Parameter __fieldAsNamedMethodDtoParamBuilder(ParameterInfo field) {
  return Parameter((b) {
    b
      ..name = field.name
      ..type = refer(field.dtoType)
      ..named = true;
  });
}

Field _fieldInfoFieldBuilder(ParameterInfo field) {
  return Field((b) {
    b
      ..name = field.name
      ..type = refer(field.asNullableType)
      ..modifier = FieldModifier.final$
      ..docs.add(field.documentationComment ?? '');
  });
}

Field _fieldInfoDtoFieldBuilder(ParameterInfo field) {
  return Field((b) {
    b
      ..name = field.name
      ..type = refer(field.dtoType)
      ..modifier = FieldModifier.final$;
  });
}

Parameter _fieldAsNamedConstructorParamBuilder(ParameterInfo field) {
  return Parameter((b) {
    b.name = field.name;
    b.toThis = !field.isSuper;
    b.named = true;
    b.required = false;
    b.toSuper = field.isSuper;
  });
}

Parameter _fieldAsNamedMethodParamBuilder(ParameterInfo field) {
  return Parameter((builder) {
    builder.name = field.name;
    builder.named = true;
    builder.required = false;
    builder.type = refer('${field.asNullableType}');
  });
}
