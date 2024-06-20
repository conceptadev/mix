import 'package:mix_generator/src/helpers/field_info.dart';
import 'package:mix_generator/src/helpers/type_ref_repository.dart';

/// Generates utility fields for the given attribute class and fields.
String generateUtilityFields(
  String className,
  List<ParameterInfo> fields,
) {
  final expressions = <String>[];

  for (final field in fields) {
    final annotatedUtilities = field.annotation.utilities ?? [];
    final propertyName = field.name;
    final utilityName = typeRefs.getUtilityName(field.dartType);

    if (annotatedUtilities.isEmpty) {
      expressions.add(
        _generateUtilityField(
          docPath: '$className.${field.name}',
          aliasName: field.name,
          utilityExpression: _utilityExpression(
            fieldName: propertyName,
            utilityName: utilityName,
          ),
        ),
      );
    } else {
      for (final extraUtil in annotatedUtilities) {
        final aliasName = extraUtil.alias ?? propertyName;

        String aliasUtilityName;

        if (extraUtil.typeAsString != null) {
          aliasUtilityName =
              typeRefs.getUtilityNameFromTypeName(extraUtil.typeAsString!);
        } else {
          aliasUtilityName = utilityName;
        }

        expressions.add(_generateUtilityField(
          docPath: '$className.$propertyName',
          aliasName: aliasName,
          utilityExpression: _utilityExpression(
            fieldName: propertyName,
            utilityName: aliasUtilityName,
          ),
        ));

        final nestedUtilities = extraUtil.properties;

        for (final nestedUtility in nestedUtilities) {
          final pathName = nestedUtility.path;
          final nestedAliasName = nestedUtility.alias;

          expressions.add(_generateUtilityField(
            docPath: '$className.$aliasName.$pathName',
            aliasName: nestedAliasName,
            utilityExpression: '$aliasName.$pathName',
          ));
        }
      }
    }
  }

  return expressions.join('\n');
}

/// Generates a utility field string based on the provided parameters.
String _generateUtilityField({
  required String docPath,
  required String aliasName,
  required String utilityExpression,
}) {
  return '''
/// Utility for defining [$docPath]
late final $aliasName = $utilityExpression;
''';
}

String _utilityExpression({
  required String fieldName,
  required String utilityName,
}) {
  if (utilityName == 'InlineModifierUtility') {
    return '${utilityName}((v) => only(${fieldName}: ModifierDto(v)))';
  }
  return '${utilityName}((v) => only(${fieldName}: v))';
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
    final fieldType = field.hasDto
        ? typeRefs.getResolvedTypeFromDto(field.dartType)
        : field.type;
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
