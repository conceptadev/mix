import 'package:analyzer/dart/element/element.dart';

import '../../core/models/field_metadata.dart';
import '../../core/type_registry.dart';
import '../../core/utils/constructor_utils.dart';
import '../../core/utils/dart_type_utils.dart';

/// Generates the utility statements for public consts
/// static methods of `mappingElement` in the context
///
/// For example:
/// T staticValue() => builder(ClassElement.staticValue);
List<String> generateUtilityFieldsFromClass(ClassElement classElement) {
  final fieldStatements = <String>[];

  final constructors = classElement.constructors.where((constructor) {
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

  return fieldStatements;
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
  final invocation = 'builder($constStatement $type$name($invocationParams))';

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
List<String> generateUtilityFields(
  String className,
  List<FieldMetadata> fields,
  TypeRegistry typeRefs,
) {
  final expressions = <String>[];

  for (final field in fields) {
    final annotatedUtilities = field.annotation.utilities ?? [];
    final propertyName = field.name;
    final utilityType = typeRefs.getUtilityType(field.dartType);
    final utilityName = utilityType?.name ?? 'DynamicUtility';

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
          // Extract path and alias using a simpler approach
          String? pathName;
          String? nestedAliasName;

          // Convert to string and parse
          final String utilityStr = nestedUtility.toString();

          // Parse the record format: (path: 'value', alias: 'value')
          if (utilityStr.startsWith('(') && utilityStr.endsWith(')')) {
            final content = utilityStr.substring(1, utilityStr.length - 1);
            final parts = content.split(',');

            for (final part in parts) {
              final keyValue = part.trim().split(':');
              if (keyValue.length == 2) {
                final key = keyValue[0].trim();
                final value = keyValue[1].trim();

                // Remove quotes if present
                final cleanValue = value.startsWith("'") && value.endsWith("'")
                    ? value.substring(1, value.length - 1)
                    : value;

                if (key == 'path') {
                  pathName = cleanValue;
                } else if (key == 'alias') {
                  nestedAliasName = cleanValue;
                }
              }
            }
          }

          // Skip if we couldn't extract both path and alias
          if (pathName == null || nestedAliasName == null) {
            continue;
          }

          expressions.add(_generateUtilityField(
            docPath: '$className.$aliasName.$pathName',
            aliasName: nestedAliasName,
            utilityExpression: '$aliasName.$pathName',
          ));
        }
      }
    }
  }

  return expressions;
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
  required List<FieldMetadata> fields,
}) {
  final fieldStatements = fields.map((e) {
    final fieldName = e.name;

    return '$fieldName: $fieldName,';
  }).join('\n');

  final optionalParameters = fields.map((e) {
    final fieldType = e.representationType?.name ?? e.type;

    return '$fieldType? ${e.name},';
  }).join('\n');

  final onlyParams = fields.isEmpty ? '' : '{$optionalParameters}';

  return '''
  /// Returns a new [$utilityType] with the specified properties.
  @override
  T only($onlyParams) {
    return builder($utilityType(
      $fieldStatements
    ));
  }
''';
}

/// Creates a getter to enable chained configuration.
String utilityMethodChainGetter(String utilityName) {
  // This one-liner might not need wrapping, but you could apply `_wrapIfLong`.
  return '''
  $utilityName<T> get chain => $utilityName(attributeBuilder, mutable: true);
  ''';
}

/// Creates a static getter that returns the self utility.
String utilityMethodSelfGetter(String utilityName, String attributeName) {
  // Also short, but you can wrap if you prefer consistent formatting.
  return '''
  static $utilityName<$attributeName> get self => $utilityName((v) => v);
  ''';
}

String utilityMethodCallBuilder(List<FieldMetadata> fields) {
  final optionalParameters = fields.map((field) {
    final fieldType = field.hasDto
        ? TypeUtils.getResolvedTypeFromDto(field.dartType)
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

// ClassBuilder utilityClassBuilder({
//   required AnnotatedClassBuilderContext context,
//   required bool isDto,
//   required bool isSpec,
// }) {
//   final attributeOrDtoName = context.name + (isSpec ? $Attribute : '');

//   final resolvedType = context.genericSuperType;

//   final utilityDefinition = ClassDefinition(
//     name: '$resolvedType${$Utility}',
//     extendTypes: isDto
//         ? '${$DtoUtility}<T, $attributeOrDtoName, $resolvedType>'
//         : '${$SpecUtility}<T, $attributeOrDtoName>',
//     genericType: '<T extends ${$Attribute}>',
//   );

//   final utilityName = MixHelper.defineUtilityName(resolvedType);

//   final fields = generateUtilityFields(attributeOrDtoName, context.fields);

//   final onlyMethod = utilityMethodOnlyBuilder(
//     utilityType: attributeOrDtoName,
//     fields: context.fields,
//   );

//   final valueClassFields = generateUtilityFieldsFromClass(context.classElement);

//   final callMethodDefinition =
//       isDto ? utilityMethodCallBuilder(context.fields) : '';

//   final chainGetterDefinition = isDto
//       ? ''
//       : '''
//   $utilityName<T> get chain => $utilityName(attributeBuilder, mutable: true);
//   ''';

//   final selfGetterDefinition = isDto
//       ? ''
//       : '''
//   static $utilityName<$attributeOrDtoName> get self => $utilityName((v) => v);
//   ''';

//   final constructorDefinition = (isDto
//       ? utilityDefinition.writeConstructor(
//           'super.builder',
//           'valueToDto: (v) => v.toDto()',
//         )
//       : utilityDefinition.writeConstructor('super.builder, {super.mutable}'));

//   final body = '''
// /// Utility class for configuring [$resolvedType] properties.
// ///
// /// This class provides methods to set individual properties of a [$resolvedType].
// /// Use the methods of this class to configure specific properties of a [$resolvedType].
// ${utilityDefinition.writeDeclaration()} {
//   $fields

//   $valueClassFields

//   $constructorDefinition

//   $chainGetterDefinition

//   $selfGetterDefinition

//   $onlyMethod

//   $callMethodDefinition
// }
// ''';

//   return ClassBuilder(utilityDefinition, body);
// }
