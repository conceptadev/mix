import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:logging/logging.dart';

import 'utils/dart_type_utils.dart';

/// A unified registry for managing type mappings based on MixUtility type parameters.
///
/// This registry determines:
/// - What representation class (DTO/Attribute) is used for a specific type
/// - What utility class is used for a specific type by scanning MixUtility implementations
class TypeRegistry {
  static final TypeRegistry instance = TypeRegistry._();

  final Logger _logger = Logger('TypeRegistry');

  // Core type mappings
  final Map<String, TypeMapping> _mappings = {};

  TypeRegistry._();

  /// Detects if a class is a representation (DTO or Attribute) and registers it
  void _detectRepresentationFromClass(ClassElement classElement) {
    final isSpec = TypeUtils.isSpec(classElement.thisType);
    final isDto = TypeUtils.isDto(classElement.thisType);
    if (!isSpec && !isDto) return;

    TypeReference representationType;
    TypeReference referenceType;

    final typeName = classElement.name;

    final utilityType = TypeReference('${typeName}Utility');

    if (isSpec) {
      representationType = TypeReference('${typeName}Attribute');
      referenceType = TypeReference.fromType(classElement.thisType);
    } else {
      final typeArg = TypeUtils.extractDtoTypeArgument(classElement);
      if (typeArg == null) return;
      referenceType = TypeReference.fromType(typeArg);
      representationType = TypeReference.fromType(classElement.thisType);
    }
    // Register the DTO mapping using the resolved key.
    final typing = TypeMapping(
      reference: referenceType,
      representation: representationType,
      utility: utilityType,
      isSpec: isSpec,
    );

    _mappings[typing.key] = typing;
  }

  /// Scans a library for types and their relationships
  void scanLibrary(LibraryElement library) {
    for (final classElement in library.units.expand((u) => u.classes)) {
      // Detect DTOs and Attributes
      _detectRepresentationFromClass(classElement);
    }
  }

  /// Scans a BuildStep for type relationships
  Future<void> scanBuildStep(BuildStep buildStep) async {
    final resolver = buildStep.resolver;
    if (!await resolver.isLibrary(buildStep.inputId)) return;

    final library = await resolver.libraryFor(buildStep.inputId);
    scanLibrary(library);

    // Also scan imported libraries
    for (final import in library.importedLibraries) {
      if (!import.isInSdk) {
        scanLibrary(import);
      }
    }
  }

  /// Gets the mapping for a DartType, including generic handling
  TypeMapping? getMappingForType(DartType type) {
    return _mappings[type.getTypeAsString()];
  }

  /// Gets the representation type (DTO or Attribute) for a DartType
  TypeReference? getRepresentationType(DartType type) {
    return getMappingForType(type)?.representation;
  }

  /// Gets the utility type for a DartType
  TypeReference? getUtilityType(DartType type) {
    return getMappingForType(type)?.utility;
  }

  /// Gets the utility name from a type name string
  String getUtilityNameFromTypeName(String typeName) {
    // Remove Dto or Attribute suffix if present
    if (typeName.endsWith('Dto')) {
      typeName = typeName.substring(0, typeName.length - 3);
    } else if (typeName.endsWith('Attribute')) {
      typeName = typeName.substring(0, typeName.length - 9);
    }

    // Ensure capitalized
    typeName = typeName[0].toUpperCase() + typeName.substring(1);

    // Add utility suffix if not present
    if (!typeName.endsWith('Utility')) {
      typeName = '${typeName}Utility';
    }

    return typeName;
  }
}

/// Represents a complete mapping for a type
class TypeMapping {
  /// The base type name
  final TypeReference reference;

  /// The corresponding representation type (DTO or Attribute)
  final TypeReference representation;

  /// The corresponding utility type
  final TypeReference utility;

  final bool isSpec;

  const TypeMapping({
    required this.reference,
    required this.representation,
    required this.utility,
    required this.isSpec,
  });

  String get key => reference.name;

  @override
  String toString() =>
      'TypeMapping(reference: $reference, representation: $representation, utility: $utility, isSpec: $isSpec)';
}

class TypeReference {
  final String name;
  final DartType? type;

  TypeReference(String name, {this.type}) : name = _getSimpleTypeName(name);

  static TypeReference fromType(DartType type) =>
      TypeReference(type.getTypeAsString(), type: type);

  @override
  String toString() => 'TypeReference(name: $name, type: ${type ?? ''})';
}

String _getSimpleTypeName(String typeName) {
  final genericIndex = typeName.indexOf('<');

  if (genericIndex > 0) {
    return typeName.substring(0, genericIndex);
  }

  return typeName;
}
