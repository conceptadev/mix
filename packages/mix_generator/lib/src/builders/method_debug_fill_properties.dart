import 'package:mix_generator/src/helpers/field_info.dart';

String methodDebugFillProperties({
  required String className,
  required List<ParameterInfo> fields,
  bool isInternalRef = false,
}) {
  final fieldStatements = fields.map((field) {
    final fieldName = isInternalRef ? field.asInternalRef : field.name;
    if (fieldName == 'decoration') {
      return 'properties.add(DiagnosticsProperty(\'$fieldName\', $fieldName, defaultValue: null, expandableValue: true));';
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
