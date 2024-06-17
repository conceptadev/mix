import 'package:mix_builder/src/helpers/builder_utils.dart';

String dtoValueExtension(DtoAnnotationContext context) {
  final resolvedType = context.resolvedType;
  final className = context.name;

  final fieldStatements = context.fields.map((field) {
    final fieldName = field.name;
    final fieldNameRef = field.nullable ? '$fieldName?' : fieldName;

    if (field.hasDto) {
      if (field.isListType) {
        return '''
  $fieldName: $fieldNameRef.map((e) => e.toDto()).toList(),
''';
      }
      return '$fieldName: $fieldNameRef.toDto(),';
    }

    return '$fieldName: $fieldName,';
  }).join('\n      ');

  return '''
extension ${resolvedType}MixExt on $resolvedType {
  $className toDto() {
    return $className(
      $fieldStatements
    );
  }
}
''';
}
