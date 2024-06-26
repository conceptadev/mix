import 'package:analyzer/dart/element/element.dart';
import 'package:mix_generator/src/helpers/builder_utils.dart';
import 'package:mix_generator/src/helpers/dart_type_ext.dart';

String dtoValueExtension(DtoAnnotationContext context) {
  final resolvedType = context.element.getGenericTypeOfSuperclass();
  final className = context.name;

  final resolvedTypeElement = resolvedType?.element;

  final params = <String, ParameterElement>{};

  if (resolvedTypeElement is ClassElement) {
    resolvedTypeElement.unnamedConstructor?.parameters.forEach((element) {
      params[element.name] = element;
    });
  }
  final fieldStatements = context.fields.map((field) {
    final fieldName = field.name;
    final paramIsNullable = params[fieldName]?.type.isNullableType ?? false;
    final fieldNameRef = paramIsNullable ? '$fieldName?' : fieldName;

    if (field.hasDto) {
      if (field.isListType) {
        return '$fieldName: $fieldNameRef.map((e) => e.toDto()).toList(),';
      }
      return '$fieldName: $fieldNameRef.toDto(),';
    }

    return '$fieldName: $fieldName,';
  }).join('\n');

  final resolvedTypeName =
      resolvedType?.getDisplayString(withNullability: false);
  return '''
extension ${resolvedTypeName}MixExt on $resolvedTypeName {
  $className toDto() {
    return $className(
      $fieldStatements
    );
  }
}
''';
}

String dtoListValueExtension(DtoAnnotationContext context) {
  final resolvedType = context.element.getGenericTypeOfSuperclass();
  final className = context.name;
  final resolvedTypeName =
      resolvedType?.getDisplayString(withNullability: false);

  return '''
extension List${resolvedTypeName}MixExt on List<$resolvedTypeName> {
  List<$className> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
''';
}
