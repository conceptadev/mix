import 'package:mix_generator/src/helpers/field_info.dart';

const _expandableFields = ['decoration', 'style'];

String methodDebugFillProperties({
  required String className,
  required List<ParameterInfo> fields,
  bool isInternalRef = false,
}) {
  final fieldStatements = fields.map((field) {
    final fieldName = isInternalRef ? field.asInternalRef : field.name;
    if (_expandableFields.contains(fieldName)) {
      return 'properties.add(DiagnosticsProperty(\'$fieldName\', $fieldName, expandableValue: true, defaultValue: null));';
    }
    return 'properties.add(DiagnosticsProperty(\'$fieldName\', $fieldName, defaultValue: null));';
  }).join('\n');

  return '''
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    $fieldStatements
  }
''';
}
