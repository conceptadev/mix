import 'package:analyzer/dart/element/element.dart';

import '../helpers/field_info.dart';
import '../helpers/type_ref_repository.dart';
import '../mixable_class_utility_generator.dart';

/// Generates the utility statements for public consts
/// static methods of `mappingElement` in the context
///
/// For example:
/// T staticValue() => build(ClassElement.staticValue);
String generateUtilityFieldsFromClass(ClassElement element) {
  final fieldStatements = <String>[];

  final constructors = element.constructors.where((constructor) {
    return isValidConstructor(constructor);
  });

  for (var constructor in constructors) {
    final utilityConstructor = generateUtilityForConstructor(
      constructor,
      skipCallMethod: true,
    );
    if (utilityConstructor.isNotEmpty) {
      fieldStatements.add(utilityConstructor);
    }
  }

  return fieldStatements.join('\n');
}

String generateUtilityForConstructor(
  ConstructorElement constructor, {
  bool skipCallMethod = false,
  ClassElement? mappedEl,
}) {
  final isConst = constructor.isConst;
  final isUnamed = constructor.name.isEmpty;

  mappedEl ??= constructor.enclosingElement as ClassElement;

  if (isUnamed && skipCallMethod) return '';

  final name = constructor.name.isEmpty ? '' : '.${constructor.name}';
  final methodName = constructor.name.isEmpty ? 'call' : constructor.name;
  final type = mappedEl.name;

  final parameters = constructor.parameters;

  final constStatement = isConst && parameters.isEmpty ? 'const' : '';

  final signatureRequiredParams = <String>[];
  final invocationRequiredParams = <String>[];
  final signatureOptionalParams = <String>[];
  final invocationOptionalParams = <String>[];
  final signatureNamedParams = <String>[];
  final invocationNamedParams = <String>[];

  for (var param in parameters) {
    final paramName = param.name;
    final paramType = param.type.getDisplayString(withNullability: true);
    final defaultValue =
        param.defaultValueCode != null ? ' = ${param.defaultValueCode}' : '';

    if (param.isPositional) {
      if (param.isRequiredPositional) {
        signatureRequiredParams.add('$paramType $paramName$defaultValue');
        invocationRequiredParams.add(paramName);
      } else {
        signatureOptionalParams.add('$paramType $paramName$defaultValue');
        invocationOptionalParams.add(paramName);
      }
    } else if (param.isNamed) {
      final requiredParam = param.isRequiredNamed ? 'required' : '';
      signatureNamedParams
          .add('$requiredParam $paramType $paramName$defaultValue');
      invocationNamedParams.add('$paramName: $paramName');
    }
  }

  final signatureParams = [
    ...signatureRequiredParams,
    if (signatureOptionalParams.isNotEmpty)
      '[${signatureOptionalParams.join(', ')}]',
    if (signatureNamedParams.isNotEmpty) '{${signatureNamedParams.join(', ')}}',
  ].join(', ');

  final invocationParams = [
    ...invocationRequiredParams,
    if (invocationOptionalParams.isNotEmpty)
      invocationOptionalParams.join(', '),
    if (invocationNamedParams.isNotEmpty) invocationNamedParams.join(', '),
  ].join(', ');

  final signature = 'T $methodName($signatureParams)';
  final invocation = 'build($constStatement $type$name($invocationParams))';

  final totalCharacters = signature.length + invocation.length;
  String signatureLine;

  if (totalCharacters > 80) {
    signatureLine = '$signature { return $invocation;} ';
  } else {
    signatureLine = '$signature => $invocation;';
  }

  return '''
/// Creates an [Attribute] instance using the [$type$name] constructor.
$signatureLine
''';
}

/// Generates utility fields for the given attribute class and fields.
String generateUtilityFields(String className, List<ParameterInfo> fields) {
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
  return '$utilityName((v) => only($fieldName: v))';
}

String utilityMethodOnlyBuilder({
  required String utilityType,
  required List<ParameterInfo> fields,
}) {
  final fieldStatements = fields.map((e) {
    final fieldName = e.name;

    return '$fieldName: $fieldName,';
  }).join('\n');

  final optionalParameters = fields.map((e) {
    final fieldType = e.dtoType ?? e.type;

    return '$fieldType? ${e.name},';
  }).join('\n');

  final onlyParams = fields.isEmpty ? '' : '{$optionalParameters}';

  return '''
  /// Returns a new [$utilityType] with the specified properties.
  @override
  T only($onlyParams) {
    return build($utilityType(
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

    return '$fieldType? ${field.name},';
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
