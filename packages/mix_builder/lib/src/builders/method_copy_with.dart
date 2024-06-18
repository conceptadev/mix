import 'package:mix_builder/src/helpers/field_info.dart';

String copyWithMethodBuilder({
  required String className,
  required List<ParameterInfo> fields,
  bool isInternalRef = false,
}) {
  final fieldStatements = fields.map((field) {
    final fieldName =
        isInternalRef ? field.asInternalRef : 'this.${field.name}';
    return '${field.name}: ${field.name} ?? $fieldName';
  }).join(',\n      ');

  return '''
  /// Creates a copy of this [$className] but with the given fields
  /// replaced with the new values.
  @override
  $className copyWith({
    ${fields.map((field) => '${field.type}? ${field.name},').join('\n    ')}
  }) {
    return $className(
      $fieldStatements,
    );
  }
''';
}
