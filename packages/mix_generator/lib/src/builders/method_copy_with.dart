import 'package:mix_generator/src/helpers/field_info.dart';
import 'package:mix_generator/src/helpers/helpers.dart';

String copyWithMethodBuilder(ClassInfo instance) {
  final fields = instance.fields;
  final className = instance.name;

  final isInternalRef = instance.isInternalRef;

  final fieldStatements = buildConstructorParams(fields, (field) {
    final fieldName =
        isInternalRef ? field.asInternalRef : 'this.${field.name}';
    return '${field.name} ?? $fieldName';
  });

  final optionalParams =
      '${fields.map((field) => '${field.type}? ${field.name},').join('\n')}';

  final copyWithParams = fields.isEmpty ? '' : '{$optionalParams}';

  final shouldAddConst = fields.isEmpty && instance.isConst;

  return '''
  /// Creates a copy of this [$className] but with the given fields
  /// replaced with the new values.
  @override
  $className copyWith($copyWithParams) {
     return ${shouldAddConst ? 'const' : ''} ${instance.writeConstructor()}($fieldStatements);
  }
''';
}
