import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

import '../metadata/field_metadata.dart';
import '../type_registry.dart';

/// Extension to get typeAsString from a ConstantReader
extension ConstantReaderX on ConstantReader {
  String? get typeAsString {
    final peakedType = peek('type');

    if (peakedType?.isString == true) {
      return peakedType!.stringValue;
    } else if (peakedType?.isType == true) {
      return peakedType!.typeValue.element!.name;
    }

    return null;
  }
}

/// Parse utility properties from annotation reader
MixableUtilityProps parseMixableUtilityProps(ConstantReader reader) {
  final path = reader.read('path').stringValue;
  final alias = reader.read('alias').stringValue;

  return (path: path, alias: alias);
}

/// Reads the [MixableField] annotation from a field element
MixableField readMixableField(Element element) {
  const checker = TypeChecker.fromRuntime(MixableField);
  final annotation = checker.firstAnnotationOf(element);

  if (annotation is! DartObject) {
    return const MixableField();
  }

  final reader = ConstantReader(annotation);
  final dtoReader = reader.peek('dto');

  final utilities = reader
      .peek('utilities')
      ?.listValue
      .map((e) => _readMixableFieldUtility(ConstantReader(e)))
      .toList();

  final isLerpable = reader.peek('isLerpable')?.boolValue ?? true;

  return MixableField(
    dto: dtoReader != null ? _getMixableDto(dtoReader) : null,
    utilities: utilities,
    isLerpable: isLerpable,
  );
}

/// Reads the [MixableFieldUtility] annotation from an element
MixableFieldUtility? readMixableFieldUtility(Element element) {
  const checker = TypeChecker.fromRuntime(MixableFieldUtility);
  final annotation = checker.firstAnnotationOfExact(element);

  if (annotation == null) return null;

  return _readMixableFieldUtility(ConstantReader(annotation));
}

/// Reads a [MixableFieldUtility] from a [ConstantReader]
MixableFieldUtility _readMixableFieldUtility(ConstantReader reader) {
  String? utilityName;

  final typeReader = reader.peek('type');
  if (typeReader?.isString == true) {
    utilityName = typeReader!.stringValue;
  } else if (typeReader?.isType == true) {
    utilityName = typeReader!.typeValue.element!.name!;
  }

  final utilityAlias = reader.peek('alias')?.stringValue;

  final properties = reader
          .peek('properties')
          ?.listValue
          .map((e) => parseMixableUtilityProps(ConstantReader(e)))
          .toList() ??
      [];

  return MixableFieldUtility(
    alias: utilityAlias,
    type: utilityName,
    properties: properties,
  );
}

/// Reads the [MixableFieldDto] annotation from an element
MixableFieldDto? readMixableFieldResolvable(Element element) {
  const checker = TypeChecker.fromRuntime(MixableFieldDto);
  final annotation = checker.firstAnnotationOfExact(element);

  if (annotation == null) return null;

  final reader = ConstantReader(annotation);
  final typeString = reader.typeAsString;

  if (typeString == null) return null;

  return MixableFieldDto(type: typeString);
}

/// Extracts [MixableFieldDto] data from a [ConstantReader]
MixableFieldDto? _getMixableDto(ConstantReader reader) {
  final typeString = reader.typeAsString;
  if (typeString == null) return null;

  return MixableFieldDto(type: typeString);
}

/// Reads the [MixableSpec] annotation from a class element
MixableSpec readMixableSpec(ClassElement element) {
  const checker = TypeChecker.fromRuntime(MixableSpec);
  final annotation = checker.firstAnnotationOfExact(element);

  if (annotation == null) {
    throw InvalidGenerationSourceError(
      'No MixableSpec annotation found on the class',
      element: element,
    );
  }

  final reader = ConstantReader(annotation);
  final prefix = reader.read('prefix').stringValue;

  return MixableSpec(
    withCopyWith: reader.read('withCopyWith').boolValue,
    withEquality: reader.read('withEquality').boolValue,
    withLerp: reader.read('withLerp').boolValue,
    skipUtility: reader.read('skipUtility').boolValue,
    prefix: prefix.isEmpty ? element.name : prefix,
  );
}

/// Reads the [MixableDto] annotation from a class element
MixableDto readMixableDto(ClassElement element) {
  const checker = TypeChecker.fromRuntime(MixableDto);
  final annotation = checker.firstAnnotationOfExact(element);

  if (annotation == null) {
    throw InvalidGenerationSourceError(
      'No MixableDto annotation found on the class',
      element: element,
    );
  }

  final reader = ConstantReader(annotation);

  return MixableDto(
    mergeLists: reader.read('mergeLists').boolValue,
    generateValueExtension: reader.read('generateValueExtension').boolValue,
    generateUtility: reader.read('generateUtility').boolValue,
  );
}

