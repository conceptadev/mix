// lib/src/core/type_registry.dart
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:logging/logging.dart';

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

  // Cache for resolved types
  final Map<DartType, TypeMapping> _resolvedCache = {};

  TypeRegistry._() {
    _registerDefaultMappings();
  }

  /// Detects a utility mapping from a class that extends MixUtility
  void _detectUtilityFromClass(ClassElement classElement) {
    if (classElement.isAbstract) return;

    // Check if it extends MixUtility
    for (var interface in classElement.allSupertypes) {
      if (_isMixUtilityType(interface)) {
        // Extract the Value type parameter (second type argument)
        final typeArguments = interface.typeArguments;
        if (typeArguments.length >= 2) {
          final valueType = typeArguments[1];
          final valueTypeName = _getTypeKey(valueType);
          final utilityTypeName = classElement.name;

          _logger
              .fine('Found Utility: $utilityTypeName for type: $valueTypeName');

          // Register the utility mapping
          final mapping = _getOrCreateMapping(valueTypeName);
          mapping.utilityType = utilityTypeName;
          mapping.utilityElement = classElement;
          _mappings[valueTypeName] = mapping;

          // Also register for list if this is a list utility
          if (classElement.name == 'ListUtility' && typeArguments.length >= 3) {
            final listItemType = typeArguments[2];
            final listItemTypeName = _getTypeKey(listItemType);

            final listMapping = _getOrCreateMapping(listItemTypeName);
            listMapping.listUtilityType = 'ListUtility';
            _mappings[listItemTypeName] = listMapping;
          }
        }
      }
    }
  }

  /// Checks if an interface type is MixUtility or a subclass of it
  bool _isMixUtilityType(InterfaceType type) {
    final elementName = type.element.name;
    if (elementName == 'MixUtility') return true;

    // Check parent classes recursively
    for (var supertype in type.element.allSupertypes) {
      if (supertype.element.name == 'MixUtility') {
        return true;
      }
    }

    return false;
  }

  /// Detects if a class is a representation (DTO or Attribute) and registers it
  void _detectRepresentationFromClass(ClassElement classElement) {
    // Skip abstract classes
    if (classElement.isAbstract) return;

    // Check if it extends Dto<T>
    for (var interface in classElement.allSupertypes) {
      if (interface.element.name == 'Dto' &&
          interface.typeArguments.isNotEmpty) {
        final valueType = interface.typeArguments.first;
        final valueTypeName = _getTypeKey(valueType);
        final dtoTypeName = classElement.name;

        _logger.fine('Found DTO: $dtoTypeName for type: $valueTypeName');

        // Register the DTO mapping
        final mapping = _getOrCreateMapping(valueTypeName);
        mapping.representationType = dtoTypeName;
        mapping.representationElement = classElement;
        mapping.isDto = true;
        _mappings[valueTypeName] = mapping;
      }
    }

    // Check if it's an Attribute for a Spec
    if (classElement.name.endsWith('Attribute')) {
      // Extract the base name (remove "Attribute" suffix)
      final baseName = classElement.name.substring(
        0,
        classElement.name.length - 'Attribute'.length,
      );

      // Look for a corresponding Spec class
      for (var interface in classElement.allSupertypes) {
        if ((interface.element.name == 'SpecAttribute' ||
                interface.element.name == 'WidgetModifierSpecAttribute') &&
            interface.typeArguments.isNotEmpty) {
          final specType = interface.typeArguments.first;
          final specTypeName = _getTypeKey(specType);

          if (specTypeName == baseName) {
            _logger.fine(
              'Found Attribute: ${classElement.name} for Spec: $baseName',
            );

            // Register the Attribute mapping
            final mapping = _getOrCreateMapping(baseName);
            mapping.representationType = classElement.name;
            mapping.representationElement = classElement;
            mapping.isSpec = true;
            mapping.isDto = false;
            _mappings[baseName] = mapping;
          }
        }
      }
    }
  }

  /// Gets or creates a type mapping
  TypeMapping _getOrCreateMapping(String typeKey) {
    return _mappings[typeKey] ?? TypeMapping(type: typeKey);
  }

  /// Checks if a type is assignable to the target type
  bool _isAssignableTo(DartType type, TypeMapping targetMapping) {
    final targetTypeName = targetMapping.type;

    if (type.element is! ClassElement) return false;

    // First check direct name match
    if (_getTypeKey(type) == targetTypeName) return true;

    // Then check supertype hierarchy
    final classElement = type.element as ClassElement;
    for (var supertype in classElement.allSupertypes) {
      if (_getTypeKey(supertype) == targetTypeName) {
        return true;
      }
    }

    return false;
  }

  /// Gets the simple type name (without generics)
  String _getSimpleTypeName(DartType type) {
    final typeName = _getTypeKey(type);
    final genericIndex = typeName.indexOf('<');

    if (genericIndex > 0) {
      return typeName.substring(0, genericIndex);
    }

    return typeName;
  }

  /// Gets a normalized key for a type
  String _getTypeKey(DartType type) {
    return type.getDisplayString(withNullability: false);
  }

  /// Registers default type mappings
  void _registerDefaultMappings() {
    // Default mappings are limited since we'll detect most from code
    // These are only for core types that don't have explicit utility classes

    // Core mappings for primitives and Flutter types
    registerUtilityMapping('double', 'DoubleUtility');
    registerUtilityMapping('int', 'IntUtility');
    registerUtilityMapping('bool', 'BoolUtility');
    registerUtilityMapping('String', 'StringUtility');

    // A few common Flutter types
    registerRepresentationMapping('Color', 'ColorDto');
    registerUtilityMapping('Color', 'ColorUtility');

    registerRepresentationMapping('EdgeInsetsGeometry', 'SpacingDto');
    registerUtilityMapping('EdgeInsetsGeometry', 'SpacingUtility');
  }

  Map<String, TypeMapping> get mappings => _mappings;

  /// Scans a library for types and their relationships
  void scanLibrary(LibraryElement library) {
    for (final classElement in library.units.expand((u) => u.classes)) {
      // Detect MixUtility implementations
      _detectUtilityFromClass(classElement);

      // Detect DTOs and Attributes
      _detectRepresentationFromClass(classElement);
    }
  }

  /// Gets the mapping for a DartType, including generic handling
  TypeMapping getMappingForType(DartType type) {
    // Check cache first
    if (_resolvedCache.containsKey(type)) {
      return _resolvedCache[type]!;
    }

    // Handle generic types like List<T>
    if (type is InterfaceType && type.typeArguments.isNotEmpty) {
      if (type.isDartCoreList) {
        // For lists, we handle the inner type and wrap appropriately
        final innerType = type.typeArguments.first;
        final innerMapping = getMappingForType(innerType);

        // Create a list version of the mapping
        final listMapping = TypeMapping(type: 'List<${innerMapping.type}>');

        // If inner type has a representation, the list has a List<Representation> type
        if (innerMapping.representationType != null) {
          listMapping.representationType =
              'List<${innerMapping.representationType}>';
        }

        // The utility is usually ListUtility or a specialized list utility
        listMapping.utilityType = innerMapping.listUtilityType ?? 'ListUtility';

        _resolvedCache[type] = listMapping;

        return listMapping;
      }
    }

    // For regular types, look up by type name
    final typeKey = _getTypeKey(type);
    final mapping = _mappings[typeKey] ?? TypeMapping(type: typeKey);

    // If no direct mapping, try assignability check
    if (mapping.representationType == null && type.element is ClassElement) {
      // Find a compatible representation based on assignability
      for (final candidateMapping in _mappings.values) {
        if (candidateMapping.representationElement != null &&
            _isAssignableTo(type, candidateMapping)) {
          mapping.representationType = candidateMapping.representationType;
          mapping.representationElement =
              candidateMapping.representationElement;
          mapping.isDto = candidateMapping.isDto;
          break;
        }
      }
    }

    // For utility, check if there's a direct utility match
    if (mapping.utilityType == null) {
      // If no direct utility, try to find one based on type hierarchy
      for (final candidateMapping in _mappings.values) {
        if (candidateMapping.utilityType != null &&
            _isAssignableTo(type, TypeMapping(type: candidateMapping.type))) {
          mapping.utilityType = candidateMapping.utilityType;
          mapping.utilityElement = candidateMapping.utilityElement;
          break;
        }
      }

      // If still no utility, use a naming convention
      mapping.utilityType ??= '${_getSimpleTypeName(type)}Utility';
    }

    // Cache the result
    _resolvedCache[type] = mapping;

    return mapping;
  }

  /// Registers a manual mapping between a type and its representation
  void registerRepresentationMapping(
    String type,
    String representationType, {
    bool isDto = true,
  }) {
    final mapping = _getOrCreateMapping(type);

    if (mapping.representationType != null &&
        mapping.representationType != representationType) {
      _logger.warning(
        'Overriding representation mapping for $type: ${mapping.representationType} -> $representationType',
      );
    }

    mapping.representationType = representationType;
    mapping.isDto = isDto;
    _mappings[type] = mapping;
  }

  /// Registers a manual mapping between a type and its utility
  void registerUtilityMapping(String type, String utilityType) {
    final mapping = _getOrCreateMapping(type);

    if (mapping.utilityType != null && mapping.utilityType != utilityType) {
      _logger.warning(
        'Overriding utility mapping for $type: ${mapping.utilityType} -> $utilityType',
      );
    }

    mapping.utilityType = utilityType;
    _mappings[type] = mapping;
  }

  /// Gets the representation type (DTO or Attribute) for a DartType
  String? getRepresentationType(DartType type) {
    return getMappingForType(type).representationType;
  }

  /// Gets the utility type for a DartType
  String getUtilityType(DartType type) {
    return getMappingForType(type).utilityType ??
        '${_getSimpleTypeName(type)}Utility';
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
  final String type;

  /// The corresponding representation type (DTO or Attribute)
  String? representationType;

  /// The corresponding utility type
  String? utilityType;

  /// For list types, a specialized list utility
  String? listUtilityType;

  /// Whether this is a spec type
  bool isSpec = false;

  /// Whether this is a DTO type (vs Attribute)
  bool isDto = false;

  /// The actual representation class element, if available
  ClassElement? representationElement;

  /// The actual utility class element, if available
  ClassElement? utilityElement;

  TypeMapping({
    required this.type,
    this.representationType,
    this.utilityType,
    this.listUtilityType,
    this.isSpec = false,
    this.isDto = false,
    this.representationElement,
    this.utilityElement,
  });

  @override
  String toString() =>
      'TypeMapping(type: $type, representation: $representationType, utility: $utilityType)';
}
