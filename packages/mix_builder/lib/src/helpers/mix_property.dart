import 'package:code_builder/code_builder.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_builder/src/helpers/builder_utils.dart';
import 'package:mix_builder/src/helpers/field_info.dart';
import 'package:source_gen/source_gen.dart';

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

  Iterable<Field> getUtilityFields(String attributeClassName) {
    final fields = <Field>[];
    for (final field in this) {
      final utilityName = field.utilityName;
      final comment =
          '/// Utility for defining [$attributeClassName.${field.name}]';

      fields.add(
        Field(
          (b) => b
            ..modifier = FieldModifier.final$
            ..late = true
            ..docs.add(comment)
            ..name = field.utilityName
            ..assignment =
                _utilityExpression(field.utilityName, field.utilityType),
        ),
      );

      final extraUtilities = field.annotation.utility?.extraUtilities ?? [];

      if (extraUtilities.any((element) => element.alias == null)) {
        throw InvalidGenerationSourceError(
          'Extra utilities must have an alias for field ${field.utilityName}',
        );
      }

      for (final extraUtil in extraUtilities) {
        fields.add(
          Field(
            (b) => b
              ..modifier = FieldModifier.final$
              ..late = true
              ..docs.add(comment)
              ..name = extraUtil.alias
              ..assignment = _utilityExpression(
                  field.utilityName, refer(extraUtil.typeAsString!)),
          ),
        );
      }

      final fieldUtilities = field.annotation.utility?.properties ?? [];

      //  each field might have more fields so I need you add them recursively recursively

      fields.addAll(getUtilityPropertiesAsFields(
        utilityName,
        fieldUtilities,
        attributeClassName,
      ));
    }

    return fields;
  }
}

Code? _utilityExpression(String fieldName, Reference? utilityType) =>
    utilityType
        ?.call([CodeExpression(Code('(v) => only(${fieldName}: v)'))]).code;

List<Field> getUtilityPropertiesAsFields(
  String utilityPath,
  List<MixableFieldProperty> utilities,
  String attributeClassName,
) {
  final fields = <Field>[];
  for (final utility in utilities) {
    final name = utility.alias ?? utility.property;

    final propertyPath = '$utilityPath.${utility.property}';

    fields.add(
      Field(
        (b) => b
          ..docs.add(
              '/// Utility for defining [$attributeClassName.$propertyPath]')
          ..modifier = FieldModifier.final$
          ..late = true
          ..name = name
          ..assignment = Code(propertyPath),
      ),
    );
    if (utility.properties?.isNotEmpty == true) {
      fields.addAll(getUtilityPropertiesAsFields(
        [...utilityPath.split('.'), name].join('.'),
        utility.properties!,
        attributeClassName,
      ));
    }
  }

  return fields;
}