/// Reads the [MixableToken] annotation from a class element
MixableToken readMixableToken(ClassElement element) {
  const checker = TypeChecker.fromRuntime(MixableToken);
  final annotation = checker.firstAnnotationOfExact(element);

  if (annotation == null) {
    throw InvalidGenerationSourceError(
      'No MixableToken annotation found on the class',
      element: element,
    );
  }

  final reader = ConstantReader(annotation);
  final type = reader.read('type').typeValue;

  return MixableToken(
    type,
    namespace: reader.read('namespace').isNull
        ? null
        : reader.read('namespace').stringValue,
    utilityExtension: reader.read('utilityExtension').boolValue,
    contextExtension: reader.read('contextExtension').boolValue,
  );
}

/// Reads the [MixableUtility] annotation from a class element and returns the generateHelpers value
int readMixableUtilityHelpers(ClassElement element) {
  const checker = TypeChecker.fromRuntime(MixableUtility);
  final annotation = checker.firstAnnotationOfExact(element);

  if (annotation == null) {
    return 0; // Default value (all helpers)
  }

  final reader = ConstantReader(annotation);

  return reader.read('generateHelpers').intValue;
}

/// Checks if a class has the [MixableUtility] annotation
bool hasMixableUtility(ClassElement element) {
  const checker = TypeChecker.fromRuntime(MixableUtility);

  return checker.hasAnnotationOfExact(element);
}

/// Gets all annotations of a specific type from an element
List<DartObject> getAnnotations(Element element, Type annotationType) {
  final checker = TypeChecker.fromRuntime(annotationType);

  return checker.annotationsOf(element).toList();
}

/// Reads the list of [MixableFieldUtility] annotations from a field element
List<MixableFieldUtility>? readMixableFieldUtilities(FieldElement element) {
  final annotations = getAnnotations(element, MixableField);
  if (annotations.isEmpty) return null;

  final reader = ConstantReader(annotations.first);
  final utilities = reader.peek('utilities')?.listValue;

  if (utilities == null || utilities.isEmpty) {
    return null;
  }

  return utilities
      .map((e) => _readMixableFieldUtility(ConstantReader(e)))
      .toList();
}

/// Creates utility metadata for a field/parameter
FieldUtilityMetadata? createFieldUtilityMetadata({
  required String name,
  required DartType dartType,
  MixableFieldUtility? utilityAnnotation,
}) {
  final typeRegistry = TypeRegistry.instance;

  // Get utility type from registry
  final utilityTypeName = typeRegistry.getUtilityForType(dartType);
  final hasUtility = utilityTypeName != null || utilityAnnotation != null;

  if (!hasUtility) return null;

  // Determine name and type from annotations or defaults
  final utilityName = utilityAnnotation?.alias ?? name;
  final utilityType = utilityAnnotation?.typeAsString ?? utilityTypeName ?? '';

  return FieldUtilityMetadata(name: utilityName, type: utilityType);
}

/// Creates resolvable metadata for a field/parameter
FieldResolvableMetadata? createFieldResolvableMetadata({
  required String name,
  required DartType dartType,
  MixableFieldDto? resolvableAnnotation,
}) {
  final typeRegistry = TypeRegistry.instance;

  // Get resolvable type from registry or annotation
  final registryType = typeRegistry.getResolvableForType(dartType);
  final resolvableTypeName = resolvableAnnotation?.typeAsString ?? registryType;

  if (resolvableTypeName == null) return null;

  return FieldResolvableMetadata(
    name: name,
    type: resolvableTypeName,
    tryToMergeType: typeRegistry.hasTryToMerge(resolvableTypeName),
  );
}

/// Creates utility properties for a field
List<UtilityProperty> createUtilityProperties({
  required String name,
  required List<MixableFieldUtility>? utilities,
  required String? defaultUtilityName,
}) {
  final result = <UtilityProperty>[];

  if (utilities == null || utilities.isEmpty) {
    return [
      UtilityProperty(name: name, path: name, utilityName: defaultUtilityName),
    ];
  }

  for (final util in utilities) {
    final aliasName = util.alias ?? name;
    final utilType = util.typeAsString ?? defaultUtilityName;

    result.add(UtilityProperty(
      name: aliasName,
      path: name,
      utilityName: utilType,
    ));

    // Add nested properties
    for (final nested in util.properties) {
      result.add(UtilityProperty(
        name: nested.alias,
        path: '$aliasName.${nested.path}',
        utilityName: utilType,
      ));
    }
  }

  return result;
}
