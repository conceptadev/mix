import 'package:mix/annotations.dart';
import 'package:mix_builder/src/helpers/field_info.dart';
import 'package:source_gen/source_gen.dart';

String utilityFields(String attributeClassName, List<ParameterInfo> fields) {
  final fieldStrings = <String>[];

  for (final field in fields) {
    final utilityName = field.utilityName;

    fieldStrings.add('''
/// Utility for defining [$attributeClassName.${field.name}]
late final $utilityName = ${_utilityExpression(field)};
''');

    final extraUtilities = field.annotation.utility?.extraUtilities ?? [];

    if (extraUtilities.any((element) => element.alias == null)) {
      throw InvalidGenerationSource(
        'Extra utilities must have an alias for field ${field.utilityName}',
      );
    }

    for (final extraUtil in extraUtilities) {
      fieldStrings.add('''
/// Utility for defining [$attributeClassName.${field.name}]
late final ${extraUtil.alias} = ${extraUtil.typeAsString}((v) => only(${field.name}: v));
''');
    }

    final fieldUtilities = field.annotation.utility?.properties ?? [];

    fieldStrings.add(_utilityPropertiesAsFields(
      utilityName,
      fieldUtilities,
      attributeClassName,
    ));
  }

  return fieldStrings.join('\n');
}

String? _utilityExpression(ParameterInfo field) {
  final utilityType = field.utilityType;
  final fieldName = field.name;

  return utilityType != null
      ? '${utilityType}((v) => only(${fieldName}: v))'
      : null;
}

String _utilityPropertiesAsFields(
  String utilityPath,
  List<MixableFieldProperty> utilities,
  String attributeClassName,
) {
  final fieldStrings = <String>[];

  for (final utility in utilities) {
    final name = utility.alias ?? utility.property;
    final propertyPath = '$utilityPath.${utility.property}';

    fieldStrings.add('''
/// Utility for defining [$attributeClassName.$propertyPath]
late final $name = $propertyPath;
''');

    if (utility.properties?.isNotEmpty == true) {
      fieldStrings.add(_utilityPropertiesAsFields(
        propertyPath,
        utility.properties!,
        attributeClassName,
      ));
    }
  }

  return fieldStrings.join('\n');
}

String utilityMethodOnlyBuilder({
  required String utilityType,
  required List<ParameterInfo> fields,
}) {
  final fieldStatements = fields.map((e) {
    final fieldName = e.name;
    return '${fieldName}: $fieldName,';
  }).join('\n');

  final optionalParameters = fields.map((e) {
    final fieldType = e.dtoType ?? e.type;
    return '$fieldType? ${e.name},';
  }).join('\n');

  return '''
  /// Returns a new [$utilityType] with the specified properties.
  @override
  T only({
    $optionalParameters
  }) {
    return builder($utilityType(
      $fieldStatements
    ));
  }
''';
}

String utilityMethodCallBuilder(List<ParameterInfo> fields) {
  final optionalParameters = fields.map((field) {
    final fieldType = field.asResolvedType;
    return '${fieldType}? ${field.name},';
  }).join('\n');

  final fieldStatements = fields.map((field) {
    final fieldName = field.name;

    if (field.hasDto) {
      if (field.isListType) {
        return '$fieldName: $fieldName?.map((e) => e.toDto()).toList(),';
      }
      return '$fieldName: $fieldName?.toDto(),';
    }
    return '$fieldName: $fieldName,';
  }).join('\n');

  return '''
T call({
  $optionalParameters
}) {
  return only(
    $fieldStatements
  );
}
''';
}
