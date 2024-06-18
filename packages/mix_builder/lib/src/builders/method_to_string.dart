import 'package:mix_builder/src/helpers/field_info.dart';

String toStringMethodBuilder({
  required String className,
  required List<ParameterInfo> fields,
  bool isInternalRef = false,
}) {
  final fieldStatements = fields.map((field) {
    final fieldName = isInternalRef ? field.asInternalRef : field.name;
    return '${field.name}: $fieldName,';
  }).join('\n');

  return '''
  @override
  String toString() {
    return '$className(
      $fieldStatements
    )';
  }
''';
}
