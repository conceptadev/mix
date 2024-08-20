import '../helpers/field_info.dart';

const _expandableFields = ['decoration', 'style'];

String methodDebugFillProperties(ClassInfo instance) {
  final fields = instance.fields;
  final isInternalRef = instance.isInternalRef;
  final fieldStatements = fields.map((field) {
    final fieldName = isInternalRef ? field.asInternalRef : field.name;
    if (_expandableFields.contains(fieldName)) {
      return 'properties.add(DiagnosticsProperty(\'${field.name}\', $fieldName, expandableValue: true, defaultValue: null));';
    }

    return 'properties.add(DiagnosticsProperty(\'${field.name}\', $fieldName, defaultValue: null));';
  }).join('\n');

  if (isInternalRef) {
    return '''
  
  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {  
    $fieldStatements
  }
  ''';
  }

  return '''
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    $fieldStatements
  }
''';
}
