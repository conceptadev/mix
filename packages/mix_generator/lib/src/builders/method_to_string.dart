import '../helpers/field_info.dart';

String toStringMethodBuilder({
  required ClassInfo instance,
  bool isInternalRef = false,
}) {
  final className = instance.name;
  final fields = instance.fields;
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
