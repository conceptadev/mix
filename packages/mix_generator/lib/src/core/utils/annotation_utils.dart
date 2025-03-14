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

/// Reads annotations of the specified type from an element
T? readAnnotation<T>(Element element) {
  Type runtimeType;

  // Map annotation class to its runtime type
  if (T == MixableFieldUtility) {
    runtimeType = MixableFieldUtility;
  } else if (T == MixableFieldDto) {
    runtimeType = MixableFieldDto;
  } else if (T == MixableField) {
    runtimeType = MixableField;
  } else if (T == MixableSpec) {
    runtimeType = MixableSpec;
  } else if (T == MixableDto) {
    runtimeType = MixableDto;
  } else if (T == MixableToken) {
    runtimeType = MixableToken;
  } else if (T == MixableUtility) {
    runtimeType = MixableUtility;
  } else {
    return null;
  }

  final checker = TypeChecker.fromRuntime(runtimeType);
  final annotation = checker.firstAnnotationOfExact(element);
  if (annotation == null) return null;

  return parseAnnotation(annotation);
}

/// Parses a DartObject into the specified annotation type
T? parseAnnotation<T>(DartObject annotation) {
  final reader = ConstantReader(annotation);

  if (T == MixableFieldUtility) {
    final type = reader.peek('type')?.typeValue;
    final alias = reader.peek('alias')?.stringValue;
    final properties = reader
            .peek('properties')
            ?.listValue
            .map((e) => parseMixableUtilityProps(ConstantReader(e)))
            .toList() ??
        [];

    return MixableFieldUtility(
      alias: alias,
      type: type,
      properties: properties,
    ) as T;
  } else if (T == MixableFieldDto) {
    final typeString = reader.typeAsString;
    if (typeString == null) return null;

    return MixableFieldDto(type: typeString) as T;
  } else if (T == MixableField) {
    final dtoReader = reader.peek('dto');
    final dto = dtoReader != null ? _getMixableDto(dtoReader) : null;

    final utilities = reader
        .peek('utilities')
        ?.listValue
        .map((e) => _readMixableFieldUtility(ConstantReader(e)))
        .toList();

    final isLerpable = reader.peek('isLerpable')?.boolValue ?? true;

    return MixableField(
      dto: dto,
      utilities: utilities,
      isLerpable: isLerpable,
    ) as T;
  }
  // Add other annotation types as needed

  return null;
}

/// Reads the [MixableField] annotation from a field element
MixableField readMixableField(FieldElement element) {
  const checker = TypeChecker.fromRuntime(MixableField);
  final annotation = checker.firstAnnotationOf(element);

  if (annotation is! DartObject) {
    return const MixableField();
  }

  return parseAnnotation(annotation) ?? const MixableField();
}

/// Reads the [MixableFieldUtility] annotation from an element
MixableFieldUtility? readMixableFieldUtility(Element element) {
  return readAnnotation(element);
}

/// Reads the [MixableFieldDto] annotation from an element
MixableFieldDto? readMixableFieldResolvable(Element element) {
  return readAnnotation(element);
}

/// Parse utility properties from annotation reader
MixableUtilityProps parseMixableUtilityProps(ConstantReader reader) {
  final path = reader.read('path').stringValue;
  final alias = reader.read('alias').stringValue;

  return (path: path, alias: alias);
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

/// Extracts [MixableFieldDto] data from a [ConstantReader]
MixableFieldDto? _getMixableDto(ConstantReader reader) {
  final typeString = reader.typeAsString;
  if (typeString == null) return null;

  return MixableFieldDto(type: typeString);
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

/// Reads the [MixableSpec] annotation from a class element
MixableSpec readMixableSpec(ClassElement element) {
  return readAnnotation<MixableSpec>(element) ??
      (throw InvalidGenerationSourceError(
        'No MixableSpec annotation found on the class',
        element: element,
      ));
}

/// Reads the [MixableDto] annotation from a class element
MixableDto readMixableDto(ClassElement element) {
  return readAnnotation<MixableDto>(element) ??
      (throw InvalidGenerationSourceError(
        'No MixableDto annotation found on the class',
        element: element,
      ));
}

/// Reads the [MixableToken] annotation from a class element
MixableToken readMixableToken(ClassElement element) {
  return readAnnotation<MixableToken>(element) ??
      (throw InvalidGenerationSourceError(
        'No MixableToken annotation found on the class',
        element: element,
      ));
}

/// Reads the [MixableUtility] annotation from a class element and returns the generateHelpers value
int readMixableUtilityHelpers(ClassElement element) {
  final annotation = readAnnotation<MixableUtility>(element);
  if (annotation == null) {
    return 0; // Default value (all helpers)
  }

  return annotation.generateHelpers;
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
