import 'package:analyzer/dart/element/element.dart';

import '../metadata/field_metadata.dart';
import 'constructor_utils.dart';
import 'dart_type_utils.dart';

/// Utility methods for generating attribute utility classes
class UtilityMethods {
  const UtilityMethods._();

  /// Generates the utility statements for public consts
  /// static methods of `mappingElement` in the context
  ///
  /// For example:
  /// T staticValue() => builder(ClassElement.staticValue);
  static String generateUtilityFieldsFromClass(ClassElement classElement) {
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

    return fieldStatements.join('\n');
  }

  static String generateUtilityForConstructor(
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
      if (signatureNamedParams.isNotEmpty)
        '{${signatureNamedParams.join(', ')}}',
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
  static List<String> generateUtilityFields(
    String className,
    List<ParameterMetadata> fields,
  ) {
    final expressions = <String>[];

    for (final field in fields) {
      final propertyName = field.name;
      final utilityProps = field.utilityProperties;

      for (final prop in utilityProps) {
        if (prop.path == propertyName) {
          // Top-level utility (main field or with an alias)
          final utilityName = prop.utilityName ?? 'DynamicUtility';
          final utilityExpression =
              '$utilityName((v) => only($propertyName: v))';

          expressions.add(_generateUtilityField(
            docPath: '$className.$propertyName',
            aliasName: prop.name,
            utilityExpression: utilityExpression,
          ));
        } else {
          // Nested utility
          expressions.add(_generateUtilityField(
            docPath: '$className.${prop.path}',
            aliasName: prop.name,
            utilityExpression: prop.path,
          ));
        }
      }
    }

    return expressions;
  }

  /// Generates a utility field string based on the provided parameters.
  static String _generateUtilityField({
    required String docPath,
    required String aliasName,
    required String utilityExpression,
  }) {
    return '''
/// Utility for defining [$docPath]
late final $aliasName = $utilityExpression;
''';
  }

  static String methodOnly({
    required String utilityType,
    required List<ParameterMetadata> fields,
  }) {
    final fieldStatements = fields.map((e) {
      final fieldName = e.name;

      return '$fieldName: $fieldName,';
    }).join('\n');

    final optionalParameters = fields.map((e) {
      final fieldType = e.resolvable?.type ?? e.type;

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
  static String chainGetter(String utilityName) {
    // This one-liner might not need wrapping, but you could apply `_wrapIfLong`.
    return '''
  $utilityName<T> get chain => $utilityName(attributeBuilder, mutable: true);
  ''';
  }

  /// Creates a static getter that returns the self utility.
  static String selfGetter(String utilityName, String attributeName) {
    // Also short, but you can wrap if you prefer consistent formatting.
    return '''
  static $utilityName<$attributeName> get self => $utilityName((v) => v);
  ''';
  }

  static String methodCall(List<ParameterMetadata> fields) {
    final optionalParameters = fields.map((field) {
      final fieldType = TypeUtils.getResolvedTypeFromDto(field.dartType);

      return '$fieldType? ${field.name},';
    }).join('\n');

    final fieldStatements = fields.map((field) {
      final fieldName = field.name;

      if (field.isDtoListType) {
        return '$fieldName: $fieldName?.map((e) => e.toDto()).toList(),';
      }

      if (field.isResolvable) {
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
}
