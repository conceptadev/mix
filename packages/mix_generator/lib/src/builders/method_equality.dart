import 'package:mix_generator/src/helpers/field_info.dart';

String getterPropsBuilder({
  required String className,
  required List<ParameterInfo> fields,
  bool isInternalRef = false,
}) {
  final fieldStatements = fields.map((field) {
    final fieldName = isInternalRef ? field.asInternalRef : field.name;
    return '$fieldName,';
  }).join('\n');

  return '''
  /// The list of properties that constitute the state of this [$className].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [$className] instances for equality.
  @override
  List<Object?> get props => [
      $fieldStatements
    ];
''';
}

String methodEqualityOperatorBuilder({
  required String className,
  required List<FieldInfo> fields,
  bool isInternalRef = false,
}) {
  final equalityChecks = fields.map((field) {
    if (field.isListType) {
      return 'listEquals(other.${field.name}, ${field.name})';
    } else if (field.isMapType) {
      return 'mapEquals(other.${field.name}, ${field.name})';
    } else if (field.isSetType) {
      return 'setEquals(other.${field.name}, ${field.name})';
    }

    return 'other.${field.name} == ${field.name}';
  }).join(' && ');

  return '''
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is $className && $equalityChecks;
  }
''';
}

String getterHashcodeBuilder({
  required List<ParameterInfo> fields,
  bool isInternalRef = false,
}) {
  final fieldStatements = fields.map((field) {
    final fieldName = isInternalRef ? field.asInternalRef : field.name;
    return '$fieldName.hashCode';
  }).join(' ^ ');

  return '''
  @override
  int get hashCode => $fieldStatements;
''';
}
