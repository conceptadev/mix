import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_generator/src/helpers/field_info.dart';

String toDtoExtension(ClassBuilderContext<MixableDto> context) {
  final resolvedType = context.referenceClass;

  final className = context.name;

  final params = <String, ParameterInfo>{};

  resolvedType.unnamedConstructor?.parameters.forEach((element) {
    params[element.name] = ParameterInfo.ofElement(element);
  });

  final fieldStatements = context.fields.map((field) {
    final fieldName = field.name;
    final paramIsNullable = params[fieldName]?.nullable ?? false;
    final fieldNameRef = paramIsNullable ? '$fieldName?' : fieldName;

    if (field.hasDto) {
      if (field.isListType) {
        return '$fieldName: $fieldNameRef.map((e) => e.toDto()).toList(),';
      }
      return '$fieldName: $fieldNameRef.toDto(),';
    }

    return '$fieldName: $fieldName,';
  }).join('\n');

  final resolvedTypeName = resolvedType.name;
  return '''
extension ${resolvedTypeName}MixExt on $resolvedTypeName {
  $className toDto() {
    return $className(
      $fieldStatements
    );
  }
}

extension List${resolvedTypeName}MixExt on List<$resolvedTypeName> {
  List<$className> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
''';
}
