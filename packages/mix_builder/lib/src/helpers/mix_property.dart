import 'package:code_builder/code_builder.dart';
import 'package:mix_builder/src/helpers/builder_utils.dart';
import 'package:mix_builder/src/helpers/field_info.dart';

extension ListFieldInfoExt on List<ParameterInfo> {
  List<ParameterInfo> get nonSuper {
    return where((f) => !f.isSuper).toList();
  }

  List<Field> get classFields {
    return nonSuper.map((e) {
      return Field((b) {
        b
          ..name = e.name
          ..type = refer(e.asNullableType)
          ..modifier = FieldModifier.final$
          ..docs.add(e.documentationComment ?? '');
      });
    }).toList();
  }

  List<Field> get classDtoFields {
    return nonSuper.map((e) {
      final fieldType = (e.dtoType ?? refer(e.asRequiredType)).nullable;
      return Field((b) {
        b
          ..name = e.name
          ..type = fieldType
          ..modifier = FieldModifier.final$;
      });
    }).toList();
  }

  List<Parameter> get constructorParams {
    return map((e) {
      return Parameter((b) {
        b.name = e.name;
        b.toThis = !e.isSuper;
        b.named = true;
        b.required = false;
        b.toSuper = e.isSuper;
      });
    }).toList();
  }

  List<Parameter> get methodParams {
    return map((e) {
      return Parameter((builder) {
        builder.name = e.name;
        builder.named = true;
        builder.required = false;
        builder.type = refer('${e.asNullableType}');
      });
    }).toList();
  }

  List<Parameter> get methodDtoParams {
    return map((e) {
      final fieldType = (e.dtoType ?? refer(e.asRequiredType)).nullable;

      // Create a nullable
      return Parameter((b) {
        b
          ..name = e.name
          ..type = fieldType
          ..named = true;
      });
    }).toList();
  }

  Iterable<Field> get utilityFields {
    final fields = <Field>[];
    for (final field in this) {
      fields.add(
        Field(
          (b) => b
            ..modifier = FieldModifier.final$
            ..late = true
            ..name = field.name
            ..assignment = field.utilityExpression?.code,
        ),
      );

      if (field.annotation.utilityProps != null) {
        for (final property in field.annotation.utilityProps!) {
          fields.add(
            Field(
              (b) => b
                ..modifier = FieldModifier.final$
                ..late = true
                ..name = property
                ..assignment = Code('${field.name}.$property'),
            ),
          );
        }
      }
    }

    return fields;
  }
}
