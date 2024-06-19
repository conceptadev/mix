import 'package:analyzer/dart/element/element.dart';
import 'package:mix_generator/src/helpers/builder_utils.dart';
import 'package:mix_generator/src/helpers/dart_type_ext.dart';

String dtoValueExtension(DtoAnnotationContext context) {
  final resolvedType = getGenericTypeOfSuperclass(context.element);
  final className = context.name;

  /// resolvedType is a DartType
  /// I would like to check if all the fields are nullable or not for the fieldStatement
  /// But I don't know how to do it.
  ///
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
