// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_generator/src/helpers/dart_type_ext.dart';
import 'package:mix_generator/src/helpers/helpers.dart';
import 'package:source_gen/source_gen.dart';

import 'helpers/builder_utils.dart';

class MixableClassUtilityGenerator
    extends GeneratorForAnnotation<MixableClassUtility> {
  MixableClassUtilityGenerator();

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader reader,
    BuildStep buildStep,
  ) async {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'The annotation can only be applied to a class.',
        element: element,
      );
    }

    final context = _readContext(element);

    return context.generate(_generateUtilityMixin(context));
  }

  /// Reads the annotation context for the given [element].
  ///
  /// Returns a [ClassUtilityAnnotationContext] instance containing the necessary
  /// information for generating the utility class.
  ClassUtilityAnnotationContext _readContext(ClassElement element) {
    final annotation = typeChecker.firstAnnotationOfExact(element);

    final valueEl = _getUtilityType(element)?.element;
    if (valueEl is! ClassElement) {
      throw InvalidGenerationSourceError(
        'Utility must extend MixUtility<Attribute, ClassValue>',
        element: element,
      );
    }
    final reader = ConstantReader(annotation);
    final mappedType = reader.peek('type')?.typeValue;
    final generateCallMethod = reader.read('generateCallMethod').boolValue;
    final mappingEl = mappedType?.element;
    if (mappingEl != null) {
      if (mappingEl is! ClassElement) {
        throw InvalidGenerationSourceError(
          'The annotation must have a valid type',
          element: element,
        );
      }
    }

    return ClassUtilityAnnotationContext(
      element: element,
      valueElement: valueEl,
      mappingElement: mappingEl as ClassElement?,
      generateCallMethod: generateCallMethod,
    );
  }
}

/// Retrieves the value type from the given [ClassElement].
/// Returns the [DartType] of the value type passed into MixUtility
DartType? _getUtilityType(ClassElement element) {
  const utilityTypes = ['MixUtility'];

  for (var supertype in element.allSupertypes) {
    if (utilityTypes.contains(supertype.element.name) &&
        supertype.typeArguments.length == 2) {
      return supertype.typeArguments[1];
    }
  }

  return null;
}

/// Generates the utility mixin code based on the given [context].
///
/// Returns the generated mixin code as a string.
String _generateUtilityMixin(ClassUtilityAnnotationContext context) {
  final className = context.name;
  final generatedName = context.generatedName;

  final valueName = context.valueElement.name;

  final callMethod = _generateCallMethod(context);

  final fieldStatements = _generateUtilityFields(context);

  final constructorStatements = _generateUtilityConstructors(context);

  final comments = '''
/// {@template ${className.snakecase}}
/// A utility class for creating [Attribute] instances from [$valueName] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [$valueName] values.
/// {@endtemplate}''';

  return '''
$comments
base mixin $generatedName<T extends Attribute> on MixUtility<T,$valueName> {

$fieldStatements

$constructorStatements

$callMethod
}
''';
}

/// Generates the utility statements for public consts
/// static methods of `mappingElement` in the context
///
/// For example:
/// T staticValue() => builder(ClassElement.staticValue);
String _generateUtilityFields(ClassUtilityAnnotationContext context) {
  final mappedEl = context.mappingElement ?? context.valueElement;
  final valueEl = context.valueElement;
  final fieldStatements = <String>[];

  mappedEl.fields.forEach((field) {
    final isSameType = field.type.isAssignableTo(valueEl.thisType);

    if (field.isStatic && field.isConst && isSameType) {
      final name = field.name;
      final type = mappedEl.name;
      fieldStatements.add('''
  /// Creates an [Attribute] instance with [${mappedEl.name}.$name] value.
  T $name() => builder($type.$name);
  ''');
    }
  });
  return fieldStatements.join('\n');
}

/// Generates the call method based on the given [context].
///
/// Returns the generated call method as a string.
/// If `generateCallMethod` is false, an empty string is returned.
///
/// For example:
/// T call(ClassElement value) => builder(value);
String _generateCallMethod(ClassUtilityAnnotationContext context) {
  if (!context.generateCallMethod) return '';
  final valueEl = context.valueElement;
  final valueName = valueEl.name;

  return '''
/// Creates an [Attribute] instance with the specified ${valueName} value.
T call($valueName value) => builder(value);
''';
}

/// Generates the utility statements for public constructors
/// of `valueElement` in the context
///
/// For example:
/// T constructor(params) => builder(ClassElement.constructor(params));
String _generateUtilityConstructors(ClassUtilityAnnotationContext context) {
  final mappedEl = context.mappingElement ?? context.valueElement;

  final fieldStatements = <String>[];

  final constructors = mappedEl.constructors.where((constructor) {
    return _isValidConstructor(constructor);
  });

  constructors.forEach((constructor) {
    final isConst = constructor.isConst;

    final isUnamed = constructor.name.isEmpty;

    // Do not genrate for  unamed constructors
    if (isUnamed && context.generateCallMethod) return;
    final name = constructor.name.isEmpty ? '' : '.${constructor.name}';
    final methodName =
        constructor.name.isEmpty ? 'call' : '${constructor.name}';
    final type = mappedEl.name;

    final parameters = constructor.parameters;

    final constStatement = isConst && parameters.isEmpty ? 'const' : '';

    final signatureRequiredParams = <String>[];
    final invocationRequiredParams = <String>[];
    final signatureOptionalParams = <String>[];
    final invocationOptionalParams = <String>[];
    final signatureNamedParams = <String>[];
    final invocationNamedParams = <String>[];

    parameters.forEach((param) {
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
    });

    final signatureParams = [
      ...signatureRequiredParams,
      if (signatureOptionalParams.isNotEmpty)
        '[${signatureOptionalParams.join(', ')}]',
      if (signatureNamedParams.isNotEmpty)
        '{${signatureNamedParams.join(', ')}}'
    ].join(', ');

    final invocationParams = [
      ...invocationRequiredParams,
      if (invocationOptionalParams.isNotEmpty)
        '${invocationOptionalParams.join(', ')}',
      if (invocationNamedParams.isNotEmpty)
        '${invocationNamedParams.join(', ')}'
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

    fieldStatements.add('''
/// Creates an [Attribute] instance using the [$type$name] constructor.
$signatureLine
''');
  });

  return fieldStatements.join('\n');
}

bool _isValidConstructor(
  ConstructorElement constructor,
) {
  final isPublic = constructor.isPublic;

  final hasUndefinedParamTypes = constructor.parameters.any((param) {
    final library = param.type.element?.library;
    return library != null && !library.isInSdk;
  });

  final hasAnyPrivateParams = constructor.parameters.any((param) {
    return param.isPrivate;
  });

  return isPublic && !hasUndefinedParamTypes && !hasAnyPrivateParams;
}
