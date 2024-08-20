// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'builders/utility_class_builder.dart';
import 'helpers/dart_type_ext.dart';
import 'helpers/helpers.dart';
import 'package:source_gen/source_gen.dart';

import 'helpers/builder_utils.dart';

class MixableClassUtilityGenerator
    extends GeneratorForAnnotation<MixableClassUtility> {
  const MixableClassUtilityGenerator();

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

    return dartFormat(_generateUtilityMixin(context));
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
  final className = context.element.name;

  final generatedName = context.element.generatedName;

  final valueName = context.valueElement.name;

  final callMethod = _generateCallMethod(context);

  final fieldStatements = _generateUtilityFields(context);

  final constructorStatements = generateUtilityConstructors(context);

  final comments = '''
/// {@template ${className.snakecase}}
/// A utility class for creating [Attribute] instances from [$valueName] values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// from predefined [$valueName] values.
/// {@endtemplate}''';

  return '''
$comments
mixin $generatedName<T extends Attribute> on MixUtility<T,$valueName> {

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

  for (var field in mappedEl.fields) {
    final isSameType = field.type.isAssignableTo(valueEl.thisType);

    if (field.isStatic && field.isConst && isSameType) {
      final name = field.name;
      final type = mappedEl.name;
      fieldStatements.add('''
  /// Creates an [Attribute] instance with [${mappedEl.name}.$name] value.
  T $name() => builder($type.$name);
  ''');
    }
  }

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
/// Creates an [Attribute] instance with the specified $valueName value.
T call($valueName value) => builder(value);
''';
}

/// Generates the utility statements for public constructors
/// of `valueElement` in the context
///
/// For example:
/// T constructor(params) => builder(ClassElement.constructor(params));
String generateUtilityConstructors(ClassUtilityAnnotationContext context) {
  final mappedEl = context.mappingElement ?? context.valueElement;

  final fieldStatements = <String>[];

  final constructors = mappedEl.constructors.where((constructor) {
    return isValidConstructor(constructor);
  });

  for (var constructor in constructors) {
    // Do not genrate for  unamed constructors

    final statement = generateUtilityForConstructor(
      constructor,
      skipCallMethod: context.generateCallMethod,
      mappedEl: context.mappingElement,
    );

    if (statement.isNotEmpty) {
      fieldStatements.add(statement);
    }
  }

  return fieldStatements.join('\n');
}

bool isValidConstructor(ConstructorElement constructor) {
  final isPublic = constructor.isPublic;

  final hasUndefinedParamTypes = constructor.parameters.any((param) {
    final library = param.type.element?.library;

    return library != null && !library.isFlutterOrDart;
  });

  final hasAnyPrivateParams = constructor.parameters.any((param) {
    return param.isPrivate;
  });

  return isPublic && !hasUndefinedParamTypes && !hasAnyPrivateParams;
}
