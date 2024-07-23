import 'package:mix_generator/src/helpers/field_info.dart';

const _expandableFields = ['decoration', 'style'];

String methodDebugFillProperties(ClassInfo instance) {
  // Return if its not a mix class
  if (!instance.mixinTypes.contains('Diagnosticable')) return '';

  final fields = instance.fields;
  final isInternalRef = instance.isInternalRef;
  final fieldStatements = fields.map((field) {
    final fieldName = isInternalRef ? field.asInternalRef : field.name;
    if (_expandableFields.contains(fieldName)) {
      return 'properties.add(DiagnosticsProperty(\'$fieldName\', $fieldName, expandableValue: true));';
    }
    return 'properties.add(DiagnosticsProperty(\'$fieldName\', $fieldName));';
  }).join('\n');

  return '''
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    $fieldStatements
  }
''';
}
